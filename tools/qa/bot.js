// Autopilot playtest: walks to each objective via A*, shoots visible enemies, extracts.
// Records stuck enemies, AI path failures, damage taken, time per objective.
const { chromium } = require('playwright');
const DIFF = process.argv[2] || 'normal', GOD = process.argv[3] === 'god', MIS = +(process.argv[4] || 0);
(async () => {
  const b = await chromium.launch();
  const p = await (await b.newContext({ viewport: { width: 1280, height: 720 } })).newPage();
  const errs = [];
  p.on('pageerror', e => errs.push(e.message));
  await p.goto('file://' + require('path').resolve(__dirname, '../../web/index.html'));
  await new Promise(r => setTimeout(r, 600));
  await p.evaluate(([d, m]) => { window.__ko.loadMission(m); document.querySelector(`[data-diff="${d}"]`).click(); document.getElementById('startBtn').click(); }, [DIFF, MIS]);
  const res = await p.evaluate(async (GOD) => {
    const k = window.__ko, log = [];
    const wait = ms => new Promise(r => setTimeout(r, ms));
    const stuck = new Map();
    let path = null, pi = 0, goalKey = '';
    const t0 = performance.now();
    let lastObj = 0;
    while (k.state === 'play' && performance.now() - t0 < 240000) {
      const P = k.P;
      if (GOD) { P.hp = 100; }
      // goal: next objective, then extraction
      const left = k.objectives.filter(o => !o.taken && !o.planted);
      const H = k.H, hd = k.hold, Mx = k.M;
      const waitingCharge = k.objectives.some(o => o.planted && !o.taken);
      const goal = left.length ? left.reduce((a, o) => Math.hypot(o.x - P.x, o.y - P.y) < Math.hypot(a.x - P.x, a.y - P.y) ? o : a)
        : waitingCharge ? { x: Mx.lzIn.x, y: Mx.lzIn.y }
        : H.state === 'captive' ? { x: H.x, y: H.y + 30 }
        : (hd.active && !hd.done) ? { x: Mx.hold.x, y: Mx.hold.y } : { x: Mx.ext.x, y: Mx.ext.y };
      const gk = goal.x + ',' + goal.y;
      if (gk !== goalKey || !path || pi >= path.length) { path = k.findPath(P.x, P.y, goal.x, goal.y) || [[goal.x, goal.y]]; pi = 0; goalKey = gk; }
      let wp = path[pi]; if (wp && Math.hypot(wp[0] - P.x, wp[1] - P.y) < 18) { pi++; wp = path[pi]; }
      // doors in the way: open them
      for (const d of k.doors) if (!d.open && Math.hypot(d.x + d.w / 2 - P.x, d.y + d.h / 2 - P.y) < 45) k.setDoor(d, true, 'hand');
      // movement keys
      for (const c of ['KeyW', 'KeyA', 'KeyS', 'KeyD']) k.keys.delete(c);
      if (wp) {
        const ang = Math.atan2(wp[1] - P.y, wp[0] - P.x), oct = Math.round(ang / (Math.PI / 4));
        const dirs = { 0: ['KeyD'], 1: ['KeyD', 'KeyS'], 2: ['KeyS'], 3: ['KeyA', 'KeyS'], 4: ['KeyA'], '-4': ['KeyA'], '-3': ['KeyA', 'KeyW'], '-2': ['KeyW'], '-1': ['KeyD', 'KeyW'] };
        for (const c of dirs[oct] || []) k.keys.add(c);
      }
      // unstick: re-path from here with fine waypoints
      window.__bs = window.__bs || { x: P.x, y: P.y, t: 0 };
      if (Math.hypot(P.x - window.__bs.x, P.y - window.__bs.y) < 3) window.__bs.t += 0.05; else { window.__bs.t = 0; window.__bs.x = P.x; window.__bs.y = P.y; }
      if (window.__bs.t > 0.8) { path = null; window.__bs.t = 0; const a = Math.random() * 6.28; P.x += Math.cos(a) * 4; P.y += Math.sin(a) * 4; }
      // interact when on objective
      if ((left.length || k.H.state === 'captive') && !waitingCharge && Math.hypot(goal.x - P.x, goal.y - P.y) < 45) k.keys.add('KeyE'); else k.keys.delete('KeyE');
      if (!left.length && k.H.state === 'follow' && Math.hypot(k.H.x - P.x, k.H.y - P.y) > 200) { for (const c of ['KeyW','KeyA','KeyS','KeyD']) k.keys.delete(c); }
      // aim: nearest visible enemy
      const vis = k.enemies.filter(e => !e.dead && e.va > 0.6 && Math.hypot(e.x - P.x, e.y - P.y) < 700);
      const tgt = vis.sort((a, b) => Math.hypot(a.x - P.x, a.y - P.y) - Math.hypot(b.x - P.x, b.y - P.y))[0];
      const ax = tgt ? tgt.x : (wp ? wp[0] : P.x + 100), ay = tgt ? tgt.y : (wp ? wp[1] : P.y);
      k.mouse.x = window.innerWidth / 2 + (ax - k.cam.x) * k.ZOOM; k.mouse.y = window.innerHeight / 2 + (ay - k.cam.y) * k.ZOOM; k.mouse.seen = true;
      if (tgt) { if (!k.mouse.l) k.pressed.add('Mouse0'); k.mouse.l = true; } else k.mouse.l = false;
      if (P.mag && P.mag[P.wi] === 0) k.pressed.add('KeyR');
      if (P.hp < 45 && P.med > 0 && !tgt) k.pressed.add('KeyQ');
      // enemy stuck detection: wants to move but no displacement
      for (const e of k.enemies) {
        if (e.dead || e.T.static || e.state === 'patrol' && e.wait > 0) continue;
        const s = stuck.get(e) || { x: e.x, y: e.y, t: 0, max: 0 };
        if (Math.hypot(e.x - s.x, e.y - s.y) < 2 && (e.state === 'alert' || (e.state === 'combat' && !e.sees) || (e.state === 'patrol' && e.route.length > 1))) s.t += 0.05; else s.t = 0;
        s.max = Math.max(s.max, s.t); s.x = e.x; s.y = e.y; stuck.set(e, s);
      }
      const taken = k.objectives.filter(o => o.taken).length;
      if (taken > lastObj) { log.push(`obj ${taken} at ${k.gameTime.toFixed(1)}s hp ${P.hp.toFixed(0)}`); lastObj = taken; }
      await wait(50);
    }
    const st = [...stuck.entries()].filter(([e, s]) => s.max > 3).map(([e, s]) => `${e.type}@${e.x | 0},${e.y | 0} ${e.state} stuck ${s.max.toFixed(1)}s`);
    return { mission: k.M.id, holdT: k.hold.t | 0, path: JSON.stringify(path && path.slice(Math.max(0, pi - 1), pi + 3).map(p => p.map(v => v | 0))), pi, keys: [...k.keys].join(','), pos: [k.P.x | 0, k.P.y | 0], left: k.objectives.filter(o => !o.taken).map(o => o.short), doorsNear: k.doors.filter(d => Math.hypot(d.x + d.w / 2 - k.P.x, d.y + d.h / 2 - k.P.y) < 120).map(d => [d.x, d.y, d.open]), hostage: k.H.state + ' ' + Math.round(k.H.hp), state: k.state, time: k.gameTime.toFixed(1), hp: k.P.hp.toFixed(0), kills: k.stats.kills, shots: k.stats.shots, hits: k.stats.hits, dmg: k.stats.dmgTaken.toFixed(0), log, stuck: st };
  }, GOD);
  console.log(DIFF, GOD ? 'god' : 'mortal', JSON.stringify(res, null, 1));
  console.log('errors', errs.slice(0, 5));
  await b.close();
})();
