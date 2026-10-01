// Kestrel Ops 3D renderer.
// Reads the 2D simulation through window.__G and draws the world with three.js:
// textured walls with real height, CC0 Poly Haven props, animated soldiers with
// IK-posed weapons, and shadow-casting night lighting. The 2D canvas stays on top
// for fog of war, tracers, markers and HUD. If anything fails, window.__R3.ready
// stays false and the game keeps its 2D renderer.
import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import * as SkeletonUtils from 'three/addons/utils/SkeletonUtils.js';
import { mergeGeometries } from 'three/addons/utils/BufferGeometryUtils.js';

const R3 = (window.__R3 = { ready: false, failed: false, progress: 0, camH: 20, lampH: 4.5 });
const G = window.__G;

const MODELS = ['covered_car', 'concrete_road_barrier', 'street_lamp_01', 'Barrel_01', 'wooden_crate_01', 'ammo_box',
  'metal_office_desk', 'Sofa_01', 'steel_frame_shelves_01', 'old_bed_frame', 'utility_box_01', 'metal_trash_can',
  'portable_generator', 'shrub_03', 'old_tyre', 'cardboard_box_01', 'WoodenChair_01'];
const TEXTURES = ['damaged_plaster_col', 'damaged_plaster_nor', 'concrete_wall_006_col', 'concrete_wall_006_nor',
  'rusty_corrugated_iron_col', 'rusty_corrugated_iron_nor'];
const WALL_H = 2.6;
const TOUCH = G.IS_TOUCH;

let renderer, scene, camera, groundTex, M;
const lib = {};           // model name -> { scene, size, min }
const units = new Map();  // game entity -> Unit
const trees3 = [];
let crate3 = [], obj3 = [], pick3 = [];
let L = {};               // lights

// ───────────────────────── boot ─────────────────────────
(async function boot() {
  try {
    if (!G) throw new Error('game bridge missing');
    M = G.M2W;
    const cv = document.createElement('canvas');
    cv.id = 'gl';
    cv.style.cssText = 'position:fixed;inset:0;width:100%;height:100%;display:block;z-index:0;background:#0a0d0c';
    document.body.insertBefore(cv, document.body.firstChild);
    renderer = new THREE.WebGLRenderer({ canvas: cv, antialias: true, powerPreference: 'high-performance' });
    renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, TOUCH ? 1 : 1.5));
    renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    renderer.toneMapping = THREE.ACESFilmicToneMapping;
    renderer.toneMappingExposure = 1.0;
    renderer.outputColorSpace = THREE.SRGBColorSpace;
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0x07090b);
    camera = new THREE.PerspectiveCamera(30, 1, 1, 400);
    resize(); window.addEventListener('resize', resize);

    const loader = new GLTFLoader();
    const tl = new THREE.TextureLoader();
    const total = MODELS.length + TEXTURES.length + 1;
    let done = 0;
    const tick = () => { R3.progress = ++done / total; };
    const tex = {};
    await Promise.all([
      ...MODELS.map(n => loader.loadAsync('assets/models/' + n + '.json').then(g => {
        const box = new THREE.Box3().setFromObject(g.scene);
        g.scene.traverse(o => { if (o.isMesh) { o.castShadow = true; o.receiveShadow = true; } });
        lib[n] = { scene: g.scene, size: box.getSize(new THREE.Vector3()), min: box.min.clone(), center: box.getCenter(new THREE.Vector3()) };
        tick();
      })),
      ...TEXTURES.map(n => tl.loadAsync('assets/tex/' + n + '.jpg').then(t => {
        t.wrapS = t.wrapT = THREE.RepeatWrapping; t.anisotropy = 8;
        if (n.endsWith('_col')) t.colorSpace = THREE.SRGBColorSpace;
        tex[n] = t; tick();
      })),
      loader.loadAsync('assets/models/Soldier.json').then(g => { lib.soldier = g; tick(); }),
    ]);
    buildWorld(tex);
    buildLights();
    R3.ready = true;
    G.on3DReady();
  } catch (err) {
    console.warn('3D renderer disabled:', err);
    R3.failed = true;
    const gl = document.getElementById('gl'); if (gl) gl.remove();
  }
})();

function resize() {
  if (!renderer) return;
  renderer.setSize(window.innerWidth, window.innerHeight, false);
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
}

