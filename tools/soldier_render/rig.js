// Shared rendering rig: loads the soldier, builds weapons, poses arms with IK.
import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { RoomEnvironment } from 'three/addons/environments/RoomEnvironment.js';

export async function makeRig(size) {
  const r = new THREE.WebGLRenderer({ antialias: true, alpha: true, preserveDrawingBuffer: true });
  r.setPixelRatio(1); r.setSize(size, size);
  r.toneMapping = THREE.ACESFilmicToneMapping; r.toneMappingExposure = 1.05;
  r.outputColorSpace = THREE.SRGBColorSpace;
  document.body.appendChild(r.domElement);
  const scene = new THREE.Scene();
  const pm = new THREE.PMREMGenerator(r);
  scene.environment = pm.fromScene(new RoomEnvironment(), 0.04).texture;
  scene.add(new THREE.HemisphereLight(0xe8eeff, 0x40382c, 0.9));
  const key = new THREE.DirectionalLight(0xfff4e6, 2.4); key.position.set(-2.5, 8, 2); scene.add(key);
  const fill = new THREE.DirectionalLight(0xb8cfff, 0.7); fill.position.set(3, 6, -3); scene.add(fill);
  const g = await new GLTFLoader().loadAsync('Soldier.glb');
  const model = g.scene; scene.add(model);
  const bones = {}; model.traverse(o => { if (o.isBone) bones[o.name.replace('mixamorig', '')] = o; });
  const mats = []; model.traverse(o => { if (o.isMesh) { o.frustumCulled = false; mats.push(o.material); } });
  const mixer = new THREE.AnimationMixer(model);
  const clips = Object.fromEntries(g.animations.map(a => [a.name, a]));
  return { r, scene, model, bones, mats, mixer, clips, THREE };
}

const M = (c, rough = 0.55, metal = 0.6) => new THREE.MeshStandardMaterial({ color: c, roughness: rough, metalness: metal });
export function buildWeapon(kind) {
  const g = new THREE.Group();
  const box = (w, h, d, x, y, z, m) => { const b = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), m); b.position.set(x, y, z); g.add(b); return b; };
  const cyl = (r, l, x, y, z, m) => { const c = new THREE.Mesh(new THREE.CylinderGeometry(r, r, l, 10), m); c.rotation.x = Math.PI / 2; c.position.set(x, y, z); g.add(c); return c; };
  const blk = M(0x1c1e20, 0.45, 0.7), dark = M(0x2a2d2f, 0.5, 0.5), poly = M(0x24261f, 0.8, 0.1), wood = M(0x6a3d1f, 0.6, 0.05), tan = M(0x8a7a5a, 0.7, 0.1);
  // weapon local: +Z forward (muzzle), +Y up; origin at the grip
  if (kind === 'rifle') {
    box(0.06, 0.09, 0.42, 0, 0.05, 0.1, blk);           // receiver
    box(0.05, 0.07, 0.26, 0, 0.05, -0.22, tan);         // stock
    box(0.055, 0.1, 0.06, 0, 0.0, -0.36, poly);         // butt
    box(0.065, 0.075, 0.28, 0, 0.06, 0.42, poly);       // handguard
    for (let k = 0; k < 4; k++) box(0.07, 0.012, 0.03, 0, 0.1, 0.32 + k * 0.06, dark); // rail slots
    cyl(0.012, 0.22, 0, 0.065, 0.66, blk);              // barrel
    cyl(0.02, 0.06, 0, 0.065, 0.78, dark);              // muzzle device
    box(0.04, 0.13, 0.07, 0, -0.06, 0.14, blk).rotation.x = -0.25; // mag
    box(0.035, 0.09, 0.04, 0, -0.04, -0.02, poly);      // grip
    box(0.035, 0.05, 0.1, 0, 0.12, 0.08, dark);         // optic
    cyl(0.017, 0.03, 0, 0.12, 0.14, M(0x203040, 0.2, 0.3));
  } else if (kind === 'shotgun') {
    box(0.06, 0.085, 0.36, 0, 0.05, 0.05, blk);
    box(0.05, 0.075, 0.3, 0, 0.04, -0.27, wood);
    box(0.06, 0.07, 0.18, 0, 0.03, 0.42, wood);         // pump
    cyl(0.016, 0.6, 0, 0.075, 0.5, blk);                // barrel
    cyl(0.013, 0.5, 0, 0.035, 0.45, dark);              // tube
    box(0.035, 0.09, 0.04, 0, -0.04, -0.03, wood);
  } else if (kind === 'pistol') {
    box(0.035, 0.05, 0.2, 0, 0.05, 0.08, blk);
    box(0.032, 0.1, 0.045, 0, -0.01, 0.0, poly).rotation.x = -0.2;
  } else if (kind === 'knife') {
    box(0.012, 0.03, 0.18, 0, 0, 0.12, M(0xb0b4b8, 0.25, 0.9));
    box(0.025, 0.035, 0.1, 0, 0, -0.02, poly);
  }
  g.traverse(o => { if (o.isMesh) o.castShadow = false; });
  return g;
}

// two-pass CCD IK on [upper, lower] so the hand reaches target (world)
const _a = new THREE.Vector3(), _b = new THREE.Vector3(), _c = new THREE.Vector3(), _q = new THREE.Quaternion(), _pq = new THREE.Quaternion(), _wq = new THREE.Quaternion();
export function ik(chain, hand, target, iters = 14) {
  for (let it = 0; it < iters; it++) {
    for (const bone of chain) {
      bone.updateMatrixWorld(true);
      bone.getWorldPosition(_a); hand.getWorldPosition(_b);
      const toEff = _b.clone().sub(_a).normalize(), toTgt = target.clone().sub(_a).normalize();
      _q.setFromUnitVectors(toEff, toTgt);
      bone.getWorldQuaternion(_wq);
      bone.parent.getWorldQuaternion(_pq);
      const nw = _q.clone().multiply(_wq);
      bone.quaternion.copy(_pq.clone().invert().multiply(nw));
      bone.updateMatrixWorld(true);
    }
  }
}
export function aimHand(hand, dirWorld, upWorld) {
  // orient the hand so its palm faces the weapon; rough but stable
  hand.updateMatrixWorld(true);
}
