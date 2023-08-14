Config = {}

Config.useLastESX = true -- If you use the last version of ESX, set this to true, else set this to false
Config.ped = "a_m_m_eastsa_02"
Config.pedPosition = vec3(-269.291870, -956.013550, 30.223133)
Config.pedHeading = 201.315

Config.jobFarms = {
    {
        label = 'Mining',
        description = "This is the job farm for mining",
        posInGPS = vec3(-201.106995, -1305.596924, 31.373247) --- Add the position of the job center (vector3)
    },
    {
        label = 'This is exemple',
        description = "This is the job farm for exemple",
        posInGPS = vec3(0,0,0)
    }
}