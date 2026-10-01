"""Builds the soldier sprite atlases used by web/index.html.

Source art: "Animated Top Down Survivor Player" by rileygombart (CC-BY 3.0)
https://opengameart.org/content/animated-top-down-survivor-player
Download Top_Down_Survivor_2.zip from that page, unzip it and pass the
Top_Down_Survivor folder as the first argument.

Usage: python3 tools/build_sprites.py <Top_Down_Survivor dir> web/assets
"""
import colorsys, glob, json, os, re, sys
from PIL import Image

SRC, OUT = sys.argv[1], sys.argv[2]
S = 0.55                      # downscale applied to the source frames
BOX = (125, 215, 135, 115)    # left, right, top, bottom around the head pivot (source px)
FW, FH = round((BOX[0] + BOX[1]) * S), round((BOX[2] + BOX[3]) * S)

def frames(path, step=1):
    fs = glob.glob(os.path.join(SRC, path, '*.png'))
    fs.sort(key=lambda f: int(re.findall(r'_(\d+)\.png$', f)[0]))
    return [Image.open(f).convert('RGBA') for f in fs][::step]

def head_pivot(im):
    xs = ys = n = 0
    px = im.load()
    for y in range(im.size[1]):
        for x in range(im.size[0]):
            r, g, b, a = px[x, y]
            if a < 250: continue
            h, s, v = colorsys.rgb_to_hsv(r / 255, g / 255, b / 255)
            if 0.12 <= s <= 0.3 and 0.17 <= v <= 0.27 and (h < 0.08 or h > 0.95):
                xs += x; ys += y; n += 1
    return (xs / n, ys / n)

def muzzle(im, piv):
    px = im.load()
    for x in range(im.size[0] - 1, -1, -1):
        col = [y for y in range(im.size[1]) if px[x, y][3] > 200]
        if col: return (x - piv[0], sum(col) / len(col) - piv[1])

def recolor(im, target, pack):
    im = im.copy(); px = im.load()
    for y in range(im.size[1]):
        for x in range(im.size[0]):
            r, g, b, a = px[x, y]
            if a == 0: continue
            h, s, v = colorsys.rgb_to_hsv(r / 255, g / 255, b / 255)
            hd = h * 360
            cloth = 95 <= hd <= 210 and s < 0.5 and v > 0.08
            camo = 35 <= hd < 95 and 0.15 <= s <= 0.75 and v > 0.12
            if cloth or (camo and pack):
                tgt = target if cloth else pack
                k = min(1.9, v / 0.33)
                px[x, y] = tuple(min(255, int(c * k)) for c in tgt) + (a,)
    return im

def darken(im, f=0.5):
    im = im.copy(); px = im.load()
    for y in range(im.size[1]):
        for x in range(im.size[0]):
            r, g, b, a = px[x, y]
            if a: px[x, y] = (int(r * f), int(g * f * 0.95), int(b * f * 0.95), a)
    return im

def cell(im, piv):
    """Crop a fixed box around the pivot and scale it down."""
    box = (round(piv[0] - BOX[0]), round(piv[1] - BOX[2]), round(piv[0] + BOX[1]), round(piv[1] + BOX[3]))
    c = Image.new('RGBA', (BOX[0] + BOX[1], BOX[2] + BOX[3]))
    c.alpha_composite(im.crop((max(0, box[0]), max(0, box[1]), min(im.size[0], box[2]), min(im.size[1], box[3]))),
                      (max(0, -box[0]), max(0, -box[1])))
    return c.resize((FW, FH), Image.LANCZOS)

VARIANTS = {
    'player': (None, None),
    'rifle': ((74, 80, 92), (60, 64, 70)),
    'gunner': ((44, 46, 50), (38, 40, 42)),
    'scout': ((122, 104, 80), (96, 82, 62)),
    'sniper': ((92, 104, 60), (78, 88, 50)),
}
LOADOUT = {
    'player': {'rifle': ['idle', 'move', 'shoot', 'reload', 'meleeattack'],
               'shotgun': ['idle', 'move', 'shoot', 'reload', 'meleeattack'],
               'handgun': ['idle', 'move', 'shoot', 'reload', 'meleeattack'],
               'knife': ['meleeattack']},
    'rifle': {'rifle': ['idle', 'move', 'shoot']},
    'gunner': {'rifle': ['idle', 'move', 'shoot']},
    'sniper': {'rifle': ['idle', 'move', 'shoot']},
    'scout': {'handgun': ['idle', 'move', 'shoot']},
}
STEP = {'idle': 2, 'move': 2, 'shoot': 1, 'reload': 2, 'meleeattack': 2}

meta = {'frameW': FW, 'frameH': FH, 'pivotX': BOX[0] * S, 'pivotY': BOX[2] * S, 'srcScale': S, 'sheets': {}, 'muzzle': {}}
for var, (cloth, pack) in VARIANTS.items():
    for weapon, anims in LOADOUT[var].items():
        rows = []
        for anim in anims:
            fr = frames(f'{weapon}/{anim}', STEP[anim])
            piv = head_pivot(fr[0])
            if anim == 'idle' and var == 'player':
                meta['muzzle'][weapon] = muzzle(fr[0], piv)
            cells = [cell(recolor(f, cloth, pack) if cloth else f, piv) for f in fr]
            rows.append((anim, cells))
        if var != 'player' or weapon == 'rifle':
            rows.append(('dead', [darken(rows[0][1][0])]))
        cols = max(len(c) for _, c in rows)
        sheet = Image.new('RGBA', (cols * FW, len(rows) * FH))
        info = {}
        for r, (anim, cells) in enumerate(rows):
            for i, c in enumerate(cells): sheet.alpha_composite(c, (i * FW, r * FH))
            info[anim] = [r, len(cells)]
        name = f'{var}_{weapon}'
        sheet.save(os.path.join(OUT, name + '.png'), optimize=True)
        meta['sheets'][name] = info
        print(name, sheet.size, info)

# feet: own pivot (bbox centre), same scale
rows = []
for anim, step in (('idle', 1), ('walk', 2), ('run', 2)):
    fr = frames(f'feet/{anim}', step)
    out = []
    for f in fr:
        bb = f.getbbox(); piv = ((bb[0] + bb[2]) / 2, (bb[1] + bb[3]) / 2)
        out.append(cell(f, piv))
    rows.append((anim, out))
cols = max(len(c) for _, c in rows)
sheet = Image.new('RGBA', (cols * FW, len(rows) * FH)); info = {}
for r, (anim, cells) in enumerate(rows):
    for i, c in enumerate(cells): sheet.alpha_composite(c, (i * FW, r * FH))
    info[anim] = [r, len(cells)]
sheet.save(os.path.join(OUT, 'feet.png'), optimize=True)
meta['sheets']['feet'] = info
json.dump(meta, open(os.path.join(OUT, 'sprites.json'), 'w'), indent=1)
print(json.dumps(meta['muzzle']))
