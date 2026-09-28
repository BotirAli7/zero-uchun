# Kestrel City — 1-bosqich (eng kichik o'ynaladigan tajriba)

`docs/KESTREL_CITY_YAGONA_REJA_UZ_V5.md` rejasiga asosan qurilgan. Bu
rejaning 29.2-bo'limida ta'riflangan **1-bosqich** ("eng kichik o'ynaladigan
tajriba"): yurish, nishonga olish/otish, uchta dushman turi, bitta hovli,
yukni topib HAVENga qaytarish. To'liq shahar, syujet, barcha qurollar va
ko'op tarmoq — bu 34 bo'limlik hujjatning keyingi bosqichlari (29.3–29.11);
ular hozircha qurilmagan.

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
| Sichqoncha chap tugmasi | Otish (W01 Signal-9) |
| `R` | Qayta o'qlash |
| `E` | Yukni ko'tarish |
| `G` | Yukni qo'yish |

## 1-bosqich maqsadi

HAVENdan chiqib, Yard-01 hovlisiga kiring. U yerda uchta dushman bor:
**E01 Sudraluvchi** (sekin, yaqin hujum), **E02 Chopqir** (tez), **E03
Qichqiruvchi** (hujum qilmaydi, lekin qichqirib boshqa dushmanlarni
ogohlantiradi). Otishning ovozi yaqin dushmanlarni ham ogohlantiradi
(shovqin tizimi). Yukni toping (`E`), HAVENga qaytaring va topshirish
nuqtasiga kiring — missiya tugaydi.

## Loyiha tuzilishi

```
project.godot
docs/DEV-001-audit.md   # 0-bosqich texnik qarorlari (29.1-bo'lim)
scripts/
  GameState.gd          # holat, voqealar jurnali, saqlash (user://)
  NoiseManager.gd        # shovqin hodisalari (8.1-bo'lim)
  Player.gd               # yurish/yugurish/chidamlilik, nishonga olish, W01 otish
  Enemy.gd                 # E01/E02/E03 holat mashinasi (9.1/9.3-bo'lim)
  Cargo.gd, DeliveryZone.gd, Door.gd
  Wall.gd, Ground.gd, HUD.gd
scenes/
  Haven.tscn   # boshpana: topshirish nuqtasi + chiqish eshigi
  Yard.tscn    # hovli: 3 dushman + yuk
  Player.tscn, Cargo.tscn, HUD.tscn
```

Barcha vizual elementlar oddiy geometrik shakllar bilan chiziladi
(`_draw()`) — bu rejaning o'zi 2-bosqich (29.3) uchun tavsiya qilgan
yondashuv: texnik/mexanika xavflarini oddiy shakllar bilan sinash. Real
san'at (rasm, animatsiya, ovoz — 23-bo'lim) keyingi bosqichlarda, kontent
hajmi aniqlangach qo'shiladi.

## Keyingi bosqichlar

29-bo'limga ko'ra: 2-bosqich (texnik xavflarni — bo'lak yuklash, 30
dushman stressi, ko'op — sinash), 3-bosqich (HAVEN xonalari, uchta resurs,
uchta vazifa turi, karkas/qism/yoritilgan ko'rinishdagi Ark namunasi).
