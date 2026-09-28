# DEV-001 — 0-bosqich auditi (Kestrel City)

Reja: `KESTREL_CITY_YAGONA_REJA_UZ_V5.md`, 29.1-bo'lim talabiga ko'ra.

## Loyiha holati

Yangi loyiha. Avvalgi "Space Station Survival" kodi Kestrel City bilan
bog'liq emas edi va reja bo'yicha butunlay almashtirildi (git tarixida
saqlanadi, `git log` orqali topiladi).

## Texnik qarorlar

| Savol | Qaror | Asos |
|---|---|---|
| Engine | Godot 3.5 (GDScript) | Shu muhitda o'rnatilgan, headless (`godot3-server`) va vizual (`xvfb-run godot3`) sinov infratuzilmasi allaqachon ishlaydi va tekshirilgan. |
| Platforma | Windows/Linux/Mac PC (Godot eksport) | Reja PC/Steam mahsuloti deb belgilagan. Eksport shablonlari bu sessiyada sinovdan o'tkazilmagan — DEV-002 sifatida qoldiriladi. |
| Kamera | Tepadan ko'rinadigan 2D, o'yinchini kuzatib yuruvchi Camera2D | 2-bo'limdagi janr ta'rifiga mos. |
| Kirish (input) | Klaviatura + sichqoncha (5.1-jadval) | Kontroller (gamepad) qo'llab-quvvatlashi keyingi bosqichga qoldiriladi. |
| Ko-op | 1-bosqichda yo'q | 29.4–29.5 bosqichlarigacha 2 kishilik ko'op talab qilinmaydi; tarmoq kodi keyinroq. |
| Rasm uslubi | 1-bosqichda oddiy geometrik shakllar (`_draw()`) | 29.3-bo'lim ("2-bosqich — texnik xavflarni sinash") aynan shu yondashuvni tavsiya qiladi: "Oddiy shakllar bilan butun dunyo ko'lami... sinaladi". Bundan tashqari, joriy Higgsfield krediti deyarli tugagan (0.4 qoldi) — real san'at keyingi bosqichda, kontent hajmi aniqlangach generatsiya qilinadi. |
| Sinov asboblari | `godot3-server --path . --print-fps` (headless soak-test skript xatolarini tutish uchun) + `xvfb-run godot3` (vizual skrinshot namoyishi) | Avvalgi loyihada ishlatilgan va tasdiqlangan usul. |

## Doimiy ID sxemasi

Rejaning o'z ID formatini ishlatamiz (keyingi bosqichlarda kengaytiriladi):

- `E01`–`E08` — dushman sinflari (1-bosqichda faqat E01–E03 qo'llaniladi)
- `W01`–`W08` — qurollar (1-bosqichda faqat W01)
- `T01`–`T08` — asboblar (1-bosqichda ishlatilmaydi)
- `M01`, `M02`, … — missiyalar/sahnalar (1-bosqichda faqat "Yard-01" ichki nom bilan, rasmiy missiya ID keyinroq)

## Saqlash siyosati

Godot `File` API orqali `user://kestrel_save.save` (`store_var`/`get_var`, Dictionary format) — avvalgi loyihada sinovdan o'tgan usul bilan bir xil. 1-bosqichda faqat asosiy holat (yuk topshirilganmi, sodir bo'lgan voqealar jurnali) saqlanadi; to'liq 26-bo'lim talablari (100 marta saqlash/yuklash sinovi, versiyalash) keyingi bosqichda.

## Missiya bog'lanishlari va resurs taqsimoti

1-bosqichda yagona chiziqli oqim: HAVEN → Yard-01 → yukni topish → HAVENga qaytish. Aktlar bo'yicha resurs taqsimoti (16-bo'lim) hali qo'llanilmaydi — bu shahar mazmuni to'liq loyihalanganda (7–8-bosqich) kerak bo'ladi.

## Natija

1-bosqichni (29.2) boshlashga to'siq yo'q. Ochiq texnik savollar (eksport, kontroller, tarmoq) DEV-002/DEV-003 sifatida keyinga qoldirildi, hozirdan "hal qilingan" deb ko'rsatilmaydi.