// ───────────────────────── world ─────────────────────────
const v3 = (x, y, z) => new THREE.Vector3(x, y, z);
function quadGeo() { return { pos: [], nor: [], uv: [], idx: [] }; }
function addQuad(g, a, b, c, d, n, uvs) {
  const i = g.pos.length / 3;
  const ab = b.clone().sub(a), ac = c.clone().sub(a);
  let pts = [a, b, c, d], u = uvs;
  if (ab.cross(ac).dot(n) < 0) { pts = [a, d, c, b]; u = [uvs[0], uvs[3], uvs[2], uvs[1]]; }
  for (let k = 0; k < 4; k++) { g.pos.push(pts[k].x, pts[k].y, pts[k].z); g.nor.push(n.x, n.y, n.z); g.uv.push(u[k][0], u[k][1]); }
  g.idx.push(i, i + 1, i + 2, i, i + 2, i + 3);
}
function toGeometry(g) {
  const geo = new THREE.BufferGeometry();
  geo.setAttribute('position', new THREE.Float32BufferAttribute(g.pos, 3));
  geo.setAttribute('normal', new THREE.Float32BufferAttribute(g.nor, 3));
  geo.setAttribute('uv', new THREE.Float32BufferAttribute(g.uv, 2));
  geo.setIndex(g.idx);
  geo.computeTangents?.();
  return geo;
}
// box with world-scaled UVs (tile = metres per texture repeat)
function addPrism(sides, tops, o, h, tile) {
  const x0 = o.x / M, x1 = (o.x + o.w) / M, z0 = o.y / M, z1 = (o.y + o.h) / M;
  const U = (a, b) => [a / tile, b / tile];
  addQuad(sides, v3(x0, 0, z0), v3(x1, 0, z0), v3(x1, h, z0), v3(x0, h, z0), v3(0, 0, -1), [U(x0, 0), U(x1, 0), U(x1, h), U(x0, h)]);
  addQuad(sides, v3(x0, 0, z1), v3(x1, 0, z1), v3(x1, h, z1), v3(x0, h, z1), v3(0, 0, 1), [U(x0, 0), U(x1, 0), U(x1, h), U(x0, h)]);
  addQuad(sides, v3(x0, 0, z0), v3(x0, 0, z1), v3(x0, h, z1), v3(x0, h, z0), v3(-1, 0, 0), [U(z0, 0), U(z1, 0), U(z1, h), U(z0, h)]);
  addQuad(sides, v3(x1, 0, z0), v3(x1, 0, z1), v3(x1, h, z1), v3(x1, h, z0), v3(1, 0, 0), [U(z0, 0), U(z1, 0), U(z1, h), U(z0, h)]);
  addQuad(tops, v3(x0, h, z0), v3(x1, h, z0), v3(x1, h, z1), v3(x0, h, z1), v3(0, 1, 0), [U(x0, z0), U(x1, z0), U(x1, z1), U(x0, z1)]);
}
function place(name, o, opt = {}) {
  const m = lib[name]; if (!m) return null;
  const obj = m.scene.clone(true);
  const g = new THREE.Group(); g.add(obj);
  const rw = o.w / M, rd = o.h / M;
  const longModelX = m.size.x >= m.size.z;
  const rot = (rw >= rd) !== longModelX ? Math.PI / 2 : 0;
  const mx = rot ? m.size.z : m.size.x, mz = rot ? m.size.x : m.size.z;
  let sx = rw / mx, sz = rd / mz;
  if (opt.uniform) sx = sz = Math.min(sx, sz);
  const sy = opt.height ? opt.height / m.size.y : (sx + sz) / 2 * (opt.yScale || 1);
  obj.position.set(-m.center.x, -m.min.y, -m.center.z);
  const inner = new THREE.Group(); inner.add(obj); inner.rotation.y = rot + (opt.spin || 0);
  g.remove(obj); g.add(inner);
  g.scale.set(rot ? sz : sx, sy, rot ? sx : sz);
  if (rot) g.scale.set(sx, sy, sz);
  g.position.set((o.x + o.w / 2) / M, opt.y || 0, (o.y + o.h / 2) / M);
  scene.add(g);
  return g;
}
function placeAt(name, x, y, size, opt = {}) {
  const m = lib[name]; if (!m) return null;
  const obj = m.scene.clone(true);
  obj.position.set(-m.center.x, -m.min.y, -m.center.z);
  const g = new THREE.Group(); g.add(obj);
  const s = opt.height ? opt.height / m.size.y : size / Math.max(m.size.x, m.size.z);
  g.scale.setScalar(s * (opt.scale || 1));
  g.rotation.y = opt.rot || 0;
  g.position.set(x / M, opt.y || 0, y / M);
  scene.add(g);
  return g;
}
function cloneMats(root) {
  const mats = [];
  root.traverse(o => { if (o.isMesh) { o.material = o.material.clone(); mats.push(o.material); } });
  return mats;
}

