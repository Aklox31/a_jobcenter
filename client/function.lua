if Config.Framework == 'QBCore' then
    QBCore = exports['qb-core']:getModule('QBCore')
elseif Config.Framework == 'ESX' then
    if Config.useLastESX == true then
        ESX = exports['es_extended']:getSharedObject()
    else
        ESX = nil
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end

function setGPS(pos, label)
    SetNewWaypoint(pos.x, pos.y)
    if Config.Framework == 'QBCore' then
        QBCore.Functions.Notify('GPS set to '..label, 'success')
    elseif Config.Framework == 'ESX' then
        ESX.ShowNotification('GPS set to '..label)
    end
end

CreateThread(function ()

    local pedName = Config.ped
    local pedHash = GetHashKey(pedName)

    local position = Config.pedPosition
    local heading = Config.pedHeading

    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Wait(1)
    end

    local ped = CreatePed(9, pedHash, position.x, position.y, position.z, heading, false, true)

    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

end)