--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Small Resources | Teleport System (Client)
    Creates interactive prompts for paired teleport locations defined in Config.Teleports.

    ═══════════════════════════════════════════════════════════════════════════════
    Server:    The Land of Wolves 🐺
    Developer: iBoss21 / The Lux Empire
    Website:   https://www.wolves.land
    Discord:   https://discord.gg/CrKcWdfd3A
    Store:     https://theluxempire.tebex.io
    ═══════════════════════════════════════════════════════════════════════════════
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]


    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.xyz)
    SetEntityHeading(ped, coords.w)
end

CreateThread(function()
    for loc, data in pairs(Config.Teleports) do
        for k, v in pairs(data) do
            local newK = k == 1 and 2 or 1
            exports['lxr-core']:createPrompt("smallresources:teleport"..k, v.coords.xyz, 0xCEFD9220, v.text, {
                type = 'callback',
                event = UseTeleport,
                args = {data[newK].coords},
            })
        end
    end
end)