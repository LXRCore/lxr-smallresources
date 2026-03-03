--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Small Resources
    Essential lightweight utilities for the LXRCore RedM Framework.
    AFK management, consumables, density control, Discord RP, eagle-eye,
    hands-up, ignore/event system, recoil, teleports, and more.

    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Server:      The Land of Wolves 🐺
    Tagline:     Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!
    Type:        Serious Hardcore Roleplay
    Access:      Discord & Whitelisted

    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    GitHub:      https://github.com/iBoss21
    Store:       https://theluxempire.tebex.io

    ═══════════════════════════════════════════════════════════════════════════════

    Version: 1.0.5
    Framework Support:
    - LXR Core  (Primary)
    - RSG Core  (Primary)
    - VORP Core (Supported / Legacy)
    - Standalone (Fallback)

    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════

    Script Author: iBoss21 / The Lux Empire for The Land of Wolves

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE NAME PROTECTION - RUNTIME CHECK
-- ═══════════════════════════════════════════════════════════════════════════════

local REQUIRED_RESOURCE_NAME = "lxr-smallresources"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error(string.format([[

        ═══════════════════════════════════════════════════════════════════════════════
        ❌ CRITICAL ERROR: RESOURCE NAME MISMATCH ❌
        ═══════════════════════════════════════════════════════════════════════════════

        Expected: %s
        Got: %s

        This resource is branded and must maintain the correct name.
        Rename the folder to "%s" to continue.

        🐺 wolves.land - The Land of Wolves

        ═══════════════════════════════════════════════════════════════════════════════

    ]], REQUIRED_RESOURCE_NAME, currentResourceName, REQUIRED_RESOURCE_NAME))
end

Config = {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ServerInfo = {
    name        = 'The Land of Wolves 🐺',
    tagline     = 'Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!',
    type        = 'Serious Hardcore Roleplay',
    access      = 'Discord & Whitelisted',
    website     = 'https://www.wolves.land',
    discord     = 'https://discord.gg/CrKcWdfd3A',
    github      = 'https://github.com/iBoss21',
    store       = 'https://theluxempire.tebex.io',
    developer   = 'iBoss21 / The Lux Empire',
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Framework Priority (in order):
    1. LXR-Core  (Primary)
    2. RSG-Core  (Primary)
    3. VORP Core (Supported / Legacy)
    4. Standalone (Fallback)
]]

Config.Framework = 'auto' -- 'auto' or manual: 'lxr-core', 'rsg-core', 'vorp_core', 'standalone'

