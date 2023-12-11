local module = {}

module.Balls = {
	["Classic"] = {
		["Ticket"] = {
			Amount = {1,3,5},
			Chance = 250,
		},
		["Seed"] = {
			Amount = {1,5},
			Chance = 750,
		},
		["Blueberry"] = {
			Amount = {1,5},
			Chance = 750,
		},
		["Strawberry"] = {
			Amount = {1,5},
			Chance = 750,
		},
		["Honey"] = {
			Amount = {150,500},
			Chance = 750,
		},
	},
	["Rare"] = {
		["Ticket"] = {
			Amount = {1,3,5},
			Chance = 250,
		},
		["Seed"] = {
			Amount = {5,10,15},
			Chance = 750,
		},
		["Blueberry"] = {
			Amount = {5,10,15},
			Chance = 750,
		},
		["Strawberry"] = {
			Amount = {5,10,15},
			Chance = 750,
		},
		["Honey"] = {
			Amount = {500,750,1000},
			Chance = 750,
		},
		["Blueberry Juice"] = {
			Amount = {1,2,3},
			Chance = 250,
		},
		["Strawberry Juice"] = {
			Amount = {1,2,3},
			Chance = 250,
		},
		["Caramel Bottle"] = {
			Amount = {1,2,3},
			Chance = 250,
		},
		["Silver Egg"] = {
			Amount = {1},
			Chance = 10,
		},
		["Fertilizer"] = {
			Amount = {1,2,3},
			Chance = 50,
		},
		["Butter"] = {
			Amount = {1,2,3},
			Chance = 250,
		},
		["Energy Drink"] = {
			Amount = {1,2,3},
			Chance = 250,
			Type = "Inventory"
		},
	},
	["Epic"] = {
		["Seed"] = {
			Amount = {15,25,35},
			Chance = 450,
		},
		["Ticket"] = {
			Amount = {1,3,5},
			Chance = 250,
		},
		["Blueberry"] = {
			Amount = {15,25,35},
			Chance = 450,
		},
		["Strawberry"] = {
			Amount = {15,25,35},
			Chance = 450,
		},
		["Honey"] = {
			Amount = {1000,2000,3000},
			Chance = 450,
		},
		["Blueberry Juice"] = {
			Amount = {1,2,3},
			Chance = 350,
		},
		["Strawberry Juice"] = {
			Amount = {1,2,3},
			Chance = 350,
		},
		["Caramel Bottle"] = {
			Amount = {1,2,3},
			Chance = 350,
		},
		["Silver Egg"] = {
			Amount = {1},
			Chance = 100,
		},
		["Golden Egg"] = {
			Amount = {1},
			Chance = 50,
		},
		["Fertilizer"] = {
			Amount = {1,2,3},
			Chance = 150,
		},
		["Butter"] = {
			Amount = {1,2,3},
			Chance = 350,
		},
		["Energy Drink"] = {
			Amount = {1,2,3},
			Chance = 350,
			Type = "Inventory"
		},
	},
	["Legendary"] = {
		["Seed"] = {
			Amount = {25,50,75},
			Chance = 250,
		},
		["Ticket"] = {
			Amount = {1,3,5},
			Chance = 450,
		},
		["Blueberry"] = {
			Amount = {25,50,75},
			Chance = 250,
		},
		["Strawberry"] = {
			Amount = {25,50,75},
			Chance = 250,
		},
		["Honey"] = {
			Amount = {10000,20000,30000},
			Chance = 750,
		},
		["Blueberry Juice"] = {
			Amount = {1,2,3},
			Chance = 500,
		},
		["Strawberry Juice"] = {
			Amount = {1,2,3},
			Chance = 500,
		},
		["Caramel Bottle"] = {
			Amount = {1,2,3},
			Chance = 500,
		},
		["Silver Egg"] = {
			Amount = {1},
			Chance = 100,
		},
		["Golden Egg"] = {
			Amount = {1},
			Chance = 50,
		},
		["Diamond Egg"] = {
			Amount = {1},
			Chance = 10,
		},
		["Fertilizer"] = {
			Amount = {1,2,3},
			Chance = 250,
		},
		["Butter"] = {
			Amount = {1,2,3},
			Chance = 500,
		},
		["Energy Drink"] = {
			Amount = {1,2,3},
			Chance = 500,
			Type = "Inventory"
		},
	},
	["Mythic"] = {
		["Seed"] = {
			Amount = {25,50,75},
			Chance = 1000,
		},
		["Ticket"] = {
			Amount = {1,3,5},
			Chance = 1000,
		},
		["Blueberry"] = {
			Amount = {25,50,75},
			Chance = 1000,
		},
		["Strawberry"] = {
			Amount = {25,50,75},
			Chance = 1000,
		},
		["Honey"] = {
			Amount = {10000,20000,30000},
			Chance = 1000,
		},
		["Blueberry Juice"] = {
			Amount = {1,2,3},
			Chance = 1000,
		},
		["Strawberry Juice"] = {
			Amount = {1,2,3},
			Chance = 1000,
		},
		["Caramel Bottle"] = {
			Amount = {1,2,3},
			Chance = 1000,
		},
		["Silver Egg"] = {
			Amount = {1},
			Chance = 150,
		},
		["Golden Egg"] = {
			Amount = {1},
			Chance = 100,
		},
		["Diamond Egg"] = {
			Amount = {1},
			Chance = 50,
		},
		["Fertilizer"] = {
			Amount = {1,2,3},
			Chance = 1000,
		},
		["Butter"] = {
			Amount = {1,2,3},
			Chance = 1000,
		},
		["Energy Drink"] = {
			Amount = {1,2,3},
			Chance = 1000,
			Type = "Inventory"
		},
	},
}

return module
