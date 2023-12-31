CreateThread(function()
    if Config.useLastESX == true then
        ESX = exports['es_extended']:getSharedObject()
    elseif Config.useLastESX == false then
        ESX = nil 
        TriggerEvent('esx:getSharedObject', function (obj)
            obj = ESX
        end)
    end
    if Config.useQBCore == 'QBCore' then
        QBCore = exports['qb-core']:getModule('QBCore')
    end
end)

function setGPS(pos, label)
    SetNewWaypoint(pos.x, pos.y)
    if Config.useQBCore == true then
        QBCore.Functions.Notify('GPS set to '..label, 'success')
    elseif Config.useLastESX == true then
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