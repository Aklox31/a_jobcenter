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

exports.ox_target:addBoxZone({
    coords = Config.pedPosition+vector3(0,0,1.2),
    size = vector3(2.0, 2.0, 2.0),
    radius = 0.3,
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