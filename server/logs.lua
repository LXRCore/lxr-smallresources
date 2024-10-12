

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = '',
    ['playermoney'] = '',
    ['playerinventory'] = '',
    ['robbing'] = '',
    ['cuffing'] = '',
    ['drop'] = '',
    ['trunk'] = '',
    ['stash'] = '',
    ['glovebox'] = '',
    ['banking'] = '',
    ['vehicleshop'] = '',
    ['vehicleupgrades'] = '',
    ['shops'] = '',
    ['dealers'] = '',
    ['storerobbery'] = '',
    ['bankrobbery'] = '',
    ['powerplants'] = '',
    ['death'] = '',
    ['joinleave'] = '',
    ['ooc'] = '',
    ['report'] = '',
    ['me'] = '',
    ['pmelding'] = '',
    ['112'] = '',
    ['bans'] = '',
    ['anticheat'] = '',
    ['weather'] = '',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['house'] = '',
}

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
    local tagUser = tagUser or nil -- New variable to tag specific users
    local webHook = Webhooks[name] or Webhooks['default']
    
    -- Construct the embed message
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'LXRCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
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
    end, 'POST', json.encode({ username = 'LXR Logs', embeds = embedData }), { ['Content-Type'] = 'application/json' })

    -- Wait briefly before sending additional messages (if any)
    Wait(100)

    -- Tag everyone or a specific user if requested
    if tagEveryone or tagUser then
        local content = tagEveryone and '@everyone' or ('<@' .. tagUser .. '>')
        PerformHttpRequest(webHook, function(err, text, headers)
            if err ~= 200 then
                print('Error sending webhook: ' .. err)
            end
        end, 'POST', json.encode({ username = 'LXR Logs', content = content }), { ['Content-Type'] = 'application/json' })
    end
end)

-- Improved webhook test command
exports['lxr-core']:AddCommand('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {
    {'tag', 'Tag a user with ID', false}
}, false, function(source, args)
    local tagUser = tonumber(args[1]) or nil -- Allow user tagging in the test command
    TriggerEvent('lxr-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully', false, tagUser)
end, 'god')

--[[ webhook old
RegisterNetEvent('lxr-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'LXRCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'LXR Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Wait(100)
    if not tag then return end
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'LXR Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
end)

exports['lxr-core']:AddCommand('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function(source, args)
    TriggerEvent('lxr-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
]]--