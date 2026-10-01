const { chromium } = require('/opt/node-tools/node_modules/playwright');
const fs = require('fs');
const OUT = process.argv[2]; fs.mkdirSync(OUT, { recursive: true });
const TINTS = {
  player: [0.2, 0.19, 0.12], rifle: [0.06, 0.07, 0.09], gunner: [0.025, 0.025, 0.03], scout: [0.14, 0.09, 0.05], sniper: [0.07, 0.09, 0.035],
};
const LOAD = { player: ['rifle', 'shotgun', 'pistol'], rifle: ['rifle'], gunner: ['rifle'], sniper: ['rifle'], scout: ['pistol'] };
const DUR = { Idle: 1.97, Walk: 1.03, Run: 0.7 };
(async () => {
  const b = await chromium.launch({ args: ['--use-gl=angle', '--use-angle=swiftshader', '--enable-unsafe-swiftshader'] });
  const p = await b.newPage({ viewport: { width: 256, height: 256 } });
  p.on('pageerror', e => console.log('ERR', e.message));
  await p.goto('http://localhost:8765/render.html'); await p.waitForFunction(() => window.ready, null, { timeout: 120000 });
  const meta = { frames: {}, muzzle: {}, pivot: null };
  const save = async (name, o) => {
    const res = await p.evaluate(o => window.frame(o), o);
    fs.writeFileSync(`${OUT}/${name}.png`, Buffer.from(res.url.split(',')[1], 'base64'));
    if (res.pivot) meta.pivot = res.pivot;
    return res;
  };
  for (const [v, tint] of Object.entries(TINTS)) {
    // legs
    await save(`${v}__legs__idle__0`, { pass: 'legs', clip: 'Idle', t: 0.2, tint });
    for (let i = 0; i < 12; i++) await save(`${v}__legs__walk__${i}`, { pass: 'legs', clip: 'Walk', t: i / 12 * DUR.Walk, tint });
    for (let i = 0; i < 10; i++) await save(`${v}__legs__run__${i}`, { pass: 'legs', clip: 'Run', t: i / 10 * DUR.Run, tint });
    await save(`${v}__dead__dead__0`, { pass: 'dead', tint });
    for (const wpn of LOAD[v]) {
      const base = { pass: 'torso', weapon: wpn, tint };
      for (let i = 0; i < 8; i++) await save(`${v}__${wpn}__idle__${i}`, { ...base, clip: 'Idle', t: i / 8 * DUR.Idle });
      for (let i = 0; i < 12; i++) await save(`${v}__${wpn}__move__${i}`, { ...base, clip: 'Walk', t: i / 12 * DUR.Walk });
      for (let i = 0; i < 3; i++) {
        const res = await save(`${v}__${wpn}__shoot__${i}`, { ...base, clip: 'Idle', t: 0.2, recoil: [0.06, 0.03, 0.012][i] });
        if (i === 2 && v === 'player') meta.muzzle[wpn] = res.muzzle;
      }
      if (v === 'player') {
        const idleRes = await p.evaluate(o => window.frame(o), { ...base, clip: 'Idle', t: 0.2 });
        meta.muzzle[wpn] = idleRes.muzzle;
        for (let i = 0; i < 12; i++) await save(`${v}__${wpn}__reload__${i}`, { ...base, clip: 'Idle', t: 0.2 + i * 0.05, reload: true, p: i / 11 });
      }
    }
    if (v === 'player') for (let i = 0; i < 8; i++) await save(`${v}__knife__meleeattack__${i}`, { pass: 'torso', weapon: 'knife', tint, clip: 'Idle', t: 0.2, p: i / 7 });
    console.log('done', v);
  }
  fs.writeFileSync(`${OUT}/meta.json`, JSON.stringify(meta));
  console.log(JSON.stringify(meta));
  await b.close();
})();
