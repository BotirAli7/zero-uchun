# QA tools

Both scripts drive the game in headless Chromium through `window.__ko`
(the 2D renderer is used when the page is opened from disk, so they run fast).

    npm i playwright        # once
    node validate.js        # every mission: spawns, routes, objectives, crates,
                            # intel, hostage, hold zone and pads are outside solids
                            # and reachable from the insertion point
    node bot.js <easy|normal|hard> <god|mortal> <mission 0-2>
                            # autopilot playtest: walks to each objective with A*,
                            # shoots visible enemies, frees the hostage, holds the
                            # zone, extracts; prints time, damage, kills, stuck AI

Balance at the time of the campaign update (mortal bot, which never uses cover):
Dust Lantern easy 1/2 normal 2/2 · Port Kestrel easy 2/2 normal 1/2 ·
Black Grid easy 1/2 normal 2/3.
