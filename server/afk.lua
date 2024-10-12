

RegisterNetEvent('lxr-afkkick:server:KickForAFK', function()
    local src = source
	DropPlayer(src, 'You Have Been Kicked For Being AFK')
end)

exports['lxr-core']:CreateCallback('lxr-afkkick:server:GetPermissions', function(source, cb)
    local src = source
    local group = exports['lxr-core']:GetPermissions(src)
    cb(group)
end)
