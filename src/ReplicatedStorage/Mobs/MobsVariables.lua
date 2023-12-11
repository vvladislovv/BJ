local module = {}

module.Mobs = {
	
	["Termit"] = {
		Speed = 6,
		Damage = 10,
		Health = 10,
		Level = 1,
		Dist = 50,
	},
	["Flying Termit"] = {
		Speed = 7,
		Damage = 15,
		Health = 50,
		Level = 1,
		Dist = 50,
	},
	["Soldier Termit"] = {
		Speed = 14,
		Damage = 25,
		Health = 25,
		Level = 1,
		Dist = 50,
	},
	["Pipe Termit"] = {
		Speed = 7,
		Damage = 5,
		Health = 5,
		Level = 1,
		Dist = 50,
	},
	
	["Ladybug"] = {
		Speed = 10,
		Damage = 10,
		Health = 10,
		Level = 1,
		Cooldown = 300,
		Dist = 50,
		Loot = {
			["Strawberry Juice"] = {
				Amount = 1,
				Chance = 100,
				Type = "Inventory"
			},
			["Strawberry"] = {
				Amount = 5,
				Chance = 500,
				Type = "Inventory"
			},
			["Honey"] = {
				Amount = 50,
				Chance = 1000,
				Type = "IStats"
			},
			["Battle Points"] = {
				Amount = 5,
				Chance = 1000,
				Type = "IStats"
			},
		},
	},
	["Rhino Beetle"] = {
		Speed = 10,
		Damage = 10,
		Health = 10,
		Level = 1,
		Cooldown = 300,
		Dist = 50,
		Loot = {
			["Blueberry Juice"] = {
				Amount = 1,
				Chance = 100,
				Type = "Inventory"
			},
			["Blueberry"] = {
				Amount = 5,
				Chance = 500,
				Type = "Inventory"
			},
			["Honey"] = {
				Amount = 50,
				Chance = 1000,
				Type = "IStats"
			},
			["Battle Points"] = {
				Amount = 5,
				Chance = 1000,
				Type = "IStats"
			},
		},
	},
	["Dragonfly"] = {
		Speed = 40,
		Damage = 15,
		Health = 350,
		Level = 4,
		Cooldown = 900,
		Dist = 100,
		Loot = {
			["Blueberry Juice"] = {
				Amount = 1,
				Chance = 250,
				Type = "Inventory"
			},
			["Blueberry"] = {
				Amount = 15,
				Chance = 500,
				Type = "Inventory"
			},
			["Honey"] = {
				Amount = 150,
				Chance = 1000,
				Type = "IStats"
			},
			["Battle Points"] = {
				Amount = 15,
				Chance = 1000,
				Type = "IStats"
			},
		},
	},
	["Butterfly"] = {
		Speed = 25,
		Damage = 15,
		Health = 350,
		Level = 4,
		Cooldown = 900,
		Dist = 100,
		Loot = {
			["Strawberry Juice"] = {
				Amount = 1,
				Chance = 250,
				Type = "Inventory"
			},
			["Strawberry"] = {
				Amount = 15,
				Chance = 500,
				Type = "Inventory"
			},
			["Honey"] = {
				Amount = 150,
				Chance = 1000,
				Type = "IStats"
			},
			["Battle Points"] = {
				Amount = 15,
				Chance = 1000,
				Type = "IStats"
			},
		},
	},
	["Silkworm"] = {
		Speed = 10,
		Damage = 25,
		Health = 500,
		Level = 7,
		Cooldown = 3600,
		Dist = 150,
		Loot = {
			["Gifted Royal Jelly"] = {
				Amount = 1,
				Chance = 10,
				Type = "Inventory"
			},
			["Gifted Silver Egg"] = {
				Amount = 1,
				Chance = 10,
				Type = "Inventory"
			},
			["Diamond Egg"] = {
				Amount = 1,
				Chance = 10,
				Type = "Inventory"
			},
			["Royal Jelly"] = {
				Amount = {1,5},
				Chance = 500,
				Type = "Inventory"
			},
			["Caramel"] = {
				Amount = {1,5},
				Chance = 500,
				Type = "Inventory"
			},
			["Cookie"] = {
				Amount = {5,15,25,50},
				Chance = 500,
				Type = "Inventory"
			},
			["Seed"] = {
				Amount = {5,15,25,50},
				Chance = 500,
				Type = "Inventory"
			},
			["Butter"] = {
				Amount = 1,
				Chance = 250,
				Type = "Inventory"
			},
			["Energy Drink"] = {
				Amount = 1,
				Chance = 250,
				Type = "Inventory"
			},
			["Honey"] = {
				Amount = 150,
				Chance = 1000,
				Type = "IStats"
			},
			["Battle Points"] = {
				Amount = 15,
				Chance = 1000,
				Type = "IStats"
			},
		},
	},
	["Frog"] = {
		Speed = 5,
		Damage = 15,
		Health = 25000000,
		Level = 5,
		Cooldown = 259200,
		Dist = 200,
		Amulet = true,
		Loot = {
			["Ticket"] = {
				Amount = {25,50,100,150,200,250},
				Chance = 1000,
				Type = "Inventory"
			},
			["Sugar"] = {
				Amount = {25,50,100,150,200,250},
				Chance = 1000,
				Type = "Inventory"
			},
			["Gifted Jelly"] = {
				Amount = {1,2,3,4,5,6,7,8,9,10},
				Chance = 1000,
				Type = "Inventory"
			},
			["Caramel Bottle"] = {
				Amount = {5,15,25,50,75,100},
				Chance = 1000,
				Type = "Inventory"
			},
			["Blueberry"] = {
				Amount = {10,25,50,100,150,200,250,300,350,400,450,500},
				Chance = 1000,
				Type = "Inventory"
			},
			["Cookie"] = {
				Amount = {100,250,500,1000,1500,2000,2500,3000,3500,4000,4500,5000,10000},
				Chance = 1000,
				Type = "Inventory"
			},
			["Fertilizer"] = {
				Amount = {5,7,10,13,15},
				Chance = 1000,
				Type = "Inventory"
			},
			["Silver Egg"] = {
				Amount = 1,
				Chance = 100,
				Type = "Inventory"
			},
			["Legendary Sprout"] = {
				Amount = 1,
				Chance = 25,
				Type = "Inventory"
			},
			["Epic Sprout"] = {
				Amount = {1,2},
				Chance = 50,
				Type = "Inventory"
			},
			["Rare Sprout"] = {
				Amount = {1,2,3},
				Chance = 100,
				Type = "Inventory"
			},
			["Sprout"] = {
				Amount = {1,2,3},
				Chance = 1000,
				Type = "Inventory"
			},
			["Golden Egg"] = {
				Amount = 1,
				Chance = 50,
				Type = "Inventory"
			},
			["Diamond Egg"] = {
				Amount = 1,
				Chance = 10,
				Type = "Inventory"
			},
			["Gifted Silver Egg"] = {
				Amount = 1,
				Chance = 10,
				Type = "Inventory"
			},
			["Gifted Golden Egg"] = {
				Amount = 1,
				Chance = 5,
				Type = "Inventory"
			},
			["Gifted Diamond Egg"] = {
				Amount = 1,
				Chance = 1,
				Type = "Inventory"
			},
			["Energy Drink"] = {
				Amount = {3,5,7},
				Chance = 250,
				Type = "Inventory"
			},
			["Honey"] = {
				Amount = 100000000,
				Chance = 1000,
				Type = "IStats"
			},
			["Battle Points"] = {
				Amount = 350,
				Chance = 1000,
				Type = "IStats"
			},
		},
	},
	["MolyCricket"] = {
		Speed = 5,
		Damage = 15,
		Health = 175000,
		Level = 5,
		Cooldown = 604800,
		Dist = 600,
		Loot = {
			["Ticket"] = {
				Amount = 50,
				Chance = 1000,
				Type = "Inventory"
			},
			["Cookie"] = {
				Amount = 250,
				Chance = 1000,
				Type = "Inventory"
			},
			["Caramel"] = {
				Amount = {5,10,15,35,50},
				Chance = 1000,
				Type = "Inventory"
			},
			["Royal Jelly"] = {
				Amount = {3,9,12,24},
				Chance = 1000,
				Type = "Inventory"
			},
			["Butter"] = {
				Amount = {1,2,3,5},
				Chance = 1000,
				Type = "Inventory"
			},
			["Caramel Bottle"] = {
				Amount = {1,2,3,5},
				Chance = 1000,
				Type = "Inventory"
			},
			["Strawberry Juice"] = {
				Amount = {1,2,3,5},
				Chance = 1000,
				Type = "Inventory"
			},
			["Blueberry Juice"] = {
				Amount = {1,2,3,5},
				Chance = 1000,
				Type = "Inventory"
			},
			["Fertilizer"] = {
				Amount = {1,2,3},
				Chance = 1000,
				Type = "Inventory"
			},
			["Night-Bell"] = {
				Amount = 1,
				Chance = 100,
				Type = "Inventory"
			},
			["Silver Egg"] = {
				Amount = 1,
				Chance = 50,
				Type = "Inventory"
			},
			["Golden Egg"] = {
				Amount = 1,
				Chance = 10,
				Type = "Inventory"
			},
			["Diamond Egg"] = {
				Amount = 1,
				Chance = 5,
				Type = "Inventory"
			},
			["Gifted Royal Jelly"] = {
				Amount = 1,
				Chance = 5,
				Type = "Inventory"
			},
			["Honey"] = {
				Amount = 25000000,
				Chance = 1000,
				Type = "IStats"
			},
			["Battle Points"] = {
				Amount = 250,
				Chance = 1000,
				Type = "IStats"
			},
		},
	},
}

return module