Config.FrameworkSettings = {
    ['lxr-core'] = {
        resource     = 'lxr-core',
        inventory    = 'lxr-inventory',
        notifications = 'lxr-core',
        events = {
            server   = 'lxr-core:server:%s',
            client   = 'lxr-core:client:%s',
            callback = 'lxr-core:callback:%s',
        },
    },
    ['rsg-core'] = {
        resource     = 'rsg-core',
        inventory    = 'rsg-inventory',
        notifications = 'rsg-core',
        events = {
            server   = 'RSGCore:Server:%s',
            client   = 'RSGCore:Client:%s',
            callback = 'RSGCore:Callback:%s',
        },
    },
    ['vorp_core'] = {
        resource     = 'vorp_core',
        inventory    = 'vorp_inventory',
        notifications = 'vorp',
        events = {
            server   = 'vorp:server:%s',
            client   = 'vorp:client:%s',
        },
    },
    ['standalone'] = {
        notifications = 'print',
        inventory     = 'none',
    },
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CONSUMABLES CONFIGURATION █████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

ConsumeablesEat = {
    ["sandwich"]    = math.random(35, 54),
    ["apple"]       = math.random(10, 25),
    ["cannedbeans"] = math.random(40, 50),
    ["bread"]       = math.random(20, 40),
    ["chocolate"]   = math.random(30, 50),
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["coffee"]       = math.random(40, 50),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"]    = math.random(30, 40),
    ["vodka"]   = math.random(20, 40),
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ AFK CONFIGURATION █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.AFK = {
    secondsUntilKick = 1800, -- Seconds of inactivity before kick (1800 = 30 min)
    checkInterval    = 10,   -- Check interval in seconds
    excludedGroups   = {},   -- Groups exempt from AFK kick (e.g. 'god', 'admin')
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DENSITY CONFIGURATION █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Density = {
    pedFrequency     = 0.2,
    trafficFrequency = 0.2,
    animalFrequency  = 0.2,
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DISCORD RICH PRESENCE █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Discord = {
    appId          = '',              -- Your Discord Application ID
    largeAsset     = 'wolves_logo',   -- Large icon asset name
    largeText      = '🐺 The Land of Wolves',
    smallAsset     = 'wolves_small',  -- Small icon asset name
    smallText      = 'wolves.land',
    buttons = {
        [1] = { label = '🐺 Join Our Server', url = 'https://discord.gg/CrKcWdfd3A' },
        [2] = { label = '🌐 Visit Website',   url = 'https://www.wolves.land' },
    },
    maxPlayers = 64,
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ EVENT / IGNORE SYSTEM █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.DisableEvents = {
    [`EVENT_CHALLENGE_GOAL_COMPLETE`]       = true,
    [`EVENT_CHALLENGE_REWARD`]              = true,
    [`EVENT_DAILY_CHALLENGE_STREAK_COMPLETED`] = true,
}

Config.BlacklistedModels = {
    -- Peds
    [`s_m_y_ranger_01`]       = true,
    -- Vehicles
    [`gatling_gun`]            = true,
    [`gatlingMaxim02`]         = true,
    [`breach_cannon`]          = true,
    [`hotchkiss_cannon`]       = true,
    [`policeWagongatling01x`]  = true,
    -- Objects
    [`prop_sec_barier_02b`]    = true,
    [`prop_sec_barier_02a`]    = true,
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ TELEPORT CONFIGURATION ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Teleports = {
    -- Template: add paired teleport points here
    [1] = {
        [1] = {
            coords = vector4(1401.03, 352.71, 87.64, 19.36),
            text   = 'Take Elevator Up'
        },
        [2] = {
            coords = vector4(1379.09, 347.07, 87.8, 15.73),
            text   = 'Take Elevator Down'
        },
    },
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DISCORD LOG WEBHOOKS ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Webhooks = {
    ['default']        = '',
    ['testwebhook']    = '',
    ['playermoney']    = '',
    ['playerinventory']= '',
    ['robbing']        = '',
    ['cuffing']        = '',
    ['drop']           = '',
    ['trunk']          = '',
    ['stash']          = '',
    ['glovebox']       = '',
    ['banking']        = '',
    ['vehicleshop']    = '',
    ['vehicleupgrades']= '',
    ['shops']          = '',
    ['dealers']        = '',
    ['storerobbery']   = '',
    ['bankrobbery']    = '',
    ['powerplants']    = '',
    ['death']          = '',
    ['joinleave']      = '',
    ['ooc']            = '',
    ['report']         = '',
    ['me']             = '',
    ['pmelding']       = '',
    ['112']            = '',
    ['bans']           = '',
    ['anticheat']      = '',
    ['weather']        = '',
    ['bossmenu']       = '',
    ['robbery']        = '',
    ['house']          = '',
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DEBUG SETTINGS ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Debug = false -- Enable debug prints and extra logging

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ STARTUP BANNER ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

CreateThread(function()
    Wait(1000)
    print([[

        ═══════════════════════════════════════════════════════════════════════════════

            ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
            ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
            ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
            ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
            ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
            ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

        ═══════════════════════════════════════════════════════════════════════════════
        🐺 SMALL RESOURCES - SUCCESSFULLY LOADED
        ═══════════════════════════════════════════════════════════════════════════════

        Version:    1.0.5
        Server:     The Land of Wolves 🐺
        Framework:  Auto-detect enabled

        Features:   AFK Kick | Consumables | Density | Discord RP
                    Eagle-Eye | Hands Up | Event Ignore | Recoil | Teleports

        ═══════════════════════════════════════════════════════════════════════════════

        Developer:  iBoss21 / The Lux Empire
        Website:    https://www.wolves.land
        Discord:    https://discord.gg/CrKcWdfd3A
        Store:      https://theluxempire.tebex.io

        ═══════════════════════════════════════════════════════════════════════════════

    ]])
end)