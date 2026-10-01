# Kestrel Ops: brauzerda o'ynaladigan taktik versiya

`web/index.html` o'yinning yangi, qayta yaratilgan versiyasi. Bu Delta Force
uslubidagi tepadan ko'rinadigan taktik shuter. Hech narsa o'rnatish shart emas:
faylni brauzerda oching. Telefonda sensorli boshqaruv avtomatik yoqiladi.

**Vazifa:** Dust Lantern sektoridan uchta yukni olib chiqish (QUVVAT bloki,
METALL yuki, TEXNIKA diski), keyin EVAK maydonchasida 8 soniya turish.

**Asosiy imkoniyatlar:**
- Ko'rish maydoni (fog of war): devor orqasidagi dushmanlar ko'rinmaydi
- 4 xil dushman (avtomatchi, razvedkachi, pulemyotchi, lazerli snayper). Ular
  patrul qiladi, shovqinni eshitadi, bir-birini chaqiradi va yo'l topib keladi
- 3 qurol (avtomat, drobovik, to'pponcha), granata, dori, zirh, sakrash
- Loot qutilari, minixarita, kill feed, zarar yo'nalishi ko'rsatkichi
- Evakuatsiya paytida dushman kuchaytirmasi keladi, vertolyot qo'nadi
- 3 qiyinlik darajasi, eng yaxshi vaqt brauzerda saqlanadi
- Ovozlar WebAudio orqali generatsiya qilinadi (tashqi fayl yo'q)
- Yashirin harakat: cho'kish (qadam tovushi yo'q, dushman kechroq sezadi) va
  orqadan pichoq bilan jimgina yo'q qilish
- Dushmanlarning fonar nurlari qorong'ida qayerga qarayotganini ko'rsatadi
- Dushmanlar sizni panadan chiqarish uchun granata otadi va granatadan qochadi
- Granatani bosib turganda traektoriya va portlash radiusi ko'rinadi
- Yomg'ir va chaqmoq; oxirida ball va S/A/B/C reyting
- Eshiklar: `E` bilan ochish/yopish, `F` bilan tepib ochish (ichkaridagilar
  bir lahza dovdirab qoladi); yopiq eshik ko'rish, o'q va granatani to'sadi,
  dushmanlar ham eshik ochadi
- Haqiqiy qurol, eshik, qadam va momaqaldiroq ovozlari (CC0 yozuvlar)
- Grafika: dinamik yoritish (o'yinchi fonari, ko'cha chiroqlari, xona
  chiroqlari, otishma chaqnashi), 2.5D balandlikdagi devorlar, konteynerlar
  va mashinalar, soyali askar spraytlari, mebel, ko'lmaklar, piyodalar
  yo'lagi, vinyetka va kino doni. Sekin qurilmalarda sifat avtomatik pasayadi

| Tugma | Amal |
|---|---|
| `W A S D` | Yurish |
| `Shift` | Yugurish |
| Sichqoncha chap / o'ng | Otish / nishonga olish (uzoqroq ko'rish) |
| `1 2 3`, g'ildirak | Qurol tanlash |
| `R` | Qayta o'qlash |
| `G` (bosib turish) | Granata: mo'ljal ko'rinadi, qo'yib yuborganda otiladi |
| `C` | Cho'kish / turish |
| `F` | Pichoq, orqadan jimgina yo'q qilish; yopiq eshikni tepib ochish |
| `E` | Yukni olish, qutini ochish (bosib turish), eshikni ochish/yopish |
| `Q` | Dori qutisi |
| `Space` | Chetga sakrash |
| `Esc` / `P` | Pauza |

**Grafika (3D):** o'yin three.js'da real vaqtli 3D'da chiziladi (`web/r3d.js`):
2.6 m balandlikdagi suvoqli devorlar, Poly Haven'ning CC0 3D modellari (mashina,
beton to'siqlar, chiroq ustunlari, bochka, yashik, mebel), barg kartochkali
daraxtlar, animatsiyali 3D askarlar (qurolni IK bilan ushlaydi, yiqilganda
jasad qoladi), soya tashlaydigan fonar, ko'cha va xona chiroqlari.
O'yin mantig'i 2D simulyatsiyada qoladi; WebGL ishlamasa, 2D renderer o'zi
yoqiladi. 3D versiya HTTP orqali ochilishi kerak (masalan,
`cd web && python3 -m http.server`, keyin `http://localhost:8000`).
Mualliflar va litsenziyalar: `web/assets/CREDITS.txt`.