function buildWorld(tex) {
  // ground: the 2D ground canvas (photo textures + decals) as a live texture
  groundTex = new THREE.CanvasTexture(G.ground);
  groundTex.colorSpace = THREE.SRGBColorSpace;
  groundTex.anisotropy = renderer.capabilities.getMaxAnisotropy();
  const gm = new THREE.Mesh(new THREE.PlaneGeometry(G.MW / M, G.MH / M),
    new THREE.MeshStandardMaterial({ map: groundTex, roughness: 0.92, metalness: 0 }));
  gm.rotation.x = -Math.PI / 2; gm.position.set(G.MW / M / 2, 0, G.MH / M / 2);
  gm.receiveShadow = true; scene.add(gm);
  // void around the map
  const vm = new THREE.Mesh(new THREE.PlaneGeometry(400, 400), new THREE.MeshStandardMaterial({ color: 0x0b0d0c, roughness: 1 }));
  vm.rotation.x = -Math.PI / 2; vm.position.set(G.MW / M / 2, -0.02, G.MH / M / 2); scene.add(vm);

  // walls and containers as merged prisms with world-scaled UVs
  const wallS = quadGeo(), wallT = quadGeo(), contS = quadGeo(), contT = quadGeo();
  for (const o of G.obs) {
    if (o.kind === 'wall' || o.kind === 'border') addPrism(wallS, wallT, o, o.kind === 'border' ? 3.2 : WALL_H, 2.2);
    else if (o.kind === 'container') addPrism(contS, contT, o, 2.55, 1.6);
  }
  const plaster = new THREE.MeshStandardMaterial({ map: tex.damaged_plaster_col, normalMap: tex.damaged_plaster_nor, roughness: 0.95, color: 0xb9b4aa });
  const cap = new THREE.MeshStandardMaterial({ map: tex.concrete_wall_006_col, normalMap: tex.concrete_wall_006_nor, roughness: 0.9, color: 0x9a978f });
  const iron = new THREE.MeshStandardMaterial({ map: tex.rusty_corrugated_iron_col, normalMap: tex.rusty_corrugated_iron_nor, roughness: 0.7, metalness: 0.35 });
  for (const [g, mat] of [[wallS, plaster], [wallT, cap], [contS, iron], [contT, iron]]) {
    if (!g.pos.length) continue;
    const mesh = new THREE.Mesh(toGeometry(g), mat);
    mesh.castShadow = true; mesh.receiveShadow = true; scene.add(mesh);
  }
  // container tints
  for (const o of G.obs) if (o.kind === 'container') {
    const m = new THREE.Mesh(new THREE.BoxGeometry(o.w / M + 0.01, 0.02, o.h / M + 0.01),
      new THREE.MeshStandardMaterial({ color: new THREE.Color(o.tint), roughness: 0.6, metalness: 0.3, transparent: true, opacity: 0.45 }));
    m.position.set((o.x + o.w / 2) / M, 2.56, (o.y + o.h / 2) / M); scene.add(m);
  }

  // props
  for (const o of G.obs) {
    if (o.kind === 'vehicle') {
      const g = place('covered_car', o, { yScale: o.model === 'truck' || o.model === 'apc' ? 1.25 : 1 });
      if (g && (o.model === 'apc' || o.model === 'truck')) g.traverse(c => { if (c.isMesh) { c.material = c.material.clone(); c.material.color.multiply(new THREE.Color(0x7d8a5c)); } });
      if (g && o.model === 'wreck') g.traverse(c => { if (c.isMesh) { c.material = c.material.clone(); c.material.color.multiply(new THREE.Color(0x3a2a22)); } });
    } else if (o.kind === 'sandbag') {
      const horiz = o.w >= o.h, len = (horiz ? o.w : o.h) / M, bl = lib.concrete_road_barrier.size;
      const unit = Math.max(bl.x, bl.z), n = Math.max(1, Math.round(len / unit));
      for (let i = 0; i < n; i++) {
        const seg = horiz ? { x: o.x + i * o.w / n, y: o.y, w: o.w / n, h: o.h } : { x: o.x, y: o.y + i * o.h / n, w: o.w, h: o.h / n };
        place('concrete_road_barrier', seg, { height: 0.85 });
      }
    } else if (o.kind === 'crate') {
      place('wooden_crate_01', o, { uniform: true, spin: (o.x * 7 + o.y) % 3 * 0.05 });
    } else if (o.kind === 'machine') {
      place('portable_generator', o, { uniform: true, yScale: 1 });
    } else if (o.kind === 'furniture') {
      const map = { bed: 'old_bed_frame', shelf: 'steel_frame_shelves_01', barrel: 'Barrel_01', desk: 'metal_office_desk', table: 'metal_office_desk', bench: 'metal_office_desk' };
      place(map[o.model] || 'cardboard_box_01', o, { uniform: o.model === 'barrel', height: o.model === 'shelf' ? 1.9 : undefined });
      if (o.model === 'desk') placeAt('WoodenChair_01', o.x + o.w / 2, o.y + o.h + 14, 0.55, { rot: Math.PI });
    }
  }
  // street lamps
  for (const l of G.LAMPS) placeAt('street_lamp_01', l[0], l[1], 1.6, { height: 4.8, rot: Math.atan2(l[1] - 960, l[0] - 1360) > 0 ? 0 : Math.PI });
  // street dressing
  [[1200, 870, 'metal_trash_can', 0.6], [1460, 1050, 'utility_box_01', 0.9], [760, 1050, 'old_tyre', 0.8], [2240, 880, 'metal_trash_can', 0.6],
   [1250, 1040, 'utility_box_01', 0.9], [690, 870, 'old_tyre', 0.8], [2050, 1150, 'cardboard_box_01', 0.6], [480, 1100, 'metal_trash_can', 0.6],
   [2660, 1080, 'old_tyre', 0.8], [1700, 860, 'utility_box_01', 0.9]]
    .forEach(([x, y, n, s]) => placeAt(n, x, y, s, { rot: (x + y) % 6 }));
  // sofas in barracks / HQ
  placeAt('Sofa_01', 1000, 300, 1.9, { rot: Math.PI / 2 });
  placeAt('Sofa_01', 1700, 1560, 1.9, { rot: 0 });
  // trees: trunk + alpha-tested leaf cards arranged in a crown
  const leafTex = makeLeafTexture();
  const barkMat = new THREE.MeshStandardMaterial({ color: 0x3b2f24, roughness: 1 });
  const cardGeo = new THREE.PlaneGeometry(1, 1);
  for (const tr of G.trees) {
    const g = new THREE.Group();
    const R0 = tr.r * 1.15 / M, hgt = 4.2 + (tr.r % 7) * 0.25;
    const trunk = new THREE.Mesh(new THREE.CylinderGeometry(0.12, 0.2, hgt * 0.8, 7), barkMat);
    trunk.position.y = hgt * 0.4; trunk.castShadow = true; g.add(trunk);
    const mat = new THREE.MeshStandardMaterial({ map: leafTex, alphaTest: 0.45, side: THREE.DoubleSide, roughness: 0.85, color: [0xd8e8b8, 0xc8e0a8, 0xe0dca8, 0xc0d8a8][tr.v % 4], emissive: 0x0d1608 });
    const rnd = mulberry(tr.x * 31 + tr.y);
    const parts = [];
    for (let i = 0; i < 46; i++) {
      const a = rnd() * Math.PI * 2, d = Math.sqrt(rnd()) * R0 * 0.8;
      const y = hgt * (0.62 + rnd() * 0.42) - d * 0.35;
      const sz = R0 * (0.7 + rnd() * 0.6);
      const m4 = new THREE.Matrix4().compose(
        new THREE.Vector3(Math.cos(a) * d, y, Math.sin(a) * d),
        new THREE.Quaternion().setFromEuler(new THREE.Euler(-Math.PI / 2 + (rnd() - 0.5) * 0.9, rnd() * Math.PI * 2, (rnd() - 0.5) * 0.9, 'YXZ')),
        new THREE.Vector3(sz, sz, sz));
      parts.push(cardGeo.clone().applyMatrix4(m4));
    }
    const crown = new THREE.Mesh(mergeGeometries(parts), mat);
    crown.castShadow = true; crown.receiveShadow = true; g.add(crown);
    g.position.set(tr.x / M, 0, tr.y / M);
    scene.add(g);
    trees3.push({ tr, g, mats: [mat] });
  }
  // loot crates, objectives, pickups
  crate3 = G.crates.map(c => ({ c, g: placeAt('ammo_box', c.x, c.y, 0.75, { rot: (c.x % 5) * 0.4 }) }));
  obj3 = G.objectives.map(o => {
    const g = placeAt('ammo_box', o.x, o.y, 0.85);
    const mats = cloneMats(g);
    for (const m of mats) { m.emissive = new THREE.Color(o.color); m.emissiveIntensity = 0.0; }
    return { o, g, mats };
  });
  for (let i = 0; i < 16; i++) { const g = placeAt('cardboard_box_01', 0, 0, 0.32); g.visible = false; pick3.push(g); }
}

