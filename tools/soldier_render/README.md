# Soldier render pipeline

Renders the top-down soldier atlases in `web/assets/` from a rigged 3D model.

1. `npm i three@0.170.0` in this folder, and put `Soldier.glb` here
   (three.js `examples/models/gltf/Soldier.glb`, or the same Mixamo character).
2. `python3 -m http.server 8765` in this folder.
3. `node render.js frames` renders every frame with Playwright/Chromium
   (legs and torso in separate passes, arms posed onto the weapon with IK).
4. `python3 pack.py frames ../../web/assets` packs atlases, recolours the
   enemy factions and writes `sprites.json` (pivot, muzzle points, frame counts).
   Paste `sprites.json` into the `SPR` constant in `web/index.html`.
