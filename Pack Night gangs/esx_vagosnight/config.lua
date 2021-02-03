Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 2
Config.MarkerSize                 = { x = 1.6, y = 1.6, z = 1.1 }
Config.MarkerColor                = { r = 239, g = 224, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.CircleZones = {
     DrugDealer = {coords = vector3( 344.22, -2044.45, 21.54), name = _U('map_blip'), color = 71, sprite = 84, radius = 1.0},
}

Config.vagosStations = {
  vagos = {


	  AuthorizedVehicles = {
		  { name = 'sultan',  label = 'Sultan' },
		  { name = 'manchez',     label = 'Manchez' },
		  { name = 'speedo',     label = 'Camionette' },
	  },

    Cloakrooms = { -- Vestiaire
      { x = 356.89, y = -2033.4884, z = 21.42 }, -- fait
    },
 
    Armories = { -- Armurerie
      { x = 338.07, y = -2012.32, z = 21.42 }, -- fait
    },

    Vehicles = { -- Garage
      {
        Spawner    = { x = 313.437, y = -2028.472, z = 19.55 }, -- fait
        SpawnPoint = { x = 329.465, y = -2042.366, z = 19.75 }, -- fait
        Heading    = 142.937, -- fait
      }
    },

    VehicleDeleters = {
      { x = 325.487, y = -2025.938, z = 20.04 }, -- fait
    },

    BossActions = { -- Action du boss Vagos
      { x = 339.87, y = -2021.37, z = 21.39 } -- fait
    },

  },

}

--create ﾒﾒﾒﾒ#4779