function mulberry(a) { return function () { a |= 0; a = a + 0x6D2B79F5 | 0; let t = Math.imul(a ^ a >>> 15, 1 | a); t = t + Math.imul(t ^ t >>> 7, 61 | t) ^ t; return ((t ^ t >>> 14) >>> 0) / 4294967296; }; }
// leaf cluster texture: hundreds of shaded leaves on a transparent canvas
function makeLeafTexture() {
  const S = 512, c = document.createElement('canvas'); c.width = c.height = S;
  const g = c.getContext('2d'), rnd = mulberry(77);
  for (let i = 0; i < 1100; i++) {
    const a = rnd() * Math.PI * 2, d = Math.pow(rnd(), 0.6) * S * 0.46;
    const x = S / 2 + Math.cos(a) * d, y = S / 2 + Math.sin(a) * d;
    const len = 14 + rnd() * 18, wid = len * (0.38 + rnd() * 0.15), rot = rnd() * Math.PI * 2;
    const shade = 0.55 + rnd() * 0.45 - d / S * 0.5;
    const r = Math.round(95 * shade + rnd() * 30), gg = Math.round(165 * shade + rnd() * 35), b = Math.round(70 * shade);
    g.save(); g.translate(x, y); g.rotate(rot);
    g.fillStyle = `rgb(${r},${gg},${b})`;
    g.beginPath(); g.moveTo(-len / 2, 0); g.quadraticCurveTo(0, -wid, len / 2, 0); g.quadraticCurveTo(0, wid, -len / 2, 0); g.fill();
    g.strokeStyle = `rgba(20,30,10,${0.35 + rnd() * 0.2})`; g.lineWidth = 1; g.stroke();
    g.strokeStyle = `rgba(190,210,140,${0.15 + rnd() * 0.15})`; g.beginPath(); g.moveTo(-len / 2, 0); g.lineTo(len / 2, 0); g.stroke();
    g.restore();
  }
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4;
  return t;
}

