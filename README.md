# Space Station Survival

2D kosmik stansiyada omon qolish o'yini (Godot 3.5, GDScript). "The Martian"
uslubida: siz stansiya ichida yolg'iz qolgansiz, uni tirik ushlab turib,
Yerga signal yuborib qutqarilishingiz kerak.

## Qanday ochish

1. [Godot 3.5](https://godotengine.org/download/archive/#3.5) engine'ni o'rnating.
2. Godot editor'da "Import" tugmasini bosing va shu papkadagi `project.godot`
   faylini tanlang.
3. Play (F5) tugmasini bosing — asosiy sahna `scenes/Main.tscn`.

## Boshqarish

| Tugma | Amal |
|---|---|
| `W A S D` yoki strelkalar | Yurish |
| `E` (bosib turing) | Generator/teshikni tuzatish/signalni faollashtirish |

## Maqsad: Yerga signal yuboring

Stansiyada 4 zona bor: **Komanda**, **Quvvat**, **Kislorod**, **Ombor**.
To'rt resurs kuzatiladi — **Kislorod**, **Quvvat**, **Korpus butunligi**,
**Oziq-ovqat** — vaqt o'tishi bilan asta-sekin kamayadi:

- **Kislorod generatori** (Kislorod zonasi) va **Quvvat generatori** (Quvvat
  zonasi) yonida `E` tugmasini bosib turib mos resursni to'ldiring. Quvvat
  tugasa, kislorod generatori ishlamay qoladi va kislorod tezroq kamayadi!
- **Oziq-ovqat zaxirasi** (Ombor zonasida) — ochlikdan halok bo'lmaslik
  uchun vaqti-vaqti bilan boring.
- Vaqti-vaqti bilan tasodifiy joyda **korpus teshigi** (qizil, miltillovchi
  doira) paydo bo'ladi — u kislorod va korpusni tezda yeb qo'yadi. Ichiga
  kirib `E` ni bosib turib tuzating. **Har bir tuzatilgan teshik sizga 1
  ehtiyot qism beradi.**
- 5 ta ehtiyot qismni yig'ib, **Signal massivi**ga (Ombor zonasida) olib
  boring va `E` tugmasini bosib turib uni faollashtiring — bu sizning
  **g'alaba** shartingiz ("SIGNAL YUBORILDI! Yordam yo'lda...").
- Har qanday resurs (kislorod, korpus yoki oziq-ovqat) nolga tushsa — o'yin
  tugaydi. Necha "SOL" (kosmik kun) omon qolganingiz ko'rsatiladi.
- **Stansiya vaqt o'tishi bilan yomonlashadi**: teshiklar tobora tezroq
  paydo bo'la boshlaydi — oxirigacha yetish qiyinlashadi.
- Resurslardan biri kritik darajaga (kislorod/korpus <25%, oziq-ovqat <15%)
  tushganda, ekran qizil miltillaydi va ogohlantirish ovozi eshitiladi.
- Vaqti-vaqti bilan (20-35 soniyada bir) **"METEORIT YOMG'IRI!"** hodisasi
  sodir bo'ladi — bir vaqtning o'zida 2 tagacha qo'shimcha teshik ochiladi.
- Har bir generator/teshik/signal yonida turganingizda ustida **[E]**
  ko'rsatkichi chiqadi — nima qilish kerakligini darhol bilasiz.
- O'yinchi yurgan yo'nalishga qarab ko'zi buriladi (kamera esa aylanmaydi).
- **Eng yaxshi natijangiz (SOL)** diskka saqlanadi va keyingi o'yinlarda
  HUD'da ko'rsatiladi — har safar rekordingizni yangilashga harakat qiling.

## Loyiha tuzilishi

```
project.godot
scripts/
  GameManager.gd    # barcha resurslar, SOL hisoblagichi, g'alaba/yutqizish holati
  AudioManager.gd    # kod orqali sintez qilingan ovoz effektlari (tashqi fayl kerak emas)
  Player.gd          # yurish
  Wall.gd            # to'siq (kod orqali chiziladi, tashqi rasm kerak emas)
  Floor.gd           # zona pollari va yorliqlar
  Station.gd         # kislorod/quvvat/oziq-ovqat generatorlari va signal massivi
  HullBreach.gd      # tasodifiy paydo bo'ladigan korpus teshigi (ehtiyot qism beradi)
  Main.gd            # teshik spawn qilish, qiyinlik ortishi, o'yin holatini bog'lash
  HUD.gd             # interfeys (bar'lar, SOL, ogohlantirish, game-over/g'alaba paneli)
scenes/
  Main.tscn          # stansiya joylashuvi (xonalar, devorlar, generatorlar, signal massivi)
  Player.tscn
  HullBreach.tscn
  HUD.tscn
```

Barcha vizual elementlar (o'yinchi, devorlar, pollar, generatorlar) tashqi
rasmlarsiz, to'g'ridan-to'g'ri kod orqali (`_draw()`) chiziladi; ovoz
effektlari ham kod orqali sintez qilinadi (`AudioStreamSample`) — shuning
uchun loyihani ochish uchun hech qanday qo'shimcha asset kerak emas.

## Keyingi qadamlar (ixtiyoriy)

- Xonalar orasiga eshiklar/koridorlar qo'shish
- Tile-based art yoki animatsiyalar qo'shish
- Bir nechta teshik turi (yong'in, elektr yong'ini) — har xil xavf
- Inventar/qurol-yarog' tizimi
