--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Small Resources | Discord Rich Presence (Client)
    Sets up Discord Rich Presence with wolves.land branding.
    Configure Discord App ID and assets at: https://discord.com/developers/applications

    ═══════════════════════════════════════════════════════════════════════════════
    Server:    The Land of Wolves 🐺
    Developer: iBoss21 / The Lux Empire
    Website:   https://www.wolves.land
    Discord:   https://discord.gg/CrKcWdfd3A
    Store:     https://theluxempire.tebex.io
    ═══════════════════════════════════════════════════════════════════════════════
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

CreateThread(function()
    SetDiscordAppId(Config.Discord.appId)

    SetDiscordRichPresenceAsset(Config.Discord.largeAsset)
    SetDiscordRichPresenceAssetText(Config.Discord.largeText)

    SetDiscordRichPresenceAssetSmall(Config.Discord.smallAsset)
    SetDiscordRichPresenceAssetSmallText(Config.Discord.smallText)

    SetRichPresence('Players: ' .. GlobalState['Count:Players'] .. '/' .. Config.Discord.maxPlayers)

    SetDiscordRichPresenceAction(0, Config.Discord.buttons[1].label, Config.Discord.buttons[1].url)
    SetDiscordRichPresenceAction(1, Config.Discord.buttons[2].label, Config.Discord.buttons[2].url)
end)

AddStateBagChangeHandler('Count:Players', 'global', function(_, _, playerCount)
    SetRichPresence('Players: ' .. playerCount .. '/' .. Config.Discord.maxPlayers)
end)