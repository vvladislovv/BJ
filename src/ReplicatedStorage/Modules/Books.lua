local module = {}

module.MakeSpell = {
	[1] = {
		Cost = 50,

		Chance = {
			Default = 9000,
			Rare = 600,
			Epic = 380,
			Legendary = 19,
			Mythic = 1,
		}
	},
	[2] = {
		Cost = 100,

		Chance = {
			Default = 8500,
			Rare = 1000,
			Epic = 350,
			Legendary = 125,
			Mythic = 25,
		}
	},
	[3] = {
		Cost = 200,

		Chance = {
			Default = 7000,
			Rare = 2000,
			Epic = 600,
			Legendary = 300,
			Mythic = 100,
		}
	},
	[4] = {
		Cost = 500,

		Chance = {
			Default = 6200,
			Rare = 1500,
			Epic = 1000,
			Legendary = 900,
			Mythic = 400,
		}
	},
}

module.Books = {
	["Default"] = {
		Count = 1,
		AvaibledStats = {
			["Pollen"] = {5,10},
			["Red Pollen"] = {5,10},
			["White Pollen"] = {5,10},
			["Blue Pollen"] = {5,10},

			["Instant"] = {1,3},
			["Red Instant"] = {1,3},
			["White Instant"] = {1,3},
			["Blue Instant"] = {1,3},

			--["Bomb Pollen"] = {5,15},
			--["Red Bomb Pollen"] = {5,15},
			--["White Bomb Pollen"] = {5,15},
			--["Blue Bomb Pollen"] = {5,15},

			--["Bomb Instant"] = {1,5},
			--["Red Bomb Instant"] = {1,5},
			--["White Bomb Instant"] = {1,5},
			--["Blue Bomb Instant"] = {1,5},

			["Player Movespeed"] = {3,15},
			["Jump Power"] = {3,15},

			["Capacity"] = {1,10},
			["Caramel"] = {1,10},
			["Flame Duration"] = {1,5},
		},
	},
	["Rare"] = {
		Count = 1,
		AvaibledStats = {
			["Pollen"] = {10,20},
			["Red Pollen"] = {10,20},
			["White Pollen"] = {10,20},
			["Blue Pollen"] = {10,20},

			["Instant"] = {1,5},
			["Red Instant"] = {1,5},
			["White Instant"] = {1,5},
			["Blue Instant"] = {1,5},

			["Bomb Pollen"] = {15,30},
			["Red Bomb Pollen"] = {15,30},
			["White Bomb Pollen"] = {15,30},
			["Blue Bomb Pollen"] = {15,30},

			["Bomb Instant"] = {2,6},
			["Red Bomb Instant"] = {2,6},
			["White Bomb Instant"] = {2,6},
			["Blue Bomb Instant"] = {2,6},

			["Player Movespeed"] = {6,21},
			["Jump Power"] = {6,21},

			["Capacity"] = {5,20},
			["Caramel"] = {3,15},
			["Flame Duration"] = {2,7},
		},
	},
	["Epic"] = {
		Count = 2,
		AvaibledStats = {
			["Pollen"] = {20,40},
			["Red Pollen"] = {20,40},
			["White Pollen"] = {20,40},
			["Blue Pollen"] = {20,40},

			["Instant"] = {4,7},
			["Red Instant"] = {4,7},
			["White Instant"] = {4,7},
			["Blue Instant"] = {4,7},

			["Bomb Pollen"] = {25,60},
			["Red Bomb Pollen"] = {25,60},
			["White Bomb Pollen"] = {25,60},
			["Blue Bomb Pollen"] = {25,60},

			["Bomb Instant"] = {4,8},
			["Red Bomb Instant"] = {4,8},
			["White Bomb Instant"] = {4,8},
			["Blue Bomb Instant"] = {4,8},

			["Player Movespeed"] = {9,24},
			["Jump Power"] = {9,24},

			["Capacity"] = {15,50},
			["Caramel"] = {10,25},
			["Flame Duration"] = {5,15},
		},
	},
}

return module
