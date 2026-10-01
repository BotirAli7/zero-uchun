const { chromium } = require('playwright');
(async () => {
  const b = await chromium.launch(); const p = await b.newPage();
  p.on('pageerror', e => console.log('PAGEERR', e.message));
  await p.goto('file://' + require('path').resolve(__dirname, '../../web/index.html')); await p.waitForTimeout(800);
  const res = await p.evaluate(() => {
    const k = window.__ko, out = {};
    for (let i = 0; i < window.KO_MISSIONS.length; i++) {
      k.loadMission(i);
      const M = k.M, issues = [];
      const inside = (x, y, pad, what) => { if (k.insideSolid(x, y, pad)) issues.push(`${what} inside solid @${x},${y}`); };
      const reach = (x, y, what) => { if (!k.findPath(M.lzIn.x, M.lzIn.y, x, y)) issues.push(`${what} unreachable @${x},${y}`); };
      M.enemies.forEach((e, j) => e[1].forEach(r => { inside(r[0], r[1], 12, `enemy${j} ${e[0]}`); reach(r[0], r[1], `enemy${j}`); }));
      M.objectives.forEach(o => { inside(o.x, o.y, 10, 'obj ' + o.id); reach(o.x, o.y, 'obj ' + o.id); });
      M.crates.forEach(c => { inside(c[0], c[1], 8, 'crate'); reach(c[0], c[1], 'crate'); });
      M.intel.forEach(c => { inside(c[0], c[1], 8, 'intel'); reach(c[0], c[1], 'intel'); });
      if (M.hostage) { inside(M.hostage.x, M.hostage.y, 12, 'hostage'); reach(M.hostage.x, M.hostage.y, 'hostage'); }
      if (M.hold) { inside(M.hold.x, M.hold.y, 12, 'hold'); reach(M.hold.x, M.hold.y, 'hold'); M.hold.waves.forEach(w => inside(w[0], w[1], 12, 'wave')); }
      for (let a = 0; a < 6.28; a += 0.5) for (const rr of [0, M.ext.r * 0.6]) inside(M.ext.x + Math.cos(a) * rr, M.ext.y + Math.sin(a) * rr, 14, 'ext pad');
      reach(M.ext.x, M.ext.y, 'ext');
      for (let a = 0; a < 6.28; a += 0.5) for (const rr of [0, M.lzIn.r * 0.6]) inside(M.lzIn.x + Math.cos(a) * rr, M.lzIn.y + Math.sin(a) * rr, 14, 'lz');
      (M.reinforce || []).forEach(w => inside(w[0], w[1], 12, 'reinforce'));
      (M.hostage ? M.hostage.alarm : []).forEach(w => inside(w[0], w[1], 12, 'alarm'));
      M.objectives.filter(o => o.tank).forEach(o => { if (!k.obs.some(ob => ob.model === 'tank' && Math.abs(ob.x + ob.w / 2 - o.tank[0]) < 5 && Math.abs(ob.y + ob.h / 2 - o.tank[1]) < 5)) issues.push('tank mismatch ' + o.id); });
      out[M.id] = { doors: k.doors.length, obs: k.obs.length, buildings: k.buildings.length, issues };
    }
    k.loadMission(0);
    return out;
  });
  console.log(JSON.stringify(res, null, 1));
  await b.close();
})();
