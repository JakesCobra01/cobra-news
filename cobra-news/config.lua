Config = {}

-- =============================================
--  BLUE HAVEN NEWS - CONFIG
-- =============================================

-- How often the scheduled "filler" broadcast fires (seconds) when no events pending
-- Set to 0 to disable filler broadcasts
Config.FillerInterval = 1800 -- 30 minutes

-- Display duration for each broadcast (seconds)
Config.DisplayTime = 12

-- Vehicle purchase threshold to trigger a news story (in GBP)
Config.VehiclePriceThreshold = 80000

-- Minimum delay ranges (seconds) per dispatch codeName category
-- Format: { min, max } — actual delay is randomised within this range
Config.Delays = {
    -- Major bank/vault heists
    majorHeist     = { 480, 900  },  -- 8–15 min
    -- Train, yacht, boat, underground ops
    largeOperation = { 600, 1080 },  -- 10–18 min
    -- Street level: carjack, boosting, house robbery
    streetCrime    = { 300, 600  },  -- 5–10 min
    -- Shootings, fights, explosions
    incident       = { 300, 480  },  -- 5–8 min
    -- Prison break — still delayed but feels "breaking"
    prisonBreak    = { 180, 300  },  -- 3–5 min
    -- EMS callouts — reported after scene
    emsReport      = { 360, 720  },  -- 6–12 min
    -- Vague suspicious activity — shortest delay, least detail
    cityDesk       = { 120, 240  },  -- 2–4 min
    -- Vehicle / property purchases
    lifestyle      = { 120, 300  },  -- 2–5 min
    -- Weather — immediate
    weather        = { 0,   0    },
}

-- Map ps-dispatch codeNames → delay category
Config.DispatchMap = {
    -- Major Heists
    bankrobbery          = 'majorHeist',
    paletobankrobbery    = 'majorHeist',
    pacificbankrobbery   = 'majorHeist',
    vangelicorobbery     = 'majorHeist',
    artgalleryrobbery    = 'majorHeist',
    humanelabsrobbery    = 'majorHeist',
    bobcatsecurityheist  = 'majorHeist',
    storerobbery         = 'majorHeist',

    -- Large Operations
    trainrobbery         = 'largeOperation',
    vanrobbery           = 'largeOperation',
    unionrobbery         = 'largeOperation',
    undergroundrobbery   = 'largeOperation',
    drugboatrobbery      = 'largeOperation',
    yachtheist           = 'largeOperation',

    -- Street Crime
    houserobbery         = 'streetCrime',
    carboosting          = 'streetCrime',
    carjack              = 'streetCrime',
    vehicletheft         = 'streetCrime',

    -- Incidents
    shooting             = 'incident',
    vehicleshots         = 'incident',
    fight                = 'incident',
    explosion            = 'incident',
    signrobbery          = 'incident',

    -- Prison
    prisonbreak          = 'prisonBreak',

    -- EMS
    civdown              = 'emsReport',
    civdead              = 'emsReport',

    -- City Desk (vague)
    suspicioushandoff    = 'cityDesk',
    susactivity          = 'cityDesk',

    -- Ignored entirely (internal emergency services)
    -- officerdown, officerbackup, officerdistress, emsdown, hunting, speeding
}

-- renewed-weather condition → news label
Config.WeatherLabels = {
    CLEAR        = 'clear skies',
    EXTRASUNNY   = 'bright sunshine',
    CLOUDS       = 'cloudy conditions',
    OVERCAST     = 'overcast skies',
    RAIN         = 'rainfall',
    CLEARING     = 'clearing showers',
    THUNDER      = 'thunderstorms',
    SMOG         = 'heavy smog',
    FOGGY        = 'dense fog',
    XMAS         = 'wintry conditions',
    SNOWLIGHT    = 'light snowfall',
    BLIZZARD     = 'blizzard conditions',
    NEUTRAL      = 'mild conditions',
    HALLOWEEN    = 'eerie atmospheric conditions',
}
