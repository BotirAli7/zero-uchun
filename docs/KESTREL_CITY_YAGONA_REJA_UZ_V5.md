# LAST UPLOAD — KESTREL CITY

# Yagona batafsil o‘yin va ishlab chiqish rejasi

**Versiya:** 5.0 · **Sana:** 2026-09-25 · **Til:** o‘zbekcha

**Holat:** ishlab chiqishga yo‘naltirilgan dizayn hujjati. Barcha balans sonlari boshlang‘ich; o‘yin sinovi natijasi sifatida ko‘rsatilmaydi.

Bu bitta hujjatda o‘yin g‘oyasi, barcha asosiy tizimlar, syujet, Steam hamkorligi, o‘yinchi qo‘llanmasi va bajaruvchiga topshiriqlar jamlangan. Avvalgi rejalarga qaytib o‘qish talab qilinmaydi. 20-bo‘lim va syujet bo‘limlarida sirlar bor; o‘yinchilarga faqat 33-bo‘lim beriladi.

## Mundarija

- [01. Hujjatdan foydalanish va asosiy qarorlar](#b01)
- [02. O‘yinning g‘oyasi, hissiyoti va o‘ziga xosligi](#b02)
- [03. Ko‘lam, vaqt va chiqariladigan imkoniyatlar](#b03)
- [04. O‘yin sikli, birinchi 25 daqiqa va o‘rgatish](#b04)
- [05. Boshqaruv, harakat va kontekst amallari](#b05)
- [06. Qurollar, zarar, o‘q va tiriltirish](#b06)
- [07. Asboblar va almashtiriladigan jihozlar](#b07)
- [08. Shovqin, xavf va moslashadigan to‘da](#b08)
- [09. Dushman turlari, sun’iy intellekt va jang budjeti](#b09)
- [10. To‘rtta katta qo‘riqchining jang ssenariysi](#b10)
- [11. Shahar, sektorlar, xonalar va yo‘l tuzilishi](#b11)
- [12. Missiya tizimi va vazifalarni yaratish qoidasi](#b12)
- [13. Uch akt va 12 syujet tugunining to‘liq ishchi ssenariysi](#b13)
- [14. Qo‘shimcha operatsiyalar, final va yakunlar](#b14)
- [15. Yuk, buyum, tashish va topshirish](#b15)
- [16. Olti resurs, kema narxi va aktlar bo‘yicha iqtisod](#b16)
- [17. Odamlarni qutqarish, davolash va joylashtirish](#b17)
- [18. HAVEN, yangilanishlar va taraqqiyot](#b18)
- [19. Ark modullari, bog‘liqliklar va yo‘lovchi sig‘imi](#b19)
- [20. Hikoya, bosh qahramonlar va guruhlar](#b20)
- [21. Tanlov, mag‘lubiyat va kampaniyani davom ettirish](#b21)
- [22. Ekranlar, xato yozuvlari va qulaylik](#b22)
- [23. Grafika, animatsiya va ovoz ishlab chiqarish ro‘yxati](#b23)
- [24. Texnik arxitektura va mazmun ta’riflari](#b24)
- [25. Shahar bo‘laklarini yuklash va yo‘l topish](#b25)
- [26. Saqlash, tiklash va versiyalar](#b26)
- [27. Steam orqali hamkorlik va tarmoq qoidalari](#b27)
- [28. Ishlash tezligi va apparat mezonlari](#b28)
- [29. Ishlab chiqish bosqichlari va o‘tish shartlari](#b29)
- [30. Tayyorlik mezonlari va sinovlar](#b30)
- [31. Asosiy xavflar va ularni kamaytirish](#b31)
- [32. Steam mahsuloti, demo va chiqarish](#b32)
- [33. O‘yinchilar uchun to‘liq qo‘llanma](#b33)
- [34. Bajaruvchi uchun ma’lumot shartnomalari, ish navbati va qabul testlari](#b34)

---

<a id="b01"></a>

## 1. Hujjatdan foydalanish va asosiy qarorlar

### 1.1 Maqsad va qo‘llash tartibi

Bu LAST UPLOAD — KESTREL CITY uchun **bitta mustaqil ishchi reja**. Avvalgi reja, batafsil dizayn va o‘yinchi qo‘llanmasining mazmuni shu yerda jamlandi. Uni ishlatish uchun oldingi suhbat yoki boshqa loyiha hujjatini topish shart emas. Tashqi manba havolalari faqat Steam va taqqoslash ma’lumotlarini tasdiqlashga xizmat qiladi.

O‘yin: tepadan ko‘rinadigan 2D shahar kampaniyasi. O‘yinchi HAVENdan chiqadi, odam va resurs topadi, yuk bilan qaytadi, bazani va qutqaruv kemasini rivojlantiradi. Yakka o‘yin va Steam orqali 2 kishilik do‘stlar rejimi mahsulot maqsadi. Dunyo — HAVEN va 9 tashqi sektor; taraqqiyot va tanlovlar saqlanadi.

Bu hujjat dizayn va topshiriqdir; ishlaydigan kod, tayyor rasmlar yoki o‘tkazilgan o‘yin sinovlari o‘rnini bosmaydi. “Boshlang‘ich qiymat” bajaruvchi ishlatib boshlaydigan aniq son; uning eng yaxshi balans ekanini anglatmaydi. “Majburiy” chiqarish uchun bajarilishi kerak bo‘lgan talab; “keyin” v1 ko‘lamiga kirmaydi.

### 1.2 Kim qaysi qismdan boshlaydi?

| Bajaruvchi | Birinchi o‘qiladigan bo‘limlar | Keyingi amal |
|---|---|---|
| Yangi dasturchi yoki AI | 01–04, 24–29, 34 | DEV-001 auditi, so‘ng ish navbati |
| Jang/AI dasturchisi | 05–10, 21, 34 | Jadvalni konfiguratsiya va sinov maydoniga aylantirish |
| Xarita/missiya yaratuvchi | 11–14, 20, 34 | A–G kulrang yo‘l, M01 instance va to‘rtta natija |
| UI va o‘rgatish yaratuvchi | 05, 22, 33 | Tugmalar, holatlar, xato yozuvlari va yordam |
| Rassom/ovoz yaratuvchi | 02, 10–11, 19–20, 23 | Kichik namuna uchun assetlar; barcha shaharni birdan chizmaslik |
| Sinovchi | 16, 26–30, 34 | QA-001–QA-028, haqiqiy natija qaydi |
| O‘yinchi | Faqat 33 | Syujet sirlarisiz qo‘llanma |

### 1.3 Qoidalar ustuvorligi va o‘zgarish

Mexanika jadvallari boshlang‘ich konfiguratsiya. 34-bo‘lim holatlar, ochilish shartlari va xato holatlarining aniq shartnomasidir. 33-bo‘lim shu qoidalarning o‘yinchiga mos tildagi tushuntirishi. Mazmunli tafsilot qolsa, shu hujjat ichida qo‘shiladi; avvalgi versiyadan boshqa qoida qidirilmaydi.

Yangi qaror yozuvi to‘rtta savolga javob beradi: nima o‘zgardi, nima uchun, qaysi tizimga ta’sir qiladi, qaysi sinov qayta bajariladi? Qo‘llanmadagi tugma yoki imkoniyat real buildga mos bo‘lishi shart. Yetishmagan texnik ID, minimal qurilma va dvigatel patchi DEV-001da qayd etiladi, mavjud deb ixtiro qilinmaydi.

### 1.4 Mahsulot sonlarining yagona ro‘yxati

| Tarkib | Miqdor |
|---|---:|
| Umumiy shahar/sektor | 1 / 10 |
| Tashqi sektor | 9 |
| Resurs toifasi | 6 |
| Ark moduli | 7 |
| Qurol / asbob | 8 / 8 |
| Oddiy-maxsus dushman / katta qo‘riqchi | 8 / 4 |
| Asosiy syujet tuguni | 12 |
| Tashqi syujet safari / HAVEN voqeasi | 10 / 2 |
| Ishchi qo‘shimcha operatsiya qolipi | 6 |
| Final tayyorgarlik yo‘li / odatiy bajariladigan safari | 3 / 2 |
| Bazaning asosiy yangilanishlari | 8 |
| Standart operator yuk sig‘imi | 10 og‘irlik birligi |
| Arkning asosiy resurs narxi | 124 |
| Namunaviy 18 safarlik yalpi/sof ta’minot | 216 / 180 |
| Dastlabki onlayn o‘yinchi soni | 2 |

### 1.5 Birlashtirishda chiqarilgan aniq qarorlar

- B02 ixtiyoriyligi Quvvat modulini bloklamaydi: standart konverter M04da; B02 qo‘shimcha foyda beradi.
- M11ga kirish uchun M05–M08, M09 siyosati, M10 va o‘rnatilgan Quvvat talab qilinadi.
- Bazaviy Ark 24 o‘rin va 2 tibbiy yotoq; sig‘im yo‘li 36/2, tibbiy yo‘l 24/6.
- 60 soniya standart reconnect oynasi; saqlash nusxalari va yakka yordamning uzilishdagi qoidasi aniq.
- W06ning otish oralig‘i va o‘qlash vaqti bir-biriga moslashtirildi.
- I akt chiqishi HAVEN tarmog‘i va Korpusga bog‘liq; Ark reaktorining katta sinovi II aktda.
- O‘yinchi qo‘llanmasi 33-bo‘limga to‘liq kiritildi.

---

<a id="b02"></a>

## 2. O‘yinning g‘oyasi, hissiyoti va o‘ziga xosligi

LAST UPLOAD — tepadan ko‘rinadigan 2D jangovar omon qolish o‘yini. O‘yinchi HAVEN boshpanasidan Kestrel shahriga chiqadi, kerakli qismlar va odamlarni topadi, cheklangan yuk bilan qaytadi va ARK KESTREL qutqaruv kemasini tayyorlaydi. Shahar elektr, yo‘llar, odamlar, guruhlar va zararlanganlar harakatidagi o‘zgarishlarni eslab qoladi.

Ark butunlay noldan qurilmaydi: HAVENdagi eski kemasozlik maydonida Kestrel kompaniyasining yarimta evakuatsiya prototipi turibdi. O‘yinchi uning yetishmayotgan qismlarini yig‘adi, shikastlanganlarini tiklaydi va yo‘lovchilar uchun qayta jihozlaydi. Shu orqali bir necha ekspeditsiyada kema qurish badiiy jihatdan asoslanadi.

Maqsad — orbitadagi vaqti-vaqti bilan aloqa signali berayotgan boshpanaga yetib borish. Birinchi versiyada bitta belgilangan manzil bo‘ladi. Navigatsiya va arxivning sifati safar ishonchliligiga ta’sir qiladi; alohida sayyoralar tizimi qurilmaydi.

O‘yinchining uch asosiy ustuvorligi:

- **Odamlar:** ko‘proq kishini topish, davolash va qutqarish.
- **Kema:** xavfsiz uchish va safarga tayyorlash.
- **Shahar:** yerda qoladiganlar uchun ishlaydigan boshpanalar, elektr va himoya qoldirish.

Asosiy hissiyot: “Reja bilan chiqaman, kutilmagan imkoniyat topaman, nimani saqlashni tanlayman, qaytish uchun kurashaman va qarorimning izini ko‘raman”.

### 2.1 Besh tayanch

**Qaytishning qiyinligi.** Topilgan narsa, sarflangan o‘q, orttirilgan jarohat va ergashayotgan odamlar qaytish yo‘lini o‘zgartiradi. Maqsadga yetish missiyaning yarmi.

**Tushunarli tanlov.** Syujet safarida odatda bitta katta dilemma; oddiy safarda yo‘l, uskunalar, yuk yoki ketish vaqti bo‘yicha kamida bitta mazmunli tanlov bo‘ladi. Har safar odam o‘limi bilan qo‘rqitish shart emas.

**Eslab qoladigan shahar.** Ochilgan darvoza, tiklangan klinika, yo‘qotilgan ko‘prik va qutqarilgan ustalar keyingi safarda amaliy farq yaratadi.

**Ko‘rinadigan qurilish.** Kemaga qo‘shilgan qism, bazada yoqilgan chiroq va bo‘sh yotoq o‘rniga kelgan oila taraqqiyotni ko‘rsatadi.

**Adolatli bosim.** Xavfning sababi bilinadi, ogohlantirish eshitiladi va javob chorasi mavjud bo‘ladi. O‘yinchi yaxshi reja tuzganida tizim uni yashirin jazolamaydi.

### 2.2 Kuzatilgan misollar

2026-yil 24-sentabrda ko‘rilgan rasmiy sahifalarda R.E.P.O. jamoa bilan buyumlarni ehtiyotlab olib chiqish, Lethal Company xavfli yig‘ish va sherik bilan vazifalarni taqsimlash, Abiotic Factor esa umumiy muhit, omon qolish va baza qurishni ta’kidlaydi. Bular hozir sotilayotgan o‘yinlardagi aniq misollar; butun bozorning kelajakdagi trendi yoki muvaffaqiyat sababini isbotlamaydi. [R.E.P.O.](https://store.steampowered.com/app/3241660/REPO/), [Lethal Company](https://store.steampowered.com/app/1966720/Lethal_Company/), [Abiotic Factor](https://store.steampowered.com/app/427410/Abiotic_Factor/).

Bizning dizayn xulosamiz: odamlar gapirib beradigan umumiy vaziyatlar, qo‘l bilan seziladigan taraqqiyot va sodda kirish Kestrel Cityga mos. Trenddagi tashqi ko‘rinishni ko‘chirish shart emas. Viral bo‘lishni hujjat bilan kafolatlab bo‘lmaydi; qisqa namuna va kuzatilgan o‘yinchi reaksiyasi bilan tekshiramiz.

### 2.3 Uchta asosiy ajratuvchi xususiyat

1. **Shahar kemaga aylanadi.** Har asosiy modulda qayerdan olingani ko‘rinadi: port po‘lati, kasalxona kapsulasi, elektr tarmog‘i g‘altagi. Modul yonida “kim olib keldi, nima evaziga” xotirasi bor.
2. **Qutqarganing qaytib yordam beradi.** Elektrchi yashirin eshikni ochadi, hamshira jarohatni yengillashtiradi, metro dispetcheri xavfni oldindan aytadi. Tanish odamning qisqa minnatdorchiligi statistik foydadan oldin eshitiladi.
3. **Uyga qaytish voqeasi.** Har katta safarning eng yaxshi lahzasi qutini topishdan keyin keladi: yuk, odam, o‘q va yo‘lning o‘zgargan holati yangi qaror tug‘diradi.

### 2.4 Qiziqtiruvchi yangi imkoniyatlar

| Imkoniyat | O‘yinchi nima qiladi? | Mukofot | Ko‘lam |
|---|---|---|---|
| Yo‘ldagi SOS | Ko‘rsatilgan masofa va xavfni ko‘rib yo‘lidan buriladi | Odam, yangi yo‘l yoki ma’lumot | Asosiy tizimlardan foydalanadi |
| Yukning kelib chiqish belgisi | Modulgacha yetgan qismni kemada taniydi | Faxr, xotira, qayta tashrifdagi suhbat | Modul uchun 1 belgi, 1 qisqa replika |
| Safar xotirasi | Qaytishda “Aziz qutqarildi; sharqiy yo‘l ochildi” kartasini ko‘radi | Qilingan ishning aniq natijasi | Holat hodisalaridan avtomatik yig‘iladi |
| Sirli radio | Ixtiyoriy signalni kuzatib kichik voqea topadi | Muqobil yo‘l, buyum yoki arxiv | Bir sektorga 1 asosiy zanjir |
| Juft vazifa | Biri uskunani ko‘taradi, biri chalg‘itadi; yakka ham mumkin | Tabiiy hamkorlik | 2 kishilik o‘yin bilan sinov |
| Bazadagi iliq voqea | Chiroqlar yoqilishi, ustaning hazili, tiklangan oshxona | Dam olish va odamga bog‘lanish | Har aktga kamida 2 sahna |
| Mahorat yo‘li | Keraksiz jangni chetlab yoki muhit bilan qo‘riqchini yengadi | Ixtiyoriy maxsus belgi; asosiy resurs yo‘qolmaydi | Alohida kuchli qurol bermaydi |

Har 30 soniyada majburiy mukofot, kundalik kirish seriyasi, yo‘qotib qo‘yish qo‘rquviga asoslangan haqiqiy vaqt tadbiri yoki to‘lovli kuch kiritilmaydi. O‘yinchi yaxshi to‘xtash nuqtasida chiqib, keyin o‘z xohishi bilan qaytishi kerak.

---

<a id="b03"></a>

## 3. Ko‘lam, vaqt va chiqariladigan imkoniyatlar

### 3.1 To‘liq kampaniya maqsadi

| Ko‘rsatkich | Dastlabki maqsad |
|---|---|
| Birinchi yakunlash | Taxminan 8–12 soat |
| Daladagi odatiy safar | 15–25 daqiqa |
| Har safar oldi va keyingi baza vaqti | Jami 3–6 daqiqa |
| Asosiy syujet | 12 tugun: 10 tashqi missiya va HAVENdagi 2 voqea |
| Namunaviy kampaniya | 10 syujet safari + taxminan 6 erkin tanlanadigan ta’minot/tiklash safari + 2 yakuniy tayyorgarlik safari |
| Yakuniy himoya va uchirish | Taxminan 20–35 daqiqa |
| Dunyo | HAVEN va 9 tashqi sektor |
| Resurs | 6 toifa |
| Ark | 7 modul |
| Asosiy o‘yin usuli | Bitta odam bilan to‘liq o‘ynash mumkin |
| Hamkorlik | Mahsulot maqsadi: Steam orqali 2 o‘yinchi; 4 kishi keyingi alohida sinov |

Vaqt maqsadining oddiy misoli: 18 × 20 daqiqa dalada = 360 daqiqa; bazada jami taxminan 90 daqiqa; final 30 daqiqa. Jami 480 daqiqa, ya’ni 8 soat. Sinchkov o‘rganish, ixtiyoriy voqealar va mag‘lubiyatdan tiklanish uni uzaytiradi. 8–12 soat kafolatlangan natija emas.

Olti ta’minot safari qat’iy syujet ketma-ketligiga bog‘lanmaydi: o‘yinchi ularning joyi, turi va tartibini tanlaydi. Ammo qurilish materiali yetishmasa, ma’lum miqdordagi qo‘shimcha yig‘ish zarur bo‘ladi. Shuning uchun ularning barchasini “butunlay ixtiyoriy” deb atash noto‘g‘ri. Mohir yig‘ish bilan ular soni kamayishi, yo‘qotishlarda ko‘payishi mumkin.

### 3.2 Birinchi to‘liq versiyada bo‘lishi kerak

Ulangan shahar, jang, shovqin, xavf darajasi, yuk olib qaytish, qutqaruv, ma’lumotga asoslangan missiyalar, ko‘rinib rivojlanadigan HAVEN va Ark, saqlanadigan oqibatlar, uch aktli syujet va o‘ynaladigan final.

Foydalanuvchi Steamda birga o‘ynashni so‘ragani uchun 2 kishilik kooperativ ushbu rejaning mahsulot maqsadiga kiritildi va dastlabki namunada tekshiriladi. Haqiqiy eski loyihada bunday tizim bo‘lsa, auditdan keyin qayta ishlatiladi. Hali tayyor imkoniyat sifatida e’lon qilinmaydi. 4 kishilik rejim faqat keyingi alohida sinovdan so‘ng ko‘rib chiqiladi.

### 3.3 Keyinga qoldiriladigan imkoniyatlar

Erkin avtomobil haydash, murakkab transport fizikasi, to‘liq buziladigan binolar, tasodifiy yaratiladigan shahar, raqobatli PvP, har bir fuqaroning alohida kundalik hayoti, cheksiz yakuniy o‘yin va host almashinuvi boshlang‘ich tarkibga kirmaydi.

Har yangi imkoniyat aniq qaror yoki o‘yin harakati yaratishi kerak. Faqat menyudagi yana bir son uchun butun yangi tizim qurilmaydi.

---

<a id="b04"></a>

## 4. O‘yin sikli, birinchi 25 daqiqa va o‘rgatish

### 4.1 Taxminan 30 soniyalik sikl

1. Atrofni o‘qish: chiqishlar, dushman, ovoz va xavfli obyektlarni ko‘rish.
2. Usul tanlash: jim o‘tish, tez yurish yoki jang bilan yo‘l ochish.
3. Harakat: yurish, otish, chalg‘itish, ta’mirlash, ko‘tarish yoki kuzatish.
4. O‘zgarishga javob: dushman yaqinlashadi, yo‘l ochiladi, yuk ortadi.
5. Yangi pozitsiya yoki chekinish yo‘lini egallash.

Bir xonani uzoq vaqt tugmani bosib turib tozalash odatiy holga aylansa, dushman aralashmasi, muhit yoki topshiriq qayta ishlanadi.

### 4.2 3–5 daqiqalik kichik voqea

Joyni tekshirish → yo‘l tayyorlash → resurs yoki vaqt sarflash → imkoniyat/kutilmagan holat → davom etish yoki qaytish qarori → bosimdan chiqish.

### 4.3 To‘liq safar

HAVENda vazifa va jihoz tanlash → shaharga kirish → maqsadni aniqlash → asosiy ish → qo‘shimcha imkoniyat yoki asorat → yuk va odamlarni tanlash → qaytish → omborga topshirish → oqibat va qurilish.

Daladagi vaqt namunasi:

| Qism | Daqiqa |
|---|---:|
| Kirish va dastlabki tekshiruv | 2–4 |
| Maqsadga yetish va bajarish | 6–9 |
| Tanlov yoki asorat | 2–4 |
| Qaytish va xavfsiz hududga chiqish | 5–8 |
| Jami | 15–25 |

Bazadagi tayyorgarlik va debrif bu jadvalga kirmaydi. Oddiy ko‘chib yurish safarning 25 foizidan oshmasligi maqsad qilinadi; jang, quvish yoki odam kuzatish bilan bog‘liq yo‘l mazmunli o‘yin hisoblanadi.

20–30 soniya — faol hududdagi yangi kuzatuv yoki qaror oralig‘i uchun maqsad. 60 soniyadan ortiq mazmunsiz yurish qayta ko‘rib chiqiladi. Maxsus sokin sahna, manzara va hissiy tanaffus bundan mustasno.

### 4.4 Uch qatlam

1. **Bir daqiqalik boshlash:** maqsad, harakat, yuk, qaytish va ombor.
2. **Kontekst yordam:** birinchi marta chiqqan holatda bitta qisqa jumla; 5 s dan uzun matn yo‘q.
3. **Jurnal qo‘llanmasi:** qidirish mumkin bo‘lgan 20 mavzu, standart tugma o‘rniga joriy input belgisi, syujet sirlarisiz.

Qidiruv misollari: “qanday saqlanadi”, “do‘st”, “og‘ir yuk”, “elektr”, “o‘lib qoldim”. Har maqola 60–150 so‘z, zarur joyda 3 qadam. To‘liq tashqi qo‘llanma shu maqolalarning kengroq to‘plami.

### 4.5 Dastlabki 20–25 daqiqa

| Vaqt | Voqea | O‘rgatish |
|---|---|---|
| 0–2 | HAVEN chirog‘i o‘chadi, Mara yo‘l ko‘rsatadi | Maqsad va xarita |
| 2–4 | Qurol olish, nishon taxtasi, eshik | Yurish/otish/harakat |
| 4–8 | Hovli va bitta E01 | Nishon, ovoz, chekinish |
| 8–12 | Majburiy rele va yuk | Vazn, qo‘yish, qaytish belgisi |
| 12–16 | Aholi signali yoki ikkinchi blok | Birinchi aniq tanlov |
| 16–21 | Ochilgan qisqa yo‘l, kichik quvish | Xavf va yuk bilan qaytish |
| 21–25 | Omborga topshirish, chiroq va odamlar | Ko‘rinadigan natija, keyingi korpus ehtiyoji |

Tajribalilar mashqni o‘tkazib yuborishi mumkin; kritik maqsad va qaytish belgisi baribir ko‘rinadi. Qo‘llanma sahifasini o‘qimagan odam ham dastlabki safarni tushuna olishi mezon.

---

<a id="b05"></a>

## 5. Boshqaruv, harakat va kontekst amallari

### 5.1 Boshlang‘ich tugmalar

Kontroller jadvali Xbox uslubidagi belgilarni ishlatadi; PlayStation yoki boshqa qurilma aniqlansa mos belgilar ko‘rsatiladi. Barcha muhim amallar qayta tayinlanadi.

| Amal | Klaviatura/sichqoncha | Kontroller |
|---|---|---|
| Yurish | W A S D | Chap tayoqcha |
| Nishon yo‘nalishi | Sichqoncha | O‘ng tayoqcha |
| Otish | Sichqoncha chap tugmasi | RT |
| Aniq nishon rejimi | Sichqoncha o‘ng tugmasi | LT |
| Yugurish | Shift | Chap tayoqchani bosish |
| Qochish qadami | Space | B |
| Olish/eshik/harakat | E | A |
| O‘qlash | R | X |
| Qurol almashtirish | 1, 2 yoki g‘ildirak | Y |
| Uloqtiriladigan vosita | Q; qo‘yib yuborish bilan uloqtirish | RB; qo‘yib yuborish bilan |
| Yordam asbobi | C | Yuqori D-pad |
| Itarish | V | O‘ng tayoqchani bosish |
| Qo‘ldagi katta yukni qo‘yish | G | Pastki D-pad |
| Chiroq | F | Chap D-pad |
| Belgi qo‘yish | Sichqoncha o‘rta tugmasi; ushlab turish — belgi tanlash | LB; ushlab turish — belgi tanlash |
| Yuk/jihoz paneli | Tab | O‘ng D-pad |
| Shahar xaritasi | M | View |
| Jurnal va yordam | J; F1 — qo‘llanma | Xarita ichidagi “Jurnal/Yordam” yorlig‘i |
| Pauza/menyu | Esc | Menu |
| Matnli jamoa xabari | Enter | Pauza ichidagi “Jamoa xabari” |

Tugmalar amallar IDsi bilan saqlanadi. Qo‘llanma va o‘rgatuvchi yozuvlar haqiqiy tayinlangan tugmani ko‘rsatadi, matnga qattiq yozilgan E yoki A ni emas. Jadval standart sozlamani tushuntiradi.

### 5.2 Boshlang‘ich harakat qiymatlari

- Sog‘liq 100, chidamlilik 100.
- Oddiy yurish 220 o‘yin birligi/soniya, yugurish 340, aniq nishonda yurish 150.
- Yugurish 18 chidamlilik/soniya sarflaydi; 0,8 soniya tinchlikdan keyin 25/soniya tiklanadi.
- Qochish qadami 110 birlikni 0,24 soniyada bosib o‘tadi, 30 chidamlilik; oralig‘i 0,7 soniya. Standartda mutlaq daxlsizlik yo‘q: ogohlantirilgan zarbadan joyini o‘zgartirib chiqish kerak.
- Itarish 60 birlik masofada 80° konus; 10 zarar, 0,6 soniya qoqilish, 20 chidamlilik, 0,9 soniya qayta ishlatish oralig‘i. Qo‘riqchini to‘liq to‘xtatmaydi.
- Boshqa aktor bilan tiqilib qolmaslik uchun sheriklar tor yo‘lda bir-birini yumshoq o‘tkazadi; devor orqali o‘tish mumkin emas.
- Qayta o‘qlashni qochish yoki jihoz almashtirish bekor qiladi; eski o‘q yo‘qolmaydi, yangi magazin esa animatsiyadagi belgilangan nuqtada qo‘shiladi.

Yuk 0–5: chidamlilik tiklanishi 100%; 6–8: 80%; 9–10: 60% va yugurish sarfi 24/soniya. Katta buyum qo‘lda: yurish 180, yugurish va qochish yo‘q, otish yo‘q, tez qo‘yish mumkin. Shu cheklov buyumni olishdan oldin ko‘rinadi.

### 5.3 Kontekst amali

Eng yaqin ko‘rinadigan va yetish mumkin bo‘lgan obyekt tanlanadi. Devor ortidagi narsa olinmaydi. Oddiy olish 0,25 s, zich quti 1,2 s, katta komponentni uzish 3 s, tiriltirish 4 s. Muhim qaror uchun alohida tasdiqlash oynasi; tasodifan E bosish bilan shahar zanjiri uzilmaydi. Harakat zarba, masofa yoki tugmani qo‘yish bilan bekor bo‘lsa, resurs faqat yakun tasdiqlanganda sarflanadi.

---

<a id="b06"></a>

## 6. Qurollar, zarar, o‘q va tiriltirish

### 6.1 Sakkiz qurolning boshlang‘ich ro‘yxati

Masofa — samarali masofa; eng uzoq ko‘rinmaydigan nishonni otishga ruxsat degani emas. Shovqin radiusi ochiq joydagi birliklarda. Zirhsiz oddiy tanaga asosiy zarar qo‘llanadi.

| ID / qurol | Zarar | Otish/soniya | Magazin | O‘qlash, s | Masofa | Shovqin | Vazifa |
|---|---:|---:|---:|---:|---:|---:|---|
| W01 Signal-9 to‘pponcha | 24 | 3 | 12 | 1,4 | 400 | 420 | Ishonchli yordam quroli |
| W02 Needle avtomati | 12 | 8 | 24 | 1,8 | 320 | 500 | Yaqin bosim va tezkorlar |
| W03 Survey karabini | 36 | 4 | 15 | 2,0 | 640 | 650 | O‘rta masofa, aniq zarba |
| W04 Breach sochma quroli | 8 dona × 10 | 1 | 5 | 2,4 | 220 | 800 | Yaqin guruh; masofada zarar tushadi |
| W05 Longline miltig‘i | 80 | 0,65 | 5 | 2,8 | 900 | 800 | Katta xavfni uzoqdan yo‘qotish |
| W06 Quietbolt arbaleti | 70 | 0,65 | 1 | 1,4 | 520 | 100 | Jim reja; sekin qayta otish |
| W07 Arc elektr asbobi | 18, yonidagi 2 nishonga 9 tadan | 1,5 | 8 | 2,2 | 260 | 350 | 0,35 s to‘xtatish, mashina qarshiligi |
| W08 Breach-L portlatgichi | Markazda 100, chetda 30 | 0,5 | 1 | 2,0 | 480 | 1 200 | Zirh, to‘siq va katta to‘da |

W01 yordam slotida; W02–W08 asosiy slotda. Namunada W01 va W03, to‘liq o‘yinda sakkiz qurol. W07 elektr toki suvda turgan hamrohni avtomatik o‘ldiradigan qoida yaratmaydi; maxsus xavf oldindan ko‘rsatiladi. W08 portlash radiusi 120, ishga tushish va ko‘rinadigan belgi 0,7 s; devor zararni to‘sadi.

W06 uchun qayta otish oralig‘i kamida 1 / 0,65 ≈ 1,54 s; 1,4 s qayta o‘qlash shu oralig‘ida bajariladi. Har qurolda keyingi o‘q ikkala shart — otish oralig‘i va o‘qlash — tugagandagina chiqadi.

### 6.2 Zarar qoidasi

`Natija = asosiy zarar × masofa koeffitsiyenti × nishon qismi koeffitsiyenti × zirh koeffitsiyenti`.

Samarali masofagacha koeffitsiyent 1; maksimal masofada odatda 0,6. Sochma qurol 220 birlikda 0,4 ga tushadi va donalar yoyiladi. To‘siq ortidagi nishonga zarar yo‘q. Oddiy aniqlik zaif nuqtasi 1,5; qo‘riqchining maxsus ochilgan qismi o‘z jadvaliga ega.

Standartda sherikka quroldan zarar yo‘q; o‘zingning portlashing va muhit xavfi o‘zingga zarar qiladi. Odamlar o‘yinchi o‘qi bilan tasodifan halok bo‘lmaydi. Do‘stlarga zarar yetkazishni yoqadigan alohida rejim keyingi ko‘lam; hozirgi qo‘llanmaga kiritilmaydi.

Zirh oddiy o‘q zararini 0,5 ga tushiradi; zaif tomoni 1. Elektr va portlovchi tur belgilangan koeffitsiyentdan foydalanadi. Immunitet o‘rniga aniq ko‘rinadigan qarshilik va zaif nuqta ishlatiladi.

### 6.3 O‘q, qurol yo‘qolishi va ta’minot

O‘q oilalari: yengil (W01/W02), miltiq (W03/W05), sochma, bolt, elektr hujayra, portlovchi. Asosiy qurol va to‘pponcha uchun boshlang‘ich minimal o‘q ombordan bepul qayta chiqariladi, ammo kampaniya resursiga aylantirilmaydi yoki sotilmaydi. Yuqori zaxira/to‘ldirish mos ta’minot xarajatidan olinadi. Bir safar boshida qayta berish amali bir marta va mavjud o‘qni hisobga olib ishlaydi.

Mag‘lubiyatda qurolning ochilgan modeli yo‘qolmaydi. Olib yurilgan sarflanuvchi va yuk tiklash joyiga tushadi. Arbalet bolti har otish uchun yagona obyekt; tegib qolgan boltni qayta olish faqat mavjud bo‘lsa mumkin, yangi bolt yaratilmaydi.

### 6.4 Qurol takomillashtirish

Har qurolda ikkita muqobil modifikatsiya yo‘li, bir vaqtning o‘zida bittasi: masalan, W03 uchun tinchroq stvol (shovqin −25%, magazin 12) yoki katta magazin (20 o‘q, o‘qlash +0,4 s). Dastlab W01/W03/W04 uchun jami 6 modifikatsiya ishlab chiqiladi; qolganlari jang xilma-xilligi tasdiqlangach. Xom zararni cheksiz oshiradigan darajalar yo‘q.

### 6.5 Yiqilish, jarohat va qiyinchilik

Standartda 0 sog‘liq — yiqilgan holat; tiklash oynasi 60 s. Sherik 4 s amalda 1 tibbiy to‘plam sarflab 40 sog‘liq bilan turg‘izadi. Bir operatorga bir safarda eng ko‘pi 2 tiriltirish. Yakka operator safar boshida bitta sotilmaydigan favqulodda injektorga ega: 4 s tiklanish va 40 sog‘liq, so‘ng 2 s dushman nishonlashidan himoya. U xavfli polga ko‘chirmaydi va foydalanib bo‘lgach safar tugamaguncha tiklanmaydi. Barcha faol operatorlar yordam imkonisiz yiqilganda safar mag‘lubiyati yechiladi.

Yakka favqulodda tiklanish sherikning ikki marta tiriltirishiga qo‘shib berilmaydi: u yakka rejimning yordamidir. Aloqa uzilganda uni qayta yaratib foydalanish yo‘q. Boshlang‘ich rejim tarkibi va ishlatilgan favqulodda yordam holati safar bilan saqlanadi.

Og‘ir jarohat keyingi safarda eng ko‘pi bitta kichik cheklov, masalan maksimal chidamlilik −15 beradi; tanaga doimiy tushunarsiz debuff yig‘ilmaydi. Klinikada ko‘rsatilgan davolash bilan tuzaladi. “Hikoya”da bunday cheklov avtomatik keyingi bazaviy damda tugashi mumkin. Odam yo‘qolishi rejalashtirilgan xavfli tanlovdan keladi, tasodifiy oddiy o‘qdan syujet o‘chmaydi.

| Rejim | O‘yinchiga zarar | Xavf budjeti | Safar resursi | Izoh |
|---|---:|---:|---:|---|
| Hikoya | ×0,65 | ×0,75 | ×1,20 | Muddatlar yumshoq, yo‘l ko‘rsatish kuchli |
| Omon qolish | ×1,00 | ×1,00 | ×1,00 | Barcha asosiy jadvallar shu rejim uchun |
| Og‘ir sinov | ×1,20 | ×1,15 | ×0,90 | Ko‘proq taktik aralashma; HP o‘zgarmaydi |

Asosiy komponent va kampaniya kalitlariga resurs kamaytirish ta’sir qilmaydi. Sog‘liqni ko‘paytirish bilan barcha dushmanni uzoq otiladigan qilish yo‘q. Maxsus accessibility sozlamasi yutuq yoki syujetni yashirmaydi. Sozlama o‘zgartirilganda yangi bosim keyingi xavfsiz bosqichda qo‘llanadi, mavjud guruh birdan almashtirilmaydi.

---

<a id="b07"></a>

## 7. Asboblar va almashtiriladigan jihozlar

Har bir o‘yinchi HAVENda jihozini almashtiradi; qattiq sinf va majburiy “healer” yo‘q. Alohida yordam slotiga bitta asbob, uloqtirish slotiga bir tur olinadi.

| ID | Vosita | Ta’sir | Chegara |
|---|---|---|---|
| T01 | Ovozli chalg‘itgich | 8 s davomida 500 birlikdagi yaqin zararlanganni ovozga tortadi | Ko‘rgan nishonini hamma dushman darhol unutmaydi |
| T02 | Tutun kapsulasi | Radius 140, 8 s; ko‘rishni uzadi | Ovozdan himoya qilmaydi; muhim xavf silueti qoladi |
| T03 | Yorug‘lik granatasi | 100 radiusdagi mos dushmanni 2 s to‘xtatadi | Qo‘riqchi 0,5 s; takroriy ta’sir cheklangan |
| T04 | Tibbiy to‘plam | 3 s amalda 40 sog‘liq; tiriltirishda 1 dona | Zarba amaliyotni to‘xtatadi, tugamaguncha sarf yo‘q |
| T05 | Qisqa skaner | 350 radiusda yaqindagi harakatni 3 s belgilaydi | 2 quvvat; barcha sir va devor ortidagi to‘liq xaritani bermaydi |
| T06 | Eshik tirgagi | Bitta oddiy eshikni 20 s ushlab turadi | Xavfsizlik chiqishini doimiy yopmaydi; qayta olish mumkin |
| T07 | Ta’mir to‘plami | Platforma/generatorning 30 yaxlitligini 4 s tiklaydi | Faqat mos obyekt, 2 zaryad |
| T08 | Signal to‘suvchi | 10 s mahalliy elektron alarmni bosadi | Qichqiruvchi va biologik eshitishga ta’sir qilmaydi |

Boshlang‘ich yuklamalar: Kuzatuvchi — W03/T05/T01; Himoyachi — W04/T07/T03; Qutqaruvchi — W02/T04/T02; Jim izlovchi — W06/T06/T01. Bu tavsiya to‘plamlari, alohida kuch daraxtlari emas. Yakka o‘yinchi ikki yondashuvni aralashtira oladi.

---

<a id="b08"></a>

## 8. Shovqin, xavf va moslashadigan to‘da

### 8.1 Shovqin

Har bir shovqin manba, kuch, masofa va vaqtga ega hodisa. O‘q, signalizatsiya, singan oyna, generator va metall yukning urilishi turli ovoz chiqaradi. Dushman ovoz chiqqan joyni tekshiradi; ko‘rmagan o‘yinchisining yangi joyini avtomatik bilmaydi.

Zarur paytda shovqin doirasi qisqa ko‘rsatiladi. Devor, yopiq eshik va sektor akustikasi tarqalishni o‘zgartiradi. Tosh, taymerli chalg‘itgich, alarm va elektr uskunasi ataylab dushmanni boshqa yo‘lga tortish uchun ishlatiladi.

### 8.2 Safar xavfi

Ichki hisob 0–100; o‘yinchi beshta tushunarli bosqichni ko‘radi:

| Qiymat | Holat | O‘zgarish |
|---|---|---|
| 0–19 | Sokin | Kam patrul, kuzatishga imkon |
| 20–39 | Bezovta | Ovozga javob beruvchi guruhlar |
| 40–59 | Ov | Yon tomondan yaqinlashish, ehtiyot yo‘llarining xavfi |
| 60–79 | To‘da | Aralash guruhlar va sektorning faol xavfi |
| 80–100 | Qamal | Qaytish shoshilinch; qolish juda xavfli |

Sinov uchun boshlang‘ich o‘zgarishlar: yopiq hududda katta portlash +8, uzoq alarm +12, asosiy generatorni ishga tushirish +15. Oddiy bitta o‘q butun shahar xavfini birdan ko‘tarmaydi; avval mahalliy eshitish tizimi ishlaydi. Qiymatlar missiya ta’rifida sozlanadi.

Bir muddat ko‘rinmasdan va ovozsiz yurish bosimni sekin tushiradi; xavfsiz xonada 30 soniyada eng ko‘pi 10 xavf birligi tushadi. Cheksiz kutib hamma bosimni yo‘qotish yo‘q: joriy missiya bosqichi eng past chegarani belgilaydi. Tinch joyda vaqtning o‘zi xavfni 100 ga olib chiqmaydi. Vaqt bo‘yicha o‘sish faqat faol xavfli hudud yoki ko‘rsatilgan ssenariy sharti bilan ishlaydi.

Oddiy qimmat metallni ko‘tarish dushmanga sehrli ravishda xabar bermaydi. Yuk shovqin chiqarsa, tezlikni pasaytirsa, kuzatuv signali yoki biologik izi bo‘lsa, aynan shu xususiyati xavfga ta’sir qiladi. Belgisi yuk olishdan oldin ko‘rsatiladi.

### 8.3 Shahar bosimi

Bu uzoq muddatli holat. U syujet voqealari, tugallangan safarlar, qarovsiz qolgan inqirozlar va muhim ochilgan tizimlar bilan o‘zgaradi. HAVENda menyu o‘qish, o‘yinni to‘xtatish yoki real hayotda bir kun kutish shaharni oldinga surmaydi.

“Ikki safardan keyin konvoy ketadi” degan inqiroz aynan yakunlangan ikki tashqi operatsiya bilan hisoblanadi. Bekor qilingan tayyorgarlik va bazada aylanish operatsiya sanalmaydi. Har inqiroz uchun muddatning ishga tushish hodisasi alohida saqlanadi.

### 8.4 Dushman boshqaruvining adolat qoidalari

- Oddiy dushman ko‘rinayotgan ekranda birdan paydo bo‘lmaydi.
- Ko‘rinadigan eshik, tunnel yoki darvoza orqali oldindan ogohlantirilgan kirish mumkin.
- Hamkorlikda paydo bo‘lish nuqtasi barcha o‘yinchilar kamerasiga nisbatan tekshiriladi.
- Endigina yopilib tozalangan xonada asoslanmagan dushman paydo bo‘lmaydi.
- Og‘ir dushman ovoz, titrash, yorug‘lik yoki radio bilan ogohlantiriladi.
- Odatda kamida bitta chekinish yo‘li saqlanadi; himoya bosqichida chiqish cheklanishi oldindan bilinadi.
- Dushmanlar uchun umumiy xarajat chegarasi va katta to‘qnashuvdan keyin tanaffus bor.
- Qaysi hodisa bosim yoki dushman tug‘dirgani ishlab chiquvchi jurnalida yoziladi.

### 8.5 Safarlar orasidagi moslashuv

To‘da oxirgi uchta mazmunli yakunlangan jangli safarni tahlil qiladi. Bazadan chiqib darhol qaytish yoki ataylab bo‘sh vazifa bajarish hisobga olinmaydi. Bitta asosiy javob va bitta kichik o‘zgarishdan ortiq moslashuv yig‘ilmaydi.

| Ustun usul | Javob | Ogohlantirish | Javob chorasi |
|---|---|---|---|
| Uzoqdan otish | Yon yo‘ldan keladigan tezkorlar | Kuzatuvchi xabari va izlar | Tuzoq, tor yo‘l, to‘xtatuvchi qurol |
| Yaqindan urish | Shishgan va ushlovchi zararlanganlar | Gaz izi, o‘ziga xos tovush | Masofa, olov, ajratib urish |
| Portlovchi qurol | Tarqoq yoki qalin qoplamali guruhlar | Zirhli qoldiqlar | Aniqlik, zaif nuqta, muhit |
| Jim yurish | Eshituvchi uyalar va qichqiruvchilar | Mayda chinqiriq, osilgan signal buyumlari | Chalg‘itish, uyani chetlash, qisqa aniq hujum |
| Bir joyda himoya | Aylanib keluvchi guruhlar | Devor ortidagi harakat | Pozitsiya almashtirish, ikki tomonni kuzatish |

Yangi javob safardan oldin razvedka kartasida aytiladi. Hamma dushman bir vaqtda almashtirilmaydi va qurolga mutlaq immunitet berilmaydi. Taktikani o‘zgartirgan bir-ikki mazmunli safardan keyin moslashuv pasayadi. ECHO o‘chirilsa, uning signallari bilan bog‘liq moslashuv susayadi, ammo tabiiy zararlanganlar va boshlanib bo‘lgan to‘da harakati yo‘qolmaydi.

---

<a id="b09"></a>

## 9. Dushman turlari, sun’iy intellekt va jang budjeti

### 9.1 Oddiy va maxsus sakkiz sinf

| ID / nom | HP | Tezlik | Hujum | Ogohlantirish | Qarshi chora |
|---|---:|---:|---|---|---|
| E01 Sudraluvchi | 60 | 105 | 15 zarar, 1,5 s oraliq | 0,55 s qo‘l ko‘tarish | Masofa, itarish, 3 W01 o‘qi |
| E02 Chopqir | 45 | 270 | 12 zarar, 1,1 s oraliq | 0,65 s oldinga egilish | Qiyshiq qochish, sochma qurol |
| E03 Qichqiruvchi | 80 | 90 | Bevosita kuchsiz; signal beradi | 2 s nafas olish | Qisqa aniq zarba yoki yo‘lni o‘zgartirish |
| E04 Shishgan | 130 | 80 | 20 yaqin zarar; halok bo‘lgach 2 s da gaz | Shish va g‘ichirlash | Uzoqdan urish; gazdan chiqish |
| E05 Qalqonli | 180 | 90 | 25 zarba, 2 s oraliq | 0,9 s og‘ir tayyorgarlik | Yon/ort; zirh teshuvchi usul |
| E06 Poylovchi | 70 | 180 | 18 sakrash zarari | 0,8 s ko‘z/chang belgisi | Chiroq, skaner, masofani saqlash |
| E07 Ushlovchi | 100 | 150 | 10 urish; 2 s gacha tutish | 0,75 s ikki qo‘lni ochish | Itarish yoki sherik yordami; yakka ozod bo‘lish amali |
| E08 Kestrel droni | 90 | 170 | 8 × 3 o‘q, salvolar oralig‘i 2 s | 1 s nishon nuri | To‘siq, elektr asbobi, panelni o‘chirish |

E03 bir signalda 3–5 dushman chaqirishi mumkin, faqat umumiy budjetda joy bo‘lsa; yangi signal oralig‘i 20 s. E04 gazi 100 radiusda 6 s turadi, 5 zarar/soniya, kirishdagi birinchi 0,5 s kechikish. E07dan ozod bo‘lish uchun ko‘rsatilgan amalni ushlab turish mumkin; tugmani tez-tez urish shart emas. Bir nechta E07 ketma-ket uzluksiz tutolmaydi: ozod bo‘lgach 3 s qayta ushlamaslik.

Boshlang‘ich namunada E01, E02, E03. E08 raqib bo‘lishi yoki shahar holatiga ko‘ra betaraf qolishi mumkin. Barcha sinflar har bir sektorda ko‘paytirib qo‘yilmaydi: sektor asosiy uchlik va eng ko‘pi ikki maxsus tur bilan taniqli bo‘ladi.

### 9.2 Jang budjeti

E01 narxi 1; E02 2; E03 4; E04 3; E05 4; E06 3; E07 3; E08 3. Yakka o‘yin uchun faol uchrashuv budjeti xavf bosqichida 6/9/12/16/20; bu bir vaqtning o‘zidagi so‘rov chegarasi, hammasi bir lahzada tug‘iladi degani emas. Ikki kishida ×1,35, butun songa yuqoriga yaxlitlanadi. Profilingdagi aktor chegarasi ustun.

Bir ekranda odatda eng ko‘pi 2 E03/E07 kabi nazoratni cheklovchi dushman. Katta to‘qnashuvdan keyin yangi to‘lqin uchun 8–12 s tanaffus; mavjud dushmanlar g‘oyib bo‘lmaydi. Qo‘riqchi alohida maydon budjetini ishlatadi, uning ustiga to‘liq oddiy budjet qo‘shilmaydi.

### 9.3 Hisoblash va aktorlar hayoti

Dushman holatlari: uyqu, kutish/patrul, ovozni tekshirish, jang, qayta joylashish, o‘chirilgan/halok. Ko‘rish avval yaqin nomzodlarni ajratadi, keyin zarur ko‘rish chizig‘ini tekshiradi. Har dushman har kadrda hamma narsani hisoblamaydi.

Dastlabki qaror yangilash maqsadi: faol jangda soniyasiga 8–10, ko‘rinadigan tinch aktorda 2–4, tayyor zonada 0,2–1 yoki soddalashtirilgan holat. Harakat va fizika chastotasi bundan alohida; 10 marta qaror qilish 10 FPS animatsiya degani emas.

Yo‘l so‘roviga dastlab kadr boshiga 8 ta chegara qo‘yib sinash mumkin. Tiqilib qolishni aniqlash, qayta yo‘l va xavfsiz chekinish kerak. Ko‘rinib turgan dushmanni o‘yinchi oldiga teleport qilish yechim bo‘lmaydi.

30 faol jangchi va 40–80 kam yangilanadigan aktor — boshlang‘ich stress sahnasi. To‘liq o‘yindagi yuqori xavf shu budjetga sig‘ishi kerak; sig‘masa dushman soni, ko‘rinish yoki sun’iy intellekt soddalashtiriladi.

---

<a id="b10"></a>

## 10. To‘rtta katta qo‘riqchining jang ssenariysi

To‘rtta to‘liq qo‘riqchi v1.0 uchun maqsad. Har sektorga alohida boss qurish shart emas. Kuchli dushmanlar sonidan ko‘ra qayta tushuniladigan jang muhim.

### 10.1 B01 — Ilgakchi, Iron Tide

HP 600, tanasi 0,6 zarar koeffitsiyenti. Arena: port krani, ikkita konteyner yo‘lagi, bitta osilgan yuk. 1-bosqich: 1,0 s ogohlantirishli uch yo‘nalishdan biriga ilgak zarbasi, 30 zarar. 2-bosqich HP 60% da: tor yo‘llarga 4 E01 kiradi, kran quvvati ochiladi. 3-bosqich HP 30% da: tezroq 0,75 s zarba, ammo 2 s tiklanish.

Kran yuki ikki marta ishlatiladi: har zarba 120 va orqa g‘altakni 5 s ochadi. Ochilgan g‘altakka ×1,5; kransiz ham yengish mumkin. Hamkorlikda biri nishonni tortadi, biri panelni boshqaradi; yakkada panel taymeri 4 s kechikib ishlaydi. Natija: og‘ir yuk ko‘prigi va korpus qismini olish yo‘li. Oddiy qurol o‘qi tugasa arena ichida cheklangan, qayta tug‘ilmaydigan o‘q va muhit zarbasi yetishi test qilinadi.

### 10.2 B02 — Shovqin yuragi, Black Grid

HP 450, faol tokda qobiq 0,25; tok uzilganda 1. Arena uch elektr zanjiri bilan bo‘linadi. 1-bosqich: ovoz urishi 1,2 s belgilanadi, 20 zarar va qisqa itarish. Ikki paneldan birini o‘chirib xavfsiz yo‘lak yaratiladi. 2-bosqich 50% da: qobiq qaytadi, boshqa panel ochiladi, 2 E02 limit. Tokni noto‘g‘ri yo‘naltirish darhol o‘lim bermaydi: 1 s chiroq/ovozdan keyin pol xavfli bo‘ladi. Natija: yaxshilangan qo‘shimcha konverter va uchinchi zanjirni tiklash imkoniyati. Asosiy Quvvat moduli uchun standart konverter M04da bossesiz olinadi. Syujetdagi ikki zanjir tanlovi bossni yengish bilan avtomatik bekor bo‘lmaydi.

### 10.3 B03 — Bosim kostyumi, Steppe Needle

HP 700. 1-bosqich: 1,1 s tayyorgarlik bilan tekis chiziqli yugurish, 35 zarar; devorga urilganda 3 s zaiflik. 2-bosqich 60% da: bug‘ yo‘llari navbatma-navbat ochiladi, issiq pol 0,8 s oldin ko‘rinadi. 3-bosqich 25% da: ikki qisqa yugurishdan keyin 4 s uzun tiklanish. Sovitish ventilini ochish oynani uzaytiradi. Natija: dvigatel qismi va tekshiruv dalili. Sinovni keyinga qoldirish bossni yo‘q qilmaydi; xavfsizroq tashish yo‘li va keyingi bazaviy kalibrlash mavjud.

### 10.4 B04 — Arxiv qo‘riqchisi, Old Town

HP 550; boshqaruvchi dron va uch signal tuguni. Bu ECHOning o‘zi emas. 1-bosqich: 1 s ko‘rinadigan lazer yo‘li, 25 zarar. 2-bosqich ikki tugun o‘chirilganda: pol bo‘ylab xavfsiz yo‘l aylanishi va 2 E08. 3-bosqich: qolgan tugun orqali 6 s ochiq yadro. Kurash yoki oldin topilgan vakolat bilan xavfsizlikni qayta belgilash yo‘li bor; tinch yo‘l boshqa xarajat/ishni talab qiladi. Natija bir xil uchirish kalitiga olib keladi. ECHO taqdiri bossni urish bilan tasodifan hal qilinmaydi.

---

<a id="b11"></a>

## 11. Shahar, sektorlar, xonalar va yo‘l tuzilishi

20 000 × 14 000 o‘yin birligi — tekshiriladigan dastlabki ko‘lam, majburiy muvaffaqiyat mezoni emas. Piksel masshtabi, kamera va yurish tezligi aniqlanmaguncha uni real o‘yin davomiyligi bilan tenglashtirish mumkin emas.

Shahar bitta dunyo; sektorlar uning mazmuniy hududlari. Texnik yuklash bo‘laklari sektor chegarasiga teng bo‘lishi shart emas. HAVEN bundan mustasno, har tashqi sektorda chekka, markaz va chuqur maqsad joyi bo‘ladi.

Tashqi sektor talablari: birinchi tayanch vazifadan keyin ikki kirish, ochiladigan qisqa yo‘l, kamida bitta xavfsiz nuqta, o‘ziga xos xavf, ikkita ko‘rinadigan yakuniy holat va qaytish uchun amaliy sabab. HAVENda esa baza xizmatlari, shipyard va himoya kirishlari bo‘ladi.

### 11.1 Taklif etilgan asosiy bog‘lanishlar

Yo‘llar boshlanishida bir qismi yopiq bo‘lishi mumkin; “bog‘langan” degani darhol kirish mumkin degani emas.

| Hudud | Bevosita yo‘l bilan bog‘langan hududlar |
|---|---|
| HAVEN | Dust Lantern, Blue Hour, Iron Tide |
| Dust Lantern | HAVEN, Crown Market, Black Grid |
| Iron Tide | HAVEN, Black Grid, Steppe Needle |
| Blue Hour | HAVEN, Crown Market, White Room |
| Crown Market | Dust Lantern, Blue Hour, Old Rail |
| Black Grid | Dust Lantern, Iron Tide, Old Rail |
| White Room | Blue Hour, Old Rail, Old Town |
| Old Rail | Crown Market, Black Grid, White Room, Steppe Needle |
| Steppe Needle | Iron Tide, Old Rail, Old Town |
| Old Town | White Room, Steppe Needle |

Bu chizma o‘rnidagi bog‘lanish jadvali; aniq koordinata va to‘qnashuv shakllari 0-bosqichda xaritaga tushiriladi. Old Town ikki yo‘ldan bog‘langan, lekin kerakli ruxsat va syujet shartiga qadar ikkisi ham yopiq.

### 11.2 Sektorlarning o‘ziga xosligi

| Sektor va doimiy ID | O‘yin xususiyati | Resurs/maqsad | Tanlov va keyingi iz |
|---|---|---|---|
| HAVEN — `haven` | Xizmatlar, tayyorgarlik, qurilish, mudofaa | Odam, tadqiqot, Ark | Kema, baza va odamlar orasida mablag‘; yangi xonalar va himoya |
| DUST LANTERN — `dust_lantern` | Tor hovli va kvartiralar, yashirin yo‘llar | LIFE, TECH, aholi | Generatorni olish yoki mahalliy boshpanaga qoldirish; yoritilgan uylar yoki bo‘sh qorong‘i uylar |
| IRON TIDE — `iron_tide` | Konteynerlar, kranlar, ochiq port yo‘laklari | METAL, FUEL, korpus | Ittifoq bilan ulashish yoki zaxirani olish; ko‘prik, yuk yo‘li va ishchilar |
| WHITE ROOM — `white_room` | Laboratoriya, havo shlyuzi, blokirovka | DATA, TECH, ruxsat | Ro‘yxatni ochiqlash yoki vaqtincha saqlash; dron va eshiklarning munosabati |
| BLUE HOUR — `blue_hour` | Shifoxona, palata, tibbiy triage | LIFE, shifokorlar | Hozirgi bemorlar yoki kelajak tibbiy kapsulalari; tiklangan klinika |
| STEPPE NEEDLE — `steppe_needle` | Angar, raketa maydoni, uzoq ko‘rinish | FUEL, dvigatel | Shovqinli tekshiruv yoki xavfli, sinalmagan qism; keyingi sinov va final holati |
| BLACK GRID — `black_grid` | Tok tarmog‘i, kommutator, qorong‘i infratuzilma | POWER, TECH | Uch zanjirdan ikkitasini yoqish; shahar chiroqlari va yo‘llari |
| OLD RAIL — `old_rail` | Metro, ovoz tarqalishi, texnik tunnel | METAL, POWER, qatnov | Metro ochilishi yoki xavfli shoxobchani berkitish; tezlik va to‘da yo‘li |
| CROWN MARKET — `crown_market` | Do‘kon, savdo joyi, fuqarolar boshpanasi | LIFE, savdo, ma’lumot | Bozorga sarmoya yoki zaxirani musodara qilish; savdogar va ittifoq |
| OLD TOWN — `old_town` | Eski ko‘chalar, arxiv va Vault B | DATA, uchirish kaliti | ECHO vakolati va arxivni saqlash; final yo‘li va meros |

### 11.3 Qatnov

O‘zlashtirilgan, xavfsiz yo‘lning bo‘sh qismini tez o‘tish mumkin. Bu vaqt, yoqilg‘i va xavf oqibatini oldindan ko‘rsatadi. Faol quvish, konvoy, yuk platformasi yoki kuzatilayotgan qochqinlar bilan bunday o‘tish mumkin emas. Odamlar xavfsiz punktga yetgach, alohida transport operatsiyasi orqali HAVENga ko‘chirilishi mumkin; bu oddiy teleport hisoblanmaydi.

### 11.4 Masshtab va ulanish

O‘yin birliklarida 64 katakli ishchi to‘r; operator to‘qnashuv diametri 28. Oddiy eshik kamida 64, muhim katta yuk yo‘li kamida 128, ikki yo‘nalishdagi asosiy ko‘cha 192–320. Ko‘rinmas bezak to‘qnashuvi yo‘q. Bu kulrang sinov xaritasi o‘lchamlari, tayyor grafikalar emas.

Har sektor o‘z koordinatasida quriladi; global joylashtirishda bitta origin ishlatiladi. Dunyo yo‘llari va 20 000 × 14 000 taxminiy ko‘lam tayyor sektorlarni joylashdan keyin tekshiriladi. Barcha mahalliy xonalarni bir global koordinataga nusxalash taqiqlanadi.

Quyidagi qolip tashqi sektorlar uchun 2 048 × 1 536 birlik ishchi hudud:

| Nuqta | Markaz x,y | Xona yoki maydon chegarasi |
|---|---|---|
| A asosiy kirish | 192,768 | 0,640 dan 384,896 gacha |
| B birinchi hovli | 576,512 | 384,256 dan 768,704 gacha |
| C ikkinchi yo‘l | 576,1088 | 384,896 dan 768,1280 gacha |
| D asosiy obyekt | 1152,512 | 896,256 dan 1408,768 gacha |
| E ixtiyoriy voqea | 1152,1088 | 896,896 dan 1408,1280 gacha |
| F chuqur maydon | 1728,768 | 1536,448 dan 1920,1088 gacha |
| G qisqa chiqish | 1728,192 | 1536,64 dan 1920,320 gacha |

A–B–D–F va A–C–E–F ikkita yo‘l. D–E ko‘ndalang yo‘l, D–G ochiladigan qisqa chiqish. F–G muqobil qaytish; barcha yo‘laklar kamida 128 birlik. Bu bir xil yetti xona chizib, har sektorga boshqa rang berish uchun emas: topologik minimum. Port ochiq yo‘laklarga, metro parallel tunnellarga, shifoxona ichki bo‘linmalarga aylantiriladi.

### 11.5 Sektor bo‘yicha xonalar, to‘siq va obyektlar

| Sektor | A/B/C | D/E | F/G | Interaktiv muhit |
|---|---|---|---|---|
| Dust Lantern | Darvoza / pochta hovlisi / tomga chiqish yo‘li | Generator xonasi / qamalgan uy | Yong‘in yo‘lagi / ochiladigan xizmat eshigi | 2 alarm, 1 tutun yo‘li, 1 yoriladigan to‘siq |
| Iron Tide | Port posti / konteyner yo‘li / ustaxona yo‘li | Po‘lat ombor / Rivet platformasi | Kran arenasi / ko‘prik | 1 kran, 2 konteyner darvozasi, 1 yuk platformasi |
| White Room | Qabul / laboratoriya qanoti / servis yo‘lagi | Arxiv / karantin | Server shlyuzi / texnik lift eshigi | 3 panel, 2 ko‘rish oynasi, 1 xavfsizlik zanjiri |
| Blue Hour | Tez yordam / qabul palatasi / kir yuvish yo‘li | ICU / kapsula ombori | Kislorod markazi / tez yordam chiqishi | 2 kislorod ventil, 3 xavfsiz kutish nuqtasi |
| Steppe Needle | Nazorat posti / hangar / yonilg‘i yo‘li | Dvigatel / sinov paneli | Issiq maydon / sovitish yo‘lagi | 3 bug‘ ventili, 2 issiq pol, 1 boshqaruv paneli |
| Black Grid | Texnik darvoza / transformator / kabel xandagi | Kommutator / aholi releysi | Turbina arenasi / servis eshigi | 3 elektr zanjir, 2 qayta o‘rnatish paneli |
| Old Rail | Bekat / platforma / texnik tunnel | Nazorat kabinasi / tashlab ketilgan vagon | Yo‘l ayrilishi / ustki chiqish | 2 strelka, 1 yuk eshigi, 1 yorug‘lik zanjiri |
| Crown Market | Maydon / do‘kon yo‘li / orqa yetkazish yo‘li | Oziq ombor / boshpana | Savdo hovlisi / orqa darvoza | 1 signal, 2 ko‘tariladigan panjara, 1 savdo nuqtasi |
| Old Town | Eski post / fuqarolik arxivi / servis yo‘li | Vakolat terminali / shaxsiy yozuvlar | Vault B / qaytish yo‘lagi | 3 signal tuguni, 1 kalit terminali, 2 to‘siq |

Har sektor A va G orqali ushbu hujjatdagi qo‘shni yo‘llarga bog‘lanadi; qo‘shimcha aloqalar xaritada alohida portal oladi. A/G har doim bir xil ko‘rinishda bo‘lishi shart emas. Yer chizmasi, dekor va yakuniy to‘qnashuv hali muharrirda chizilishi kerak; jadval qurish topshirig‘i hisoblanadi.

### 11.6 HAVEN joylashuvi

Ishchi maydon 1536 × 1024. Kirish (128,768); ombor (384,768); qurolxona/ustaxona (384,384); boshqaruv (768,256); klinika (768,768); boshpana (1088,768); kemasozlik (1216,320). Asosiy aylana yo‘l 192 kenglikda. Kirishdan topshirishgacha taxminan 2–4 s, ombordan istalgan asosiy xizmatgacha 5–12 s yurish maqsadi. Muhit bezaklari yo‘lni toraytirmaydi.

### 11.7 Topilma joylashtirish qoidasi

Har tashqi xaritada 12 tekshirilgan resurs uyasi, 4 o‘q uyasi, 2 yordam buyumi uyasi, 1 ma’lumot joyi va 1 mutaxassis/aholi voqeasi belgisi. Hammasi har safar faol emas. Vazifa aniq uyalarni tanlaydi; kritik komponent tasodifiy umumiy jadvalga berilmaydi. Qoldiq zaxira olib ketilgandan keyin bo‘sh ko‘rinadi. Tiklash vazifasi yangi resursni mavjud bo‘lgan buyum bilan bir IDda saqlaydi.

---

<a id="b12"></a>

## 12. Missiya tizimi va vazifalarni yaratish qoidasi

### 12.1 Vazifalarning to‘rt darajasi

- **Syujet vazifasi:** bir martalik, personaj, dilemma va uzoq oqibatga ega.
- **Hudud amaliyoti:** elektr, ko‘prik, xavfsiz xona, uya yoki savdo yo‘lini o‘zgartiradi.
- **Ta’minot safari:** resurs uchun qisqa va tizimli vazifa; uning qarori asosan tavakkal va yuk haqida.
- **Favqulodda chaqiriq:** tushunarli muddatli qutqaruv yoki inqiroz.

### 12.2 Sakkiz vazifa turi

| Tur | Asosiy harakat | Qaytishni o‘zgartiradigan omil |
|---|---|---|
| Qaytarib olish | Qismni topish, uzish, ko‘tarish | Og‘ir yoki shovqinli yuk |
| Qutqarish | Topish, barqarorlashtirish, xavfsiz nuqtalar orasida kuzatish | Odam holati va sekin yurishi |
| Elektrni tiklash | Bir nechta nuqtani tuzatish va zanjir tanlash | Chiroq bilan birga himoya tizimlari ham faollashadi |
| Maxfiy kirish/sabotaj | Ruxsatni aylanib o‘tish, nusxa olish yoki tizimni o‘chirish | Alarm chiqishlarni o‘zgartiradi |
| Konvoy | Yo‘lni tayyorlash va platformani kuzatish | To‘xtash, ta’mirlash, yo‘lni tanlash |
| Sezdirmay bajarish | Ko‘rish, ovoz va vaqtni boshqarish | Aniqlanish qisman natijaga olib keladi, darhol tugamaydi |
| Hudud qo‘riqchisi | Xulqni o‘rganish, muhitdan foydalanish, yengish | Arena va sektor holati o‘zgaradi |
| Evakuatsiya | Guruhlarni ajratish, yo‘lakni saqlash, sig‘imni boshqarish | Cheklangan joy, navbat va himoya |

Tergov, savdolashish va to‘dani boshqa yo‘lga burish shu turlar ichidagi bosqichlar bo‘lishi mumkin. Ular uchun yana uchta alohida katta tizim qurish shart emas.

### 12.3 Syujet missiyasining tarkibi

Buyurtmachi va sabab → aniq maqsad → joyning maxsus qoidasi → oldindan ishorasi bor asorat → ikki qimmatli natija orasidagi tanlov → o‘zgargan qaytish → ko‘rinadigan natija → keyingi missiyadagi aks → mag‘lubiyatdan davom etish yo‘li.

Asorat misollari: yopilgan ko‘prik, ichkaridan kelgan yordam signali, ayni resursni so‘ragan guruh, uzluksiz tok talab qiladigan yuk, ifloslangan kapsula yoki qaytishda ov boshlagan qo‘riqchi.

### 12.4 Takrorlanishni cheklash

Takliflar bir xil vazifa turini ketma-ket ustun qo‘ymasligi, bir sektor/tur juftligini so‘nggi to‘rt safarda ortiqcha takrorlamasligi va asoratlarni navbatlashi kerak. Bu qat’iy taqiq emas: tiklash, favqulodda yordam va asosiy yo‘l har doim ochiq turadi. O‘yinchi yoqtirgan turini ataylab qayta tanlay olsa ham mukofot cheksiz ko‘paymaydi.

Ixtiyoriy vazifa muddati tugasa, qaysi operatsiya yoki syujet hodisasi bunga sabab bo‘lishi avval ko‘rsatiladi. Yangi to‘siq paydo bo‘lishining kamida bitta oldingi belgisi bo‘ladi.

### 12.5 Vazifa kartasi namunasi

```text
VAZIFA: TARMOQ YURAGI
HUDUD: BLACK GRID — g‘arbiy turbina
MAQSAD: 2 ta quvvat blokini olib qaytish
MA’LUM XAVF: generator ishga tushsa signal tarqaladi
TOPILADIGAN ZAXIRA: 6 POWER, 2 TECH
QAYTISH: janubiy texnik yo‘l
ARKNING KEYINGI TALABI: POWER — 6 / 10
```

Kartadagi zaxira “omborga allaqachon tushgan mukofot” emas; maydonda topilishi kutiladigan resursdir.

---

<a id="b13"></a>

## 13. Uch akt va 12 syujet tugunining to‘liq ishchi ssenariysi

### 13.1 I akt — Tiklanish

| № | Vazifa | Joy | O‘rgatiladigan tizim va tanlov |
|---|---|---|---|
| 1 | Birinchi nur — FIRST LIGHT | Dust Lantern | Majburiy bitta quvvat blokini qaytarish; keyin qo‘shimcha blok yoki aholini qutqarish |
| 2 | Og‘ir metall — HEAVY METAL | Iron Tide | Og‘ir yuk; Rivet bilan materialni ulashish yoki olish |
| 3 | Moviy soat — BLUE HOUR | Blue Hour | Hozirgi bemorlar va kelajak tibbiy kapsulalari |
| 4 | Shahar ovozi — THE CITY SPEAKS | Black Grid | HAVEN himoyasi, shifoxona va qatnov zanjiridan ikkitasini tiklash |

Birinchi missiyada qutqaruvni tanlagan odam zarur elektrsiz qolmaydi: asosiy blok oldindan olinadi; dilemma ikkinchi, ixtiyoriy blok haqida. Odamlar inventar og‘irligi sifatida hisoblanmaydi; ularni kuzatish vaqt, qo‘l va marshrutni talab qiladi.

I akt Korpusning bazaviy holati va HAVEN tarmog‘i tiklanganda tugaydi. Ark reaktori bu shartga kirmaydi. Zarur resurs yetmasa, ikki majburiy bo‘lmagan tiklash amaliyoti ochiq qoladi.

### 13.2 II akt — Qurish

| № | Vazifa | Joy | Asosiy natija |
|---|---|---|---|
| 5 | Arvoh poyezd — GHOST TRAIN | Old Rail | Metro yo‘li va to‘da ko‘chishi orasidagi tanlov |
| 6 | Imtiyozli ro‘yxat — WHITE LIST | White Room | Eski yo‘lovchi mezoni va Sera siri |
| 7 | Ochiq bozor — OPEN MARKET | Crown Market | Uzoq savdo ittifoqi yoki hozirgi zaxira |
| 8 | Sovuq ishga tushirish — COLD START | Steppe Needle | Shovqinli dvigatel sinovi yoki uni keyinga qoldirish |
| 9 | Ro‘yxat — THE LIST | HAVEN | O‘rindiqlar va bortga chiqarish tartibini muhokama qilish |
| 10 | Qarz qaytadi — DEBT COMES HOME | Holatga mos tashqi hudud | Ittifoqchiga yordam, savdo sharti yoki hujum oqibati |
| 11 | Qora osmon — BLACK SKY | HAVEN | Reaktor sinovi va birinchi katta mudofaa |

5–8-tugunlar yo‘l va komponent shartlariga mos turli tartibda bajariladi. 9-tugun 6-tugun va yo‘lovchi sig‘imi ma’lum bo‘lgandan keyin ochiladi. 10-tugun oldingi munosabatni aks ettiradi. 11-tugun M05–M08 va M10 yakunlangach, M09 bort siyosati tasdiqlangach hamda Quvvat moduli o‘rnatilgach boshlanadi.

8-tugundagi sinalmagan dvigatel keyin bazada muqobil sinovdan o‘tkaziladi. Finalda yashirin tanga tashlab kema portlatilmaydi; tekshiruvdan o‘tmagan holat aniq ta’mir yoki boshqaruv asoratiga aylanadi.

### 13.3 III akt — Qochish

12-tugun — **Vault B**, Old Town. ECHO vakolati, ro‘yxat va oxirgi arxiv bo‘yicha asosiy tanlov qilinadi. Uchirish kaliti olinadi. Bu so‘nggi tashqi syujet missiyasi.

Shundan keyin oldingi olti modul, boshqaruv moduli, zarur arxiv va qayta tiklanish yo‘li tekshiriladi. Hamma majburiy ish tugamaguncha yakuniy signal yoqilmaydi.

**Oxirgi imkoniyat.** O‘yinchi uchirish signalini yoqishni ongli ravishda tanlaydi. Ekranda “2 ta tashqi tayyorgarlik operatsiyasi qoldi” deyiladi. Uch yo‘nalish bor: odamlar, kema, yerda qoladigan shahar. Odatda ikkitasini o‘yinchi bajaradi; kuchli ittifoq bo‘lsa uchinchisini ittifoqchi guruhi qisman bajarishi mumkin.

Bu haqiqiy soat bo‘yicha yashirin sanagich emas. Bazada qaror o‘qish muddatni yemaydi. Tayyorgarlik safari muvaffaqiyatsiz bo‘lsa ham qaytish bir imkoniyatni sarflaydi; buning natijasi safardan oldin ko‘rsatiladi. Shu paytda yangi majburiy resurs vazifasi ochilmaydi. Oldingi bosqichga qaytish uchun alohida saqlangan nusxa qoladi.

**Hech kim jim ketmaydi.** Yo‘laklar, darvozalar, tibbiy yordam va guruhlar himoya qilinadi. Bortga chiqish davom etadi. Yerda qolganlar o‘z boshpanalariga yo‘naltiriladi.

**Oxirgi yuklash.** Majburiy paket va tanlangan arxiv yuboriladi. O‘yinchi darhol uchish yoki kelayotgan guruh uchun ko‘rsatilgan qo‘shimcha xavfga chidashni tanlaydi. Natija oldingi tayyorgarlik va hozirgi o‘yin bilan belgilanadi.

12 syujet tugunidan 9 va 11 HAVENda o‘tadi; demak tashqi syujet safarlari 10 ta. Finalning bu bosqichlari 13–15 “yashirin syujet safari” deb qayta sanalmaydi.

### 13.4 Har bir tugunning bajariladigan ssenariysi

Quyida har tugunning boshlanish sharti, harakatlari, tanlovi, to‘rtta natijasi va ikki asosiy replikasi bor. Bu to‘liq ovoz yozish matni emas; qo‘shimcha qisqa replikalar hudud va natija holatidan tuziladi. Aktyor yozuvi faqat sinovdan o‘tgan yakuniy matndan olinadi.

### 13.5 M01 — Birinchi nur

**Kirish:** yangi kampaniya. Mara HAVEN generatori to‘xtaganini aytadi. **Bosqichlar:** jihoz olish → Dust Lantern A → Bdagi bitta E01 orqali shovqinni o‘rganish → Ddan majburiy releyni olish → Eda yordam signali → Gni ochish yoki A orqali qaytish → omborga topshirish → chiroq sahnasi. **Tanlov:** asosiy releydan keyin ikkinchi zaxira blok yoki 3 aholi/elektrchi yo‘li; vaqt va tashish cheklovi kartada ko‘rinadi. Birinchi safarda odamni qutqarish majburiy quvvatni bekor qilmaydi.

**To‘liq:** rele va qo‘shimcha tanlov natijasi. **Qisman:** rele olib kelindi, qo‘shimcha imkoniyat qoladi yoki keyingi aniq inqirozga aylanadi. **Chekinish:** saqlangan yuk bilan qaytish, rele vazifasi faol. **Mag‘lubiyat:** yordam yo‘li va rele tiklash joyi; boshlang‘ich anjom qayta beriladi. **Iz:** HAVEN chirog‘i va yangi odam yoki zaxira. **Radio:** Mara: “Avval bitta releyni qaytar. Yorug‘liksiz klinika ishlamaydi.” Aziz: “Ikkinchi blokni olsang, bu uy qorong‘i qoladi. Eshikni ochsang, biz sizga ishlaymiz.”

### 13.6 M02 — Og‘ir metall

**Kirish:** M01. **Bosqichlar:** portga kirish → Rivet postini topish → omborni ochish → po‘lat bog‘lamini olish → platforma yo‘lini tayyorlash → qaytish. B01 to‘liq kampaniyada ushbu yoyning yakunida; ilk port tashrifida bossni darhol majburlash shart emas. **Tanlov:** 3 METALni ittifoqqa qoldirib ishchi/ko‘prik yordami olish yoki hammasini olib, keyingi munosabatni yomonlashtirish. Kredit mavjud miqdordan olinadi; yo‘q 3 METALni va’da qilishning alohida qarz yozuvi kerak.

**To‘liq:** qism, po‘lat va kelishuv. **Qisman:** yengil yuk yetdi, og‘ir bog‘lam keyinga. **Chekinish:** muzokara saqlanadi, yopiq ombor holati o‘zgarmaydi. **Mag‘lubiyat:** cargo tiklash, yo‘l xavfi oshishi. **Iz:** korpus bo‘lagi va ko‘prik. **Radio:** Rivet: “Bu po‘lat devorimizga ham kerak.” Idris: “Ularga qoldirganing bugun kemani sekinlashtiradi. Ertaga ular yukni tezlashtirishi mumkin.”

### 13.7 M03 — Moviy soat

**Kirish:** M01 va Blue Hour yo‘li. **Bosqichlar:** tez yordamdan kislorod holatini olish → ikki palatani tekshirish → Noor ko‘rsatmasi bilan bir tizimni barqarorlashtirish → ICU yoki kapsula tanlovi → xavfsiz nuqtalar orqali qaytish. **Tanlov:** cheklangan sovitishni 4 bemorga yoki kema kapsulasini saqlashga yo‘naltirish. Ko‘chirish boshlanishidan oldin tanlov tushuntiriladi. Qo‘shimcha kelajak operatsiyasi boshqa natijani qisman tiklay oladi.

**To‘liq:** tanlangan maqsad va xavfsiz ko‘chirish. **Qisman:** guruhning bir qismi xavfsiz punktda qoladi; keyingi tashish kerak. **Chekinish:** tizimni vaqtincha barqarorlashtirib ketish, 2 safarlik aniq muddat. **Mag‘lubiyat:** hayotiy odamlar tasodifiy yo‘q qilinmaydi; tanlovdan kelgan belgilangan jarohat/yo‘qolish qoidasi ishlaydi. **Iz:** klinika yoki kapsula. **Radio:** Noor: “Ikkalasiga ham quvvat yetmaydi. Avval qaysini saqlashimizni ayt.” Lina: “Yo‘l ochilsa, bemorlarni men yuritaman. Siz oldimizni kuzating.”

### 13.8 M04 — Shahar ovozi

**Kirish:** M01–M03ning asosiy natijalari va tarmoq asbobi. **Bosqichlar:** kabel yo‘li → 2 ta qayta ulash nuqtasi → D kommutatori → uch zanjirdan ikki tanlov → 45 s bosqichli ishga tushirish → servis chiqishi. **Tanlov:** HAVEN devori, kasalxona, shahar qatnovidan ikkitasi. Yakuniy yoqishdan oldin xulosa oynasi. **Komponent:** standart konverter shu M04ning asosiy texnik sandig‘ida. **B02:** keyingi ixtiyoriy yaxshilangan konverter operatsiyasi; M04 va bazaviy Quvvat qurilishi unga bog‘lanmaydi.

**To‘liq:** ikkala tanlangan zanjir ishlaydi. **Qisman:** bittasi ishga tushdi, ikkinchisiga ta’mir vazifasi. **Chekinish:** yoqilmagan tanlov bekor, tiklangan kabellar qoladi. **Mag‘lubiyat:** yangi tiklash bosqichi, asosiy yo‘l saqlanadi. **Iz:** ikki hudud chiroqlari. **Radio:** Idris: “Uch chiqish bor. Quvvat ikkitasiga yetadi.” Mara: “Tanlovni yashirmaymiz. Kim chiroqsiz qolishini bilishlari kerak.”

### 13.9 M05 — Arvoh poyezd

**Kirish:** I akt tugagan. **Bosqichlar:** platforma → Pavel signalini topish → vagon yozuvlarini tekshirish → strelkani boshqarish → yo‘lni ochish yoki xavfli shoxobchani berkitish → kuzatish bilan qaytish. **Tanlov:** to‘liq qatnov yoki xavfsizroq qisqa yo‘l. **To‘liq:** dispetcher va tanlangan yo‘l. **Qisman:** yo‘l ochildi, odam guruhini tashish keyinga. **Chekinish:** oldingi metro holati qoladi. **Mag‘lubiyat:** vagon yuklari belgilangan tiklash nuqtasiga o‘tadi. **Iz:** xaritadagi qatnov va keyingi to‘da yo‘li. **Radio:** Pavel: “Poyezd bizni ham, ortimizdagilarni ham olib o‘tishi mumkin.” Mara: “Bekatni ochishdan oldin chiqishni ham tekshir.”

### 13.10 M06 — Imtiyozli ro‘yxat

**Kirish:** I akt va White Room servis ruxsati. **Bosqichlar:** laboratoriya → dron tizimi → Mei yoki zaxira terminali orqali arxiv → dalillar nusxasi → Sera bilan radio → qaysi payt oshkor qilish qarori → o‘zgargan eshiklar orqali chiqish. **Tanlov:** hozir ochiq tarqatish yoki bazadagi yig‘ilishgacha saqlash; ikkinchisi avtomatik doimiy yashirish emas. **To‘liq:** dalil va chiqish. **Qisman:** asosiy ro‘yxat, qo‘shimcha tadqiqot yo‘q. **Chekinish:** nusxa olinmagan bo‘lsa vazifa ochiq. **Mag‘lubiyat:** kritik dalil qayta tiklanadi, jismoniy tashuvchi joyi ma’lum. **Iz:** HAVEN ishonchi va Kestrel eshiklari. **Radio:** Sera: “Ro‘yxatni men tuzganman. Uning oqibatini o‘sha payt tushunmaganman.” Mara: “Endi kim bilishini sen yolg‘iz hal qilmaysan.”

### 13.11 M07 — Ochiq bozor

**Kirish:** I akt, Crown Market yo‘li. **Bosqichlar:** bozor aholisini eshitish → oziq ombori atrofidagi xavfni yechish → zaxira tanlovi → savdo nuqtasini yoki olib ketish platformasini tayyorlash → qaytish. **Tanlov:** zaxiradan darhol foydalanish yoki mahalliy ta’minotga qoldirib doimiy savdo ochish. **To‘liq:** savdo/olib chiqish qarori bajarildi. **Qisman:** yo‘l ochiq, tovar joyida. **Chekinish:** muzokara takror mumkin; o‘sha narxga cheksiz sovg‘a yo‘q. **Mag‘lubiyat:** zaxira raqibga o‘tishi va keyingi savdo/tiklash yo‘li. **Iz:** savdogar va bazadagi oziq burchagi. **Radio:** Savdogar: “Bir marta hammasini olasanmi yoki ertaga ham keladigan bozor qoldirasanmi?” Rivet: “Och qolgan odam devor qurmaydi.”

### 13.12 M08 — Sovuq ishga tushirish

**Kirish:** I akt tugagan, Korpus o‘rnatilgan, M02 port yo‘li orqali Steppe Needle kirishi ochiq; M05 qo‘shimcha marshrut berishi mumkin. **Bosqichlar:** hangar → Samir yoki texnik jurnal → sovitish ventili → B03/harakat sinovi → dvigatel blokini platformaga mahkamlash → chiqish. **Tanlov:** shu yerda to‘liq shovqinli sinov yoki bazada 2 TECH va qo‘shimcha sovitish ishi bilan sinash. Bu 2 TECH mavjud yordam xarajatiga kiradi. **To‘liq:** sinalgan blok. **Qisman:** blok qaytdi, “sinov kutilmoqda” holati. **Chekinish:** sovitilgan yo‘l keyingi safar saqlanadi, xavf qayta baholanadi. **Mag‘lubiyat:** blokni olishning tiklash yo‘li. **Iz:** dvigatel va tekshiruv yorlig‘i. **Radio:** Samir: “Hozir yoqsak, butun maydon eshitadi.” Idris: “Sinalmagan dvigatel bilan uchmaymiz. Sinovni qayerda qilishni tanlaymiz.”

### 13.13 M09 — Ro‘yxat

**Kirish:** M06, yo‘lovchi sig‘imi ma’lum, HAVEN xavfsiz holatda. **Bosqichlar:** klinika va boshpanadagi qisqa sahnalar → boshqaruv yig‘ilishi → to‘rtta bort siyosatidan biri → bir nomli istisno imkoniyati → o‘rin xulosasi. Tashqi safar hisoblagichi oshmaydi. **Tanlov:** mutaxassis, oila, qur’a, hissasiga/navbatga qarab. Siyosat aholini yashirincha o‘chirib yubormaydi. **Qisman:** qaror keyinga qoldiriladi. **Chekinish:** oynani yopish bilan kampaniya davom etadi. **Mag‘lubiyat:** jang yo‘q; yaroqsiz sig‘im tasdiqlanmaydi. **Iz:** yo‘lovchi doskasi va munosabat. **Radio:** Mara: “Bu yerda ism bor. Har ismning ortida kimdir kutyapti.” Noor: “Joy sanashdan oldin, kimni yo‘lga tayyorlashimizni ham sanang.”

### 13.14 M10 — Qarz qaytadi

**Kirish:** kamida ikkita II akt tashqi tugun va aniqlangan guruh holati. **Bosqichlar:** ittifoqchi bo‘lsa yordam chaqirig‘i, betarafda ayirboshlash, dushmanda qaytarib olish → tanlangan sektorda yo‘lni tekshirish → konvoy/odam/ombor maqsadi → biri qimmat, biri uzoq muddatli natija → qaytish. **To‘liq:** qarz va tanlangan yordam hal bo‘ladi. **Qisman:** odam chiqdi, yuk qoladi yoki aksincha. **Chekinish:** oqibat kartada, asosiy kema kaliti bu yerga qulflanmaydi. **Mag‘lubiyat:** munosabat pasayishi va bir tiklash taklifi. **Iz:** finaldagi yordam guruhi. **Radio:** Rivet: “Oldingi safarda qoldirgan po‘latingni unutmadik.” Dushman variantida: “Endi yo‘l narxini biz aytamiz.”

### 13.15 M11 — Qora osmon

**Kirish:** M05–M08 va M10 yakunlangan, Quvvat o‘rnatilgan, M09 siyosati tasdiqlangan; “sinovni boshlash” alohida tasdiqlanadi. **Bosqichlar:** bir mudofaa ustuvorligi → reaktor sinovi → uch yo‘nalishdan ikkitasi navbat bilan → tizim uzilishi → 30 s ta’mir va chekinish yo‘li → himoya natijasi. **Tanlov:** odamlar boshpanasi yoki ustaxona jihozini oldin himoyalash. **To‘liq:** ikkalasi tegishli tayyorgarlik bilan saqlanishi mumkin; majburiy sun’iy qurbon yo‘q. **Qisman:** ta’mirlanadigan devor yoki uskuna yo‘qotishi. **Chekinish:** xavfsiz ichki yo‘lakka; himoya davom etadi. **Mag‘lubiyat:** yirik zarar, tiklash vazifasi; reaktor kaliti yo‘qolmaydi. **Iz:** ko‘rinadigan iz va odamlarning reaksiyasi. **Radio:** Idris: “Quvvat bor. Endi ular ham bizni eshitdi.” Mara: “Bu uchirish emas. Hamma ichki yo‘lakka!”

### 13.16 M12 — Vault B

**Kirish:** M11 natijasi, White Room yoki Steppe Needle orqali ruxsat. **Bosqichlar:** eski arxiv → shaxsiy yozuvlar → B04 yoki vakolat yo‘li → majburiy uchirish kalitini nusxalash → ECHO/arxiv tanlovi → ma’lumotni olib qaytish. **Tanlov:** ECHO vakolatini cheklash/tuzatish/o‘chirish; dalillarni saqlash/uzatish. **To‘liq:** kalit va tanlangan arxiv. **Qisman:** kalit bor, ixtiyoriy paketning bir qismi qoladi. **Chekinish:** kalit olinmagan bo‘lsa qaytish mumkin. **Mag‘lubiyat:** kalit qayta olinadigan, yagona holatda qoladi; yakuniy sanagich boshlanmaydi. **Iz:** aloqa, signal va final paketlari. **Radio:** ECHO: “Evakuatsiya huquqi tasdiqlanmagan.” Mara: “Ularning tirikligi yetarli sabab.”

---

<a id="b14"></a>

## 14. Qo‘shimcha operatsiyalar, final va yakunlar

### 14.1 Oltita tayyor qo‘shimcha operatsiya

| ID | Joy/tur | Bosqich va dilemma | Natija |
|---|---|---|---|
| O01 | Dust Lantern / qutqaruv | 2 xavfsiz nuqta → tom yoki past yo‘l; vaqt/o‘q | Aziz yoki guruh, belgilangan yengil zaxira |
| O02 | Iron Tide / konvoy | Yo‘l tekshirish → platforma → 1 ta’mir; qisqa xavfli yoki uzun tinch yo‘l | METAL/FUEL, ko‘prik holati |
| O03 | Black Grid / B02 | Zanjirlar → qo‘riqchi → konverter; uchinchi zanjir ustuvorligi | POWER/TECH, keyingi elektr imkoniyati |
| O04 | White Room / jim kirish | Ruxsat → DATA nusxasi → signalni o‘chirish yoki tez chiqish | DATA/TECH va tadqiqot |
| O05 | Blue Hour / ta’minot | Dori va filtr → bemor signali → sig‘im tanlovi | LIFE va tibbiy zaxira |
| O06 | Old Rail / tiklash | Yo‘qotilgan yuk izi → strelka → olib qaytish | Oldingi yagona yuk, yangi mukofot nusxasi yo‘q |

Asosiy ta’riflardan keyin oltita asorat: blokirovka, qisqa elektr uzilishi, kelayotgan patrul, yordam signali, guruh talabi, ko‘chuvchi xavf. Ular faqat mos joy va shart bilan birikadi; 6 × 6 barcha kombinatsiya majburiy ishlab chiqilmaydi. O‘yinchi bu misollarning aynan oltitasini bajarishi shart emas.

### 14.2 Yakuniy tayyorgarlikning uch varianti

- P01 Odamlar: Old Raildagi guruhni xavfsiz punktga yetkazish; yordam ittifoqi bo‘lmasa operatorning bir safarini oladi.
- P02 Kema: Steppe Needle zaxira yoqilg‘i va sovitish; mavjud modullarning ishonchliligini oshiradi, yangi majburiy modul bermaydi.
- P03 Shahar: Black Grid–Crown Market yer boshpanasiga elektr va devor yordami; yerda qoladiganlar natijasini yaxshilaydi.

Signal yoqilgach odatda ikki operatsiya. Kuchli ittifoq uchinchisiga yordam beradi, ammo mukammal natija avtomatik emas. Bu safarlardagi iqtisod ushbu hujjatdagi so‘nggi 20 sof birlik doirasida. Qo‘shimcha qolgan sig‘im natijani oshirishi mumkin, majburiy kema retseptini esa qoplamaydi.

### 14.3 Finalning bajariladigan bosqichlari

F01 — ko‘rinadigan darvoza yo‘nalishi, 3–4 daqiqa. F02 — yo‘lovchi guruhlari 3 ta xavfsiz nuqta orqali, 4–6 daqiqa. F03 — majburiy arxiv tekshiruvi 60 s, 2 ta mahalliy panel xavfi. Har ixtiyoriy paket +30 s; to‘rtta paketning hammasi majburiy emas. F04 — kutilayotgan guruh uchun 60 s kechiktirish yoki uchirish; shartlar oldindan ko‘rinadi. F05 — uchirishning 3–5 daqiqalik faol himoyasi va qisqa yakun.

Ushbu vaqtlar sahna harakati va yurish bilan umumiy 20–35 daqiqaga moslanadi. Yakuniy zarar tasodifiy “muvaffaqiyat foizi” bilan olinmaydi; saqlangan holat va bosqichlarni bajarishdan keladi. Oldindan saqlangan finaldan oldingi nusxa orqali boshqa urinish mumkin.

### 14.4 Kampaniya natijalari

Natija bitta yaxshi/yomon ball bilan o‘lchanmaydi. Ark yaxlitligi, bortdagi odamlar, tibbiy holat, yer boshpanasi, guruhlar yordami, saqlangan bilim va personajlar taqdiri alohida hisoblanadi.

| Yakun nomi | Asosiy mazmun |
|---|---|
| Ikki ufq | Kema uchadi, yerda ham yashashga yaroqli hamjamiyat qoladi |
| To‘la osmon | Ko‘proq odam uchadi, ammo zaxiralar torroq va safar qiyinroq |
| Sovuq hisob | Texnik jihatdan yaxshi kema, lekin juda kam odam |
| Shahar bardosh berdi | Uchish amalga oshmaydi yoki undan voz kechiladi; yer hamjamiyati yashaydi |
| So‘nggi signal | Jismoniy evakuatsiya og‘ir muvaffaqiyatsizlikka uchraydi, arxivning bir qismi uzatiladi |
| Davom etayotgan safar | Kema uchgan, lekin yuqoridagi maxsus profillarga kirmagan natija |
| Yerda davom etgan hayot | Uchishdan voz kechilgan; maxsus shahar yoki signal profili bajarilmagan |
| Uzilgan yo‘l | Uchirish muvaffaqiyatsiz va boshqa maxsus profil bajarilmagan |

“To‘la osmon” belgilangan jismoniy o‘rindiq chegarasidan oshishni talab qilmaydi: tibbiy yoki zaxira jihatidan torroq sharoitda maksimal sig‘imga yaqin yuklanish yetarli.

Bir nechta natija bir vaqtda mos bo‘lishi mumkin. Yakun ekrani ularni o‘lchamlar bo‘yicha ko‘rsatadi: uchish, odamlar, shahar, bilim va personajlar. Sarlavha shu profilga mos tanlanadi; oxirgi bitta tugma butun kampaniya ishini o‘chirib yubormaydi.

Sarlavhaning aniq chegaralari va ustuvorligi 34.15-bandda berilgan. Bu sakkizta alohida kampaniya emas: bitta natija modelining sakkiz nomlanishi.

Finalning alohida muvaffaqiyatsizligi oddiy safardagi kabi yumshatilishi shart emas. Biroq qaytarib bo‘lmas bosqich oldindan belgilangan, saqlangan nusxa esa qayta urinish imkonini beradi.

---

<a id="b15"></a>

## 15. Yuk, buyum, tashish va topshirish

Har o‘yinchining yuk sig‘imi 10 og‘irlik birligi. Ikki kishida har kimning yuki va yo‘qotishi alohida; omborga topshirilgandan keyin resurslar umumiy bo‘ladi.

| Yuk | Og‘irlik | Qiymat/xususiyat |
|---|---:|---|
| Oddiy to‘plam | 1 | 1 resurs birligi |
| Zich quti | 2 | 3 resurs birligi; olish uzoqroq/shovqinliroq |
| Maxsus komponent | 3–5 | Modul sharti; og‘ir yoki ikki qo‘l talab qiladi |
| Ma’lumot tashuvchisi | 0–1 | Kam hajm; bir xil yozuv qayta mukofot bermaydi |
| Yaradorni ko‘tarish | Qo‘l band | Qurol, tezlik va xavfsiz yo‘lni cheklaydi |

Yuk og‘irligi va qurilish resursi turli birliklar. 10 og‘irlik sig‘imiga 12 resurs qiymati sig‘ishi mumkin: masalan, 4 zich quti = 8 og‘irlik va 12 resurs. Komponentli safarda sig‘im torayadi, boshqa safarda ko‘proq olib qaytish mumkin.

Yuk holatlari: 0–5 yengil; 6–8 o‘rtacha — chidamlilik sekinroq tiklanadi; 9–10 og‘ir — uzoq yugurish cheklanadi. Oddiy yurish keskin sekinlashmaydi. 5-bo‘limda boshlang‘ich yurish va chidamlilik qiymatlari berilgan; ular boshqaruv sinovidan keyin sozlanadi.

Ko‘chadagi belgilangan yashirish joyida yuk qoldirish mumkin. U ombor hisoblanmaydi va vazifani yakunlamaydi. Joyning saqlanish muddati, uni kim topishi mumkinligi va xavfi kartada ko‘rinadi. Orqaga qaytish, saqlash yoki hududni yuklash buyumni ko‘paytirmaydi.

Birgalikda o‘ynash ko‘tarishni yengillashtiradi. Kema narxi va asosiy komponent talabi o‘yinchi soniga ko‘paymaydi. Vazifa joyidagi iqtisodiy qiymat asosan o‘sha-o‘sha qoladi; dushman bosimi va qaytish xavfi oshadi. Ikki kishilik rejim tezroq taraqqiy etsa, balans mukofotlarning yashirin ko‘paytirilishi bilan tuzatilmaydi.

24 sig‘imli yordam platformasi faqat belgilangan yo‘llarda ishlaydi. Uni haydash fizikasi yo‘q: tortish/kuzatish, to‘xtatish va ta’mirlash mumkin. Boshlang‘ich namuna uchun zarur emas.

---

<a id="b16"></a>

## 16. Olti resurs, kema narxi va aktlar bo‘yicha iqtisod

### 16.1 Olti toifa

| Kod | Mazmun | Kamida ikki asosiy sarf |
|---|---|---|
| POWER | Elektr qismlari, energiya saqlash | Ark quvvati, baza/yo‘l elektri |
| METAL | Korpus va konstruksiya materiali | Kema, devor va platforma |
| FUEL | Yoqilg‘i va harakat tizimi | Dvigatel, generator/transport |
| LIFE | Tibbiyot, suv, havo, oziq tizimlari | Odamlarni tiklash, hayot ta’minoti |
| TECH | Elektronika va boshqaruv | Uskuna/asbob, kema va baza tizimlari |
| DATA | Tahlil qilingan bilim va kalibrlash natijasi | Navigatsiya, tadqiqot va boshqaruv |

POWER — devordagi qolgan tok foizi emas, saqlanadigan qurilish ta’minoti. LIFE ham har bir non yoki dori uchun alohida buyum yaratmaydi. DATA sarfi asl faylni o‘chirib tashlamaydi: u tahlil va joriy qilish quvvatini ifodalaydi; topilgan bilim arxivda qoladi. Nusxasi topilgan bir hujjat ikki marta DATA bermaydi.

### 16.2 Yetti modul xarajati

| Modul | POWER | METAL | FUEL | LIFE | TECH | DATA | Jami |
|---|---:|---:|---:|---:|---:|---:|---:|
| Korpus | 0 | 12 | 0 | 0 | 4 | 0 | 16 |
| Quvvat | 10 | 0 | 0 | 0 | 4 | 2 | 16 |
| Dvigatel | 0 | 8 | 8 | 0 | 3 | 0 | 19 |
| Hayot ta’minoti | 5 | 0 | 0 | 8 | 4 | 0 | 17 |
| Navigatsiya | 2 | 0 | 0 | 0 | 6 | 8 | 16 |
| Himoya | 6 | 10 | 0 | 0 | 4 | 0 | 20 |
| Uchirish boshqaruvi | 4 | 0 | 8 | 0 | 0 | 8 | 20 |
| **Jami** | **27** | **30** | **16** | **8** | **25** | **18** | **124** |

Maxsus komponent shu modulning kirish sharti. Yuqoridagi narxga yana yashirin resurs to‘lovi sifatida qo‘shilmaydi. Komponent jismonan olinib topshiriladi; narx bilan munosabati uning ta’rifida aniq yoziladi.

### 16.3 18 safarlik kampaniya hisobi

Bu hisob balans isboti emas, oldingi arifmetik nomuvofiqlikni bartaraf etuvchi sinov modeli.

| Hisob | POWER | METAL | FUEL | LIFE | TECH | DATA | Jami |
|---|---:|---:|---:|---:|---:|---:|---:|
| Jami olib kelingan qiymat | 40 | 44 | 30 | 32 | 46 | 24 | 216 |
| Safar, dori va uskunaga namunaviy sarf | 2 | 4 | 8 | 14 | 8 | 0 | 36 |
| Rivojlanishga qoladi | 38 | 40 | 22 | 18 | 38 | 24 | 180 |
| Kemaning yetti moduli | 27 | 30 | 16 | 8 | 25 | 18 | 124 |
| Tanlangan baza va odam yaxshilanishlari | 6 | 6 | 4 | 6 | 10 | 4 | 36 |
| **Xatolar va boshqa tanlovlar uchun qoldiq** | **5** | **4** | **2** | **4** | **3** | **2** | **20** |

18 safar uchun o‘rtacha yalpi qiymat 12, rivojlanishga qoladigan qiymat 10. Ayrim qutqaruv safarlarida kamroq resurs, yirik ta’minot safarlarida ko‘proq qiymat keladi. 36 birlik yordam xarajati barcha bazaviy imkoniyatlarni maksimal qilishga yetmaydi; tanlov saqlanadi.

Yakuniy ikki tayyorgarlik safari zarur kema qismlarini moliyalash uchun hisoblanmaydi. Ushbu namunada dastlabki 16 safardan keyin sof 160 birlik bo‘lishi rejalashtiriladi: POWER 34, METAL 36, FUEL 20, LIFE 16, TECH 34, DATA 20. Bu 124 birlik kemani va kamida 24 birlik tanlangan baza/odam yaxshilanishini qoplaydi; 12 birlik zaxira qoladi. So‘nggi ikki safardagi sof 20 birlik faqat final imkoniyatlari va qo‘shimcha tayyorgarlikka xizmat qiladi. Shu bilan uchirish signalidan keyin yetishmaydigan majburiy modul ortidan yugurish ziddiyati bartaraf etiladi.

Kampaniya davomida mavjud bo‘lishi mumkin bo‘lgan jami zaxira kutiladigan 216 birlikdan ko‘proq bo‘ladi. O‘yinchi yuk, xavf va tanlov sabab uning hammasini olmaydi. Har aktda keyingi majburiy bosqichgacha kerakli **har bir resurs turi** yetishi tekshiriladi. Kampaniya bo‘yicha umumiy summa yetishi erta bosqichdagi tanqislikni oqlamaydi.

### 16.4 Tiqilib qolmaslik qoidalari

- Kiritilgan asosiy komponent kam ehtimolli tasodifiy topilmaga bog‘lanmaydi.
- Majburiy missiyaning asosiy zaxirasi xaritadagi aniq obyektlarda bo‘ladi.
- Moddiy resurs HAVEN omboriga topshirilganda bir marta qo‘shiladi; vazifani belgilashning o‘zi material yaratmaydi.
- Ikki ketma-ket mag‘lubiyatdan keyin past daromadli yordam operatsiyasi ochiladi.
- Bepul minimal anjom bilan kam xavfli safarga chiqish imkoniyati qoladi; sarflanadigan hashamatli jihoz majburiy emas.
- Cheksiz passiv ta’minot yo‘q; qayta topiladigan zaxira vaqt/safar va hudud holatiga bog‘liq.
- Savdo bosimni yumshatadi; boshlang‘ich misol 3 oddiy resursga 1 kerakli resurs. DATA va syujet kalitlari bunday cheksiz almashmaydi.
- Qutqarilgan mutaxassis majburiy qurilish uchun yagona yo‘l bo‘lmaydi. Standart yo‘l bor; mutaxassis arzonlashtiradi yoki sifatni yaxshilaydi.

### 16.5 Aktlar bo‘yicha taqsimot

Ushbu hujjatdagi 216 yalpi, 180 sof resurs quyidagicha bo‘linadi. Jadval kutilgan yig‘ishning sinov yo‘li; yerga qo‘yiladigan jami potensial zaxira bundan ko‘proq. Har bir komponent kerakli bosqichdan oldin mavjud bo‘ladi.

| Bosqich va hisob | POWER | METAL | FUEL | LIFE | TECH | DATA | Jami |
|---|---:|---:|---:|---:|---:|---:|---:|
| I akt yalpi | 8 | 18 | 4 | 8 | 14 | 2 | 54 |
| I akt sarfi | 0 | 1 | 2 | 3 | 2 | 0 | 8 |
| I akt sof | 8 | 17 | 2 | 5 | 12 | 2 | 46 |
| II akt yalpi | 22 | 22 | 20 | 15 | 25 | 12 | 116 |
| II akt sarfi | 2 | 3 | 4 | 7 | 6 | 0 | 22 |
| II akt sof | 20 | 19 | 16 | 8 | 19 | 12 | 94 |
| Vault va signalgacha yalpi | 6 | 0 | 2 | 5 | 3 | 6 | 22 |
| Vault va signalgacha sarfi | 0 | 0 | 0 | 2 | 0 | 0 | 2 |
| Vault va signalgacha sof | 6 | 0 | 2 | 3 | 3 | 6 | 20 |
| Final tayyorgarlik yalpi | 4 | 4 | 4 | 4 | 4 | 4 | 24 |
| Final tayyorgarlik sarfi | 0 | 0 | 2 | 2 | 0 | 0 | 4 |
| Final tayyorgarlik sof | 4 | 4 | 2 | 2 | 4 | 4 | 20 |

I aktda Korpus uchun 12 METAL + 4 TECH, HAVEN tarmog‘i uchun 2 POWER + 2 TECH sarfini qoplash mumkin. Bu tarmoq sarfi bazaviy/ixtiyoriy yordamning 36 birlik rejasiga kiradi, tashqaridan yana qo‘shilmaydi. II akt oxirigacha jamlangan sof POWER 28, METAL 36, FUEL 18, LIFE 13, TECH 31, DATA 14; oldingi olti modul narxi jami 104: POWER 23, METAL 30, FUEL 8, LIFE 8, TECH 25, DATA 10. Qolgan qiymat baza/jihozga imkon beradi. Uchirish boshqaruvining oxirgi kaliti va qo‘shimcha DATA Vaultdan keladi.

Bu yo‘lning aniq bazaviy sarf misoli: jami 24 birlikdan POWER 4, METAL 4, FUEL 2, LIFE 4, TECH 8, DATA 2. Tarkib: HAVEN boshlang‘ich tarmog‘i (2 POWER, 2 TECH), H01 (2 METAL, 1 TECH), H03 (3 LIFE, 2 TECH), H04 (1 POWER, 2 TECH, 1 DATA), va safar sharoitiga qarab bir martalik baza ta’miri/tayyorlov (1 POWER, 2 METAL, 2 FUEL, 1 LIFE, 1 TECH, 1 DATA). Bu misol qolgan xarid yo‘llarini majburlamaydi; boshqa sarfda ta’minot operatsiyasi kerak bo‘lishi mumkin.

Modulga zarur materialni sarflashdan oldin UI “Bu xarid keyingi modulni kechiktiradi” deb ko‘rsatadi. O‘yinchi baribir tanlasa, muqobil ta’minot yo‘li ochiq qoladi. Bitta umumiy summa bilan iqtisod to‘g‘ri deb e’lon qilinmaydi: har shox va murakkablik alohida sinaladi.

---

<a id="b17"></a>

## 17. Odamlarni qutqarish, davolash va joylashtirish

Odam ikki ko‘rinishda hisoblanadi: hikoyasi va xususiy roli bor mutaxassis, hamda 2–6 kishilik oddiy guruh. Katta evakuatsiya sahnasida guruh yirikroq bo‘lishi mumkin, lekin har bir fuqaro uchun murakkab sun’iy hayot simulyatsiyasi yo‘q.

Holatlar: topilmagan → topilgan → barqarorlashtirilgan → xavfsiz punktda → HAVENga yetgan → ishlayotgan/davolanayotgan → bortga chiqqan yoki yerda qolgan. Yo‘qolgan va halok bo‘lgan holatlar alohida saqlanadi.

“Qutqarildi” faqat odam HAVENga yoki aniq xavfsiz doimiy boshpanaga yetganda hisoblanadi. Bitta eshikni ochish bilan hamma avtomatik omon qolmaydi.

Kuzatish paytida odamlar belgilangan xavfsiz nuqtalar orasida yuradi. O‘yinchi “kuting” va “ergashing” deydi. Ular mayda to‘siqlarga tiqilmasligi, ko‘rinib turgan olovga yurmasligi va qo‘rqib ketganida nima sabab bo‘lganini bildirishlari kerak.

Boshlang‘ich aholi maqsadi: HAVENda o‘yinchi avatarlarini ham qo‘shganda 12 kishi. Kampaniyada jami qo‘shimcha taxminan 24–36 kishini topish mumkin. Bu aniq o‘rindiq bosimini sinash uchun diapazon; sahnadagi NPC soni barcha aholi soniga teng bo‘lishi shart emas.

Beshta qutqariladigan mutaxassisning boshlang‘ich vazifalari:

| Mutaxassis | Topiladigan joy | Amaliy foyda |
|---|---|---|
| Elektr ustasi Aziz | Dust Lantern | Uchinchi tarmoq zanjirini ochish yo‘lini arzonlashtiradi |
| Hamshira Lina | Blue Hour | Bir operatsiyada ko‘proq bemorni davolaydi |
| Dispetcher Pavel | Old Rail | Metro xavfi va poyezd qatnovini oldindan ko‘rsatadi |
| Tahlilchi Mei | White Room | Arxiv paketlarini tekshirish va kalibrlashga yordam beradi |
| Mexanik Samir | Steppe Needle | Dvigatel sinovi va ta’mirning muqobil usulini ochadi |

Ismlar ishchi variant. Mutaxassis yo‘qolsa vazifani boshqa, qimmatroq yoki uzunroq yo‘l bilan bajarish mumkin. O‘lim xavfi katta, oldindan ko‘rsatilgan qarorga bog‘liq; oddiy tasodifiy hodisa syujet yo‘lini uzmaydi.

---

<a id="b18"></a>

## 18. HAVEN, yangilanishlar va taraqqiyot

Asosiy xizmatlar orasida yurish 45 soniyadan kam bo‘lishi kerak. Tayyorlash, topshirish va qurish qulay joylashadi; bazaga har safar kelish uzoq ro‘yxat tekshirishga aylanmaydi.

| Joy | Vazifa | Ko‘rinadigan rivojlanish |
|---|---|---|
| Boshqaruv markazi | Vazifa, xarita, razvedka | Ishlaydigan monitor va radio |
| Ombor | Yukni hisoblash va topshirish | Qutilar, aravalar, ishchilar |
| Ustaxona | Jihoz, ta’mir, modul tayyorlash | Faollashgan dastgohlar |
| Laboratoriya | Tadqiqot va Kestrel ma’lumoti | Terminallar, namunalar |
| Klinika | Jarohat, guruh davosi | Yotoq, tibbiy uskuna, sog‘aygan odam |
| Boshpana | Aholi sig‘imi va ruhiy holat | Band yotoqlar, umumiy xonalar |
| Qurolxona | Jihoz va mudofaa | Javon va to‘siqlar |
| Aloqa xonasi | Chaqiriq, ittifoq va hikoya | Antenna va toza signal |
| Kemasozlik maydoni | Ark yig‘ilishi va uchirish | Yetti modulning ko‘rinadigan qismlari |

To‘rtta holat: elektr — o‘chiq/cheklangan/barqaror; himoya — yorilgan/ushlab turibdi/mustahkam; tibbiyot — to‘lib ketgan/ishlayapti/tayyor; ruhiy holat — tarqoq/barqaror/birlashgan.

Bu holatlar xizmatlar, suhbat, muhit va finalga ta’sir qiladi. Odamlarga ovqat yoki dori yetmay qolishi birdan butun bazani o‘ldirmaydi: avval xizmat pasayadi, ogohlantirish va yordam imkoniyati chiqadi.

Guruh tayinlash safardan oldin amalga oshadi. Bir odam bir vaqtning o‘zida ikki joyda ishlamaydi. Boshqa ishga o‘tkazish mumkin. Qurilish va davolashga haqiqiy soat bo‘yicha uzoq kutish kiritilmaydi: belgilangan operatsiya yakuni yoki qisqa bazaviy sahna hisoblanadi.

Bazaga hujum syujet bosqichi yoki tushunarli oqibatdir. Har safardan so‘ng tasodifiy hujum yo‘q. Ogohlantirish → bitta tayyorgarlik ustuvorligi → o‘ynaladigan himoya → tuzatiladigan zarar ketma-ketligi ishlaydi.

### 18.1 Sakkiz asosiy yangilanish

| ID | Yangilanish | Narx | Amaliy foyda |
|---|---|---|---|
| H01 | Ombor saralashi | 2 METAL, 1 TECH | Tez topshirish va keyingi ehtiyojni belgilash |
| H02 | Sharqiy darvoza | 3 METAL, 2 POWER | Finaldagi bir yo‘nalish ushlanishi |
| H03 | Klinikadagi qo‘shimcha joy | 3 LIFE, 2 TECH | Bir operatsiyada 2 guruhni barqarorlashtirish |
| H04 | Radio releysi | 2 TECH, 1 POWER, 1 DATA | Bir safarda oldindan bitta ma’lum asorat |
| H05 | Ustaxona asbobi | 2 METAL, 2 TECH | Birinchi qurol modifikatsiyasi va ta’mir yo‘li |
| H06 | Boshpana qanoti | 3 LIFE, 2 METAL | HAVENda xavfsiz joy +8; Ark o‘rni o‘zgarmaydi |
| H07 | Yer boshpanasi aloqa tuguni | 2 POWER, 2 DATA, 1 TECH | Finaldagi shahar rejasiga kirish |
| H08 | Zaxira generator | 2 FUEL, 2 POWER, 1 TECH | Bitta bazaviy uzilish oqibatini yumshatish |

Bularning hammasini bir kampaniyada sotib olish talab qilinmaydi. Ushbu hujjatdagi 36 birlik — tanlangan yaxshilanishlar va yordamga oid namunaviy sarf; yuqoridagi jami assortiment narxi bilan teng bo‘lishi shart emas. Qurol modifikatsiyasi va muqobil sinov ham shu ixtiyoriy xarajatlar bilan raqobat qiladi.

### 18.2 Operator va kampaniya rivojlanishi

Ark kampaniyani, HAVEN xizmatlarni, operator jihozlari esa harakat usullarini rivojlantiradi. Operator yaxshilanishi ko‘proq zarar raqamidan ko‘ra “jim buzib kirish yoki tez ochish”, “dron kuzatuvi yoki chalg‘itgich”, “davolash yoki qisqa tezlanish” kabi tanlov beradi.

Jihoz bazada almashtiriladi. Dastlabki tanlov o‘yinchini butun kampaniya davomida noto‘g‘ri rolga qamamaydi.

Qayta o‘ynash uchun asosiy xarita va syujet nuqtalari muallif tomonidan belgilanadi. Tasodifiylik faqat tasdiqlangan bir nechta yo‘l to‘siqlari, kesh joylari, ikkilamchi guruhlar va asorat kombinatsiyalarini tanlaydi. Kritik yo‘l har variantda tekshiriladi.

Haqiqiy farq sektor tartibi, ittifoq, kema sozlamasi, qutqarilganlar va yerga qoldirilgan imkoniyatlardan keladi. Yangi o‘yin+ keyingi bosqichga qoldiriladi.

### 18.3 Safar natijasi

Uch satr: “Nimani olib kelding?”, “Kimga yordam berding?”, “Nima o‘zgardi?”. Bir keyingi maqsad: “Korpus uchun yana 3 METAL kerak”. Statistika yordamchi, odam va dunyo natijasi birinchi.

Asosiy to‘rtta xotira: qutqarilgan ism, ochilgan yo‘l, modulgacha yetgan qism, yo‘qotilgan yoki yerda qolgan odam. Bir kampaniyada 20–30 katta xotira yetadi; yuzlab bir xil bildirishnoma yo‘q. Rasm olish ixtiyoriy, hech qayerga avtomatik yuborilmaydi.

### 18.4 Qayta tashrif sababi

Har sektor uchun uch qaytish holati: yo‘l ochilgandan keyin boshqa kirish; mutaxassis yordami bilan avval yopiq uskuna; to‘da moslashuvi yoki guruh munosabatiga mos yangi vazifa. Oddiy sandiqning har safar to‘lishi asosiy sabab bo‘lmaydi.

---

<a id="b19"></a>

## 19. Ark modullari, bog‘liqliklar va yo‘lovchi sig‘imi

Har modul tashqi ko‘rinish, amaliy imkoniyat va yakuniy natijaga ta’sir qiladi. O‘rnatish shartlari to‘liq bo‘lmasa, aniq yetishmayotgan qism ko‘rsatiladi.

| Modul | Oldingi shart | Hozirgi foyda | Finaldagi foyda |
|---|---|---|---|
| Korpus | Boshlang‘ich karkas, port chizmasi | Ish maydoni va yuk jihozlari | Korpus yaxlitligi |
| Quvvat | Korpus, konverter | Qo‘shimcha baza yordam tizimi | Uchirish zaxirasi |
| Dvigatel | Korpus, g‘altak va tyaga yig‘masi | Platforma/transport ustaxonasi imkoniyati | Chiqish quvvati |
| Hayot ta’minoti | Korpus, Quvvat, kislorod tizimi | Davolash va yo‘lovchi sig‘imi | Odamlarning safardagi holati |
| Navigatsiya | Quvvat, navigatsiya yadrosi | Aniqlashtirilgan razvedka | Orbital boshpanaga xavfsiz yo‘l |
| Himoya | Korpus, Quvvat | Baza va maydon yordam vositasi | Uchirish paytida zarar kamayishi |
| Uchirish boshqaruvi | Oldingi olti modul, Vault B kaliti | Yakuniy tayyorgarlik bosqichi | Uchirish va oxirgi yuklash |

Bu bog‘lanishlar aylana hosil qilmaydi. Quvvat uchun reaktorni oldin yoqish talab qilinmaydi: o‘rnatish, sovuq sinov va to‘liq ishga tushirish alohida holat.

I aktda HAVENning tashqi elektr tarmog‘i tiklanadi. Bu Ark reaktori qurildi degani emas. “Qora osmon”da reaktorning birinchi katta sinovi bo‘ladi; undan keyin xavf oshadi, lekin yakuniy qaytarib bo‘lmas sanagich hali boshlanmaydi.

Yakuniy qarorga qadar uchta sozlama tanlovi mavjud:

- Quvvat: barqaror zaxira yoki qisqa va kuchli uchirish quvvati.
- Hayot ta’minoti: ko‘proq o‘rin yoki kuchliroq tibbiy yordam.
- Himoya: ochiq qurolli mudofaa yoki signalni pasaytiradigan qarshi choralar.

Uchirish signaligacha sozlamani ko‘rsatilgan xarajat evaziga o‘zgartirish mumkin. Ularning murakkabligi asosiy namunadan keyin kiritiladi.

### 19.1 O‘rindiqlar va hayot ta’minoti

Boshlang‘ich qiymat: bazaviy tayyor kema 24 o‘rin va 2 tibbiy yotoq. Sig‘im yo‘li tanlansa 36 o‘rin va 2 tibbiy yotoq, tibbiy yo‘l tanlansa 24 o‘rin va 6 tibbiy yotoq. Yo‘lovchi soni jismoniy o‘rindiq va faol hayot ta’minoti imkoniyatining kichigidan oshmaydi.

Og‘ir jarohatli har bir odam yo‘lovchi o‘rni bilan birga tibbiy yotoq ham talab qiladi. Yotoq yetmasa, davolash, xavfsiz yer boshpanasi yoki ko‘rsatilgan xavfli joylashtirish tanlovi chiqadi; yashirin tasodifiy o‘lim yo‘q.

O‘yinchi avatarlarini ham bortga chiqqanlar soniga qo‘shish kerak. Ikki kishilik kampaniya boshlang‘ich 12 kishida ikkita operatorni hisoblaydi. Nomlari bor personajlar ham shu ro‘yxatdagi odamlar, qo‘shimcha yashirin yo‘lovchilar emas.

---

<a id="b20"></a>

## 20. Hikoya, bosh qahramonlar va guruhlar

Kestrel shahar tarmog‘i ECHO favqulodda vaziyatda yo‘laklarni ochish, kasallanishni kuzatish va zararlanganlarni ovoz hamda elektr tizimlari bilan boshqa yo‘lga burish uchun yaratilgan. Shahar qulagach, shikastlangan qoidalar hamon odamlar xatti-harakatidan o‘rganadi.

Kestrel kompaniyasi evakuatsiya huquqini oldindan tuzilgan ro‘yxat orqali bergan. HAVENdagi ko‘p odam ro‘yxatda yo‘q. Sera Venn bu tizimni yaratishda qatnashgan va yashirib kelgan. O‘yinchi kompaniyaning tanlash mezonini davom ettirishi, o‘zgartirishi yoki bekor qilishi mumkin.

Vault Bda uchirish kaliti, ECHO vakolati, tirik qolgan guruhlar signallari, tibbiy va texnik arxiv hamda kompaniya qarorlarining dalillari bor.

“Oxirgi yuklash” — uchirishdan oldin tekshirilgan yo‘lovchi ro‘yxati va arxivni kema tizimiga ko‘chirish. Oddiy fayl ko‘chirishni asossiz uzoq kutishga aylantirmaslik uchun jarayonning sababi yoziladi: zararlangan serverlardan paketlarni tiklash, tekshirish va uchirish tizimi bilan kalibrlash. Katta paket uzoqroq ochiq aloqa talab qiladi va to‘dani jalb etadi.

Majburiy paket: uchirish kaliti, yo‘l hisobi va joriy yo‘lovchi ro‘yxati. Ixtiyoriy paketlar: tibbiy bilim, texnik bilim, aholi xotirasi va Kestrel haqidagi dalillar. “Arxivni o‘chirish” tanlovi majburiy kalit/yo‘l nusxasini oldin ajratishni talab qiladi; aks holda o‘yinchi nimadan voz kechayotganini bilmasdan uchirishni buzib qo‘ymaydi.

Jang paytida radio qisqa bo‘ladi. Muhim maqsad faqat yashirin kundalikda qolmaydi. Uzoq suhbat bazada o‘tadi. Ro‘yxat va arxivning ahamiyati asosiy ochilishdan oldin kamida uch marta tabiiy tarzda eslatiladi.

### 20.1 Doimiy qahramonlar va munosabatlar

| Personaj | Vazifa | Ichki qarama-qarshilik | Natijaga ta’sir |
|---|---|---|---|
| Mara Ilyan | HAVEN koordinatori | Har yordam signaliga javob berishni xohlaydi | Bortga chiqishi yoki yerda qolib boshqarishi |
| Sera Venn | Kestrel olimi | Eski ro‘yxatdagi aybini yashiradi | Ishonch, haqiqat, arxiv yo‘li |
| Idris Vale | Bosh muhandis | Kemaga ketgan material shaharda yetishmaydi | Qurilish va yer boshpanasi |
| Noor Qadir | Bosh shifokor | Bugungi bemor va kelajak safar bir uskuna uchun raqobat qiladi | Davolash va bortdagi holat |
| Tomas “Rivet” Bek | Port ittifoqi rahbari | Yerni tashlab ketishga qarshi | Savdo, yo‘llar, konvoy, final yordam |
| ECHO | Shahar sun’iy tizimi | Eski buyruq va tirik odamlar ehtiyoji to‘qnashadi | Shahar nazorati, ma’lumot, uchirish |

Birinchi to‘rt personaj HAVENda; Rivet o‘z hududida bo‘lib, kelishuvdan keyin vakil yuboradi yoki bazaga keladi; ECHO terminal/radio orqali namoyon bo‘ladi.

Uch siyosiy tomon:

- HAVEN kengashi — odamlarni qutqarish va ochiq qaror.
- Rivet ittifoqi — yerda mustahkam kelajak.
- Kestrel Continuity — texnik ishonchlilik va eski evakuatsiya tartibi.

Munosabat: dushman → shubhali → hamkor → ittifoqchi. Holat o‘zgarishi savdogar, qo‘riqchi, ochilgan yo‘l yoki haqiqiy yordam bilan ko‘rinadi. Zararlanganlar to‘dasi siyosiy guruh hisoblanmaydi.

---

<a id="b21"></a>

## 21. Tanlov, mag‘lubiyat va kampaniyani davom ettirish

Katta qarorda ikkala tomonning qiymati, yaqin oqibati va keyin qaytarish mumkinligi ko‘rsatiladi. Tanlov imkon qadar harakat bilan amalga oshadi: tokni ulash, konteynerni yuklash, eshikni ochish yoki kalitni topshirish.

Misol: “Shifoxonaga quvvat berish — bemorlar barqarorlashadi; HAVEN sharqiy devori keyingi tarmoq amaliyotigacha quvvatsiz qoladi”.

Tashqi sektorning holati kam sonli qiymat bilan ifodalanadi: elektr, xavf, nazorat, yo‘l, alohida aholi guruhlari va asosiy obyekt. Butun sektorga bitta “hamma qutqarildi” belgisi qo‘yilmaydi; har guruhning taqdiri alohida.

Mag‘lubiyat olib yurilgan yuk, vaqt, vaqtinchalik jarohat, yo‘l xavfi yoki guruh qarziga ta’sir qiladi. Kampaniyani bir marta yiqilish bilan o‘chiradigan tizim yo‘q.

Jangda yiqilish: hamkor 60 soniyalik oynada 4 soniyalik amal va bitta tibbiy to‘plam bilan 40 sog‘liqqa tiklaydi; bir operatorga safar davomida eng ko‘pi ikki marta. Yakka safarda bitta favqulodda injektor yordam beradi. Barcha operatorlar yordam imkonisiz yiqilsa, muvaffaqiyatsiz safar yechimi ishlaydi. Aniq uzilish va qiyinchilik qoidalari 6 va 34-bo‘limlarda.

Yo‘qotilgan yuk keyingi bir tashqi operatsiya davomida tiklash joyida turadi. Keyin oddiy zaxira yo‘qolishi yoki guruh qo‘liga o‘tishi mumkin. Majburiy komponentning muddati tugashi uni kampaniyadan butunlay yo‘q qilmaydi: muqobil tiklash yoki savdo yo‘li ochiladi. Har buyum yagona identifikator bilan ko‘chadi, nusxalanmaydi.

---

<a id="b22"></a>

## 22. Ekranlar, xato yozuvlari va qulaylik

Doimo o‘qiladigan ma’lumot: vazifa, joriy joy, yuk, safar xavfi va uning oxirgi o‘sish sababi, qaytish yo‘li. Keyingi Ark talabi xarita/yuk panelida; jang ekranini to‘ldirmaydi.

```text
TARMOQ YURAGI — quvvat bloklari: 1 / 2
BLACK GRID — G‘ARBIY TURBINA
YUK: 7 / 10 — O‘RTACHA
XAVF: OV ↑ generator signali
QAYTISH: JANUBIY YO‘L — XAVFLI
```

Xaritada ma’lum sektor holati, yo‘l, boshpana, vazifa va inqiroz ko‘rinadi. O‘rganilmagan xonadagi barcha buyum oshkor etilmaydi. Yo‘l tanlanganda faqat masofa emas, ma’lum xavf ham ko‘rsatiladi.

O‘rgatish ketma-ketligi: yurish/harakat → oddiy jang va ovoz → yuk → qaytish/topshirish → qutqaruv tanlovi → bosim → shahar oqibati → tadqiqot va to‘da moslashuvi. Bitta ilk safarda hammasi to‘liq ochilmaydi.

Talablar: tugmalarni almashtirish, kontroller, matn/subtitr kattaligi, rangdan tashqari belgi, yuqori kontrast, ekran silkinishi/chaqnashni kamaytirish, bosib turish yoki bir marta bosish, ko‘rish/nishonga olish yordami. Bir tugma faqat rang bilan ma’no bermaydi.

Uch boshlang‘ich qiyinchilik: Hikoya, Omon qolish, Og‘ir sinov. Qo‘shimcha sozlamalar jang zarari, resurs tanqisligi, bosim, jarohat va inqiroz muddatini alohida boshqaradi. Yordamchi sozlama kampaniya mazmunini yashirmaydi. Yakka o‘yinda pauza ishlaydi; tarmoqda menyu vaqtni to‘xtatmasligi aniq ko‘rsatiladi.

### 22.1 Asosiy ekranlar

| Ekran | Ko‘rinadigan amal | Bo‘sh/xato holati |
|---|---|---|
| Bosh menyu | Davom etish, yangi kampaniya, birga o‘ynash, sozlama, yordam, chiqish | Saqlanish bo‘lmasa “Davom etish” o‘rnida “Yangi kampaniya” |
| Yangi kampaniya | Nomi, qiyinchilik, yordam sozlamalari, o‘rgatish | Eski saqlanishni bosib ketish alohida tasdiq |
| Yuklash | Kampaniya, sana, akt, egasi | Zaxiradan tiklash yoki mos bo‘lmagan versiya xabari |
| Jihoz | Asosiy, yordam, uloqtirish, asbob, o‘q | Yetishmagan resurs va mavjud muqobil |
| Vazifa | Maqsad, ma’lum xavf, yo‘l, keyingi Ark ehtiyoji | Hozir ochiq vazifa bo‘lmasa tiklash/ta’minot |
| Yuk | Vazn, qiymat, topshirish, tashlash | Sig‘im yetmasa nimani qo‘yish kerakligi |
| Ark | 7 modul, shart, narx, foyda, ko‘rinish | Yopiq modul sababini aniq yozish |
| Aholi | Guruh, jarohat, vazifa, xavfsiz joy | Bir odamning ikki ishga tayinlanishi bloklanadi |
| Shahar | Ma’lum yo‘l, sektor, xavf, yordam | Noma’lum joyga taxminiy belgi, to‘liq xona xaritasi yo‘q |
| Jurnal | Vazifa, signal, o‘rganilgan dushman, qo‘llanma | Syujet sirini ochmaydigan yopiq yozuv |
| Qaytish natijasi | Yuk, odam, o‘zgarish, keyingi imkoniyat | Mag‘lubiyatda ayblovsiz tiklanish yo‘li |
| Final qarori | O‘rin, tibbiyot, arxiv, yer boshpanasi | Yaroqsiz tayyorgarlikda signal tugmasi sababi bilan yopiq |

### 22.2 Xato yozuvlarining tayyor matni

- “Yuk sig‘imi yetmaydi. Kerak: 3. Bo‘sh joy: 2.”
- “Bu qism hozir band. Sheriging uni ko‘taryapti.”
- “Modul o‘rnatilmadi. 2 POWER yetishmaydi.”
- “Saqlash tugamadi. Eski nusxa saqlandi. Diskdagi bo‘sh joyni tekshiring.”
- “Bu kampaniya yangiroq o‘yin versiyasida saqlangan. Uni ochish uchun o‘yinni yangilang.”
- “Aloqa uzildi. Qayta ulanish: 60 soniya.”
- “Xona to‘la. Ikki o‘yinchi allaqachon ulangan.”
- “Vazifa davom etmoqda. Keyingi xavfsiz nuqtada qo‘shilasiz.”
- “Bu qaror final tayyorgarligini boshlaydi. Keyin 2 ta tashqi operatsiya qoladi.”

### 22.3 Pauza va yordam

Yakka o‘yinda pauza, inventar, xarita va qo‘llanma ochilganda vaqt to‘xtaydi. Kooperativda bular vaqtni to‘xtatmaydi; panel ustida “Jamoaviy o‘yin davom etmoqda” yozuvi. Uzoq qo‘llanma uchun HAVEN tavsiya qilinadi. Dushman yonida yordam oynasi avtomatik ochilib boshqaruvni olib qo‘ymaydi.

---

<a id="b23"></a>

## 23. Grafika, animatsiya va ovoz ishlab chiqarish ro‘yxati

Boshlang‘ich vizual uslub — tepadan 3/4 ko‘rinishdagi piksel 2D. Haqiqiy masshtab, sprite o‘lchami va animatsiya xarajati 0-bosqichda sinov sahnasida tekshiriladi. Agar mavjud tayyor aktivlar boshqa uslubni asoslantirsa, o‘zgarish avval bitta sahnada tekshiriladi va qaror qayd etiladi. Uslublarni tasodifiy aralashtirish yo‘q.

HAVEN — iliq ishchi chiroqlar; Dust Lantern — deraza va sariq signallar; Iron Tide — kran va zangli ko‘k metall; White Room — oq geometriya va qizil blokirovka; Blue Hour — sovuq tibbiy yorug‘lik; Steppe Needle — ochiq osmon va alangali maydon; Black Grid — qorong‘i massa va elektr ko‘ki; Old Rail — yoylar va signal chiroqlari; Crown Market — mato, yozuv va tirik odam ranglari; Old Town — eski tosh va oltin arxiv belgilari.

Arkda olingan joyning izlari qoladi: port bo‘yoqli qoplama, shifoxona kapsulasi, elektr stansiyasi konverteri. O‘yinchi kemaning qayerdan yig‘ilganini taniydi.

Ovoz xavf kuchayganda qatlamlanadi. Har dushman turi, xavfsiz xona, muhim alarm va qaytish belgisi farqlanadi. Radio xavf hujumining ovozini bosmaydi. Sokin lahzalar ham rejalashtiriladi.

### 23.1 Uslub qarori

Taklif etilgan boshlang‘ich uslub: yuqoridan 3/4 ko‘rinishdagi 2D, 64 birlikli muhit katagi, 48–64 piksel atrofidagi aktor, toza siluet va yumshoq yorug‘lik. Standart — piksel uslubi; boshqa uslubga o‘tish 34-bo‘limdagi o‘zgarish tartibini talab qiladi.

### 23.2 Mazmun ro‘yxati

| Guruh | Kichik namuna | To‘liq v1 maqsadi | Tayyorlik talabi |
|---|---|---|---|
| Operator | 1 asosiy model, 2 rang | 1 modelga 4 rang va bir nechta jihoz qatlamlari | Har yo‘nalishda dushmandan farq qiladi |
| Oddiy dushman | 3 sinf | 8 sinf | Siluet, zarba belgisi, o‘lim va ovoz |
| Qo‘riqchi | 1 soddalashtirilgan uchrashuv | 4 to‘liq | Fazalar va zaif nuqta ko‘rinishi |
| Odamlar | 2 asosiy NPC, 1 qutqariladigan | 6 asosiy aloqa/personaj; 5 mutaxassis; guruh variantlari | Har birining baza joyi va portreti |
| Muhit to‘plami | HAVEN + turar joy + podstansiya parchalari | 10 sektor uchun 6 qayta ishlatiladigan material oilasi | Chegara, eshik va xavf ajraladi |
| Ark | 3 ko‘rinadigan holat | Boshlang‘ich karkas + 7 modul overlayi | Modul mustaqil yoqiladi; tartib erkinligiga mos |
| Qurol | 2 | 8 | Qo‘lda, yerda, inventarda tasvir |
| Asbob | 3 | 8 | Ikonka, qo‘llash effekti, zaryad belgisi |
| Interaktiv prop | 12 asosiy | Taxminan 48 qayta ishlatiladigan tur | Ochiq/yopiq/buzilgan holat |
| Oddiy bezak | 20 qayta ishlatiladigan | Taxminan 90 variant | Muhim yo‘l va nishonni yashirmaydi |
| UI ikonka | 24 | Taxminan 70 | 6 resurs, vazifa, holat, jihoz va xarita |
| Portret | 3 | 11 nomli inson/aloqa obrazi | Izchil uslub, matn bilan identifikatsiya |

Operator animatsiyalari: turish, yurish, yugurish, aniq nishon, otish, o‘qlash, qochish, itarish, harakat, katta yuk, zarba olish, yiqilish, tiriltirish va turish. 8 yo‘nalish kerakligi kamera bilan tekshiriladi; har yo‘nalishga alohida 14 to‘plamni tayyorlashdan oldin qatlam/aylantirish/mirroring sifati sinovdan o‘tadi.

Dushman: turish/patrul, tekshirish, yugurish, ogohlantirish, hujum, qoqilish, o‘lim; o‘ziga xos sinfga signal/ushlash/gaz. NPC: kutish, yurish, ish, jarohat, qo‘rquv va qisqa minnatdorchilik. Katta animatsiya ro‘yxati bosqichma-bosqich olinadi.

### 23.3 Ovoz ro‘yxati

8 qurolga otish/o‘qlash/bo‘sh magazin; 8 dushmanga aniqlash/ogohlantirish/zarba/o‘lim; 4 qo‘riqchiga faza va zaiflik; 10 sektor muhit qatlami; 6 asosiy sirt qadami; alarm, tok, eshik, yuk, klinika, ombor va Ark bosqichi. Har takrorlanuvchi o‘q/zarba uchun dastlab 3 variant. Musiqa: HAVEN tinch, maydon sokin, ov, qamal, qo‘riqchi, qurilish, final va yakun — 8 mavzu yoki qatlam to‘plami.

To‘liq ovozli aktyorlik birinchi namuna sharti emas. Matn va radio effektli vaqtinchalik ovoz bilan o‘ynash sifati tekshiriladi. Aktyor yozuviga faqat tasdiqlangan matn chiqadi. Subtitr, speaker nomi va muhim tovushning ko‘rinadigan ogohlantirishi ovoz yo‘qligida ham ishlaydi.

---

<a id="b24"></a>

## 24. Texnik arxitektura va mazmun ta’riflari

Bu bo‘lim Godotdagi loyiha uchun tavsiya. `.gd` kengaytmasi Godot 4 ekanini o‘zi isbotlamaydi. Avval engine va renderer versiyasi aniqlanadi; bu hujjat tayyor kodni almashtirish buyrug‘i emas.

Asosiy qoida: doimiy holat ma’lumotda; sahna shu holatni tasvirlaydi. Eshik rasmi almashtirilgani uning ochilgani haqidagi yagona dalil bo‘lmaydi.

```text
Ilova xizmatlari
  ContentDB — doimiy mazmun ta’riflari
  SaveService — saqlash va tiklash
  SettingsService — sozlamalar
  AudioService — ovoz
  NetworkBootstrap — tarmoqqa kirish

GameSession — joriy kampaniya
  RunState — ishonchli, saqlanadigan holat
  CityWorld — yuklangan dunyo
    WorldStreamer — qismlarni yuklash
    LoadedChunks — faol qismlar
    PersistentActors — o‘yinchilar va doimiy hamrohlar
  MissionService — vazifalar
  InventoryService — yuk va resurs
  EncounterDirector — to‘qnashuvlar
  ThreatDirector — bosim qoidalari
  HavenService — baza
  ArkService — kema
  CampaignService — syujet va inqiroz
  NetSession — tarmoq sessiyasi
  UI — ekran va boshqaruv
```

RunState bitta kampaniyaga tegishli. Yangi o‘yin eskisining odamlari yoki omborini meros qilib olmaydi. Kichik prototipda xizmatlar bitta soddaroq faylda bo‘lishi mumkin, lekin vazifa va holat egaligi ajralgan bo‘lishi kerak.

Muhim o‘zgarish so‘rov orqali o‘tadi: olish, topshirish, sarflash, maqsadni tugatish, sektor holatini o‘zgartirish, mutaxassis tayinlash, modul o‘rnatish. Xizmat shartni tekshiradi, holatni bir marta yangilaydi va natija hodisasini beradi. Ekran va tarmoq shu natijani oladi.

Eski quruvchilar faqat tekshiruvdan so‘ng moslashtiriladi. `city_world.gd` butun o‘yin mantiqini jamlamaydi. `sector_builder.gd` odatda tahrirlash/yig‘ish vositasi bo‘ladi; ish vaqtida deterministik qurish foydali bo‘lsa, profillangan holda qoldirish mumkin. Barcha builderni majburan qayta yozish shart emas.

Doimiy obyekt ID namunasi: `black_grid.west_turbine.generator_a`. Ekrandagi tartib raqami saqlash kaliti bo‘lmaydi. Tarmoqdagi vaqtinchalik raqamlar doimiy IDdan ajratiladi.

### 24.1 Ma’lumot orqali mazmun yaratish

Qurol, buyum, resurs, dushman, sektor, vazifa, maqsad, NPC, guruh, baza va Ark yangilanishi alohida ta’riflardan o‘qiladi. Mos Godot versiyasida resurs fayllari ishlatilishi mumkin; aniq format auditda tanlanadi.

Vazifa ta’rifi quyidagilarni saqlaydi:

| Maydon | Ma’nosi |
|---|---|
| `id`, `act`, `sector_id`, `sponsor_id` | Doimiy nom, akt, joy, buyurtmachi |
| `prerequisites` | Ochilish shartlari |
| `objective_phases` | Bosqich va maqsadlar |
| `pressure_profile`, `known_risks` | Xavf va oldindan ma’lum ma’lumot |
| `choice`, `choice_preview` | Tanlov va ko‘rsatiladigan oqibat |
| `complication_pool` | Ruxsat etilgan asoratlar |
| `success`, `partial`, `failure` | Uch natijadagi holat o‘zgarishi |
| `visible_changes`, `followups`, `finale_echo` | Hozirgi, keyingi va yakuniy iz |
| `co_op_rule` | Jamoaviy qaror tartibi |
| `completion_effect_id` | Bir martalik tugash natijasining kaliti |

Qayta bajariladigan vazifada har safarning o‘z `mission_instance_id` qiymati bo‘ladi. Aks holda bir xil ta’rif IDsi keyingi safarning mukofotini noto‘g‘ri bloklashi mumkin. Haqiqiy amallar uchun alohida `command_id` qo‘llanadi.

Mazmun tekshiruvchisi takroriy ID, yo‘q havola, yopiq talab aylanasini, devor ichidagi tug‘ilish nuqtasini, yetib bo‘lmaydigan maqsad va yaroqsiz resurs taqsimotini topadi. Hikoya sifati yoki qiziqarlilikni avtomatik test to‘liq isbotlay olmaydi; bular inson sinovida baholanadi.

---

<a id="b25"></a>

## 25. Shahar bo‘laklarini yuklash va yo‘l topish

Texnik bo‘lak uchun 1024 × 1024 o‘yin birligi dastlabki tajriba qiymati. Kamera, yugurish tezligi, rasm xotirasi va yo‘l topishga qarab o‘zgartiriladi.

Bo‘lak tarkibi: yer, bezak, statik obyekt, to‘qnashuv, yo‘l topish, dushman belgilari, vazifa nuqtalari, ovoz zonalari va doimiy obyektlar.

Uch holat:

- Faol — jang, to‘qnashuv, ko‘rinish va tezkor dushman qarorlari.
- Tayyor — oldindan o‘qilgan, zarur joyda juda past simulyatsiya.
- Uyqu — jonli sahna yo‘q; o‘zgarishlar RunStateda.

Kamera atrofidagi zaxira maydon va taxminiy harakat yo‘nalishi yuklanadi. Fayl resurslari fon ishida o‘qilishi mumkin; jonli sahna va fizikaga ulash asosiy oqimda kichik bo‘laklarda bajariladi. Boshlang‘ich ulash budjeti taxminan 2 ms/kadr. Bu alohida bepul vaqt emas, asosiy kadr budjetining ichida.

Yangi bo‘lak tayyor → uning doimiy o‘zgarishlari qo‘llanadi → to‘qnashuv va yo‘l bog‘lanadi → aktorlar faollashadi. Chiqarishda teskari tartib va holat tekshiruvi ishlaydi. Chegarada tebranishni kamaytirish uchun 2–3 soniyalik chiqarmaslik oralig‘i qo‘yiladi.

O‘yinchi va qutqarilayotgan hamroh bo‘lak bilan birga o‘chmaydi. Missiya davomida kerakli maxsus arena vaqtincha yuklangan holda ushlab turilishi mumkin. Bo‘lak chegarasida dushman yo‘li, o‘q va hamroh o‘tishi alohida tekshiriladi.

Bitta ulkan fon rasmi va butun shahardagi minglab obyektni bitta tartiblash guruhiga joylashdan qochiladi. Katta dunyo aniq profiling natijasiga qarab kichraytirilishi mumkin.

---

<a id="b26"></a>

## 26. Saqlash, tiklash va versiyalar

Saqlanadigan ma’lumot: format/mazmun versiyasi, kampaniya IDsi, dunyo urug‘i, operatsiya hisoblagichi, shahar bosimi, o‘yinchilar, yuk/ombor, baza, Ark, guruhlar, missiyalar, sektorlar, doimiy obyektlar, yakunlangan amallar va nazorat nuqtasi.

Har bir o‘q, chang zarrachasi yoki oddiy dushmanning vaqtinchalik animatsiyasi doimiy saqlanmaydi. Ammo olib ketilgan resurs yoki yaralangan muhim odamni shunchaki sahna qayta yuklangani uchun qaytarib bo‘lmaydi.

### 26.1 Bir-biriga mos tiklanish siyosati

O‘yin nazorat nuqtasida butun bog‘liq holatni oladi: dunyo, o‘yinchi, yuk, vazifa, vaqt va mukofot. Oddiy jangdan keyin chiqib ketilganda oxirgi bunday nuqtaga **hammasi birga** qaytadi. So‘nggi yukni saqlab, dushman va joyni eski holatga qaytarish taqiqlanadi.

Qaytarib bo‘lmas tanlov, omborga topshirish, missiya tugashi va modul o‘rnatish bir tranzaksiyada — bo‘linmas yozuvda — saqlanadi. Zarur hollarda bu hodisa o‘ziga mos yangi davom etish nuqtasini yaratadi. Tiklanish nuqtasi, topshiriq bosqichi va sarflangan buyumlar mos bo‘lishi shart.

O‘yin “Oxirgi saqlanish: ...” ni ko‘rsatadi. Boshlang‘ich maqsad normal safarda saqlash oralig‘i 3–5 daqiqadan ortmasligi; murakkab set-piece bundan uzun bo‘lsa bosqichlar orasida tekshiruv nuqtasi qo‘shiladi.

### 26.2 Fayl ishonchliligi

Avval vaqtinchalik nusxa yoziladi, tuzilishi va tekshiruv qiymati tasdiqlanadi, eski nusxa zaxiraga olinadi va yangi nusxa faollashadi. Platforma xususiyati auditda sinovdan o‘tadi. Disk to‘lsa eski yaroqli fayl qolishi va xato ko‘rinishi kerak.

Yangilanish uchun ketma-ket format migratsiyalari va qayta nomlangan IDlar xaritasi bo‘ladi. Hali chiqarilmagan uch eski versiyani qo‘llashga va’da yo‘q: amalda chiqarilgan va qo‘llab-quvvatlanadigan formatlar ro‘yxati yuritiladi. Tanilmagan kelajak formati ustiga yozilmaydi. Yo‘qolgan oddiy kontent kompensatsiya bilan tiklanishi mumkin; kritik syujet kaliti sukut bilan yo‘q qilinmaydi.

Takror yuborilgan `command_id` qayta mukofot bermaydi. Bir martalik missiya natijasi va aniq buyum IDsi ham tekshiriladi. Saqlash asosiy holatning uzilgan nusxasidan yoziladi; parallel yozuv paytida holat yarim yangilanib qolmaydi.

---

<a id="b27"></a>

## 27. Steam orqali hamkorlik va tarmoq qoidalari

Host — sessiyani yurituvchi asosiy kompyuter — dushman, zarba, buyum, inventar, xarajat, missiya, Ark, vaqt va tasodifiy natijaning ishonchli egasi. Boshqa o‘yinchilar kirish va amal so‘rovini yuboradi. Mahalliy yurish va ayrim effektni oldindan ko‘rsatish mumkin, lekin mukofotni mijozning o‘zi tasdiqlamaydi.

Dastlabki texnik maqsad: 60 Hz fizika, 30–60 Hz kirish xabarlari, 15–20 Hz holat yangilanishlari. Bular joriy Godot imkoniyatlari, trafik va haqiqiy tarmoq sinoviga qarab tanlanadi; tayyor natija deb olinmaydi.

Shaxsiy jihoz va olib yurilgan yuk alohida; depozit, Ark va kampaniya umumiy. Muhim buyum jamoaviy IDga ega. U ko‘tarilgan holda o‘yinchi uzilsa, buyum yo‘qolmaydi: vaqtinchalik tanada yoki belgilangan joydagi yukda qoladi.

Boshlang‘ich rejimda bitta faol topshiriq sektori va kirish/chiqish chegarasi ishlaydi. O‘yinchilar shu hududda bo‘linishi mumkin. Boshqa sektorga o‘tish yig‘ilish/ovoz berish bilan; hamma alohida butun shaharda ketishi birinchi ko‘lamga kirmaydi. Bu qoida shaharning uzluksiz dunyo ekanini o‘zgartirmaydi, jamoaning operatsiya doirasini belgilaydi.

Dushman xarajati o‘yinchi soniga qarab boshlang‘ich hisobda har qo‘shimcha o‘yinchi uchun taxminan 30–35% oshirilishi mumkin. Son, qanotdan kelish va rollar ustun; sog‘liqni ko‘r-ko‘rona ko‘paytirish emas. Barcha kritik amallar yolg‘iz ham bajariladi.

Doimiy katta qaror har kimga ko‘rsatiladi. Ovozlar teng bo‘lsa, taymerdan keyin host qarori qo‘llanishi oldindan yoziladi. Bir o‘yinchi menyuni yopib javob bermasa, kampaniya cheksiz turib qolmaydi. Shoshilinch jang qarorlari alohida sodda qoidaga ega.

Tarmoqqa qo‘shilish: versiya/mazmun tekshiruvi → holat nusxasi → kerakli obyektlar → keyingi o‘zgarishlar → xavfsiz joyga kirish. Qayta ulanish uchun standart muddat 60 soniya; uzilgan operator va uning yuki 34-bo‘lim qoidasi bilan boshqariladi. Host chiqsa, oxirgi tasdiqlangan saqlanish qoladi; avtomatik host almashish yo‘q.

Tekshiruv shartlari: 150 ms borib-qaytish kechikishi va 2% paket yo‘qolishida to‘liq namuna; 200 ms va 5% yo‘qolishda 60 daqiqalik barqarorlik. Maqsad kechikishning yo‘qolishi emas, holat buzilmasligi va kampaniya to‘xtab qolmasligi.

### 27.1 Chiqariladigan dastlabki maqsad

Yakka o‘yin + 2 kishilik onlayn hamkorlik. Ikki kishilik rejim endi foydalanuvchi so‘ragan mahsulot maqsadi sifatida rejalashtiriladi, ammo hali ishlaydigan imkoniyat deb e’lon qilinmaydi. To‘liq chiqarishda uni va’da qilish uchun namuna va tarmoq mezonlari bajarilishi kerak. 4 kishi keyingi alohida sinov; do‘kon matniga hozir qo‘shilmaydi.

### 27.2 Xona oqimi

Birga o‘ynash → xona yaratish → kampaniya tanlash → “Faqat do‘stlar” → taklif → sherikning versiyasi tekshiriladi → jihoz → ikkala o‘yinchi tayyor → HAVEN yoki xavfsiz kirish. Boshlanishida tasodifiy hamma kira oladigan ochiq qidiruv yo‘q. Bu xavfsizroq va o‘rgatish uchun sodda boshlang‘ich ko‘lam; ochiq xonalar keyingi mezonlarga bog‘liq.

Steam xonasi, taklif va o‘yin tarmog‘i alohida qatlamlar. Steam lobby o‘zi jang va inventarni sinxron qilmaydi; transport va host tasdiqlagan amallar alohida ulanadi. [Steamworks multiplayer](https://partner.steamgames.com/doc/features/multiplayer).

### 27.3 Kampaniya egaligi

Kampaniya hostga tegishli. Mehmon shu kampaniyada o‘z sloti va jihozini qayta topadi, lekin o‘z alohida kampaniyasiga material ko‘chirmaydi. Kosmetik profil/mahalliy yutuq ajratilishi mumkin, ammo hech bir kritik resurs mehmonning ketishi bilan yo‘qolmaydi. Mehmon oldindan “Taraqqiyot xona egasining kampaniyasida saqlanadi” yozuvini ko‘radi.

Host chiqishidan oldin navbatdagi xavfsiz saqlanish yoki oxirgi nuqta vaqti ko‘rsatiladi. Favqulodda uzilishda oxirgi tasdiqlangan holat qoladi. Mehmon uzilganda uning aktori vaqtincha himoyasiz yakkaxon farm qilmaydi: 60 s kutish, keyin yuk tanada/keshda va operator xavfsiz qayta kirish kutishida. Shu vaqt ichidagi umumiy jang simulyatsiyasi hostda davom etadi.

### 27.4 Aloqa va jamoaviy qulaylik

Tez belgilar: kel, xavf, buyum, kut, yordam. Matnli jamoa xabari klaviatura bilan; kontroller uchun tayyor iboralar. Mikrofon majburiy emas. O‘yin ichidagi ovozli chat va masofaviy ovoz keyingi ko‘lam, dastlab Steam yoki tashqi ovoz aloqasi bilan o‘ynash mumkin. Raqib mikrofondagi haqiqiy ovoz balandligini eshitmaydi; shovqin o‘yindagi amallardan keladi.

Host o‘yinchini faqat HAVENda oddiy tartibda chiqaradi; tarmoqni suiste’mol qilish holati uchun favqulodda uzish bor. Chiqarilgan mehmonning ko‘targan kritik buyumi host dunyosida qoladi. Ikki kishilik teng ovozda host qarorining ustunligi xonada avval ko‘rsatiladi.

---

<a id="b28"></a>

## 28. Ishlash tezligi va apparat mezonlari

Minimal kompyuter nomi, protsessor, video imkoniyati, xotira, disk, renderer va ekran o‘lchami 0-bosqichda yoziladi. Hozirgi qiymatlar 1080p, 60 FPS uchun boshlang‘ich sinov budjeti.

| Ko‘rsatkich | Maqsad |
|---|---|
| Kadrlarning 95 foizi | 16,7 ms yoki kam |
| Kadrlarning 99 foizi | 25 ms yoki kam |
| Oldindan yuklangan 10 daqiqalik yo‘lda | 50 ms dan katta qotish bo‘lmasligi |
| Asosiy oqim | 8 ms gacha; AI/fizika/ulash shu ichida |
| AI va fizika | 4 ms gacha, asosiy oqimdagi ulush |
| GPU | 12 ms gacha |
| RAM / grafik xotira | Taxminan 2 GB / 1,5 GB, apparatga mos qayta baholanadi |
| Holat nusxasini olish | 5 ms maqsad; 16,7 ms dan oshsa xavfsiz sahnada yoki bo‘lib bajarish |
| To‘liq fayl yozish | Fondagi ish uchun taxminan 1 soniya |
| Saqlangan nuqtadan yuklash | Maqsad 3 soniya, nomlangan diskda |
| Ikki soatlik bir xil yo‘l | Barqarorlashgandan keyin xotira o‘sishi 5% ichida |

CPU va GPU vaqtlari har doim oddiy qo‘shilmaydi; haqiqiy kadr vaqti alohida o‘lchanadi. Umumiy grafik xotirali kompyuterda RAM va VRAM chegaralari bir xil usulda talqin qilinmaydi.

Sinov paneli faol bo‘laklar, aktor, fizik obyekt, yo‘l navbati, kadr taqsimoti, xotira, tarmoq, holat reviziyasi va xavf xarajatini ko‘rsatadi. Oddiy o‘yinchiga bu texnik panel chiqarilmaydi.

---

<a id="b29"></a>

## 29. Ishlab chiqish bosqichlari va o‘tish shartlari

### 29.1 0-bosqich — Haqiqiy loyiha auditi

Kod va resurslar bo‘lsa inventar qilish; bo‘lmasa yangi loyiha ekanini belgilash. Engine, platforma, minimal kompyuter, kamera, input, kooperativ tarkib, rasm uslubi va test asboblari aniqlanadi. Doimiy IDlar, saqlash siyosati, missiya bog‘lanishlari va resursning aktlar bo‘yicha taqsimoti yoziladi.

Natija: asosiy texnik savollar uchun aniq qaror yoki tekshiriladigan tajriba rejasi. Jamoa va tayyor kod bo‘lmagani uchun hozirdan aniq hafta yoki pul narxi belgilanmaydi.

### 29.2 1-bosqich — Eng kichik o‘ynaladigan tajriba

Yurish, nishonga olish, uch dushman, bitta hovli, yukni olish va bazaga yetkazish. 5–10 daqiqalik o‘yin. Shu bilan birga sodda holat egasi, log va saqlash asosi yaratiladi. Katta kontent tizimini jangning o‘zi qiziqligi bilinmasdan mukammallashtirish shart emas.

O‘tish sharti: yurish va jang tushunarli; olib qaytish haqiqiy tanlov tug‘diradi.

### 29.3 2-bosqich — Texnik xavflarni sinash

Oddiy shakllar bilan butun dunyo ko‘lami, bo‘lak yuklash, chegaradagi yo‘l, doimiy obyekt, 30 dushman stressi, xavfsiz saqlash va 2 kishilik kooperativ sinaladi.

O‘tish sharti: nomlangan qurilmada asosiy budjet, yuklash va saqlash mosligi ishlaydi. Muammo hal bo‘lmasa shahar va tizim soddalashtiriladi.

### 29.4 3-bosqich — Asosiy tizimlarni jamlagan kichik namuna

HAVENning zarur xonalari, Dust Lanternning bir to‘liq yo‘li, Black Gridning bitta kichik podstansiya hududi. Uch resurs — POWER, METAL, TECH; uch vazifa turi — qaytarish, qutqarish, elektrni tiklash. Uch ko‘rinish — karkas, boshlang‘ich korpus qismi, chiroqlari yoqilgan maydon.

Bu uch ko‘rinish yetti moduldan uchtasi to‘liq qurildi degani emas. Namunadagi retseptlar alohida sinov ma’lumoti; ular tayyor kampaniya iqtisodi bilan aralashtirilmaydi.

Tarkib: uch oddiy dushman, bitta kuchli uchrashuv, ikki qurol turi, yuk, xavf, bitta to‘da javobi, bir guruh munosabati, bir qutqariladigan mutaxassis, mag‘lubiyat/tiklash va saqlash.

O‘tish sharti: 30–45 daqiqalik sikl ishlab chiquvchining maxsus tugmalarisiz yakunlanadi.

### 29.5 4-bosqich — Taqdim etiladigan sifatdagi namuna

Grafika, ovoz, ekran, onboarding va qisqa syujet yakuniy sifatga yaqinlashtiriladi. 2 kishilik kooperativ shu namunada ishlaydi. 45–60 daqiqalik tashqi o‘ynash sinovi.

O‘tish sharti: 30-bo‘limdagi tajriba va texnik mezonlar qoniqarli. Shundan keyin katta shahar mazmuniga o‘tiladi.

### 29.6 5-bosqich — Asosiy tizimlar to‘liq

Olti resurs, vazifa holatlari, baza, Ark, guruh, jarohat, tiklanish, bosim, arxiv, qulaylik va zarur tarmoq protokoli yakunlanadi.

O‘tish sharti: navbatdagi sektor asosan ma’lumot va sahna orqali qo‘shiladi, asosiy boshqaruv qayta yozilmaydi.

### 29.7 6-bosqich — Uch xil sektor

Tor turar joy, ochiq port va elektr hududi ishlab chiqiladi. Bir sektorni kerakli sifatga yetkazish qancha mehnat olishi o‘lchanadi.

O‘tish sharti: qolgan xarajat haqiqiy ishlab chiqarish tezligidan hisoblanadi; sektorlar o‘yin jihatidan farq qiladi.

### 29.8 7-bosqich — Shahar mazmuni

To‘qqiz tashqi sektor, HAVEN, yo‘llar, holatlar, qayta tashriflar, missiya joylari va muhim uchrashuvlar tugallanadi.

O‘tish sharti: kritik nuqtalarga yetish mumkin; resurs va shartlarda to‘siq yo‘q; kerakli yo‘l vaqtinchalik kodga bog‘lanmagan.

### 29.9 8-bosqich — To‘liq kampaniya

12 syujet tuguni, personajlar, final tayyorgarligi, himoya, bortga chiqish, oxirgi yuklash va yakunlar ulanadi.

O‘tish sharti: yangi saqlanishdan boshlab har asosiy yo‘l va rejalashtirilgan mag‘lubiyatdan tiklanish yakungacha o‘ynaladi.

### 29.10 9-bosqich — Balans va barqarorlik

Iqtisod, qiyinchilik, takrorlanish, migratsiya, uzoq yuklama, tarmoq, kontroller, matn va ekran o‘lchami tekshiriladi.

O‘tish sharti: kampaniyani to‘xtatuvchi, ma’lumot yo‘qotuvchi va resurs nusxalovchi xato yo‘q; qolgan xatolar ro‘yxati baholangan.

### 29.11 10-bosqich — Chiqariladigan nomzod

Toza kompyuterda o‘rnatish, ishga tushirish, eksport tarkibi, saqlash siyosati, xato jurnali va orqaga qaytish yig‘ilmasi tekshiriladi.

O‘tish sharti: o‘zgarmagan bitta yig‘ilma kelishilgan chiqarish tekshiruvlarini ikki marta o‘tadi.

Eski xarita menyusi mavjud bo‘lsa, yangi yo‘l to‘liq ishlamaguncha o‘chirib yuborilmaydi. Eski saqlanishni yangi shaharga ko‘chirish imkoni bo‘lmasa, foydalanuvchiga bu aniq ko‘rsatiladi va eski saqlanish zaxirada qoladi.

---

<a id="b30"></a>

## 30. Tayyorlik mezonlari va sinovlar

Imkoniyat tayyor: holat egasi, saqlanishi, xato va tiklanishi, zarur tarmoq vakolati, tushunarli ekran, mos boshqaruv, ishlash budjeti va muhim o‘tish tekshiruvi bor.

Tashqi sektor tayyor: noyob mexanika, ikki kirish, xavfsiz nuqta, qisqa yo‘l, muhim obyekt, uch kichik hikoya, ikki ko‘rinadigan oqibat, qayta tashrif va yo‘l/saqlash sinovi bor. HAVEN o‘z xizmat va himoya mezonlari bilan baholanadi.

Syujet missiyasi tayyor: sponsor, maqsad, xavf, ikki usul yoki yo‘l, kamida ikki harakat turi, oldindan ishorali asorat, tushunarli tanlov, o‘zgargan qaytish va keyingi aks bor. Muvaffaqiyat, qisman bajarish, ixtiyoriy chekinish va tiklanadigan mag‘lubiyat qoidasi yozilgan. Finalning qaytarib bo‘lmas sahnalari bundan alohida.

Personaj tayyor: amaliy foyda, shaxsiy qarama-qarshilik, ko‘rinadigan joy/aloqa shakli, muhim qaror, yo‘qolsa muqobil yo‘l va yakuniy natija bor.

### 30.1 Kichik namunaning tajriba sinovi

Kamida besh yangi odam bilan dastlabki sifat sinovi o‘tkaziladi. Bu statistik isbot emas, katta muammolarni erta topish usuli.

- Kamida to‘rt kishi yordamsiz vazifasi, yuki, qaytish yo‘li va xavf nega oshganini ayta oladi.
- Jim, tez va kuch bilan o‘ynashning kamida bittadan foyda va xarajatini tushunadi.
- Bir safarda kamida bitta haqiqiy yo‘l/yuk/odam/vaqt qarori bo‘ladi.
- Safar 15–25 daqiqa atrofida; bekor yurish 25% dan oshmaydi.
- 60 daqiqada ketma-ket vazifalar faqat boshqa buyum yig‘ishga o‘xshab qolmaydi.
- Qaytishlarning aksarida ko‘rinadigan natija bor.
- Ikki mag‘lubiyatdan keyin bir-ikki yordam/tiklash operatsiyasi bilan davom etish mumkin.
- O‘yinchi “nima uchun yutqazdim”ni tushuntira oladi; kutilmagan ko‘rinmas dushman sabab bo‘lmaydi.

Natija qoniqarsiz bo‘lsa, vazifa, harakat yoki ko‘lam o‘zgartiriladi. Buni ko‘proq sektor, qurol yoki matn qo‘shish bilan yopishga urinilmaydi.

### 30.2 Muhim hisoblar

Yuk chegarasi, resursning bir marta o‘tishi, modul narxi, talablar grafigi, tasodifiy natijaning qayta tiklanishi, missiya o‘tishlari va saqlash migratsiyasi tekshiriladi.

### 30.3 Birikma tekshiruvlari

O‘zgargan obyektni yukdan chiqarib qaytarish; sektor chegarasida vazifa; mag‘lubiyat va yo‘qotilgan yuk; Ark ko‘rinishini ma’lumotdan tiklash; ikki o‘yinchining bir buyumni olishi; xarajat vaqtida uzilish; qayta ulanish va kech qo‘shilish.

### 30.4 Uzoq tekshiruvlar

100 marta saqlash/yuklashda o‘yin mazmuni holati o‘zgarmasligi; vaqt tamg‘asi kabi xizmat metama’lumoti taqqoslashdan chiqariladi. Saqlashning har bosqichidagi majburiy uzilishda eski yoki yangi yaroqli nusxa qolishi tekshiriladi.

Ikki soatlik yurish, to‘rt soatlik tarmoq/saqlash kuzatuvi, stress arena va toza eksport sinovi bajariladi. 2 kishilik hamkorlik ushbu chiqarish ko‘lamida majburiy, shuning uchun tarmoq sinovi ham majburiy. Faqat dastlabki yakka ichki prototipda u vaqtincha “hali bajarilmagan” deb qayd qilinadi; chiqarishga qabul qilingan degani emas.

### 30.5 Tekshiruv holati jadvali

| Yo‘nalish | Talab | Hozirgi holat |
|---|---|---|
| Mazmun | Takroriy ID va yo‘q havola bo‘lmasligi | Hali tekshirilmagan |
| Shahar | 1 dunyo, 10 sektor, kritik yo‘llar ochilishi | Hali tekshirilmagan |
| Iqtisod | Har akt va har resurs bo‘yicha davom etish mumkinligi | Faqat namunaviy umumiy hisob tekshirildi |
| Saqlash | 100 sikl va uzilishlarda holat saqlanishi | Hali tekshirilmagan |
| Ark | 7 modul, aylanasiz talablar, to‘g‘ri narx | Reja darajasida ko‘rib chiqildi |
| Final | Barcha qo‘llab-quvvatlangan natijalar olinishi | Hali tekshirilmagan |
| Tarmoq | Nusxalanish va yo‘lni to‘sadigan farq bo‘lmasligi | Hali tekshirilmagan |
| Qiziqarlilik | Tashqi o‘ynash sinovi | Hali tekshirilmagan |

### 30.6 Qiziqarlilik gipotezalari

| Gipoteza | Tekshiruv | Muammo chiqsa |
|---|---|---|
| Yuk bilan qaytish hayajonli | Tester safardan keyin eng esda qolgan lahzani aytadi | Qaytish yo‘li, yuk cheklovi yoki xavf belgisi o‘zgaradi |
| Odamlar qadrli | Resursga qarshi odam tanlovini tushuntira oladi | Personaj foydasi va bazadagi aks kuchayadi |
| Kema keyingi safarga undaydi | Modul natijasidan keyin tester nimani qilishni biladi | Keyingi maqsad va ko‘rinish soddalashadi |
| Co-op haqiqatan foydali | Ikki tester o‘zlari rol bo‘lishadi | Jihoz va muhit hamkorligi ko‘payadi |
| Qo‘llanmasiz kirish tushunarli | 5 kishidan 4 tasi birinchi topshirishni yordamsiz bajaradi | Tugma, maqsad, yo‘l belgisi tuzatiladi |

“Trending bo‘lish” testdan o‘tish mezoni emas. Qiziqish, tushunish, texnik sifat va haqiqiy qayta o‘ynash sababini tekshiramiz. Saqlangan o‘yin vaqti o‘zi qoniqishni isbotlamaydi.

### 30.7 Tekshiriladigan chegaralar

O‘q damage jadvali oddiy E01/E02ga mos; qurol almashganda o‘q ikki marta sarflanmaydi. Katta yukda chiqishga sig‘ish, qutqarilgan odamning navbat nuqtalari, ochilgan eshikning qayta yuklanganda holati, final signalining muddat sharti, host ketganda yuk va doimiy qaror, Cloud nusxasini xato ustiga yozmaslik tekshiriladi.

Muhim ssenariylar: 0 o‘q/0 resurs bilan tiklanish; mutaxassis yo‘q; hamkor yo‘q; to‘la inventar; o‘chgan internet; to‘la disk; eski saqlanish; ikkita bir vaqtdagi pickup; finaldan oldingi 2 resurs kamligi. Har birida tushunarli davom etish yoki xabar bor.

---

<a id="b31"></a>

## 31. Asosiy xavflar va ularni kamaytirish

| Xavf | Ko‘rinadigan belgi | Chora |
|---|---|---|
| Shahar juda katta | Bo‘sh yo‘l ko‘p | Hududni qisqartirish, zichlik, ochilgan qatnov |
| Missiyalar bir xil | “Yana bir quti” hissi | Harakat turi, muhit va qaytish asoratini almashtirish |
| Doimiy fojia charchatadi | Har tanlovda kimdir o‘lishi shart | Taktik tanlov, sokin muvaffaqiyat va iliq baza voqealari |
| Iqtisod to‘xtaydi | Aniq turdagi resurs yo‘q | Akt bo‘yicha hisob, muqobil manba, yordam vazifasi |
| Hamkorlik iqtisodni buzadi | Ikki kishi resursni ikki marta oladi | Yagona buyum/amal IDsi, umumiy ombor |
| Yuk zerikarli sekinlik | O‘yinchi olib yurishni yoqtirmaydi | Oddiy yurishni saqlash, tez qo‘yish, yo‘l tanlovi |
| Saqlashdan foydalanib boyish | Yuk qolib dunyo qaytadi | To‘liq mos nazorat nuqtasi va atomar amallar |
| Final erta qulflanadi | Kerakli qism yo‘q, vaqt tugaydi | Signal oldidan barcha majburiy shartlarni tekshirish |
| To‘da adolatsiz | Qarshi chora noma’lum | Razvedka, ogohlantirish, cheklangan moslashuv |
| Personaj yo‘qolib yo‘l uziladi | Faqat bitta olim vazifani ochadi | Qimmatroq muqobil tadqiqot yoki qutqaruv yo‘li |
| Yuklash qotadi | Chegarada sakrash | Oldindan yuklash, asosiy oqim budjeti, kichik bo‘lak |
| Kooperativ juda qimmat | Alohida shaharlardagi o‘yinchilar | Boshlang‘ich umumiy operatsiya hududi |
| Mazmun ishlab chiqarish cho‘ziladi | Bir sektor kutilganidan qimmat | Uch sektor tezligini o‘lchash, kerak bo‘lsa ko‘lamni kamaytirish |
| Ko‘p tizim, zaif jang | Hujjat katta, o‘ynash sust | 5–10 daqiqalik tajribani birinchi tekshirish |

---

<a id="b32"></a>

## 32. Steam mahsuloti, demo va chiqarish

### 32.1 Do‘konda tushunarli va’da

Ishchi ta’rif: “Do‘sting bilan zararlangan shaharga kir. Odamlar va kema qismlarini HAVENga olib qayt. Qaysi hayot, qaysi bilim va qaysi shahar uchirishgacha yetib borishini sen tanlaysan.” Bu reklama loyihasi; faqat ishlaydigan va tekshirilgan imkoniyatlar bilan moslashtirilib e’lon qilinadi.

Asosiy tasvir: uzoqda Ark, oldinda og‘ir qismni ko‘tarayotgan operator va uni himoya qilayotgan sherik, yon eshikdan yordam signali. Treylersiz ham o‘yinning yuk/qutqarish/qaytish g‘oyasi o‘qilishi kerak.

### 32.2 60–75 soniyalik treyler loyihasi

0–5 s: sherik yiqiladi, katta yuk yerga tushadi, chiqish ochiladi. 5–15 s: o‘yin ko‘rinishi va shaharga kirish. 15–30 s: jim yo‘l, muhit quroli, qutqaruv. 30–45 s: kema qismlarining uch bosqichi va bazadagi odamlar. 45–60 s: qo‘riqchi, og‘ir yukni qaytarish, qisqa final ishorasi. So‘ng nom va mavjud amaliy chaqiriq: demo yoki istaklar ro‘yxatiga qo‘shish. Soxta gameplay va tayyor bo‘lmagan to‘rt kishilik sahna yo‘q.

### 32.3 Demo va o‘ynash sinovi

Demo uchun 25–40 daqiqa: M01, kichik Black Grid operatsiyasi, bitta kuchli uchrashuv va Arkdagi ko‘rinadigan natija. Bu 45–60 daqiqalik ichki namunadan qisqartirilishi mumkin. Demo alohida saqlanish foydalanadi; to‘liq o‘yinga ko‘chirish faqat mos format sinovidan keyin va’da qilinadi. Steam demo sahifasi va tarqatish sozlamalari rasmiy yo‘riqnomaga muvofiq tekshiriladi. [Steamworks demo hujjati](https://partner.steamgames.com/doc/store/application/demos).

Dastlab 5 kuzatiladigan tester → keyin 15–20 yangi tester → tuzatilgan ochiq demo. Birinchi guruh statistik muvaffaqiyat isboti emas. O‘lchov: yordam so‘rash, birinchi omborga qaytish, tushunarsiz o‘lim, takror o‘ynash sababi, do‘st taklif qilish muammosi. Ma’lumot yig‘ish anonim/rozilikka mos, texnik loglar esa minimal bo‘ladi.

### 32.4 Steam imkoniyatlari

- Steam taklifi va do‘stlar xonasi: 2 kishilik chiqarish maqsadi.
- Steam Cloud: kampaniya fayllarini qurilmalar orasida ko‘chirish uchun rejalashtiriladi; host almashinuvi emas. Bir xil kampaniyaning ikki nusxasi qarama-qarshi bo‘lsa, vaqt va akt ko‘rsatiladi, ikkala nusxa zaxirada qoladi. [Steam Cloud](https://partner.steamgames.com/doc/features/cloud).
- Yutuqlar: dastlab 12 mazmunli, bir martalik holatga bog‘langan maqsad; internet uzilib qolsa mahalliy navbat, keyin tasdiqlash.
- Kontroller va o‘qiladigan UI: chiqarish mezoni. Steam Deck belgisi faqat tegishli haqiqiy tekshiruvdan keyin aytiladi.
- O‘yin ichidagi qo‘llanma, versiya va yangilanish qaydlari: qo‘llab-quvvatlashning bir qismi.

Yutuq namunalar: “Birinchi nur”, “Uyga hamma qaytdi”, “Jim yo‘l”, “Po‘lat qanot”, “Shahar eslaydi”, “Sirli signal”, “Ittifoq ko‘prigi”, “Qaytarilgan yuk”, “To‘liq ekipaj”, “Yerda qolgan chiroq”, “Oxirgi yuklash”, “Ikki ufq”. O‘yinchini yuzlab bir xil ishga yoki do‘stni ataylab qurbon qilishga undaydigan yutuq yo‘q. Syujet yakunlari yashirin sarlavha bilan beriladi.

### 32.5 Early Access bo‘yicha qaror

Avval demo va tashqi sinov. Early Access tanlansa, sotilayotgan yig‘ilma o‘sha holatidayoq o‘ynaladigan va qiymatli bo‘lishi kerak; xaridorni kelajakdagi amalga oshishi noma’lum va’daga tayantirish mumkin emas. Saqlanish buzilishi va haqiqiy kontent ochiq yoziladi. [Steamworks Early Access qoidalari](https://partner.steamgames.com/doc/store/earlyaccess).

Narx, chiqish sanasi, tadbirga qatnashish va pullik kontent bo‘yicha hozir raqam va’da qilinmaydi. Bular demo sifati, ishlab chiqarish xarajati va o‘sha paytdagi bozor tekshiruvidan keyingi mahsulot qarorlari.

---

<a id="b33"></a>

## 33. O‘yinchilar uchun to‘liq qo‘llanma

**Bu bo‘lim o‘yinchilarga beriladigan, katta syujet sirlarisiz qo‘llanmadir.** Hujjatdagi boshqaruv rejalashtirilgan buildga tegishli; chiqarilishdan oldin real ishlaydigan versiya bilan tekshiriladi. Uni o‘yin ichidagi Jurnal → Yordam maqolalariga aylantirish mumkin.

Kestrelga xush kelibsiz. HAVENda odamlar sizning qaytishingizni kutyapti. Shaharda ularga kerakli dori, quvvat, metall va kema qismlari bor. Vazifangiz — keraklisini tanlash, odamlarni qutqarish va uyga yetib kelish.

### 33.1 Bir daqiqada tushunib oling

1. HAVENdagi boshqaruv markazidan vazifa tanlang.
2. Qurol, o‘q, tibbiy vosita va bitta foydali asbobni tekshiring.
3. Xaritada kirish va qaytish yo‘lini belgilang.
4. Shaharda maqsadni bajaring. Qancha shovqin chiqarganingiz va qancha yuk olganingizni kuzating.
5. Zarur bo‘lsa qo‘shimcha topilmani qoldiring, yo‘lni almashtiring yoki ertaroq qayting.
6. HAVEN omborida yukni topshiring. Shundan keyin undan kema, baza va odamlar uchun foydalanasiz.

Asosiy eslatma: **buyumni topish yoki ko‘tarish uni bazaga yetkazganingizni anglatmaydi.** Yukni omborga olib kelish kerak.

### 33.2 Birinchi o‘yinni boshlash

Bosh menyuda **Yangi kampaniya**ni tanlang, kampaniyaga nom bering va qiyinchilikni belgilang. Birinchi safarda o‘rgatishni yoqib qoldirish tavsiya qilinadi.

| Qiyinchilik | Kim uchun? |
|---|---|
| Hikoya | Shahar va personajlarni o‘rganishni, yengilroq jangni xohlaganlar |
| Omon qolish | Jang, resurs va qarorlar orasidagi asosiy muvozanat |
| Og‘ir sinov | Xavfni o‘qishni biladigan, kamroq xatoga tayyor o‘yinchilar |

Nishonga olish yordami, subtitr, matn o‘lchami, ekran silkinishi va tugmalarni **Sozlamalar**da moslang. Kontroller ishlatsangiz, o‘yin mos belgilarni ko‘rsatadi.

Birga o‘ynashni xohlasangiz, 33.15-banddagi qadamlar bo‘yicha xona yarating. Rejalashtirilgan boshlang‘ich onlayn rejim ikki kishilik.

### 33.3 Asosiy tugmalar

Quyidagilar standart tugmalar. Ularni o‘zgartirsangiz, o‘yin ichidagi yordam sizning yangi tugmalaringizni ko‘rsatishi kerak.

| Amal | Klaviatura va sichqoncha | Kontroller |
|---|---|---|
| Yurish | W A S D | Chap tayoqcha |
| Nishon yo‘nalishi | Sichqoncha | O‘ng tayoqcha |
| Otish | Chap tugma | RT |
| Aniq nishon | O‘ng tugma | LT |
| Yugurish | Shift | Chap tayoqchani bosish |
| Qochish qadami | Space | B |
| Olish, eshik, suhbat, amal | E | A |
| O‘qlash | R | X |
| Qurolni almashtirish | 1, 2 yoki g‘ildirak | Y |
| Uloqtiriladigan vosita | Q ni tuting, nishonlang, qo‘yib yuboring | RB ni tuting va qo‘yib yuboring |
| Asbobdan foydalanish | C | Yuqori D-pad |
| Yaqindagi dushmanni itarish | V | O‘ng tayoqchani bosish |
| Qo‘ldagi katta yukni qo‘yish | G | Pastki D-pad |
| Chiroq | F | Chap D-pad |
| Sherikka belgi qo‘yish | O‘rta tugma | LB |
| Yuk va jihoz | Tab | O‘ng D-pad |
| Xarita | M | View |
| Jurnal | J | Xarita ichidagi Jurnal |
| Qo‘llanma | F1 | Pauza yoki Jurnaldagi Yordam |
| Pauza/menyu | Esc | Menu |

Oddiy buyumni sumkadan tashlash uchun yuk panelidagi **Tashlash**ni tanlang. G tugmasi asosan qo‘lda ko‘tarilgan katta buyumni tez qo‘yishga xizmat qiladi.

Belgi tugmasini ushlab tursangiz, “xavf”, “kel”, “kut”, “buyum” va “yordam” orasidan tanlaysiz. Mikrofoningiz bo‘lmasa ham sherigingiz bilan reja qilishingiz mumkin.

### 33.4 Ekrandagi belgilar

Maydonda beshta narsani kuzating:

- **Maqsad:** nima bajarilishi va qancha qolgani.
- **Joy:** sektor va muhim bino nomi.
- **Yuk:** hozirgi og‘irlik va sig‘im.
- **Xavf:** dushmanlar qanchalik faollashgani va nima sabab bo‘lgani.
- **Qaytish:** chiqish yo‘nalishi va uning hozirgi holati.

Misol:

```text
TARMOQ YURAGI — quvvat bloklari: 1 / 2
BLACK GRID — G‘ARBIY TURBINA
YUK: 7 / 10 — O‘RTACHA
XAVF: OV ↑ generator signali
QAYTISH: JANUBIY YO‘L — XAVFLI
```

Bu vazifani tugatish uchun yana bitta blok kerakligini, yuk borligini va generator signali dushmanlarni faollashtirganini bildiradi. “Xavfli” yo‘l mutlaqo yopiq degani emas; xaritada boshqa chiqish borligini tekshiring.

Keyingi kema moduliga nima yetishmasligini xarita yoki yuk panelida ko‘rasiz. Jang vaqtida hamma qurilish sonini eslab yurish shart emas.

### 33.5 Birinchi safaringiz

Mara sizni HAVEN elektrini tiklash uchun yuboradi. Avval ko‘rsatilgan asosiy releyni toping. Yo‘lda harakat, otish, buyum olish va shovqin yordamlarini ko‘rasiz.

Asosiy buyumni olgach, qo‘shimcha zaxira yoki yordamga muhtoj odamlar chiqishi mumkin. Asosiy maqsad, bo‘sh yuk joyi, sog‘liq va qaytish yo‘lini solishtiring. Hamma topilmani olishga urinish shart emas.

HAVENga yetgach omborga boring, topshiriladigan yukni tekshiring va tasdiqlang. Chiroqlar va bazadagi o‘zgarishga qarang. Keyingi vazifaga chiqishdan oldin dori va o‘qni tekshiring.

Agar qaerga borishni bilmasangiz: maqsad yozuvini o‘qing → xaritani oching → belgilangan muhim joyni toping → eng yaqin ochiq yo‘lni tanlang. Hali ochilmagan binoga kirish uchun boshqa vazifa kerak bo‘lishi mumkin.

### 33.6 Jangdan omon chiqish

Har jangni otishdan oldin chiqish yo‘lini ko‘rib oling. Tor yo‘lak sizga yordam berishi mumkin, lekin orqangizdan kelish yo‘lini ham unutmang.

Tezkor dushman nishon olayotganda yon tomonga siljing. Og‘ir dushman hujumdan oldin tayyorlanadi — shu belgi qochish vaqtini aytadi. Qochish qadami sizni har qanday zarbadan daxlsiz qilmaydi; haqiqatan zarba yo‘lidan chiqishingiz kerak.

Yaqin dushmanni itarib ozgina vaqt yutishingiz mumkin. Itarish, yugurish va qochish chidamlilik sarflaydi. Chidamlilik tugasa, xavfsizroq burchakka o‘ting va uning tiklanishiga imkon bering.

Magazin tugamasidan xavfsiz joyda o‘qlang. O‘qlashni qochish yoki qurol almashtirish bilan bekor qilish mumkin. O‘q kam bo‘lsa, qurolni almashtirish, shovqin bilan yo‘l ochish yoki chekinish ham to‘g‘ri qaror.

Standart rejimda sizning oddiy o‘qingiz sherigingiz va qutqarilayotgan odamlarga zarar bermaydi. O‘z portlashingiz va muhitdagi olov/tok esa xavfli. Ularni do‘stga zarar yo‘q qoidasi bilan adashtirmang.

### 33.7 Qaysi qurolni tanlash kerak?

| Qurol | Kuchli tomoni | Ehtiyot bo‘ladigan joy |
|---|---|---|
| Signal-9 to‘pponcha | O‘qni nazorat qilib sarflash, yordam quroli | Katta guruhni to‘xtatish qiyinroq |
| Needle avtomati | Yaqin tezkor dushmanlar | O‘qni tez ishlatadi |
| Survey karabini | O‘rta masofada ishonchli | Doimiy shovqin patrullarni tortadi |
| Breach sochma quroli | Yaqin masofada kuchli | Uzoqda tarqaladi va foydasi tushadi |
| Longline miltig‘i | Muhim nishonni uzoqdan urish | Sekin, tor joyda yordam qurol kerak |
| Quietbolt arbaleti | Tinchroq harakat | Bir otishdan keyin vaqt kerak |
| Arc elektr asbobi | Yaqin guruhni to‘xtatish | Masofasi qisqa |
| Breach-L portlatgichi | Katta tahdid va zirhli joy | O‘z portlashingizdan uzoqda turing |

Barcha qurol boshida ochiq bo‘lmaydi. Sizda mavjud qurol bilan vazifani bajarishning yo‘li bo‘lishi kerak. Yangi qurol eski qurolni avtomatik yaroqsiz qilmaydi.

Boshlanishiga karabin, to‘pponcha, tibbiy to‘plam va ovozli chalg‘itgich tushunarli to‘plam. Jihozni HAVENda almashtiring va boshqa usullarni sinang.

### 33.8 Foydali asboblar

**Ovozli chalg‘itgich:** yon yo‘lakka tashlab yaqin zararlanganlarni boshqa tomonga torting. Sizni ko‘rib turgan barcha dushman darhol unutadi deb kutmang.

**Tutun:** ko‘rish chizig‘ini uzishga va kimnidir ko‘tarishga yordam beradi. Shovqin davom etadi.

**Yorug‘lik granatasi:** qisqa fursat ochadi; katta qo‘riqchiga ta’siri kamroq.

**Tibbiy to‘plam:** sog‘liqni tiklash yoki sherikni ko‘tarish uchun. Ishlatish vaqt oladi, xavfsiz burchak tanlang.

**Skaner:** yaqindagi harakat haqida qisqa ma’lumot. U barcha yashirin buyum va to‘liq xaritani bermaydi.

**Eshik tirgagi:** oddiy eshikni vaqtincha ushlab turadi. Muhim qochish yo‘lini o‘zingizga yopib qo‘ymang.

**Ta’mir to‘plami:** mos generator yoki yuk platformasiga yordam beradi.

**Signal to‘suvchi:** elektron alarmni qisqa bosadi. Tirik qichqiruvchi dushmanni jim qilmaydi.

Asbobning qolgan zaryadi va uning vazifasi jihoz panelida ko‘rinadi. Noto‘g‘ri obyektga ishlatib resurs sarflashdan oldin mos amal yozuvini kuting.

### 33.9 Shovqin va xavf nimani anglatadi?

Shovqin — yaqin dushman eshitadigan hodisa. Safar xavfi esa hududning umumiy javobi. Bir marta to‘pponcha otish bilan butun shahar sizning aniq joyingizni bilib qolmaydi, lekin uzun alarm yoki katta generator ko‘proq e’tibor tortadi.

| Holat | Sizga tavsiya |
|---|---|
| Sokin | Kuzating, qaytish yo‘lini eslab qoling |
| Bezovta | Ovoz kelgan yo‘l va patrulni tekshiring |
| Ov | Yon yo‘llarni kuzating, keraksiz otishni kamaytiring |
| To‘da | Muhim maqsadga e’tibor bering, zaxira chiqishni tanlang |
| Qamal | Qolish juda xavfli; qaytish yoki oldindan tayyor himoya kerak |

Ko‘rinishdan chiqish, alarmni o‘chirish va qisqa xavfsiz joyga chekinish yordam beradi. Hamma xavfni yo‘qotish uchun xonada cheksiz kutish ishlamaydi: missiya bosqichi ma’lum bosimni saqlashi mumkin.

Shahar bir necha safardagi ustun usulingizga javob bera boshlaydi. Vazifadan oldingi razvedka buning alomatini aytadi. Boshqa asbob, yo‘l yoki taktika bilan sinab ko‘ring; sevimli qurolingiz butunlay ishlamay qolmaydi.

### 33.10 Yukni boshqarish

Har o‘yinchida **10 og‘irlik birligi** bor. Bu buyumning resurs qiymati bilan bir xil emas: og‘irligi 2 bo‘lgan zich quti 3 birlik resurs berishi mumkin.

- 0–5: yengil yuk.
- 6–8: chidamlilik sekinroq tiklanadi.
- 9–10: uzoq yugurish qiyinlashadi.
- Qo‘ldagi katta qism: qurol ishlatish va tez qochish cheklanadi. Xavf bo‘lsa G bilan qo‘ying.

“Yuk sig‘imi yetmaydi” chiqsa, sumkani ochib qaysi buyum kerakligini solishtiring. Kritik vazifa buyumini tashlasangiz uning joyini xaritada belgilang. Oddiy resursni almashtirish mumkin, lekin topshirilmaguncha u hali ombor mulki emas.

Ko‘chadagi yashirish joyi vaqtinchalik. Kartada uning xavfi va muddati yoziladi. Uni HAVEN ombori deb hisoblamang.

Ikki kishi o‘ynaganda har kim o‘z yukini ko‘taradi. Katta buyumni yerga qo‘yib sherigingizga berishingiz mumkin. Bitta buyumdan ikki nusxa olinmaydi; omborga topshirilgan material esa umumiy bo‘ladi.

### 33.11 Olti resursni eslab qolish

| Belgi | Nima uchun? | Qayerda ko‘proq uchraydi? |
|---|---|---|
| POWER — quvvat | Elektr, reaktor, mudofaa | Elektr infratuzilmasi |
| METAL — metall | Korpus, to‘siq, konstruktsiya | Port, metro, ustaxona |
| FUEL — yoqilg‘i | Dvigatel, generator, transport | Port va uchirish maydoni |
| LIFE — hayot ta’minoti | Davolash, havo, suv va boshpana | Shifoxona, turar joy, bozor |
| TECH — texnika | Asbob, boshqaruv, elektronika | Laboratoriya va texnik xonalar |
| DATA — ma’lumot | Tadqiqot, navigatsiya, tizimlar | Arxiv va maxsus terminallar |

Har yangi topilmada nomi, og‘irligi va nimaga kerakligi ko‘rinadi. Maxsus dvigatel qismi singari buyumlar modul sharti bo‘lishi mumkin. Ularning ustidagi belgi orqali keyingi qurilishga bog‘liqligini bilasiz.

Ma’lumotni ishlatish arxivdagi hikoyani o‘chirib yubormaydi. Bir xil faylni yana nusxalash esa cheksiz DATA bermaydi.

### 33.12 Odamlarni qutqarish

Yordam signalini topgach, odamning holatini tekshiring. Ba’zi guruh yurishi mumkin, boshqasiga avval dori yoki xavfsiz yo‘l kerak.

1. Xonani va chiqish yo‘lini tekshiring.
2. Kerak bo‘lsa yaradorni barqarorlashtiring.
3. Guruhga “ergashing” yoki “shu yerda kuting” buyrug‘ini bering.
4. Keyingi xavfsiz nuqtani tozalang.
5. HAVEN yoki doimiy xavfsiz boshpanaga yetkazing.

Eshikni ochishning o‘zi qutqaruvni tugatmaydi. Odamlarni yo‘lda tashlab ketish yoki xavfsiz joyga qoldirish turli natija beradi; yozuvga qarang.

Qutqarilgan mutaxassislar bazada ishlashi, yo‘l ochishi yoki keyingi safarda foydali xabar berishi mumkin. Hamma bir xil vazifa bajarmaydi. Jarohatlangan odamni darhol ishga yoki kemaga chiqarishdan oldin klinikani tekshiring.

### 33.13 HAVENda nima qilaman?

**Ombor:** yukni topshiring va keyingi ehtiyojni ko‘ring.

**Qurolxona va ustaxona:** jihozni almashtiring, o‘q va asbobni tayyorlang, mavjud modifikatsiyalarni tekshiring.

**Klinika:** jarohat va qutqarilgan guruhning holatini ko‘ring. Sog‘liq va uzoqroq davolanish kerak bo‘lgan jarohat bir narsa emas.

**Boshqaruv markazi:** vazifa, ma’lum xavf, inqiroz muddati va yo‘lni tanlang.

**Boshpana:** odamlar holati va xavfsiz joyni tekshiring.

**Laboratoriya va aloqa:** topilgan bilim, ma’lum signal va tadqiqot imkoniyatlari.

**Kemasozlik maydoni:** Arkning hozirgi ko‘rinishi, keyingi modul va nima yetishmasligi.

Har safar hamma xonani aylanib chiqish shart emas. Yangi voqea yoki muammo bo‘lsa belgi chiqadi. Tinch suhbat va bazadagi kichik o‘zgarishlar siz qutqargan odamlar haqida ko‘proq bilishga yordam beradi.

### 33.14 Kemani qanday quraman?

Arkda yetti tizim bor: korpus, quvvat, dvigatel, hayot ta’minoti, navigatsiya, himoya va uchirish boshqaruvi.

Modulni tanlasangiz uch ma’lumot chiqadi: kerakli resurs, maxsus qism, oldin tugashi kerak bo‘lgan tizim. Hammasi tayyor bo‘lsa o‘rnatishni tasdiqlaysiz. Yetishmasa, aynan nima kamligi ko‘rinadi.

Kema qurilgani tashqi ko‘rinishida va bazadagi imkoniyatlarda bilinadi. Ammo barcha materialni kemaga sarflash har doim eng qulay yo‘l emas: sog‘lom odam, ishonchli elektr va himoyalangan baza keyingi safarni yengillashtiradi.

Kema o‘rindiqlari bilan HAVENdagi yotoqlar boshqa-boshqa. Bazada ko‘proq joy qurish kemaga avtomatik o‘rin qo‘shmaydi. Kampaniya bu masalaga kelganda yo‘lovchi sig‘imi va tibbiy talab aniq ko‘rsatiladi.

Oxirgi tayyorgarlik boshlanishidan oldin o‘yin alohida ogohlantiradi. Oddiy reaktor qurish yoki bazada suhbat qilish yashirincha finalni boshlamaydi.

### 33.15 Steamdagi do‘stim bilan qanday o‘ynayman?

Rejalashtirilgan dastlabki tartib:

1. Ikkalangiz bir xil o‘yin versiyasini ishlating.
2. Xona egasi **Birga o‘ynash → Xona yaratish**ni tanlaydi.
3. Egasi kampaniyani va **Faqat do‘stlar**ni tanlaydi.
4. **Do‘stni taklif qilish** orqali Steam taklifini yuboradi.
5. Ikkinchi o‘yinchi taklifni qabul qiladi.
6. Jihozlarni tekshirib, ikkalangiz **Tayyor**ni belgilaysiz.

Kampaniya **xona egasida** saqlanadi. Mehmon shu kampaniyaga yana qo‘shilganda o‘z slotini davom ettiradi. Olingan umumiy resurslar mehmonning boshqa mustaqil kampaniyasiga ko‘chmaydi.

Dastlab ikki o‘yinchi bir faol topshiriq hududida ishlaydi. Shu hududda turli yo‘ldan yurish mumkin; boshqa sektorga o‘tish uchun jamoa yig‘iladi. Biri portda, biri shaharning narigi uchida butunlay boshqa vazifa bajaradigan rejim rejalashtirilgan dastlabki tarkibga kirmaydi.

Bo‘sh slotga vazifa o‘rtasida qo‘shilayotgan odam xavfsiz kirish nuqtasini kutishi mumkin. Katta qaytarib bo‘lmas qaror ikkalangizga ko‘rsatiladi; teng ovozda xona egasining qoidasi qo‘llanadi.

Mikrofon majburiy emas. Belgilar va matnli xabarlardan foydalaning. O‘yin ichidagi maxsus ovozli chat dastlabki rejimning kafolatlangan qismi emas; Steam yoki boshqa ovozli aloqa bilan gaplashishingiz mumkin.

### 33.16 Sherigim yiqilsa yoki aloqa uzilsa

Sherigingiz yiqilganda avval yaqin xavfni yengillashtiring. Tibbiy to‘plam bilan ko‘tarish vaqt oladi; tutun, itarish yoki eshikdan foydalaning. Og‘ir yukni yerga qo‘yish ko‘pincha yaxshi qaror.

Rejalashtirilgan standartda yiqilgan sherikni tiklash oynasi 60 soniya, yordam amali 4 soniya. U 40 sog‘liq bilan turadi. Bir operator bir safarda ikki marta ko‘tarilishi mumkin; keyingi yiqilish xavfsiz chekinish/yakun qoidalariga olib keladi. Ekrandagi qolgan vaqtga qarang.

Yakka o‘yinda safarga berilgan bitta favqulodda tiklanish vositasi bo‘lsa undan foydalanish mumkin; u hamma mag‘lubiyatni bekor qilmaydi. Vosita tugaganida safar muvaffaqiyatsizlik natijasi bilan yakunlanadi, kampaniya o‘chmaydi.

Aloqa uzilsa qayta ulanish oynasi chiqadi. Xona egasi hali o‘ynayotgan bo‘lsa, imkon qadar shu oynadan qayting. Egasi chiqib ketsa, sessiya tugaydi va oxirgi tasdiqlangan saqlanishdan davom etiladi. Muhim yuk tarmoq uzildi deb mehmon bilan yo‘qolib ketmasligi kerak.

### 33.17 Yutqazsam nima bo‘ladi?

Oddiy ekspeditsiyada mag‘lubiyat kampaniyaning o‘chirilishi degani emas. Siz olib yurgan yukni yo‘qotishingiz, jarohat olishingiz, hudud xavfi ko‘tarilishi yoki yordam vazifasi chiqishi mumkin.

Yo‘qotilgan yuk xaritada tiklash joyi sifatida ko‘rsatiladi. Uning muddatini tekshiring: odatda keyingi bitta tashqi operatsiya ichida qaytarishga ulgurish kerak. Oddiy resurs keyin yo‘qolishi yoki boshqa guruhga o‘tishi mumkin; asosiy kampaniya uchun zarur qismning muqobil yo‘li qoladi.

Ketma-ket qiynalsangiz, past xavfli yordam/ta’minot vazifasini tanlang. Boshlang‘ich anjom bilan qayta harakat qilish imkoni bor. Qurol modelini ochganingiz oddiy mag‘lubiyat bilan butunlay yo‘qolmaydi.

Yakuniy bosqich oqibatlari jiddiyroq. Unga kirishdan oldin alohida ogohlantirish va saqlangan nusxa bo‘ladi. Batafsil natijalarni syujetni buzmaslik uchun bu qo‘llanmada ochmaymiz.

### 33.18 O‘yin qanday saqlanadi?

O‘yin xavfsiz nazorat nuqtalarida, muhim topshirishlar va katta qarorlarda saqlanadi. Ekrandagi saqlanish belgisiga va **Oxirgi saqlanish** vaqtiga qarang.

Oddiy jang o‘rtasida chiqib ketsangiz, oxirgi nazorat nuqtasidan davom etasiz: o‘sha nuqtadagi yuk, joy va vazifa holati birga tiklanadi. Saqlanmagan oxirgi daqiqalardagi topilma qolmasligi mumkin. Chiqish oynasi buni tushuntiradi.

Yakka o‘yinda pauza va yordam oynasi vaqtni to‘xtatadi. Birga o‘ynashda menyu ochsangiz ham dunyo davom etadi. Uzoq ma’lumot o‘qish uchun HAVEN yoki xavfsiz nuqtaga o‘ting.

Steam Cloud ishlaydigan chiqarilishda u saqlanishlarni qurilmalar orasida ko‘chirishga yordam beradi. U xona egasi o‘rnini avtomatik boshqa o‘yinchiga bermaydi. Qarama-qarshi nusxa xabari chiqsa, sana va kampaniya holatini solishtiring; shoshilib eski nusxani yangisining ustiga yozmang.

### 33.19 Ko‘p uchraydigan savollar

**Qutini topdim, nega modul qurilmayapti?** Quti omborga topshirildimi, tarkibi kerakli resursmi va modulning oldingi sharti bajarildimi — tekshiring.

**Hamma dushmanni o‘ldirishim shartmi?** Yo‘q. Maqsadingizni bajarib qaytish muhim. Ba’zi himoya va qo‘riqchi vazifalarida jang shart bo‘ladi.

**Xarita nega hamma narsani ko‘rsatmayapti?** U ma’lum yo‘l va topilgan joylarni ko‘rsatadi. Hali o‘rganilmagan xonalardagi barcha narsalar avtomatik belgilanmaydi.

**Nega boshqa sektor eshigi ochilmayapti?** Yo‘l, elektr, ruxsat yoki vazifa sharti bo‘lishi mumkin. Eshik yoki xaritadagi sabab yozuvini o‘qing.

**Nega yuki to‘la bo‘lganimda yugurish qiyin?** Og‘ir yuk chidamlilikni sekin tiklaydi. Keraksiz narsani qoldiring, vaqtinchalik joyga qo‘ying yoki qayting.

**Qutqargan odam nega kemaga chiqmayapti?** U HAVENga yetganmi, davolanganmi, o‘rin va kerakli tibbiy joy bormi — ko‘ring. Boshpanadagi yotoq kema o‘rindig‘i emas.

**Do‘stimga qo‘shilolmayapman.** Steam ulanishi, bir xil o‘yin versiyasi, bo‘sh slot va yangi taklifni tekshiring. “Xavfsiz nuqta kutilmoqda” bo‘lsa, host shu nuqtaga yetishini kuting.

**Do‘stim chiqdi, endi nima bo‘ladi?** Mehmon bo‘lsa host davom etishi mumkin; host chiqsa sessiya tugaydi. Keyin host saqlangan kampaniyani yana ochadi.

**Dori yoki o‘qim qolmadi.** Xavfsiz qaytish imkonini izlang, qo‘shimcha jangga kirmang. HAVENda minimal ta’minot va tiklash vazifasini tekshiring.

**Menyuda kutganim uchun shahar yomonlashadimi?** Yakka pauzada yo‘q. Umumiy inqirozlar ko‘rsatilgan operatsiya yoki syujet hodisasi bilan yuradi; haqiqiy hayotdagi bir kunlik tanaffus bilan emas.

**Sirli radio signaliga borish majburiymi?** Asosiy vazifa belgisi bo‘lmasa odatda ixtiyoriy. Bo‘sh sig‘im, yo‘l va hozirgi xavfni solishtiring.

**O‘yin qiyin yoki belgilar mayda.** Qiyinchilik va qulaylik sozlamalarini o‘zgartiring. Matn kattaligi, nishon yordami va vizual effektlar orqali tajribani moslash mumkin.

### 33.20 Safar oldidan eslatma

Chiqishdan oldin: maqsad, o‘q, dori, asbob va qaytish yo‘li.

Maydonda: ovoz, chiqish, chidamlilik, yuk va yon yo‘llar.

Qaytishda: odamlar ortda qolmadimi, kritik qism qo‘ldami, yo‘l ochiqmi?

HAVENda: yukni topshirish, yaradorni tekshirish, natijani ko‘rish va keyingi bitta maqsadni tanlash.

Shahar hamma narsani bir safarda berishga majbur emas. O‘zingiz uchun qimmatli narsani aniqlang va uni uyga olib keling.

---

<a id="b34"></a>

## 34. Bajaruvchi uchun ma’lumot shartnomalari, ish navbati va qabul testlari

### 34.1 Amalga oshirishning boshlang‘ich qarorlari

Ushbu bo‘lim “taxmin qiling” degan joylarni kamaytirish uchun bajaruvchiga aniq qoidalarni beradi. Hujjat o‘yin kodining o‘zi emas; undagi shartlar kod va testga aylantiriladi.

| Qaror | Boshlang‘ich tanlov | O‘zgartirish sharti |
|---|---|---|
| Platforma | Windows, 64 bit; klaviatura/sichqoncha va kontroller | Boshqa platforma alohida eksport va qurilma sinovi bilan |
| Dvigatel | Mavjud Godot loyihasi bo‘lsa versiyasini audit qilish; yangida bitta barqaror Godot 4.x patchini tanlab loyiha yozuviga qotirish | Avtomatik yangilash yo‘q; yangilanish saqlash, renderer va tarmoq sinovidan keyin |
| Tasvir | Tepadan 3/4 ko‘rinish; piksel uslubi; operator 48–64 piksel, muhitning ishchi katagi 64 birlik | Mavjud tayyor san’at boshqa uslubda bo‘lsa avval bir sahnada moslik sinovi |
| Boshlang‘ich renderer | Godot Compatibility bilan kulrang namuna; ishlamaydigan yoritish bo‘lsa soddalashtirish | Renderer almashtirish faqat maqsad kompyuterida ko‘rsatilgan foyda bilan |
| Yakka o‘yin | To‘liq kampaniya, internet talab qilmaydigan asosiy o‘yin | Steam funksiyalari mavjudligi alohida tekshiriladi |
| Hamkorlik | Steam orqali 2 kishi, hostga tegishli kampaniya, do‘stlar xonasi | 4 kishi va ochiq qidiruv alohida kengaytma |
| Til | O‘zbekcha va inglizcha UI/subtitr maqsadi; matnlar kalitlar bilan ajratiladi | Har til chiqarilishdan oldin to‘liq tekshiriladi; to‘liq ovoz shart emas |
| Pul modeli | Asosiy to‘liq o‘yin; gameplay kuchini sotish yo‘q | Narx alohida chiqarish qarori |
| Saqlash | 3 avtomatik aylanuvchi nusxa + final oldi nusxasi + oxirgi yaroqli checkpointdan qo‘lda kampaniya nusxasi | Bulutdagi qarama-qarshi nusxa avtomatik birlashtirilmaydi |
| Standart qiyinchilik | Omon qolish; qurol va iqtisod jadvallari shunga tegishli | Har qiyinchilik alohida tekshiriladi |
| Jamoa harakati | Bitta faol topshiriq hududi va u bilan bog‘liq kirish/chiqish yo‘li | Butun shaharda cheksiz ajralish v1 tarkibiga kirmaydi |
| Dizayn sonlari | Shu hujjatdagi qiymatlar boshlang‘ich konfiguratsiya | Sinov dalili bilan almashtirish, tegishli jadval va qo‘llanmani yangilash |

Minimal kompyuter, ishlatiladigan dvigatel patchi va Steam ilova identifikatori mavjud dalilsiz ixtiro qilinmaydi. DEV-001 ularni qayd qiladi. Bu uch ma’muriy qiymat qolgan mexanikalarni ishlab chiqishni to‘xtatmaydi; Steamga chiqarish va ishlash tezligi haqidagi da’vo ularsiz berilmaydi.

### 34.2 Atamalar va raqamlarning ma’nosi

| Atama | Aniq ma’no |
|---|---|
| Sektor | HAVEN yoki to‘qqiz tashqi mazmuniy hududdan biri |
| Bo‘lak / chunk | Yuklash uchun texnik qism; sektor bilan bir xil emas |
| Safar / operatsiya | HAVENdan maqsad bilan chiqib, qaytish yoki mag‘lubiyat bilan tugaydigan bitta instance |
| Syujet tuguni | M01–M12; ulardan M09 va M11 HAVENda, qolgan 10 tasi tashqarida |
| Kontent ta’rifi | O‘zgarmas qurol, missiya yoki joy qoidasi |
| Runtime holat | Joriy kampaniyada o‘zgargan qiymat |
| Nazorat nuqtasi | Dunyo, yuk, vaqt va missiyaning bir vaqtdagi mos nusxasi |
| Xavfsiz kirish | Join/reconnect uchun validatsiyadan o‘tgan nuqta; jangni o‘chirib yuboruvchi universal boshpana emas |
| Resurs birligi | Ombordagi qurilish qiymati |
| Og‘irlik birligi | Olib yurish sig‘imi; resurs birligiga teng bo‘lishi shart emas |
| Sog‘liq / HP | Aktyorning tirik holati qiymati |
| Holat versiyasi / revision | Tasdiqlangan o‘zgarishlar ketma-ketligini ajratuvchi raqam |
| Tranzaksiya | Birgalikda bajariladigan yoki umuman bajarilmaydigan o‘zgarish |
| Idempotent amal | Bir so‘rov qayta kelganda natijani takror yaratmaydigan amal |
| Qabul mezoni | Imkoniyatning tayyorligini tekshiradigan kuzatiladigan shart |

Masofa va tezlik o‘yin birligi hamda soniyada. Zarar bitta tegish uchun, sochma qurolda har dona uchun ko‘rsatilgan. Foizlar ketma-ket ko‘paytiriladi, o‘zaro qo‘shilmaydi. Pul qiymati va chiqish sanasi bu balans raqamlariga kirmaydi.

### 34.3 O‘zgarmas qoidalar — bajaruvchi tekshiradigan shartlar

1. Bitta jismoniy buyum bir vaqtning o‘zida faqat bitta joy/egada bo‘ladi.
2. Ombor resursi faqat tasdiqlangan depozit, belgilangan savdo yoki ma’lum kompensatsiya bilan o‘zgaradi.
3. Sotib olishda avval barcha shartlar tekshiriladi; narx va natija bir operatsiyada bajariladi.
4. Hech bir resurs, o‘q, HP yoki zaryad manfiy bo‘lmaydi.
5. Uskuna yaratish, modul o‘rnatish yoki missiya tugashi takroriy tarmoq xabaridan ikkinchi mukofot bermaydi.
6. Muhim missiya qismi yo‘qolishi kampaniya yo‘lini qaytmas yopmaydi; almashtirish eski instance holatini bekor qilib bitta yangi manba ochadi.
7. Operator uzilganda kritik yuk uning shaxsiy qurilmasida qolib ketmaydi.
8. Yangi o‘yin oldingi kampaniya holatini ololmaydi.
9. Oddiy sahna yuklash/unload resursni qayta tug‘dirmaydi.
10. Saqlangan nuqtaga qaytilganda faqat dushman yoki faqat yuk emas, bir-biriga bog‘liq holat birga qaytadi.
11. Muhim tanlovning oqibati tasdiqlashdan oldin ko‘rinadi.
12. Final signali boshlanishidan oldin oldingi yetti modul, majburiy kalit, sinov holati va finalga kirish talablari tekshiriladi.
13. Elektr tarmog‘i, o‘rnatilgan Ark reaktori, reaktor sinovi va uchirish signali alohida qiymatlar.
14. Bitta odam bir vaqtning o‘zida ishlayotgan, yo‘qolgan va bortga chiqqan bo‘lolmaydi.
15. Bitta guruhning barcha a’zosi uchun o‘rin va tibbiy sig‘im tekshiriladi; sig‘magan odam sukut bilan o‘chirilmaydi.
16. Asosiy syujetni ochish uchun yagona qutqariladigan mutaxassisning tirik qolishi shart qilinmaydi.
17. Jamoa qarori yoki safarni tark etish allaqachon ochilgan qo‘llanma bilan cheksiz bloklanmaydi.
18. Texnik test “hali bajarilmagan” bo‘lsa, muvaffaqiyatli deb ko‘rsatilmaydi.

### 34.4 Loyiha fayllarining boshlang‘ich tuzilishi

Quyidagi yo‘llar kelajakdagi o‘yin reposi ichidagi tavsiya etilgan tuzilma. Hozir shu fayllar yaratilgan degani emas.

~~~text
project.godot
src/
  app/                 yuklash, sozlamalar, rejim tanlash
  session/             GameSession, RunState, command/event
  world/               sektor, chunk, yo‘llar, streaming
  actors/              operator, dushman, NPC, qutqaruv guruhlari
  combat/              zarar, qurol, o‘q, status, perception
  inventory/           buyum, vazn, depozit, savdo
  missions/            maqsadlar, instance, kampaniya grafigi
  haven/               xizmatlar, aholi, yangilanishlar
  ark/                 modul, vizual holat, uchirish
  save/                snapshot, fayl yozish, migration
  network/             host, request validation, snapshot, reconnect
  ui/                  ekranlar, jurnal, qo‘llanma, dynamic input belgisi
content/
  sectors/             sektor ta’riflari va portal shartlari
  missions/            M01–M12, O01–O06, P01–P03
  items/               resurs, komponent, o‘q, sarflanuvchi
  weapons/             W01–W08
  enemies/             E01–E08, B01–B04
  haven/               H01–H08 va boshlang‘ich xizmatlar
  ark/                 yetti modul
  dialogue/            kalit, speaker, trigger, takrorlanish qoidasi
  localization/        o‘zbekcha va inglizcha satrlar
scenes/
  test/                jang, yuk, save, tarmoq maydonlari
  haven/
  sectors/
assets/
  art/
  audio/
tests/
  unit/
  integration/
  fixtures/
tools/
  validate_content/
  inspect_save/
  simulate_economy/
docs/
  decisions/           audit va qabul qilingan o‘zgarishlar
  test_results/        build, qurilma, natija
~~~

Birinchi namunada barcha papkani bo‘sh sinflar bilan to‘ldirish talab etilmaydi. Ishlaydigan bir vertikal yo‘l quriladi, lekin holat egaligi saqlanadi. Eng katta controllerga barcha mexanika yig‘ilmaydi.

### 34.5 Ma’lumot shartnomalari

| Tuzilma | Majburiy maydonlar | Tekshiruv |
|---|---|---|
| PlayerState | player_id, actor_id, hp, stamina, position, sector_id, loadout_ids, carried_item_ids, downed_state, revives_used, solo_injector_used | Noyob ID, vazn ≤10, slotga mos buyum, HP chegarada |
| ItemInstance | instance_id, definition_id, location_kind, owner_or_container_id, resource_yield, weight, mission_binding, state | Bitta joy, musbat vazn yoki ruxsat etilgan 0, haqiqiy ta’rif |
| InventoryState | owner_id, item_ids, revision | Takrorlanmagan item IDlar; egasi bilan ikki tomonlama moslik |
| MissionInstance | instance_id, definition_id, status, phase_id, objective_progress, choice_ids, cargo_bindings, operation_id, revision | Bosqich haqiqiy, prerequisite bajarilgan, natija bir marta |
| SectorState | sector_id, power_state, route_flags, faction_control, long_threat, group_states, landmark_flags | Ruxsat etilgan qiymat, doimiy IDlar |
| NPCState | npc_id, group_id, location_id, life_state, injury_state, assignment, boarding_state | Bitta joy, mos tayinlash va yo‘lovchi holati |
| ArkState | module_states, doctrine_ids, tests_passed, final_signal_active, prep_ops_left, upload_packages | Modul grafigi mos, 0–2 tayyorgarlik, signal shartlari |
| HavenState | upgrade_ids, grid_state, integrity, medical_state, morale, warehouse, population_assignments | Ombor manfiy emas; xizmat shartlari haqiqiy |
| RunState | schema_version, content_version, run_id, seed, revision, operation_index, players, inventories, missions, sectors, npcs, haven, ark, checkpoint, completed_effect_ids, rng_states | Barcha havola topiladi; yangi o‘yin IDsi alohida |

ENUM qiymatlari kodda bitta joyda ta’riflanadi. Ekrandagi o‘zbekcha matn saqlash kaliti bo‘lmaydi. Masalan, power_state = OFF / PARTIAL / FULL; ekrandagi “o‘chiq / cheklangan / barqaror” localization kalitidan olinadi.

Tugallangan buyum joylari: WORLD, CARRIED, STASH, WAREHOUSE, CONSUMED, LOST_RECOVERABLE, REMOVED. Resursga aylangan quti CONSUMEDga o‘tadi va depozit IDsi saqlanadi. CONSUMED buyumni boshqa egaga ko‘chirish mumkin emas.

### 34.6 So‘rov va hodisa protokoli

Har muhim amal quyidagi konvert bilan keladi:

~~~json
{
  "command_id": "run_001:player_01:0042",
  "run_id": "run_001",
  "actor_id": "player_01",
  "type": "TRY_PICKUP",
  "target_id": "dust_lantern.D.relay_01",
  "expected_revision": 18,
  "payload": {}
}
~~~

Host yoki yakka sessiyaning ishonchli xizmati tekshiradi: actor mavjudmi, tirikmi, masofa yetarlimi, ko‘rish/to‘siq sharti mosmi, buyum hali bormi, kerakli slot va vazn bormi, amal shu bosqichda ruxsatmi, oldin command_id bajarilganmi? Mijoz yozgan narx, zarar, mukofot yoki o‘yinchi soni haqiqat sifatida olinmaydi.

Natija: SUCCESS va yangi revision + hodisalar; yoki REJECTED va tushunarli sabab. Oldin bajarilgan so‘rov kelganda o‘sha tasdiqlangan natija qaytariladi. Revision eskirgan bo‘lsa, avval maqsadning dolzarb holati qaytarilib zarur yangilanish amalga oshadi; buyum ikki marta berilmaydi.

| So‘rov | Kirish | Tasdiqlangandan keyin | Oddiy rad sababi |
|---|---|---|---|
| TRY_PICKUP | actor, item | Item CARRIED, yuk yangilanadi | BAND, UZOQ, VAZN_YETMAYDI |
| DROP_ITEM | actor, item, valid_position | Item WORLD/STASH | EGASI_EMAS, JOY_YAROQSIZ |
| DEPOSIT_CARGO | actor, warehouse, item_ids | Yuk kamayadi, ombor oshadi, bitta effect_id | OMBORGA_YETMAGAN, TAKROR |
| START_OBJECTIVE | actor, objective | Kanal/bosqich boshlanadi | SHART_YOQ, BAND |
| RESOLVE_CHOICE | choice_id, option_id, participant_votes | Tasdiqlangan oqibat, checkpoint | OVOZ_KUTILMOQDA, SHART_YOQ |
| INSTALL_MODULE | module_id | Rezerv yo‘q bo‘lsa bir marta yaratiladi; mavjud rezerv sarflanadi, holat/ko‘rinish yangilanadi | RESURS_KAM, TALAB_YOQ |
| ASSIGN_NPC | npc_id, facility_id | Oldingi ish yechiladi, yangi ish beriladi | JAROHAT, JOY_YOQ |
| START_FINAL_SIGNAL | actor, confirmation | Final oldi nusxasi, prep_ops_left=2 | MODUL/SINOV/KALIT_YOQ |
| CONFIRM_RETURN | party_id, exit_id | Safar natijasi va yagona vaqt o‘tishi | JAMOA_YETMAGAN |

Hodisalar namunasi: ItemClaimed, CargoDeposited, ObjectiveAdvanced, ChoiceCommitted, SectorChanged, NPCRescued, ModuleInstalled, ExpeditionResolved. UI hodisani ko‘rsatadi; UI ochilib-yopilishi hodisani qayta bajarmaydi.

### 34.7 Missiya holat mashinasi va maqsadlar

~~~text
LOCKED -> AVAILABLE -> ACTIVE -> OBJECTIVE_READY
                           -> RETURNING -> RESOLVED_SUCCESS
                                        -> RESOLVED_PARTIAL
                           -> ABORTED
                           -> FAILED_RECOVERABLE

ABORTED yoki FAILED_RECOVERABLE:
  tegishli o‘zgargan holatni saqlash
  tiklash variantini ochish
  bir martalik mukofotni qayta bermaslik
~~~

M09 bazadagi qaror, M11 bazadagi himoya bo‘lgani uchun standart tashqi qaytish qadamidan o‘tmaydi; ular bazada o‘z yakunini tasdiqlaydi. Shu ikki tugun tashqi operatsiya sanog‘ini oshirmaydi.

| Maqsad turi | Bajarilish signali | Bekor/to‘xtash | Saqlanadigan progress |
|---|---|---|---|
| REACH | Valid aktor hududga kirdi | Kirish mumkin bo‘lmasa yo‘l ko‘rsatiladi | Bir martalik reached |
| INTERACT | Kanal to‘liq tugadi | Masofa, zarba, bekor qilish | Terminal natijasi; yarim kanal odatda qayta boshlanadi |
| COLLECT | Muayyan item claim tasdiqlandi | Buyum qo‘yilsa carry sharti yangilanadi | Itemning haqiqiy joyi |
| DELIVER | Warehouse tranzaksiyasi | Sig‘im/egalik xatosida hech narsa sarflanmaydi | Deposit effect_id |
| ESCORT | Guruh valid xavfsiz punktga yetdi | Xavfda kutish, yo‘lni qayta topish | Guruh va oxirgi xavfsiz nuqta |
| DEFEND | Vaqt va obyekt holati sharti bajarildi | Obyekt shikastida ta’mir/failure | Bosqich, qolgan vaqt, yaxlitlik |
| ELIMINATE | Kerakli dushman/qo‘riqchi holati tugadi | Qochishda arena reset siyosati | Boss phase checkpoint; takror mukofot yo‘q |
| CHOOSE | Ko‘rsatilgan tanlov tasdiqlandi | Tasdiqqacha sarf yo‘q | Choice ID va oqibat |
| EXTRACT | Jamoa chiqarish shartini bajardi | Yiqilgan/yo‘qolgan sherik bo‘yicha tasdiq | Safar natijasi, bitta operation tick |

Maqsad holati va mukofot ikki alohida tushuncha: komponentni topish vazifa bosqichini ochadi, ammo ombor resursini oshirmaydi. So‘nggi kalit kabi DATA hodisasi arxivga nusxa yozadi; bir xil arxiv IDsi qayta birlik bermaydi.

### 34.8 Kampaniya ochilish grafigi va muqobil yo‘llar

| Tugun | Minimal ochilish sharti | Majburiy chiqish natijasi | Tiqilib qolishga qarshi yo‘l |
|---|---|---|---|
| M01 | Yangi kampaniya | Bir asosiy relay HAVENga yetkazilgan | Yo‘qotilganda kichik tiklash varianti |
| M02 | M01 resolved | Korpus chizmasi va portdagi bazaviy material yo‘li | Rivet bilan dushmanlik muqobil servis yo‘lini yopmaydi |
| M03 | M01 resolved | Kislorod/tibbiy tizim ma’lumoti | Bemor/kapsula tanlovi keyingi LIFE qismni butunlay yo‘q qilmaydi |
| M04 | M02 va M03 resolved; ta’mir asbobi berilgan | HAVEN tarmog‘i; standart reactor_converter; White Room servis ruxsati | Bitta zanjir qolsa tiklash operatsiyasi |
| ACT1_DONE | M01–M04 resolved; Korpus o‘rnatilgan; HAVEN tarmog‘i PARTIAL yoki FULL | M05–M08 yo‘llari ochiladi | Resurs kam bo‘lsa ta’minot ochiq |
| M05 | ACT1_DONE | Qatnov yoki xavfsiz metro shoxi | Pavel bo‘lmasa qo‘lda strelka boshqaruvi |
| M06 | ACT1_DONE + M04 servis ruxsati | Ro‘yxat nusxasi, navigatsiya uchun kirish | Mei/Sera bo‘lmasa sekinroq zaxira terminali |
| M07 | ACT1_DONE | Savdo yoki zaxira qarori | Dushman bozordan tashqari neytral ta’minot |
| M08 | ACT1_DONE + M02 port yo‘li | Dvigatel bloki; sinov flagi yoki aniq muqobil ish | Samirsiz texnik jurnal va bazada 2 TECH sinov |
| M09 | M06 resolved + M03dan sig‘im ma’lumoti | Bort siyosati yoki vaqtincha pending | Sig‘im ma’lum bo‘lishi yetarli, modul hali o‘rnatilmagan bo‘lishi mumkin |
| M10 | M05–M08 orasidan kamida 2 resolved | Guruh qarzi/yordami oqibati | Har munosabatga bitta o‘ynaladigan variant |
| M11 | M05–M08 resolved; M09 qarori tasdiqlangan; M10 resolved; Quvvat o‘rnatilgan | Reaktor sinovi va himoya oqibati | Sinovdan oldin ta’minot/tuzatish erkin |
| M12 | M11 resolved; White Room yoki Steppe Needle kirishi | Uchirish kaliti va arxiv qarori | Ikkala kirish muqobili tekshiriladi |
| FINAL_READY | M12 + 7 modul + dvigatel/reaktor sinovi + saqlash yaroqli | Signalni yoqish tugmasi ochiq | Yetishmayotgan har band ko‘rinadi |
| FINAL_COMMIT | Alohida tasdiq | 2 tayyorgarlik operatsiyasi; final oldi nusxasi | Asosiy modullar uchun yangi majburiy qism paydo bo‘lmaydi |

M02 va M03 bir-biridan keyin qat’iy qulflanmaydi; o‘yinchi ularni ikki tartibda bajarishi mumkin. M05–M08 ham erkinroq navbatda; M11 bularni tugatganidan keyin kiradi. M09 oynasini yopish kampaniyani buzmaydi, lekin M11 boshlanishidan oldin siyosat tanlanishi talab qilinadi.

**Ixtiyoriy boss deadlockini bartaraf etish:** Quvvat uchun standart konverter M04dagi asosiy texnik sandiqdan olinadi. B02 yuqori sifatli qo‘shimcha konverter beradi; bu xavfsizlik zaxirasi yoki muqobil resurs/yo‘l foydasi, asosiy modul uchun yagona buyum emas. B01 portning og‘ir ko‘prigini va qo‘shimcha resursni ochadi; bazaviy Korpus chizmasi M02da bossesiz olinadi. B03 dvigatel yoyining asosiy jangi, B04 esa jang yoki vakolat yo‘li bilan bajariladi.

### 34.9 Modul holatlari va kritik sarf

Modul holati: LOCKED -> AVAILABLE -> FUNDED -> INSTALLED -> TESTED. Sinov talab qilinmagan modulda INSTALLED yetarli; TESTED faqat Quvvat, Dvigatel va Uchirish boshqaruvi uchun haqiqiy dalilga ega.

FUNDED bosqichidagi sarf ombordan bitta rezervga o‘tadi. O‘yinchi o‘rnatish boshlanmaguncha bekor qilsa aynan shu qiymat qaytariladi. Bir kadrda ikki marta bosish ikki rezerv yaratmaydi. O‘rnatish sahnasi kosmetik tugashida resurs qayta yechilmaydi. Offline qurilish uchun real hayotda soatlab kutish yo‘q.

Boshlang‘ich HAVEN tarmog‘i narxi 2 POWER + 2 TECH; u Arkning 124 birlik narxiga qo‘shilmaydi, bazaviy yordam xarajatiga kiradi. Quvvat komponenti jismonan olib kelinadi, lekin qayta yashirin retsept narxi yo‘q. Qo‘shimcha buyum resursga aylansa sarflanishi va IDsi bitta tranzaksiyada yoziladi.

Katta final tugmasi: yetti modul INSTALLED, Quvvat va Dvigatel TESTED, M12 kaliti arxivda, M09 siyosati bor, valid checkpoint yozilishi mumkin. Tekshiruv muvaffaqiyatsiz bo‘lsa qaytarib bo‘lmas holat hali boshlanmaydi.

### 34.10 Aholi, joy va tibbiyotning aniq hisoblari

Boshlang‘ich HAVEN sig‘imi 24 xavfsiz joy, aholisi 12, shu jumladan operatorlar. H06 +8 joy; yana 8 o‘rin favqulodda vaqtinchalik chodir sifatida mavjud, ammo klinika/ruhiy holatga xarajat qiladi. Chodir to‘lib qolsa qutqarilgan guruh oldindan ko‘rsatilgan doimiy sektor boshpanasiga joylashtiriladi. UI ularni HAVENda deb noto‘g‘ri sanamaydi. Joy yetishmasligi odamni avtomatik yo‘q qilmaydi.

Oddiy klinika bir operatsiyada bitta guruhni barqarorlashtiradi; H03 ikki guruhga chiqaradi. Lina bir guruhning davolanish sarfini kamaytirishi yoki og‘ir holatini tezroq tiklashi mumkin; bu tanlov ma’lumotda bitta effekt bilan aniq saqlanadi, ikkalasi birdan bepul berilmaydi.

Ark bazaviy hayot ta’minotida 24 yo‘lovchi o‘rni va 2 tibbiy yotoq. Sig‘im sozlamasi 36 o‘rin va 2 yotoq; tibbiy sozlama 24 o‘rin va 6 yotoq. Bitta og‘ir bemor bitta yo‘lovchi o‘rni **va** bitta tibbiy yotoq egallaydi; ikkita oddiy o‘rin deb hisoblanmaydi.

Og‘ir jarohatni xavfli ravishda dori bilan vaqtincha barqarorlashtirish tanlovi bo‘lsa, xarajat va safar oqibati ko‘rsatiladi. Buni qilmagan odamga “xavfli joylashtirish” orqali cheksiz bepul bypass yo‘q. Joy yetmagan bemor davolanishi yoki xavfsiz yer boshpanasiga qolishi mumkin.

Bortga chiqish ro‘yxati bitta snapshot: odamning IDsi, holati, siyosat sababi, istisno, o‘rin va yotoq. Jo‘nab ketganlar HAVENning faol ishchilar ro‘yxatidan chiqadi. Turli yakun ekranlarida bitta odam ikki joyda ko‘rinmaydi.

### 34.11 Eshik, elektr, yuk va muhit o‘zaro ta’siri

| Tizim | Holatlar | Muhim qoida |
|---|---|---|
| Eshik | CLOSED, OPEN, LOCKED, JAMMED, DESTROYED | Talab/kalit yoki muqobil yo‘l; collision va ko‘rinish bir holatdan |
| Elektr paneli | OFF, READY, CHANNELING, ON, DAMAGED | Elektr yoqilishidan oldin xavfli pol belgilanishi; sinxron tasdiq |
| Platforma | PARKED, MOVING, BLOCKED, DAMAGED, ARRIVED | Faqat belgilangan yo‘l; player input yo‘l nuqtasini tanlaydi |
| Xavfsiz xona | UNKNOWN, DISCOVERED, ACTIVATED, COMPROMISED | Faol xona bosimni cheklangan darajada tushiradi, resurs yaratmaydi |
| Stash | EMPTY, STORED, AT_RISK, RECOVERED, EXPIRED | Muddati operation_indexga bog‘liq; save/load uni yangilamaydi |
| Alarm | OFF, TRIGGERED, SILENCED, BROKEN | Signal to‘suvchi elektron alarmga; biologik qichqiruvga emas |

Elektr polining ko‘rinishi va collision/damage holati bir reviziyada o‘zgaradi. Chiroq yonishi o‘yinchi hech qachon ko‘rmagan devor ortidagi dushmanni darhol oshkor etmaydi. Bir xavf ikki emitter orqali ikki marta zarar bermasligi uchun hazard_id va zarar oralig‘i ishlatiladi.

Boshlang‘ich zarar holatlari: olov 5 HP/s, gaz 5 HP/s, faol elektr pol 10 HP/s; kirishda kamida 0,5 s ko‘rinadigan ogohlantirish yoki xavf zonasi allaqachon aniq chizilgan bo‘lishi kerak. Bir turdagi holat yig‘ilmaydi, muddati yangilanadi. To‘liq hayotiy fizik simulyatsiya va butun binoni zanjirli yondirish yo‘q.

### 34.12 Masofa, ko‘rish va to‘da bosimining aniq minimumi

Boshlang‘ich oddiy E01 ko‘rishi 420 birlik va 110° konus, ortdagi tovush esa radius bo‘yicha eshitiladi. E02 500, E03 380, E06 460 birlik bilan boshlanadi. Devor chizig‘i tekshiriladi; yorug‘likni ko‘paytirish ko‘rish chegarasini oshirishi mumkin, ammo yoritish effekti mustaqil AI qoidasi hisoblanmaydi.

Shovqin hodisasi (source_id, position, radius, intensity, timestamp) bitta emitterdan keladi. Bir o‘q har dushmanning eshitishi bilan xavfni N marta oshirmaydi. Mahalliy eshitish, missiya bosimi va uzoq muddatli shahar bosimi uch boshqa qiymat.

Kutilgan shovqin qiymatlari: qadam 90, yugurish 180, oddiy eshik 120, buzish 500; qurol radiuslari 6-bo‘lim jadvalidan. “Jim yurish” aniq nishon/yurish tezligini kamaytirish bilan qadam radiusini 50 ga tushiradi. Chidamlilik tugashi harakatni bloklamaydi: oddiy yurish qoladi.

Xavf vaqt o‘sishi faqat faol hududda: dastlab har 30 s +1, joriy missiya bosqichi belgilagan vaqt bo‘yicha maksimum 39. 40 va undan yuqori bosimga katta shovqin, objective yoki aniq xavf hodisasi olib chiqadi. 15 s kuzatuv va shovqinsiz holatdan keyin har 5 s −1, bosqich minimumidan past emas. Xavfsiz xonada 30 s ichida eng ko‘pi −10; bitta kirish uchun. Bu boshlang‘ich konfiguratsiya, yashirin universal sanagich emas.

### 34.13 Saqlashning muvaffaqiyatsizlik va qayta urinish siyosati

1. Mutatsiya uchun yangi runtime reviziyasi hisoblanadi.
2. Uning o‘yin, yuk, mission va resume anchorini birlashtirgan nusxasi olinadi.
3. Vaqtinchalik fayl yozilib o‘qish/format/tekshiruv qiymati tekshiriladi.
4. Yaroqli nusxa keyingi slotga faollashadi.
5. Faqat shundan so‘ng “saqlandi” belgisi ko‘rsatiladi.

Disk yozish xatosida jonli sessiya o‘ynalishi mumkin, ammo “saqlanmadi” doimiy xabari chiqadi. Finalga qaytarib bo‘lmas kirish esa yaroqli final oldi nusxasi yaratilmaguncha tasdiqlanmaydi. So‘rov jonli holatda qayta yuborilsa yana material sarflanmaydi.

O‘yin yopilib yozilmagan ish yo‘qolsa, butun holat oldingi yaroqli nazorat nuqtasiga qaytadi. Bu rasmiy checkpoint siyosati; yozilmagan mukofotni alohida tiklab dushmanni eskiga qaytarish yo‘q. Muqobil nusxalar buzilishda tanlanadi, ular bir-biriga qo‘shilmaydi.

Oxirgi turli checkpointlar saqlanadi: faqat bir xavfli joyning uch bir xil nusxasi emas. Kamida bitta HAVEN/safar oldi nusxasi final commitgacha saqlanishi kerak. Zamonaviy kontent versiyasi mos bo‘lmasa, eski saqlanish ustiga avtomatik yozilmaydi.

### 34.14 Uzilish, qayta ulanish va yakka yordamni suiste’mol qilmaslik

Safar boshlanishida player_ids, mode_at_start va assistance_issued qayd qilinadi. Yakka boshlangan safarda ishlatilmagan favqulodda injektor sherik xavfsiz join qilganda vaqtincha o‘chiriladi. Ishlatilgan bo‘lsa ishlatilganligicha qoladi; yangi tibbiy buyum yoki sog‘liq mukofoti berilmaydi. Ikki kishi boshlangan safarda sherik uzilgani uchun bepul yakka injektor yaratilmaydi. Zarur bo‘lsa xavfsiz qaytish va keyingi yakka safar taklif qilinadi.

Disconnect:
- 0–60 s: aktor joyida qoladi va zarar olishi mumkin; boshqaruvsiz o‘zi jang qilmaydi va avtomatik mukofot yig‘maydi. Sherik uni odatiy tiriltirish qoidasi bilan qutqarishi mumkin.
- qaytsa: shu player_id, revision va inventory bilan davom etadi;
- muddat tugasa: actor sessiyadan olinadi, yuk host dunyosidagi bitta belgilangan keshga o‘tadi;
- tashqi operatsiya yakunlangach qaytsa: xavfsiz bazaga, yangi loot mukofotisiz.

Standart qayta ulanish muddati 60 s. U texnik konfiguratsiyada o‘zgarishi mumkin, ammo UI va test aynan shu qiymatni o‘qishi shart. Host migratsiyasi yo‘q.

Zarur tarmoq xavfsizligi: jo‘natuvchi o‘z player_idsi bilan bog‘langanmi, buyum uning qo‘lida yoki yetish masofasidami, request tezligi chegaradami, narx server ta’rifidanmi? Xato xabarlarni qabul qilish campaign faylini buzmasligi kerak. Jiddiy shubhali so‘rovlar minimal logga yoziladi; maxfiy hisob ma’lumotlarini loglash yo‘q.

### 34.15 Final va yakun hisobining ochiq modeli

Natija oltita o‘lchamni beradi; bitta yashirin axloq balli yo‘q:

- launch_state: LAUNCHED / STAYED / FAILED;
- ark_integrity: yakuniy obyektning 0–100 yaxlitligi;
- people: boarded, healthy, medical_supported, ground_safe, missing/lost alohida;
- ground_ready: elektr, boshpana, himoya, ta’minotning 4 boolean holati;
- archive: majburiy paket va 4 ixtiyoriy paketning IDlari;
- allies_and_people: haqiqiy yordam va nomli personajlarning holati.

“Uchdi” faqat majburiy upload tugagan, uchirish boshqaruvi ishlayotgan va Ark yaxlitligi 0 dan katta bo‘lsa. Yakuniy boshqaruv buzilgan bo‘lsa qisqa aniq ta’mir bosqichi, tiklanmasa FAILED; ko‘rinmaydigan ehtimol hisoblanmaydi.

Sarlavhalar uchun boshlang‘ich tanlash tartibi:
1. LAUNCHED + ground_readydagi 4 shartdan kamida 3 + kamida 6 yerda xavfsiz odam = “Ikki ufq”.
2. LAUNCHED + yo‘lovchi sig‘imining kamida 90 foizi band = “To‘la osmon”.
3. LAUNCHED + yaxlitlik kamida 80 + bandlik 50 foizdan kam = “Sovuq hisob”.
4. STAYED/FAILED + ground_ready kamida 3 = “Shahar bardosh berdi”.
5. STAYED/FAILED + majburiy yoki ixtiyoriy arxiv paketi yuborilgan, yuqoridagilar emas = “So‘nggi signal”.
6. Boshqa LAUNCHED = “Davom etayotgan safar”; boshqa STAYED = “Yerda davom etgan hayot”; boshqa FAILED = “Uzilgan yo‘l”.

Bu sarlavha qoidalari ma’lumotlar jadvalida bo‘ladi. Yakun sahifasi sarlavhadan qat’i nazar barcha oltita o‘lchamni ko‘rsatadi. “To‘la osmon” uchun jismoniy sig‘imdan oshirish kerak emas. Hech bir sarlavha o‘yinchini oldindan ataylab odam yo‘qotishga majburlaydigan yutuqning sharti bo‘lmaydi.

### 34.16 Dasturchi yoki AI uchun aniq ish navbati

Har topshiriq natijasi: ishlaydigan o‘zgarish, tegishli test, yangilangan kontent va qisqa tekshirish qaydi. Faqat fayl yaratish yoki “tayyor” yozish qabul qilinmaydi.

| ID | Bog‘liqlik | Bajariladigan ish | Qabul qilinadigan dalil |
|---|---|---|---|
| DEV-001 | Yo‘q | Kod/asset auditi; engine patch, platforma, repo, minimal qurilma va versiya yozuvi | Hozir nima mavjudligi va nimani qayta ishlatish mumkinligi aniq |
| DEV-002 | 001 | Bo‘sh loyiha, GameSession, RunState, yangi/chiqish yo‘li | Ikki yangi kampaniya bir-birining holatini olmaydi |
| DEV-003 | 002 | Harakat, kamera, collision, input rebinding | Klaviatura va kontroller bilan bir hovlini yurish |
| DEV-004 | 003 | W01/W03, zarar, o‘q, E01–E03 va ogohlantirish | Jadval zarari, o‘qlash/itarish/qochish ishlaydi |
| DEV-005 | 002–004 | Item ID, 10 vazn, ko‘tarish/qo‘yish/depozit | 1 buyum 1 marta omborga, chegarada xato yo‘q |
| DEV-006 | 002,005 | Checkpoint, qayta yuklash, zaxira va save error | Yuk/world birga tiklanadi, ikki marta mukofot yo‘q |
| DEV-007 | 003,005 | Dust Lantern kulrang A–G, ikki yo‘l | Katta yuk barcha kerakli yo‘lakdan o‘tadi |
| DEV-008 | 004,007 | Shovqin, perception, local xavf | Devor ortidagi ko‘rinmagan player AIga sehrli ma’lum emas |
| DEV-009 | 005–008 | M01ning barcha to‘rt natijasi | Rele bazaga keladi, odam/quti tanlovi iz qoldiradi |
| DEV-010 | 009 | HAVEN minimal xizmatlari va 3 Ark ko‘rinishi | Bir safardan keyin chiroq va qurilish o‘zgaradi |
| DEV-011 | 009 | Kontekst yordam, dastlabki UI va qo‘llanma | 5 testerning 4 tasi birinchi depozitni yordamsiz bajaradi |
| DEV-012 | 006,009 | Host vakolati, 2 lokal tarmoq nusxasi | Pickup/spend contentionda bitta natija |
| DEV-013 | 012 | Steam do‘st taklifi, join/reconnect va host exit | Ikki haqiqiy hisob bilan taklifdan saqlashgacha |
| DEV-014 | 007,008,012 | Streaming, navigation seams, stress arena | Profiling va 30 faol aktor mezoni |
| DEV-015 | 010–014 | Black Grid kichik zona, tok va kuchli uchrashuv | 45–60 daqiqalik namuna, save/co-op qayta urinish |
| DEV-016 | 015 | Kontent ta’riflari, validator, economy simulator | Yo‘q ID va impossible prerequisite buildda topiladi |
| DEV-017 | 016 | Korpus–Quvvat–Dvigatel va qolgan modullar grafigi | Retsept va ko‘rinish resurs holatidan tiklanadi |
| DEV-018 | 016 | Aholi, klinika, H01–H08, assignment | Joy yetmasligi odamni o‘chirmaydi; bir odam ikki ishda emas |
| DEV-019 | 015–018 | Iron Tide + to‘liq Dust/Black Grid, B01/B02 | Uch xil sektor va ishlab chiqarish tezligi qaydi |
| DEV-020 | 019 | Qolgan sektorlar, W/E/T ro‘yxati, B03/B04 | Har sektor o‘z yo‘li va o‘zgargan revisitga ega |
| DEV-021 | 017–020 | M02–M12 graph, radio, oqibat, arxiv | Barcha yo‘l va recovery branch kampaniyani davom ettiradi |
| DEV-022 | 021 | Final commit, P01–P03, F01–F05 va yakunlar | Signal oldidan talablari tekshiriladi, har yakun reachable |
| DEV-023 | 022 | To‘liq art/audio, lokalizatsiya, controller UI, help | Placeholder-kritik resurs yo‘q; matn va input mos |
| DEV-024 | 015,023 | Demo, Steam Cloud/yutuq, store/trailer material | Faqat haqiqiy ishlaydigan xususiyatlar ko‘rsatiladi |
| DEV-025 | 024 | Save/network soak, clean export, tashqi sinov va RC | O‘zgarmagan kandidat kelishilgan suite’dan ikki marta o‘tadi |

DEV-012 va DEV-014ni 20 ta sektor fayli yig‘ilgandan keyinga qoldirish mumkin emas: tarmoq va streaming risklari kichik namunada tekshiriladi. DEV-023 artni faqat oxirida boshlash degani emas; birinchi namuna uchun zarur art oldin, umumiy sifat yakuni shu vazifada.

### 34.17 Qabul testlarining tayyor ssenariylari

| ID | Berilgan holat | Amal | Kutiladigan natija |
|---|---|---|---|
| QA-001 | Yuk 8/10, buyum vazni 3 | Olish | Rad: 2 bo‘sh; buyum joyida; resurs o‘zgarmaydi |
| QA-002 | Bitta buyum, 2 player | Bir vaqtda olish | Faqat bitta egada; ikkinchisiga BAND |
| QA-003 | 3 METAL quti qo‘lda | DEPOSITni 3 marta yuborish | Ombor +3 bir marta, quti CONSUMED |
| QA-004 | Modul narxidan 1 POWER kam | O‘rnatish | Hech qanday sarf yo‘q, aniq kam miqdor |
| QA-005 | Narx yetarli | Ikki install so‘rovi | Bitta modul, bitta to‘lov |
| QA-006 | Ko‘prik ochilgan, cache olingan | Chunk unload/load | Ko‘prik ochiq, cache bo‘sh |
| QA-007 | Checkpoint A, keyin 2 quti olindi | Saqlamay chiqish/yuklash | Player/yuk/dunyo barchasi A; quti nusxasi yo‘q |
| QA-008 | Checkpoint yozilmoqda | Disk xatosi/uzilish | Kamida oldingi valid nusxa, “saqlandi” yolg‘on chiqmaydi |
| QA-009 | M01 asosiy rele qo‘lda | Odam yo‘lini tanlash | Asosiy quvvat saqlanadi; dilemma ikkinchi resurs haqida |
| QA-010 | B02 bajarilmagan | M04ni tugatish | Standart konverter mavjud, Quvvat yo‘li ochiq |
| QA-011 | Mei, Pavel, Samir qutqarilmagan | Tegishli syujet yo‘llari | Jurnal/qo‘lda/zaxira terminal yo‘llari ishlaydi |
| QA-012 | M09 ko‘rilgan, siyosat pending | M11ni boshlash | Siyosat tanlash sababi ko‘rsatiladi, yashirin failure yo‘q |
| QA-013 | Dvigatel o‘rnatilgan, sinalmagan | Final signal | Sinov talabi bilan rad; operatsiya sanalmaydi |
| QA-014 | Finalga to‘liq tayyor | Signal, so‘ng bazada 30 min | 2 prep qoladi; haqiqiy vaqt ularni yemaydi |
| QA-015 | Final prep 2 | Bir tashqi prep mag‘lubiyati | 1 qoladi, oqibat oldindan ko‘rsatilgan |
| QA-016 | 24 o‘rin, 24 band | Yana odam qo‘shish | Sig‘im rad yoki oldindan ko‘rsatilgan almashtirish; odam yo‘qolmaydi |
| QA-017 | 2 tibbiy yotoq, 3 og‘ir bemor | Boarding | Davolash/yerda xavfsiz joy tanlovi; yashirin o‘lim yo‘q |
| QA-018 | Mehmon kritik yuk ko‘targan | Uzilish va 60 s | Bitta kesh, hostda mavjud; qaytishda nusxa yo‘q |
| QA-019 | Yakka injektor sarflangan | Join/disconnect aylanishi | Yangi injektor yoki HP berilmaydi |
| QA-020 | 150 ms RTT, 2% loss | M01+depozit+modul | Ikki ekran mantiqan bir xil, holat buzilmaydi |
| QA-021 | M tugmasi boshqa tugmaga almashtirilgan | Tutorial/qo‘llanma | Joriy tugma ko‘rsatiladi |
| QA-022 | Ovoz 0, rang ajratish qiyin | Alarm va og‘ir hujum | Matn/ikonka/animatsiya bilan tushunarli |
| QA-023 | Enemy cleared sealed room | Threat oshishi | Ko‘rinmas tushunarsiz ichki spawn yo‘q |
| QA-024 | Bilim fayli oldin olingan | Yana nusxa olish | Arxiv qoladi, DATA ikkinchi marta berilmaydi |
| QA-025 | 2ta Cloud nusxasi turli progressda | Sinxronlash | Tanlash/xulosa va ikkala backup; qo‘shib resurs yaratish yo‘q |
| QA-026 | B04da jang o‘rniga vakolat yo‘li | Tinch yakun | Asosiy kalit olinadi, jang mukofoti alohida nusxalanmaydi |
| QA-027 | Kun o‘zgardi, o‘yin yopiq | Qayta kirish | Operation clock o‘zidan oshmagan |
| QA-028 | Yutuq sharti offline bajarilgan | Keyin Steam ulanishi | Bir martalik belgi, resursga ta’sir yo‘q |

Test natijasi bilan build ID, qurilma, input, solo/co-op, seed, qadam va actual natija yoziladi. Xatoni qayta chiqarib bo‘lmasa “to‘g‘ri ishladi” deb yopilmaydi; qayta kuzatish uchun kerakli log qo‘shiladi.

### 34.18 Tasdiqlanmagan narsalarni boshqarish

Barcha boshlang‘ich damage, vaqt, resurs va ko‘lam qiymati hujjatda bor; bajaruvchi ularni konfiguratsiya qilib o‘yinni boshlashi mumkin. Biroq qiziqarlilik, real FPS, tarmoq sifati, oxirgi narx, haqiqiy minimal kompyuter va tayyor grafikaning ko‘rinishi kod yoki sinovsiz kafolatlanmaydi.

O‘zgartirish yozuvi: qaysi qoida/ID, oldingi qiymat, yangi qiymat, sabab, o‘yinchi tajribasiga ta’sir, qayta bajariladigan QA test va qo‘llanma yangilanishi. Og‘zaki “shunday yaxshi bo‘ladi” hujjatdagi mavjud qoidani sukut bilan almashtirmaydi.

Bajaruvchi uchun yakuniy yo‘l: 1–3-bo‘limlardagi mahsulotni tushunish → tegishli mexanika jadvalini o‘qish → 34-bo‘limdagi holat/so‘rov shartini qo‘llash → DEV topshirig‘ini bajarish → mos QA misolini tekshirish → o‘yinchi qo‘llanmasini dolzarb qilish. Shunda keyingi odam yoki AI oldingi suhbatlarni o‘qimasdan ishni davom ettira oladi.


### 34.19 Kritik komponentlar registri

Quyidagi qismlar oddiy resurslardan alohida yagona instance sifatida tashiladi. Modul uchun topshirilgan qism omborda rezervlanadi; o‘rnatilganda CONSUMED bo‘ladi. Jadvaldagi og‘irlik tashish uchun, kema narxidagi resursga yashirin qo‘shimcha emas.

| Component ID | Asosiy manba | Og‘irlik | Vazifa | Yo‘qolsa |
|---|---|---:|---|---|
| relay_first_light | M01 / Dust Lantern D | 3 | HAVEN birinchi quvvati; depozitda 3 POWER qiymati | M01 tiklash joyi |
| hull_blueprint | M02 / Iron Tide D | 0 | Korpus chizmasi; arxiv kaliti | Port servis terminali |
| reactor_converter | M04 / Black Grid D | 4 | Quvvat modulining standart qismi | Black Grid texnik tiklash vazifasi |
| engine_assembly | M08 / Steppe Needle D/F | 5 | Dvigatel | Platforma tiklash yoki yangi manba ochilib eski instance REMOVED |
| oxygen_assembly | M03da aniqlanadi; M03 yoki O05 orqali olinadi | 4 | Hayot ta’minoti | Blue Hour texnik ombori, tanlovdan keyin ham yo‘li bor |
| navigation_core | M06 / White Room F | 3 | Navigatsiya | Arxivning nusxa/kalibrlash terminali |
| defense_controller | M10 / variantdagi texnik obyekt | 3 | Himoya | HAVEN ustaxonasida o‘sha retsept doirasidagi muqobil yig‘ish |
| launch_key | M12 / Old Town F | 0 | Uchirish boshqaruvi | Valid nusxa qayta olinadi; bir xil DATA mukofoti berilmaydi |

Oxygen assembly bilan bemor/kapsula dilemmasi ajratiladi: asosiy tizimga kerakli kislorod yig‘masi topilishi doim mumkin. Kapsula tanlovi tibbiy zaxira/sifatni yaxshilaydi yoki keyingi ta’mir xarajatini kamaytiradi. Bemorni saqlash asosiy modulni butunlay yo‘qotish narxiga ega emas.

Defense controller M10dagi do‘stlikka qulflanmaydi: ittifoqchi beradi, betaraf bilan ayirboshlanadi, dushman variantida qaytarib olinadi, eng yomon holatda ustaxona muqobil yo‘lni beradi. Standart 20 birlik Himoya narxi saqlanadi; muqobil ish vaqt/missiya asoratiga ta’sir qiladi.

### 34.20 M01 uchun bevosita ma’lumotga aylantiriladigan namuna

Quyidagi JSON kontent ta’rifining ishchi misoli. Dasturchi field nomlarini loyiha formatiga moslashi mumkin, lekin ma’no, ID va to‘rtta natija saqlanadi. Bu yuklangan o‘yin holati emas, yangi instance yaratish ta’rifi.

~~~json
{
  "id": "M01",
  "title_key": "mission.m01.title",
  "sector_id": "dust_lantern",
  "sponsor_id": "mara",
  "repeatable": false,
  "prerequisites": [],
  "start_anchor": "dust_lantern.A",
  "return_anchor": "haven.warehouse",
  "objectives": [
    {"id": "m01_reach", "type": "REACH", "target": "dust_lantern.B"},
    {"id": "m01_take", "type": "COLLECT", "target": "relay_first_light"},
    {"id": "m01_optional", "type": "CHOOSE", "optional": true,
     "options": ["rescue_house", "take_reserve", "leave_for_now"]},
    {"id": "m01_return", "type": "EXTRACT", "target": "dust_lantern.A_or_G"},
    {"id": "m01_deliver", "type": "DELIVER", "target": "relay_first_light"}
  ],
  "required_item": {
    "definition_id": "relay_first_light",
    "spawn_id": "dust_lantern.D.relay_01",
    "weight": 3,
    "resource_yield": {"POWER": 3}
  },
  "optional_sites": [
    {"spawn_id": "dust_lantern.E.reserve_01", "weight": 3,
     "resource_yield": {"POWER": 3}},
    {"spawn_id": "dust_lantern.C.tech_01", "weight": 1,
     "resource_yield": {"TECH": 1}},
    {"spawn_id": "dust_lantern.B.metal_01", "weight": 2,
     "resource_yield": {"METAL": 2}}
  ],
  "pressure": {
    "start": 0,
    "objective_alarm_delta": 12,
    "time_growth_cap": 19,
    "peak_cap": 59
  },
  "groups": [
    {"group_id": "dust_lantern.house_group_01",
     "members": ["aziz", "civilian_dl_01", "civilian_dl_02"],
     "rally_points": ["dust_lantern.E", "dust_lantern.D", "dust_lantern.G"]}
  ],
  "checkpoints": [
    "dust_lantern.A",
    "dust_lantern.D_after_clear",
    "haven.warehouse_after_deposit"
  ],
  "success_effects": [
    "haven.first_light_on",
    "campaign.m01_resolved",
    "campaign.m02_available",
    "campaign.m03_available"
  ],
  "failure_variant": "M01_RECOVERY",
  "completion_effect_id": "M01:first_completion"
}
~~~

M01da relay topshirilganda +3 POWER aynan depozitdan keladi; success_effects yana +3 bermaydi. Qo‘shimcha releyni olish tanlovi qutqariladigan uyning tokini olib ketish ekanini preview ko‘rsatadi. Rescue_house tanlovi zaxira releyni shu uy elektrida qoldiradi: optional reserve item LOCKED_FOR_COMMUNITYga bog‘langan sektor obyektida qoladi, o‘yinchi inventariga ko‘chmaydi. Bu LOCKED_FOR_COMMUNITY WORLD buyumiga qo‘yilgan foydalanish cheklovi, yangi ikkinchi item_location emas. Guruh ko‘chib chiqqanidan keyin uy doimiy boshpana bo‘lgani uchun rele bepul farmga aylanmaydi.

Leave_for_now guruhni darhol o‘ldirmaydi: keyingi ikki tashqi operatsiya uchun aniq chaqiriq ochiladi. Muddat bir marta boshlanadi. Tanlov allaqachon qilingan bo‘lsa yuklash yoki qayta suhbat yangi zaxira bermaydi.

M01 asosiy qutisi va o‘q uyalariga yetish uchun E01–E03 budjeti kifoya. Birinchi yakka safarda xavf 59dan oshmaydi; to‘liq qamalni ko‘rsatish keyingi vazifaga qoldiriladi. Tutorial asboblari sotilmaydi va resursga aylantirilmaydi.

### 34.21 Kontent fayli va sahna qabul shabloni

Har qurol/dushman/asbob faylida: ID, nom kaliti, tavsif, resurs havolasi, statistik qiymatlar, effekt turi, tegishli ovoz/VFX, input/interaction talabi, save/network siyosati va validator sharti. Narx/zarar bir vaqtning o‘zida UI matni va kodda ikki qo‘lda yozilmaydi; UI ta’rifdan oladi.

Har sektor faylida: sector_id, local_bounds, origin, portals, chunk_ids, landmark_ids, mission_socket_ids, valid_spawn_points, safe_anchors, default_state. Har portal ikki tomonlama yoki ataylab bir tomonli ekanini ko‘rsatadi. Bog‘lanishning narigi tomoni yo‘q bo‘lsa validator rad etadi.

Har suhbat satrida: localization_key, speaker_id, trigger, priority, repeat_rule, subtitle_duration, interruption_rule, required_world_flags. Vazifa tushuntirishi hujum telegraphini bosadigan ovoz bilan bir vaqtga qo‘yilmaydi. Muhim replika uzilsa Jurnalda ko‘rish mumkin.

Har grafik aktivda: asset_id, ishlatiladigan sahna, o‘lcham, pivot, collisiondan farqi, animatsiya holatlari, xotira/atlas guruhi va variant. Tayyor art keltirishdan oldin eng kichik o‘lchamdagi ekran va kontrollerda nishon ajratilishi sinovdan o‘tadi.

### 34.22 Misol bo‘yicha bajaruvchi topshirig‘i

“DEV-009 — M01ni amalga oshir” topshirig‘i quyidagi yakun bilan topshiriladi:

1. Yangi o‘yin HAVENdan ochiladi; yo‘l va vazifa ko‘rinadi.
2. Operator W01/W03ning namuna jihozi bilan Dust Lantern A–G bo‘ylab yuradi.
3. Bitta kerakli relay olinadi; uchta ixtiyoriy natija preview bilan tanlanadi.
4. Guruh xavfsiz nuqtalar orqali qaytadi yoki aniq keyingi chaqiriqqa qoladi.
5. Relay omborga faqat bir marta +3 POWER beradi.
6. Chiroq yoqiladi, M02/M03 ochiladi; keyingi maqsad ko‘rinadi.
7. Abort/failure variantidan qayta kirishda relay yoki guruh nusxasi paydo bo‘lmaydi.
8. Checkpointdan qaytishda barcha bog‘liq holat mos.
9. Yakka va 2 kishilik test; sherik uzilsa ham kritik qism dunyoda qoladi.
10. QA-001,002,003,006,007,009,018,019,021 natijalari va qayta bajarish qadamlari beriladi.

Qolgan topshiriqlar ham shunday kuzatiladigan yakun bilan qabul qilinadi. Ushbu qoida inson yoki AI bajaruvchining “kod yozdim” degan hisobotidan ko‘ra o‘yinda ishlaydigan natijani talab qiladi.