// ───────────────────────── lights ─────────────────────────
function buildLights() {
  scene.add(new THREE.HemisphereLight(0x4a5878, 0x15120e, 0.55));
  const moon = new THREE.DirectionalLight(0xa9bcff, 0.55);
  moon.castShadow = !TOUCH;
  moon.shadow.mapSize.set(2048, 2048);
  moon.shadow.camera.near = 1; moon.shadow.camera.far = 80;
  moon.shadow.bias = -0.0008; moon.shadow.normalBias = 0.03;
  scene.add(moon); scene.add(moon.target);
  const flash = new THREE.SpotLight(0xfff0d8, 220, 26, 0.5, 0.55, 1.6);
  flash.castShadow = true; flash.shadow.mapSize.set(TOUCH ? 512 : 1024, TOUCH ? 512 : 1024);
  flash.shadow.bias = -0.0005; flash.shadow.camera.near = 0.3; flash.shadow.camera.far = 26;
  scene.add(flash); scene.add(flash.target);
  const fill = new THREE.PointLight(0xffe8cc, 6, 5, 1.6); scene.add(fill);
  const pool = (n, make) => Array.from({ length: n }, () => { const l = make(); l.intensity = 0; scene.add(l); if (l.target) scene.add(l.target); return l; });
  L = {
    moon, flash, fill,
    lamps: pool(TOUCH ? 3 : 5, () => new THREE.PointLight(0xffb873, 0, 11, 1.7)),
    rooms: pool(TOUCH ? 2 : 3, () => new THREE.PointLight(0xcfe0ff, 0, 10, 1.5)),
    espots: pool(TOUCH ? 2 : 3, () => new THREE.SpotLight(0xfff0d0, 0, 14, 0.42, 0.5, 1.5)),
    muzzle: pool(2, () => new THREE.PointLight(0xffb060, 0, 10, 1.6)),
    ext: (() => { const l = new THREE.PointLight(0xffa860, 0, 16, 1.4); scene.add(l); return l; })(),
  };
}
const nearest = (list, n, cx, cy, key) => list.map(it => [it, (key(it)[0] - cx) ** 2 + (key(it)[1] - cy) ** 2]).sort((a, b) => a[1] - b[1]).slice(0, n).map(a => a[0]);

