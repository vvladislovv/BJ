local module = {}

module.TaskTypes = {
	["Classic"] = {
		{
			Amount = 3,
			TaskType = "HatchEgg",
			TaskParam = "Any",
			RewardType = "Pumpkin",
			Reward = 3
		},
		{
			Amount = 1,
			TaskType = "HatchEgg",
			TaskParam = "Basic",
			RewardType = "Pumpkin",
			Reward = 1
		},
		{
			Amount = 1,
			TaskType = "HatchEgg",
			TaskParam = "Mythic Egg",
			RewardType = "Pumpkin",
			Reward = 10
		},
		{
			Amount = 1,
			TaskType = "HatchEgg",
			TaskParam = "Gifted Mythic Egg",
			RewardType = "Pumpkin",
			Reward = 25
		},
		{
			Amount = 1,
			TaskType = "BuyFromEventShop",
			TaskParam = "Any",
			RewardType = "Pumpkin",
			Reward = 25
		},
		{
			Amount = 5,
			TaskType = "OpenBox",
			TaskParam = "Pumpkin",
			RewardType = "Skull",
			Reward = 3
		},
		{
			Amount = 1800,
			TaskType = "Playtime",
			TaskParam = "",
			RewardType = "Skull",
			Reward = 1
		},
	},
	["Premium"] = {
		{
			Amount = 5,
			TaskType = "OpenBox",
			TaskParam = "Pumpkin",
			RewardType = "Skull",
			Reward = 5,
			RewardType2 = "Pumpkin",
			Reward2 = 5,
		},
		{
			Amount = 5,
			TaskType = "FeedBees",
			TaskParam = "Strawberry",
			RewardType = "Skull",
			Reward = 5,
			RewardType2 = "Pumpkin",
			Reward2 = 5,
		},
		{
			Amount = 5,
			TaskType = "FeedBees",
			TaskParam = "Spoiled Cookie",
			RewardType = "Skull",
			Reward = 5,
			RewardType2 = "Pumpkin",
			Reward2 = 5,
		},
		{
			Amount = 10,
			TaskType = "FeedBees",
			TaskParam = "Blueberry",
			RewardType = "Skull",
			Reward = 1,
			RewardType2 = "Pumpkin",
			Reward2 = 25,
		},
		{
			Amount = 3,
			TaskType = "ReachPLevel",
			TaskParam = "Any",
			RewardType = "Skull",
			Reward = 5,
			RewardType2 = "Pumpkin",
			Reward2 = 10,
		},
	},
}

module.Progression = {
	{
		Goal = 0,
		Rewards = {
			{"Inventory", "Instant Converter", 10}
		},
	},
	{
		Goal = 10,
		Rewards = {
			{"Inventory", "Cookie", 1000}
		},
	},
	{
		Goal = 20,
		Rewards = {
			{"Inventory", "Ticket", 100}
		},
	},
	{
		Goal = 40,
		Rewards = {
			{"Inventory", "Skull", 1}
		},
	},
	{
		Goal = 70,
		Rewards = {
			{"Inventory", "Mythic Egg", 1}
		},
	},
	{
		Goal = 110,
		Rewards = {
			{"Inventory", "Night-Bell", 1}
		},
	},
	{
		Goal = 160,
		Rewards = {
			{"Inventory", "Legendary Sprout", 1}
		},
	},
	{
		Goal = 220,
		Rewards = {
			{"Inventory", "Ticket", 250}
		},
	},
	{
		Goal = 290,
		Rewards = {
			{"Inventory", "Book", 25}
		},
	},
	{
		Goal = 370,
		Rewards = {
			{"Inventory", "Star Cookie", 1}
		},
	},
}

module.Cases = {
	["Pumpkin"] = {
		GDrop = {
			{"Ticket", {1,5,10,25,50,100}, "Count", "Inventory"},
			{"Honey", {1000,2500000}, "Radius", "IStats"},
			{"Strawberry", {1,5,10,25,50,100,333}, "Count", "Inventory"},
			{"Blueberry", {1,5,10,25,50,100,333}, "Count", "Inventory"},
			{"Seed", {1,5,10,25,50,100,333}, "Count", "Inventory"},
			{"Strawberry Juice", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Blueberry Juice", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Energy Drink", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Fertilizer", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Caramel Bottle", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Butter", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Night-Bell", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Firefly Vial", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Rare Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Epic Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Legendary Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Cookie", {15,50,250,1000,5000,10000}, "Count", "Inventory"},
			{"Royal Jelly", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Gifted Jelly", {1,3,5}, "Count", "Inventory"},
			{"Caramel", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Sugar", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Book", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Instant Converter", {1,3,5,10,25,50}, "Count", "Inventory"},
		},
	},
	["Skull"] = {
		GDrop = {
			{"Ticket", {15,25,55,75,105,202}, "Count", "Inventory"},
			{"Honey", {500000,250000000}, "Radius", "IStats"},
			{"Strawberry", {15,25,50,100,250,500,999}, "Count", "Inventory"},
			{"Blueberry", {15,25,50,100,250,500,999}, "Count", "Inventory"},
			{"Seed", {15,25,50,100,250,500,999}, "Count", "Inventory"},
			{"Strawberry Juice", {5,7,12,27,52,75}, "Count", "Inventory"},
			{"Blueberry Juice", {5,7,12,27,52,75}, "Count", "Inventory"},
			{"Energy Drink", {5,7,12,27,52,75}, "Count", "Inventory"},
			{"Fertilizer", {5,7,12,27,52,75}, "Count", "Inventory"},
			{"Caramel Bottle", {5,7,12,27,52,75}, "Count", "Inventory"},
			{"Butter", {5,7,12,27,52,75}, "Count", "Inventory"},
			{"Night-Bell", {3,5,8,10,15,20}, "Count", "Inventory"},
			{"Firefly Vial", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Rare Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Epic Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Legendary Sprout", {1,3,5,10,25,50}, "Count", "Inventory"},
			{"Star Cookie", {1,2}, "Count", "Inventory"},
			{"Cookie", {50,150,500,2500,10000,50000}, "Count", "Inventory"},
			{"Royal Jelly", {15,25,55,100,125,250}, "Count", "Inventory"},
			{"Gifted Jelly", {3,5,10}, "Count", "Inventory"},
			{"Caramel", {25,50,150,250,500,1000}, "Count", "Inventory"},
			{"Sugar", {50,100,200,500,1000,2500}, "Count", "Inventory"},
			{"Book", {5,15,25,50,75,100}, "Count", "Inventory"},
			{"Instant Converter", {3,5,10,25,50,100}, "Count", "Inventory"},
		},
	},
	["Honey Comb"] = {

	},
}

return module
