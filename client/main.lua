if Config.useLastESX == true then
    ESX = exports['es_extended']:getSharedObject()
else
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
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

RegisterCommand('jobcenter', function()
    print('jobcenter')
    jobCenter()
end, false)

function setGPS(pos, label)
    SetNewWaypoint(pos.x, pos.y)
    ESX.ShowNotification('GPS set to '..label)
end