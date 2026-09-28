# Space Station Survival

2D kosmik stansiyada omon qolish o'yini (Godot 3.5, GDScript). "The Martian"
uslubida: siz stansiya ichida yolg'iz qolgansiz va uni tirik ushlab turishingiz
kerak.

## Qanday ochish

1. [Godot 3.5](https://godotengine.org/download/archive/#3.5) engine'ni o'rnating.
2. Godot editor'da "Import" tugmasini bosing va shu papkadagi `project.godot`
   faylini tanlang.
3. Play (F5) tugmasini bosing — asosiy sahna `scenes/Main.tscn`.

## Boshqarish

| Tugma | Amal |
|---|---|
| `W A S D` yoki strelkalar | Yurish |
| `E` (bosib turing) | Generator/teshikni tuzatish |

## O'yin mexanikasi

- Stansiyada 4 zona bor: **Komanda**, **Quvvat**, **Kislorod**, **Ombor**.
- Uch resurs kuzatiladi: **Kislorod**, **Quvvat**, **Korpus butunligi** — vaqt
  o'tishi bilan asta-sekin kamayadi.
- **Quvvat generatori** yonida `E` tugmasini bosib turib quvvatni to'ldiring.
- **Kislorod generatori** yonida `E` tugmasini bosib turib kislorodni
  to'ldiring (quvvat tugasa, generator ishlamay qoladi va kislorod tezroq
  kamayadi!).
- Vaqti-vaqti bilan tasodifiy joyda **korpus teshigi** (qizil, miltillovchi
  doira) paydo bo'ladi — u kislorod va korpusni tezda yeb qo'yadi. Uning
  ichiga kirib, `E` tugmasini bosib turib tuzating.
- Kislorod yoki korpus butunligi nolga tushsa — o'yin tugaydi. Ekranda necha
  soniya omon qolganingiz ko'rsatiladi va "Qayta boshlash" tugmasi bilan
  qaytadan boshlashingiz mumkin.

## Loyiha tuzilishi

```
project.godot
scripts/
  GameManager.gd   # kislorod/quvvat/korpus holatini boshqaruvchi singleton
  Player.gd         # yurish
  Wall.gd           # to'siq (kod orqali chiziladi, tashqi rasm kerak emas)
  Floor.gd          # zona pollari va yorliqlar
  Station.gd        # kislorod/quvvat generatorlari
  HullBreach.gd      # tasodifiy paydo bo'ladigan korpus teshigi
  Main.gd           # teshik spawn qilish va o'yin holatini bog'lash
  HUD.gd            # interfeys (progress bar'lar, taymer, game-over paneli)
scenes/
  Main.tscn         # stansiya joylashuvi (xonalar, devorlar, generatorlar)
  Player.tscn
  HullBreach.tscn
  HUD.tscn
```

Barcha vizual elementlar (o'yinchi, devorlar, pollar, generatorlar) tashqi
rasmlarsiz, to'g'ridan-to'g'ri kod orqali (`_draw()`) chiziladi — shuning
uchun loyihani ochish uchun hech qanday qo'shimcha asset kerak emas.

## Keyingi qadamlar (ixtiyoriy)

- Xonalar orasiga eshiklar/koridorlar qo'shish
- Tile-based art yoki animatsiyalar qo'shish
- Ovoz effektlari (signal, teshik ovozi)
- Ochlik/chanqash kabi qo'shimcha resurslar
