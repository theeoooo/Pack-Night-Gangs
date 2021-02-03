Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 2
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 106, b = 188 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true 
Config.EnableNonFreemodePeds      = false 
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.MarabuntaStations = {

  Marabunta = {

    Blip = {
      Pos     = {},
      Sprite  = -1,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    -- Config des armes pour l'armurerie

    AuthorizedWeapons = {
      --{ name = 'WEAPON_COMBATPISTOL',     price = 500 },
     -- { name = 'WEAPON_ASSAULTSMG',       price = 15000 },
      --{ name = 'WEAPON_ASSAULTRIFLE',     price = 500 },
      -- { name = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      -- { name = 'WEAPON_STUNGUN',          price = 250 },
     -- { name = 'WEAPON_FLASHLIGHT',       price = 50 },
     -- { name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      -- { name = 'WEAPON_FLAREGUN',         price = 3000 },
    --  { name = 'GADGET_PARACHUTE',        price = 2000 },
      -- { name = 'WEAPON_SNIPERRIFLE',      price = 50000 },
      -- { name = 'WEAPON_FIREWORK',         price = 5000 },
      -- { name = 'WEAPON_BZGAS',            price = 8000 },
      -- { name = 'WEAPON_SMOKEGRENADE',     price = 8000 },
     -- { name = 'WEAPON_APPISTOL',         price = 12000 },
     -- { name = 'WEAPON_CARBINERIFLE',     price = 25000 },
      -- { name = 'WEAPON_HEAVYSNIPER',      price = 100000 },
     -- { name = 'WEAPON_FLARE',            price = 8000 },
      --{ name = 'WEAPON_SWITCHBLADE',      price = 500 },
	 -- { name = 'WEAPON_REVOLVER',         price = 6000 },
	 -- { name = 'WEAPON_POOLCUE',          price = 100 },
	  -- { name = 'WEAPON_GUSENBERG',        price = 17500 },
	  
    },

	  AuthorizedVehicles = { -- Véhicules dans le garage marabunta
		  { name = 'buffalo2',    label = 'Buffalo Sport' },
		  { name = 'pony2',  label = 'Camionette' },
		  { name = 'manchez',     label = 'Manchez' },
		  { name = 'chino2',     label = 'Lowrider' },
	  },

    Cloakrooms = { -- Vestaire
      { x = 1441.85, y = -1496.11, z = 63.1 }, 
    },

    Armories = { -- Armurerie
      { x = 152.56, y = -1000.93, z = -98.8 }, 
    },

    Vehicles = { -- Garage
      {
        Spawner    = { x = 1440.13, y = -1499.82, z = 62.8 }, 
        SpawnPoint = { x = 1428.92, y = -1511.58, z = 61.1 }, 
        Heading    = 112.5, 
      }
    },

    VehicleDeleters = {
      { x = 1422.26, y = -1505.05, z = 60.6 }, 
    },

    BossActions = { -- Action du boss recruter...
      { x = 1437.06, y = -1489.16, z = 66.58 } 
    },

  },

}

--create ﾒﾒﾒﾒ#4779