// ───────────────────────── soldiers ─────────────────────────
const MAT = (c, r = 0.55, m = 0.6) => new THREE.MeshStandardMaterial({ color: c, roughness: r, metalness: m });
const WM = { blk: MAT(0x1a1c1e, 0.42, 0.75), dark: MAT(0x2c3032, 0.5, 0.55), poly: MAT(0x222420, 0.85, 0.08), wood: MAT(0x6a3d1f, 0.6, 0.05), tan: MAT(0x7d6e50, 0.75, 0.08), steel: MAT(0xb5b9bd, 0.25, 0.9) };
function buildWeapon(kind) {
  const g = new THREE.Group();
  const box = (w, h, d, x, y, z, m) => { const b = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), m); b.position.set(x, y, z); b.castShadow = true; g.add(b); return b; };
  const cyl = (r, l, x, y, z, m) => { const c = new THREE.Mesh(new THREE.CylinderGeometry(r, r, l, 10), m); c.rotation.x = Math.PI / 2; c.position.set(x, y, z); c.castShadow = true; g.add(c); return c; };
  if (kind === 'rifle') {
    box(0.06, 0.09, 0.42, 0, 0.05, 0.1, WM.blk); box(0.05, 0.07, 0.26, 0, 0.05, -0.22, WM.tan); box(0.055, 0.1, 0.06, 0, 0, -0.36, WM.poly);
    box(0.065, 0.075, 0.28, 0, 0.06, 0.42, WM.poly);
    for (let k = 0; k < 4; k++) box(0.07, 0.012, 0.03, 0, 0.1, 0.32 + k * 0.06, WM.dark);
    cyl(0.012, 0.22, 0, 0.065, 0.66, WM.blk); cyl(0.02, 0.06, 0, 0.065, 0.78, WM.dark);
    box(0.04, 0.13, 0.07, 0, -0.06, 0.14, WM.blk).rotation.x = -0.25; box(0.035, 0.09, 0.04, 0, -0.04, -0.02, WM.poly);
    box(0.035, 0.05, 0.1, 0, 0.12, 0.08, WM.dark);
  } else if (kind === 'shotgun') {
    box(0.06, 0.085, 0.36, 0, 0.05, 0.05, WM.blk); box(0.05, 0.075, 0.3, 0, 0.04, -0.27, WM.wood); box(0.06, 0.07, 0.18, 0, 0.03, 0.42, WM.wood);
    cyl(0.016, 0.6, 0, 0.075, 0.5, WM.blk); cyl(0.013, 0.5, 0, 0.035, 0.45, WM.dark); box(0.035, 0.09, 0.04, 0, -0.04, -0.03, WM.wood);
  } else if (kind === 'pistol') {
    box(0.035, 0.05, 0.2, 0, 0.05, 0.08, WM.blk); box(0.032, 0.1, 0.045, 0, -0.01, 0, WM.poly).rotation.x = -0.2;
  } else if (kind === 'knife') {
    box(0.012, 0.03, 0.18, 0, 0, 0.12, WM.steel); box(0.025, 0.035, 0.1, 0, 0, -0.02, WM.poly);
  }
  return g;
}
const TINT = { player: 0xffffff, rifle: 0x5d6a80, gunner: 0x2a2c30, scout: 0x8c8460, sniper: 0x6f8a52 };
const ART = { rifle: 'rifle', shotgun: 'shotgun', pistol: 'pistol' };
function makeUnit(kind) {
  const root = SkeletonUtils.clone(lib.soldier.scene);
  const bones = {}; root.traverse(o => { if (o.isBone) bones[o.name.replace('mixamorig', '')] = o; });
  const mats = [];
  root.traverse(o => {
    if (o.isMesh || o.isSkinnedMesh) {
      o.material = o.material.clone(); o.castShadow = true; o.receiveShadow = true; o.frustumCulled = false;
      if (o.material.name.includes('Body')) o.material.color.set(TINT[kind] || 0xffffff);
      mats.push(o.material);
    }
  });
  const mixer = new THREE.AnimationMixer(root);
  const clip = n => lib.soldier.animations.find(a => a.name === n);
  const actions = { Idle: mixer.clipAction(clip('Idle')), Walk: mixer.clipAction(clip('Walk')), Run: mixer.clipAction(clip('Run')) };
  actions.Idle.play();
  const yaw = new THREE.Group(); yaw.add(root);
  const weapons = { rifle: buildWeapon('rifle'), shotgun: buildWeapon('shotgun'), pistol: buildWeapon('pistol'), knife: buildWeapon('knife') };
  for (const w of Object.values(weapons)) { w.visible = false; scene.add(w); }
  scene.add(yaw);
  return { kind, root, yaw, bones, mats, mixer, actions, cur: 'Idle', weapons, lx: null, ly: null, dead: false, deadT: 0, opacity: 1 };
}
const _a = new THREE.Vector3(), _b = new THREE.Vector3(), _q = new THREE.Quaternion(), _pq = new THREE.Quaternion(), _wq = new THREE.Quaternion();
function ik(chain, hand, target, iters = 10) {
  for (let it = 0; it < iters; it++) {
    for (const bone of chain) {
      bone.updateMatrixWorld(true);
      bone.getWorldPosition(_a); hand.getWorldPosition(_b);
      const toEff = _b.sub(_a).normalize(), toTgt = target.clone().sub(_a).normalize();
      _q.setFromUnitVectors(toEff, toTgt);
      bone.getWorldQuaternion(_wq); bone.parent.getWorldQuaternion(_pq);
      bone.quaternion.copy(_pq.invert().multiply(_q.multiply(_wq)));
    }
  }
  chain[0].updateMatrixWorld(true);
}
function setAction(u, name, scale) {
  if (u.cur !== name) {
    const from = u.actions[u.cur], to = u.actions[name];
    to.reset().play(); to.crossFadeFrom(from, 0.2, false);
    u.cur = name;
  }
  u.actions[name].timeScale = scale;
}
// pose the arms on the weapon; o: { art, shootT, reloadP, knifeP }
function poseArms(u, o) {
  const { bones, weapons } = u;
  for (const w of Object.values(weapons)) w.visible = false;
  u.root.updateMatrixWorld(true);
  const ra = new THREE.Vector3(), la = new THREE.Vector3(), sp = new THREE.Vector3();
  bones.RightArm.getWorldPosition(ra); bones.LeftArm.getWorldPosition(la); bones.Spine2.getWorldPosition(sp);
  bones.RightForeArm.rotation.z += 0.6; bones.LeftForeArm.rotation.z -= 0.6;
  // character frame vectors (world)
  const F = new THREE.Vector3(0, 0, -1).applyQuaternion(u.yaw.quaternion), RT = new THREE.Vector3(1, 0, 0).applyQuaternion(u.yaw.quaternion), UP = new THREE.Vector3(0, 1, 0);
  if (o.knifeP != null) {
    const k = weapons.knife; k.visible = true;
    const ang = 1.0 - o.knifeP * 1.9;
    const dir = F.clone().applyAxisAngle(UP, ang);
    const hand = ra.clone().addScaledVector(dir, 0.5).addScaledVector(UP, -0.18 + Math.sin(o.knifeP * Math.PI) * 0.08);
    ik([bones.RightArm, bones.RightForeArm], bones.RightHand, hand);
    ik([bones.LeftArm, bones.LeftForeArm], bones.LeftHand, la.clone().addScaledVector(F, 0.28).addScaledVector(RT, 0.12).addScaledVector(UP, -0.25));
    bones.RightHand.getWorldPosition(_a);
    k.position.copy(_a); k.quaternion.copy(u.yaw.quaternion); k.rotateY(Math.PI + ang * 0.8);
    return;
  }
  const w = weapons[o.art]; w.visible = true;
  const recoil = o.shootT < 0.08 ? (0.08 - o.shootT) * 0.7 : 0;
  const rp = o.reloadP;
  const lower = rp != null ? Math.sin(rp * Math.PI) * 0.06 : 0, roll = rp != null ? Math.sin(rp * Math.PI) * 0.5 : 0;
  if (o.art === 'pistol') {
    w.position.copy(sp).addScaledVector(F, 0.5 - recoil).addScaledVector(RT, 0.02).addScaledVector(UP, 0.05 - lower);
  } else {
    w.position.copy(ra).addScaledVector(RT, -0.06).addScaledVector(UP, -0.13 - lower).addScaledVector(F, 0.2 - recoil);
  }
  w.quaternion.copy(u.yaw.quaternion);
  w.rotateY(o.art === 'pistol' ? Math.PI : Math.PI - 0.14);
  w.rotateX(recoil * 1.5 - lower * 0.6); w.rotateZ(roll);
  w.updateMatrixWorld(true);
  const P = (x, y, z) => new THREE.Vector3(x, y, z).applyMatrix4(w.matrixWorld);
  const grip = P(0, -0.02, -0.02);
  let fore = o.art === 'pistol' ? P(0.01, -0.03, 0) : P(0, 0, 0.42);
  if (rp != null) {
    const hg = P(0, 0, 0.42), mag = P(0, -0.12, 0.14), pouch = la.clone().addScaledVector(UP, -0.32).addScaledVector(F, 0.12).addScaledVector(RT, 0.05);
    const seg = (a, b, k) => a.clone().lerp(b, k);
    fore = rp < 0.25 ? seg(hg, mag, rp / 0.25) : rp < 0.5 ? seg(mag, pouch, (rp - 0.25) / 0.25) : rp < 0.8 ? seg(pouch, mag, (rp - 0.5) / 0.3) : seg(mag, hg, (rp - 0.8) / 0.2);
  }
  ik([bones.RightArm, bones.RightForeArm], bones.RightHand, grip);
  ik([bones.LeftArm, bones.LeftForeArm], bones.LeftHand, fore);
}
function updateUnit(u, ent, dt, o) {
  const x = ent.x / M, z = ent.y / M;
  if (o.dead) {
    if (!u.dead) {
      u.dead = true;
      for (const a of Object.values(u.actions)) a.stop();
      u.actions.Idle.play(); u.mixer.setTime(0.2);
      u.root.rotation.x = -Math.PI / 2; u.root.position.y = 0.12;
      u.yaw.rotation.y = -(o.fallA ?? 0) - Math.PI / 2;
      u.yaw.position.set(x, 0, z);
      for (const w of Object.values(u.weapons)) w.visible = false;
      const gun = u.weapons[o.art] || u.weapons.rifle; gun.visible = true;
      gun.position.set(x + 0.5, 0.05, z + 0.3); gun.rotation.set(-Math.PI / 2, 0, (x * 13) % 6);
      for (const m of u.mats) { m.color.multiplyScalar(0.55); m.transparent = false; m.opacity = 1; }
    }
    return;
  }
  u.yaw.position.set(x, 0, z);
  u.yaw.rotation.y = -o.aim - Math.PI / 2;
  const mv = u.lx == null ? 0 : Math.hypot(ent.x - u.lx, ent.y - u.ly);
  const speed = dt > 0 ? mv / dt / M : 0;            // m/s
  if (speed > 0.25) {
    const mvA = Math.atan2(ent.y - u.ly, ent.x - u.lx);
    const back = Math.cos(mvA - o.aim) < -0.3;
    if (speed > 3.6) setAction(u, 'Run', (back ? -1 : 1) * speed / 4.4);
    else setAction(u, 'Walk', (back ? -1 : 1) * Math.max(0.6, speed / 1.7));
  } else setAction(u, 'Idle', 1);
  u.lx = ent.x; u.ly = ent.y;
  u.mixer.update(dt);
  const s = o.scale || 1; u.yaw.scale.setScalar(s);
  poseArms(u, o);
  // visibility fade + hit flash
  if (u.opacity !== o.alpha) {
    u.opacity = o.alpha;
    for (const m of u.mats) { m.transparent = o.alpha < 0.99; m.opacity = o.alpha; }
    for (const w of Object.values(u.weapons)) w.traverse(c => { if (c.isMesh) { c.material = c.material.clone(); c.material.transparent = o.alpha < 0.99; c.material.opacity = o.alpha; } });
  }
  const fl = Math.max(0, o.flash || 0);
  for (const m of u.mats) { m.emissive.setRGB(fl * 0.6, fl * 0.6, fl * 0.6); }
}
function hideUnit(u) { u.yaw.visible = false; for (const w of Object.values(u.weapons)) w.visible = false; }

