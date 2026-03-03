--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Small Resources | Discord Logging (Server)
    Sends structured Discord webhook embeds for server activity logging.
    Webhooks are configured in Config.Webhooks inside config.lua.

    ═══════════════════════════════════════════════════════════════════════════════
    Server:    The Land of Wolves 🐺
    Developer: iBoss21 / The Lux Empire
    Website:   https://www.wolves.land
    Discord:   https://discord.gg/CrKcWdfd3A
    Store:     https://theluxempire.tebex.io
    ═══════════════════════════════════════════════════════════════════════════════
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]


local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('lxr-log:server:CreateLog', function(name, title, color, message, tagEveryone, tagUser)
    local tagEveryone = tagEveryone or false
    local tagUser = tagUser or nil
    local webHook = Config.Webhooks[name] or Config.Webhooks['default']

    -- Construct the embed message
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c') .. ' | 🐺 wolves.land',
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = '🐺 The Land of Wolves | LXR Logs',
                ['icon_url'] = 'https://www.wolves.land/assets/logo.png',
                ['url'] = 'https://www.wolves.land',
            },
            ['fields'] = {
                {
                    ['name'] = 'Category',
                    ['value'] = name,
                    ['inline'] = true
                },
                {
                    ['name'] = 'Log Level',
                    ['value'] = color,
                    ['inline'] = true
                },
            }
        }
    }

    -- Send the main embed to the webhook
    PerformHttpRequest(webHook, function(err, text, headers)
        if err ~= 200 then
            print('Error sending webhook: ' .. err)
        end
    end, 'POST', json.encode({ username = '🐺 LXR Logs | wolves.land', embeds = embedData }), { ['Content-Type'] = 'application/json' })

    -- Wait briefly before sending additional messages (if any)
    Wait(100)

    -- Tag everyone or a specific user if requested
    if tagEveryone or tagUser then
        local content = tagEveryone and '@everyone' or ('<@' .. tagUser .. '>')
        PerformHttpRequest(webHook, function(err, text, headers)
            if err ~= 200 then
                print('Error sending webhook: ' .. err)
            end
        end, 'POST', json.encode({ username = '🐺 LXR Logs | wolves.land', content = content }), { ['Content-Type'] = 'application/json' })
    end
end)

-- Webhook test command
exports['lxr-core']:AddCommand('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {
    {'tag', 'Tag a user with ID', false}
}, false, function(source, args)
    local tagUser = tonumber(args[1]) or nil
    TriggerEvent('lxr-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully', false, tagUser)
end, 'god')