Pastdagi Godot 3.5 loyihasi (`project.godot`, `scenes/`, `scripts/`) avvalgi
prototip. U tarix sifatida saqlab qolindi.

---

# Kestrel City — 3-bosqich namunasi

`docs/KESTREL_CITY_YAGONA_REJA_UZ_V5.md` rejasiga asosan, hujjatning o'z
bosqichlari (29-bo'lim) bo'yicha qurilmoqda:

- **0-bosqich** — audit/qarorlar: `docs/DEV-001-audit.md`
- **1-bosqich** — eng kichik o'ynaladigan tajriba (yurish, nishonga
  olish, 3 dushman, yuk, HAVENga qaytarish)
- **3-bosqich** (hozirgi holat) — "asosiy tizimlarni jamlagan kichik
  namuna" (29.4-bo'lim): HAVENning zarur xonalari, **Dust Lantern**
  sektorining to'liq yo'li (A–G, 11.4/11.5-bo'lim), **Black Grid**ning
  kichik podstansiya hududi, uch resurs (POWER/METAL/TECH), uchta
  vazifa turi (qaytarish, qutqarish, elektrni tiklash), ikki qurol,
  qochish qadami, bitta kuchli uchrashuv (qalqonli qo'riqchi), bitta
  qutqariladigan mutaxassis (Aziz), bitta to'da javobi.

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
| `E` | Yukni/odamni ko'tarish, generator/zanjirni ishga tushirish |
| `G` | Yukni qo'yish |
| `Space` | Qochish qadami (110 birlik, 0,24 s, 30 chidamlilik, 0,7 s oraliq) |

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
  boshqalarni ogohlantiradi), TECH resurs, **Black Gridga o'tuvchi eshik**
- **G — Xizmat eshigi**: HAVENga qisqa qaytish yo'li

Bir vaqtda faqat bitta yuk (resurs yoki odam) ko'tarish mumkin — og'ir
yuk bilan yurish sekinlashadi va qurol ishlamaydi.

## Black Grid — kichik podstansiya

Dust Lanternning F xonasidan kiriladi. Uchta elektr zanjiridan
(`CircuitA/B/C`) ikkitasini `E` bilan yoqing — shahar chiroqlari
yoqiladi (fon rangi yorishadi, bu Arkning uch ko'rinishidan biri:
"chiroqlari yoqilgan maydon") va 2 TECH mukofot beriladi. E02 Chopqir
xonani qo'riqlaydi; POWER va TECH resurslari ham bor.

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
  GeneratorSwitch.gd, CircuitSwitch.gd, GasCloud.gd
  Door.gd, Wall.gd, Ground.gd, HUD.gd
  DustLantern.gd, BlackGrid.gd   # sektor kontrollerlari
scenes/
  Haven.tscn        # boshpana: 4 xona yorlig'i, topshirish nuqtasi
  DustLantern.tscn   # A–G yetti xonali sektor
  BlackGrid.tscn      # kichik podstansiya
  Player.tscn, ResourcePickup.tscn, Specialist.tscn, GasCloud.tscn, HUD.tscn
```

Barcha vizual elementlar oddiy geometrik shakllar bilan chiziladi
(`_draw()`) — reja buning 2-bosqich uchun tavsiya qiladi ("oddiy
shakllar bilan sinaladi"); real san'at keyingi bosqichda, kontent
hajmi aniqlangach qo'shiladi.

## Ma'lum cheklovlar (honest scope)

- Faqat Dust Lantern (to'liq) va Black Gridning bir kichik qismi
  qurilgan; qolgan 8 tashqi sektor (yoki Black Gridning qolgan
  xonalari) yo'q.
- Faqat 2 qurol (W01, W02) va 5 dushman turi (E01–E05) qurilgan.
- Syujet missiyalari (13-bo'lim, M01–M12) hali yo'q — bu erkin
  o'ynaladigan namunaviy sektor, chiziqli hikoya emas.
- Ko-op, saqlashning to'liq versiyalash sinovi va 2-bosqichning stress
  testlari o'tkazilmagan.
- E05 zarari hujjatning boshlang'ich qiymatidan (25) pasaytirildi (16)
  — sinovda dodge hali yo'q holatda o'yinchi qo'riqchidan oldin
  o'lgani aniqlandi; endi dodge qo'shilgani uchun bu raqam yana
  balanslashtirilishi mumkin.

## Keyingi bosqichlar

29-bo'limga ko'ra: 2-bosqich (texnik stress-testlar), 4-bosqich
(taqdim etiladigan sifat — ovoz, real san'at, qisqa syujet), so'ng
qolgan sektorlar va syujet tugunlari.
