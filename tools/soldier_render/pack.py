import json, os, sys
from PIL import Image
import numpy as np
# recolour the tan armour per faction; greys (weapons, straps) keep their colour
TARGET = {'rifle': (215, 0.2, 0.72), 'gunner': (220, 0.08, 0.42), 'scout': (60, 0.32, 0.72), 'sniper': (92, 0.42, 0.66)}
def recolor(im, v):
    if v not in TARGET: return im
    th, ts, tv = TARGET[v]
    a = np.asarray(im.convert('RGBA')).astype(np.float32) / 255
    rgb = a[..., :3]; mx = rgb.max(-1); mn = rgb.min(-1); d = mx - mn
    sat = np.where(mx > 0, d / np.maximum(mx, 1e-6), 0)
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    hue = np.where(mx == r, ((g - b) / np.maximum(d, 1e-6)) % 6, np.where(mx == g, (b - r) / np.maximum(d, 1e-6) + 2, (r - g) / np.maximum(d, 1e-6) + 4)) * 60
    mask = (sat > 0.18) & (hue > 10) & (hue < 60) & (a[..., 3] > 0)
    val = mx * tv
    c = val * ts; x = c * (1 - abs((th / 60) % 2 - 1)); m = val - c
    seg = int(th // 60) % 6
    tbl = [(c, x, 0 * c), (x, c, 0 * c), (0 * c, c, x), (0 * c, x, c), (x, 0 * c, c), (c, 0 * c, x)][seg]
    new = np.stack([tbl[0] + m, tbl[1] + m, tbl[2] + m], -1)
    rgb[mask] = new[mask]
    a[..., :3] = rgb
    return Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8), 'RGBA')
SRC, OUT = sys.argv[1], sys.argv[2]
os.makedirs(OUT, exist_ok=True)
meta = json.load(open(os.path.join(SRC, 'meta.json')))
FS, PPM = 256, 128.0
PX, PY = meta['pivot']
CROP = (0, PY - 80, 256, PY + 80)      # torso/legs cells: 256 x 160
FW, FH = 256, 160
groups = {}
for f in os.listdir(SRC):
    if not f.endswith('.png'): continue
    v, w, anim, i = f[:-4].split('__')
    groups.setdefault((v, w), {}).setdefault(anim, []).append((int(i), f))
out = {'ppm': PPM, 'frameW': FW, 'frameH': FH, 'pivotX': PX, 'pivotY': PY - CROP[1], 'deadSize': FS, 'sheets': {}, 'muzzle': {}}
for k, (mx, my) in meta['muzzle'].items():
    out['muzzle'][k] = [(mx - PX) / PPM, (my - PY) / PPM]   # metres: forward, right
order = ['idle', 'move', 'shoot', 'reload', 'meleeattack', 'walk', 'run']
dead = []
for (v, w), anims in sorted(groups.items()):
    if w == 'dead':
        dead.append((v, recolor(Image.open(os.path.join(SRC, anims['dead'][0][1])), v))); continue
    names = [a for a in order if a in anims]
    cols = max(len(anims[a]) for a in names)
    sheet = Image.new('RGBA', (cols * FW, len(names) * FH)); info = {}
    for r, a in enumerate(names):
        for c, (_, f) in enumerate(sorted(anims[a])):
            sheet.alpha_composite(recolor(Image.open(os.path.join(SRC, f)).crop(CROP), v), (c * FW, r * FH))
        info[a] = [r, len(anims[a])]
    name = f'{v}_{w}'
    sheet.save(os.path.join(OUT, name + '.png'), optimize=True)
    out['sheets'][name] = info
    print(name, sheet.size, info)
sheet = Image.new('RGBA', (len(dead) * FS, FS)); info = {}
for c, (v, im) in enumerate(dead):
    sheet.alpha_composite(im, (c * FS, 0)); info[v] = c
sheet.save(os.path.join(OUT, 'dead.png'), optimize=True)
out['dead'] = info
json.dump(out, open(os.path.join(OUT, 'sprites.json'), 'w'), indent=1)
print(json.dumps(out['muzzle']))
