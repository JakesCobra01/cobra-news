# paradise-news
### Blue Haven Live News System

A fully automated, living news broadcasting system for Paradise Island (QBCore). Hooks into your existing stack to generate delayed, immersive news articles about events happening across the city — displayed as a polished bottom-of-screen ticker under the Blue Haven News banner.

---

## Dependencies

| Resource | Required |
|---|---|
| `qb-core` | ✅ |
| `ox_lib` | ✅ |
| `oxmysql` | ✅ (for metadata persistence) |
| `ps-dispatch` | ✅ (crime/incident hooks) |
| `qb-vehicleshop` | ✅ (vehicle purchase hooks) |
| `bcs-housing` | ✅ (property purchase hooks) |
| `renewed-weather` | ✅ (weather broadcast hooks) |

---

## ⚠️ Required: ps-dispatch Shim (One-Time Edit)

FiveM's net event security prevents any resource from hooking another resource's net events directly. To get dispatch alerts into paradise-news you need to add **three lines** to `ps-dispatch/server/main.lua`.

Open `ps-dispatch/server/main.lua` and add this anywhere near the top of the file (after any existing `AddEventHandler` calls is fine):

```lua
-- paradise-news hook
AddEventHandler('ps-dispatch:server:notify', function(data)
    TriggerEvent('ps-dispatch:server:localNotify', data)
end)
```

That's it. This re-emits the dispatch data as a local server event that paradise-news can safely listen to. It has zero impact on ps-dispatch's normal operation.


## Installation

1. Drop `paradise-news` into your `resources` folder.
2. Add `ensure paradise-news` to your `server.cfg` — place it **after** `qb-core`, `ox_lib`, `ps-dispatch`, `qb-vehicleshop`, `bcs-housing`, and `renewed-weather`.
3. No SQL required — uses QBCore player metadata for preference persistence.
4. Restart your server.

---

## Player Commands

| Command | Description |
|---|---|
| `/newsalerts` | Toggle Blue Haven News alerts on/off (persists across sessions) |

A key binding is also registered — players can assign it in GTA V Key Bindings settings under FiveM.

---

## Admin Commands

| Command | Usage |
|---|---|
| `/newssend` | Manual broadcast — requires `admin` or `god` permission |

**Syntax:** `/newssend <TIER> <Title> | <Body>`

**Tiers:** `BREAKING`, `DEVELOPING`, `CITY NEWS`

**Examples:**
```
/newssend BREAKING Explosion Downtown | Emergency services responding to a large explosion near Maze Bank Arena.
/newssend CITY NEWS Road Closure on Route 1 | Motorists are advised to seek alternative routes this evening.
```

Console (txAdmin) can also run `/newssend` without permission checks.

---

## Configuration (`config.lua`)

### Key Settings

| Option | Default | Description |
|---|---|---|
| `Config.FillerInterval` | `1800` | Seconds between scheduled filler broadcasts (0 = disabled) |
| `Config.DisplayTime` | `12` | Seconds each broadcast is visible |
| `Config.VehiclePriceThreshold` | `80000` | Minimum GBP price for vehicle purchase to trigger news |

### Delays

Delays are randomised within `{ min, max }` ranges (in seconds):

| Category | Default Range | Events |
|---|---|---|
| `majorHeist` | 8–15 min | Bank robberies, jewellery, Vangelico, Bobcat, Humane Labs |
| `largeOperation` | 10–18 min | Train, yacht, drug boat, underground, union |
| `streetCrime` | 5–10 min | Car jacking, boosting, vehicle theft, house robbery |
| `incident` | 5–8 min | Shootings, fights, explosions |
| `prisonBreak` | 3–5 min | Prison break |
| `emsReport` | 6–12 min | Person down, deceased person |
| `cityDesk` | 2–4 min | Suspicious activity |
| `lifestyle` | 2–5 min | Vehicle and property purchases |
| `weather` | Immediate | Weather changes |

---

## Adding New Event Types

1. Add the `ps-dispatch` `codeName` to `Config.DispatchMap` in `config.lua` with a delay category.
2. Add a matching template block to `shared/templates.lua` using the same key as the `codeName`.
3. Use `{street}`, `{vehicle}`, `{area}` placeholders — these are auto-filled from dispatch data.

---

## Ignored Events

The following dispatch codes are deliberately **not** broadcast (internal emergency services only):

- `officerdown`, `officerbackup`, `officerdistress`
- `emsdown`
- `hunting`, `speeding`

To add these back, remove them from the ignore comment in `config.lua` and add templates.

---

## How It Works

```
ps-dispatch fires → server intercepts codeName
→ delay engine picks random delay from category range
→ article template selected + street/vehicle filled in
→ queued with timestamp
→ queue processor checks every 10s
→ when time reached: broadcast pushed to all opted-in players
→ client receives → NUI ticker slides up from bottom
→ auto-hides after Config.DisplayTime seconds
```

Weather hooks bypass the queue and fire with a short natural delay (5–20 seconds) directly.
