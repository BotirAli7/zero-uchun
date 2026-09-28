# Kestrel City — 3-bosqich namunasi

`docs/KESTREL_CITY_YAGONA_REJA_UZ_V5.md` rejasiga asosan, hujjatning o'z
bosqichlari (29-bo'lim) bo'yicha qurilmoqda:

- **0-bosqich** — audit/qarorlar: `docs/DEV-001-audit.md`
- **1-bosqich** — eng kichik o'ynaladigan tajriba (yurish, nishonga
  olish, 3 dushman, yuk, HAVENga qaytarish)
- **3-bosqich** (hozirgi holat) — "asosiy tizimlarni jamlagan kichik
  namuna" (29.4-bo'lim): HAVENning zarur xonalari, **Dust Lantern**
  sektorining to'liq yo'li (A–G, 11.4/11.5-bo'lim), uch resurs
  (POWER/METAL/TECH), uchta vazifa turi (qaytarish, qutqarish, elektrni
  tiklash), ikki qurol, bitta kuchli uchrashuv (qalqonli qo'riqchi),
  bitta qutqariladigan mutaxassis (Aziz), bitta to'da javobi.

2-bosqich (texnik stress-testlar: 30 dushman, ko'op) ataylab
o'tkazib yuborildi — kontent tizimlarini birlashtirish ustuvor edi;
2-bosqich talablari keyinroq alohida tekshiriladi.

## Qanday ochish

1. [Godot 3.5](https://godotengine.org/download/archive/#3.5) o'rnating.
2. Editor'da "Import" → shu papkadagi `project.godot`ni tanlang.
3. Play (F5) — asosiy sahna `scenes/Haven.tscn`.

## Boshqarish

| Tugma | Amal |
|---|---|
| `W A S D` | Yurish |
| `Shift` (bosib turish) | Yugurish (chidamlilik sarflaydi) |
| Sichqoncha | Nishonga olish |
| Sichqoncha chap tugmasi | Otish |
| `1` / `2` | Signal-9 / Needle qurolini tanlash |
| `R` | Qayta o'qlash |
| `E` | Yukni/odamni ko'tarish, generatorni ishga tushirish |
| `G` | Yukni qo'yish |

## Dust Lantern sektori (A–G)

HAVEN darvozasidan chiqib, quyidagi xonalar orqali harakatlaning:

- **A — Darvoza**: HAVENga qaytish eshigi
- **B — Pochta hovlisi**: E01 Sudraluvchi, METAL resurs
- **C — Tomga chiqish yo'li**: E02 Chopqir, METAL resurs
- **D — Generator xonasi**: **E05 Qalqonli** (qalqon — old tomondan
  zarar 2x kamayadi, hujum tayyorgarligi paytida yon/orqadan urish
  to'liq zarar beradi), asosiy rele (POWER, majburiy topshiriladi),
  generator kalitini (E, ushlab turing) faollashtirish — bu qo'shimcha
  dushmanlarni jalb qiladi (to'da javobi)
- **E — Qamalgan uy**: **Aziz** (qutqariladigan elektr ustasi) va
  ixtiyoriy qo'shimcha POWER bloki — ikkalasini olish mumkin, lekin
  qo'shimcha blokni olish obro'ni "o'zim uchun" tomon o'zgartiradi
  (13.5-bo'lim dilemmasi)
- **F — Yong'in yo'lagi**: E03 Qichqiruvchi (hujum qilmaydi, faqat
  boshqalarni ogohlantiradi), TECH resurs
- **G — Xizmat eshigi**: HAVENga qisqa qaytish yo'li

Bir vaqtda faqat bitta yuk (resurs yoki odam) ko'tarish mumkin — og'ir
yuk bilan yurish sekinlashadi va qurol ishlamaydi.

## Loyiha tuzilishi

```
project.godot
docs/
  DEV-001-audit.md                    # 0-bosqich qarorlari
  KESTREL_CITY_YAGONA_REJA_UZ_V5.md   # to'liq reja hujjati
scripts/
  GameState.gd        # resurslar, obro', qutqarilgan odamlar, saqlash
  NoiseManager.gd      # shovqin hodisalari (8.1)
  Player.gd             # harakat, nishonga olish, 2 qurol (6.1)
  Enemy.gd               # E01–E05 holat mashinasi, qalqon mexanikasi (9.1)
  ResourcePickup.gd, Specialist.gd, DeliveryZone.gd
  GeneratorSwitch.gd, GasCloud.gd, Door.gd, Wall.gd, Ground.gd, HUD.gd
  DustLantern.gd        # sektor kontrolleri (to'da javobi, o'lim/qayta yuklash)
scenes/
  Haven.tscn        # boshpana: 4 xona yorlig'i, topshirish nuqtasi
  DustLantern.tscn   # A–G yetti xonali sektor
  Player.tscn, ResourcePickup.tscn, Specialist.tscn, GasCloud.tscn, HUD.tscn
```

Barcha vizual elementlar oddiy geometrik shakllar bilan chiziladi
(`_draw()`) — reja buning 2-bosqich uchun tavsiya qiladi ("oddiy
shakllar bilan sinaladi"); real san'at keyingi bosqichda, kontent
hajmi aniqlangach qo'shiladi.

## Ma'lum cheklovlar (honest scope)

- Qochish qadami (dodge-roll, 5.2-bo'lim) hali yo'q — E05 bilan jang
  vaqtida faqat otish va harakatlanish bilan kurashiladi.
- Faqat Dust Lantern qurilgan; qolgan 8 tashqi sektor yo'q.
- Faqat 2 qurol (W01, W02) va 5 dushman turi (E01–E05) qurilgan.
- Syujet missiyalari (13-bo'lim, M01–M12) hali yo'q — bu erkin
  o'ynaladigan namunaviy sektor, chiziqli hikoya emas.
- Ko-op, saqlashning to'liq versiyalash sinovi va 2-bosqichning stress
  testlari o'tkazilmagan.

## Keyingi bosqichlar

29-bo'limga ko'ra: 2-bosqich (texnik stress-testlar), 4-bosqich
(taqdim etiladigan sifat — ovoz, real san'at, qisqa syujet), so'ng
qolgan sektorlar va syujet tugunlari.
