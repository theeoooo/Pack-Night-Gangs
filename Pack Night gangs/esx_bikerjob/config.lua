Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 2
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 0, b = 10, }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true 
Config.EnableNonFreemodePeds      = false 
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.bikerStations = {

  biker = {

    Blip = {
      Pos     = {},
      Sprite  = -1,
      Display = 4,
      Scale   = 1.2,
      Colour  = 85,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 500 },
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

	  AuthorizedVehicles = {
		  { name = 'manchez',    label = 'manchez' },
		  { name = 'akuma',     label = 'akuma' },
		  { name = 'hexer',     label = 'hexer' },
	  },

    Cloakrooms = {
      { x = 0, y = 0, z = 0 }, -- fait
    },

    Armories = {
      { x = 975.17, y = -95.83, z = 74.85 }, -- fait
    },

    Vehicles = {
      {
        Spawner    = { x = 955.91, y = -124.53, z = 74.35 }, -- fait
        SpawnPoint = { x = 969.17, y = -130.06, z = 74.37 }, -- fait
        Heading    = 112.5, -- fait
      }
    },

    VehicleDeleters = {
      { x = 984.24, y = -113.97, z = 73.97 } -- fait
    },

    BossActions = {
      { x = 976.54, y = -103.39, z = 74.85 } -- fait
    },

  },

}