--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Small Resources | Consumables (Server)
    Registers useable items for food, drink, alcohol, cigarettes, cigars, and dual-wield.

    ═══════════════════════════════════════════════════════════════════════════════
    Server:    The Land of Wolves 🐺
    Developer: iBoss21 / The Lux Empire
    Website:   https://www.wolves.land
    Discord:   https://discord.gg/CrKcWdfd3A
    Store:     https://theluxempire.tebex.io
    ═══════════════════════════════════════════════════════════════════════════════
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]


    exports['lxr-core']:CreateUseableItem(k, function(source, item)
        local Player = exports['lxr-core']:GetPlayer(source)
        if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent("consumables:client:Drink", source, item.name)
        end
    end)
end

-- DrinkAlcohol
for k in pairs(ConsumeablesAlcohol) do
    exports['lxr-core']:CreateUseableItem(k, function(source, item)
        local Player = exports['lxr-core']:GetPlayer(source)
        TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
    end)
end

-- EAT
for k in pairs(ConsumeablesEat) do 
    exports['lxr-core']:CreateUseableItem(k, function(source, item)
        local Player = exports['lxr-core']:GetPlayer(source)
        if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent("consumables:client:Eat", source, item.name)
        end
    end)
end

-- OTHER

exports['lxr-core']:CreateUseableItem("cigarette", function(source, item)
    local Player = exports['lxr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Smoke", source, item.name)
    end
end)

exports['lxr-core']:CreateUseableItem("cigar", function(source, item)
    local Player = exports['lxr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Smoke", source, item.name)
    end
end)

exports['lxr-core']:CreateUseableItem("dual", function(source, item)
    local Player = exports['lxr-core']:GetPlayer(source)
    TriggerClientEvent("lxr:Dual", source)
end)