// ───────────────────────── per-frame render ─────────────────────────
let groundT = 0;
R3.render = function (dt, sx, sy, vis) {
  if (!R3.ready) return;
  const st = G.state, P = G.P, cam = G.cam, ZOOM = G.ZOOM, W = window.innerWidth, H = window.innerHeight;
  const t = performance.now() / 1000;
  // camera: straight down, so the ground plane maps 1:1 onto the 2D overlay
  const vh = H / ZOOM / M, fov = camera.fov * Math.PI / 180;
  const h = (vh / 2) / Math.tan(fov / 2);
  const cx = (cam.x - sx / ZOOM) / M, cz = (cam.y - sy / ZOOM) / M;
  camera.position.set(cx, h, cz); camera.up.set(0, 0, -1); camera.lookAt(cx, 0, cz);
  camera.near = Math.max(1, h - 12); camera.far = h + 5; camera.updateProjectionMatrix();
  // ground decals
  groundT -= dt;
  if (G.groundDirty && groundT <= 0) { groundTex.needsUpdate = true; G.groundDirty = false; groundT = 0.35; }
  const vw = W / ZOOM / M, inView = (x, y, m) => Math.abs(x / M - cx) < vw / 2 + m && Math.abs(y / M - cz) < vh / 2 + m;

  // soldiers
  const seen = new Set();
  const drive = (ent, kind, o) => {
    let u = units.get(ent);
    if (!u) { u = makeUnit(kind); units.set(ent, u); }
    seen.add(ent);
    if (!o.dead && (!inView(ent.x, ent.y, 3) || o.alpha <= 0.02)) { hideUnit(u); u.lx = ent.x; u.ly = ent.y; return; }
    u.yaw.visible = true;
    updateUnit(u, ent, dt, o);
  };
  for (const e of G.enemies) {
    drive(e, e.type, { aim: e.a, art: ART[e.T.art] || 'rifle', shootT: e.shotT, scale: e.T.scale, alpha: st === 'menu' ? 1 : e.va, flash: e.flash / 0.12, dead: e.dead, fallA: e.fallA });
  }
  if (st !== 'menu') {
    const w = G.WEAPONS[P.wi];
    drive(P, 'player', {
      aim: P.a, art: ART[w.art] || 'rifle', shootT: P.shootT, alpha: 1, flash: P.iT > 0 ? 0.5 : 0, scale: P.crouch ? 0.92 : 1,
      reloadP: P.reloadT > 0 ? 1 - P.reloadT / w.reload : null, knifeP: P.knifeT > 0 ? 1 - P.knifeT / 0.32 : null, dead: P.dead, fallA: P.a + Math.PI,
    });
  }
  for (const [ent, u] of units) if (!seen.has(ent)) { scene.remove(u.yaw); for (const w of Object.values(u.weapons)) scene.remove(w); units.delete(ent); }

  // props state
  for (const c of crate3) if (c.g) c.g.rotation.x = c.c.opened ? 0.0 : 0, c.g.visible = true, c.c.opened && (c.g.position.y = -0.05);
  for (const ob of obj3) {
    ob.g.visible = !ob.o.taken;
    const k = 0.35 + Math.sin(t * 3) * 0.25;
    for (const m of ob.mats) m.emissiveIntensity = k;
  }
  pick3.forEach((g, i) => { const pk = G.pickups[i]; g.visible = !!pk; if (pk) g.position.set(pk.x / M, 0, pk.y / M); });
  for (const tt of trees3) {
    const a = tt.tr.a ?? 1;
    for (const m of tt.mats) { m.transparent = a < 0.95; m.opacity = a; m.depthWrite = a > 0.95; }
    tt.g.rotation.z = Math.sin(t * 0.8 + tt.tr.x) * 0.012;
  }

  // lights
  const f = G.weather.flash;
  L.moon.intensity = 0.55 + f * 3;
  L.moon.position.set(cx - 9, 24, cz + 7); L.moon.target.position.set(cx, 0, cz);
  const sc = L.moon.shadow.camera, half = Math.max(vw, vh) / 2 + 3;
  if (sc.right !== half) { sc.left = -half; sc.right = half; sc.top = half; sc.bottom = -half; sc.updateProjectionMatrix(); }
  if (st !== 'menu' && !P.dead) {
    const px = P.x / M, pz = P.y / M, dx = Math.cos(P.a), dz = Math.sin(P.a);
    L.flash.intensity = 220; L.flash.position.set(px + dx * 0.35, 1.45, pz + dz * 0.35);
    L.flash.target.position.set(px + dx * 8, 0, pz + dz * 8);
    L.fill.intensity = 5; L.fill.position.set(px, 2.2, pz);
  } else { L.flash.intensity = 0; L.fill.intensity = 0; }
  const lamps = nearest(G.LAMPS.filter(l => inView(l[0], l[1], 8)), L.lamps.length, cam.x, cam.y, l => l);
  L.lamps.forEach((l, i) => { const p = lamps[i]; l.intensity = p ? 34 : 0; if (p) l.position.set(p[0] / M, 4.5, p[1] / M); });
  const rooms = nearest(G.INTERIOR.filter(r => inView(r.x, r.y, 6)), L.rooms.length, cam.x, cam.y, r => [r.x, r.y]);
  L.rooms.forEach((l, i) => {
    const r = rooms[i]; let a = r ? 26 : 0;
    if (r && r.flicker && (Math.sin(t * 23) > 0.75 || Math.sin(t * 3.1) > 0.92)) a *= 0.2;
    l.intensity = a; if (r) l.position.set(r.x / M, 2.3, r.y / M);
  });
  const eflash = nearest(G.enemies.filter(e => !e.dead && e.type !== 'sniper' && inView(e.x, e.y, 4)), L.espots.length, P.x, P.y, e => [e.x, e.y]);
  L.espots.forEach((l, i) => {
    const e = eflash[i]; l.intensity = e ? 120 : 0;
    if (e) {
      const dx = Math.cos(e.a), dz = Math.sin(e.a);
      l.position.set(e.x / M + dx * 0.5, 1.4, e.y / M + dz * 0.5); l.target.position.set(e.x / M + dx * 6, 0, e.y / M + dz * 6);
      l.color.set(e.state === 'combat' ? 0xffb0a0 : e.state === 'alert' ? 0xffe2a0 : 0xfff0d0);
    }
  });
  const fl = G.lights.slice(-L.muzzle.length);
  L.muzzle.forEach((l, i) => { const s = fl[i]; l.intensity = s ? s.a * (s.life / s.max) * 260 : 0; if (s) { l.position.set(s.x / M, 1.2, s.y / M); l.color.setStyle(`rgb(${s.col})`); l.distance = s.r / M * 1.4; } });
  if (G.ext.active) { L.ext.intensity = 60 + Math.sin(t * 4) * 15; L.ext.position.set(G.EXT.x / M, 3, G.EXT.y / M); } else L.ext.intensity = 0;

  R3.camH = h;
  renderer.render(scene, camera);
};
R3.setLowQuality = function () {
  if (!renderer) return;
  renderer.setPixelRatio(1); L.moon && (L.moon.castShadow = false); resize();
};
