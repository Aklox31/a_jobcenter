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


local function jobCenter()
    local options = {}
    for _, info in pairs(Config.jobFarms) do
        options[#options+1] = {
        title = info.label,
            description = info.description,
            onSelect = function ()
                setGPS(info.posInGPS, info.label)
            end
        }
    end

    lib.registerContext({
        id = 'job_center_menu',
        title = 'Job Center',
        options = options,
    })

    lib.showContext('job_center_menu')
end

-- Devmode (remove this if you don't want to use it)
if Config.devMode == true then
    RegisterCommand('jobcenter', function()
        print('jobcenter')
        jobCenter()
    end, false)
end

exports.ox_target:addBoxZone({
    coords = Config.pedPosition+vector3(0,0,1.2),
    size = vector3(2.0, 2.0, 2.0),
    drawSprite = true,
    options = {
        {
            name = "open_job_center",
            icon = 'fas fa-clipboard-list',
            label = 'Open a job center',
            onSelect = function(data)
                jobCenter()
            end
        }
    }
})