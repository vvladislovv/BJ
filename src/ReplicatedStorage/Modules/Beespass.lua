local Beespass = {}

Beespass.Images = {
	["Classic"] = {
		Image = "http://www.roblox.com/asset/?id=10249162705",
		Hover = "http://www.roblox.com/asset/?id=10249163851",
	},
	["Rare"] = {
		Image = "http://www.roblox.com/asset/?id=10249062538",
		Hover = "http://www.roblox.com/asset/?id=10249077096",
	},
	["Epic"] = {
		Image = "http://www.roblox.com/asset/?id=10249109224",
		Hover = "http://www.roblox.com/asset/?id=10249110745",
	},
	["Legendary"] = {
		Image = "http://www.roblox.com/asset/?id=10249112692",
		Hover = "http://www.roblox.com/asset/?id=10249114063",
	},
	["Grand"] = {
		Image = "http://www.roblox.com/asset/?id=10257697706",
		Hover = "http://www.roblox.com/asset/?id=10257699878",
	},
	["Ready"] = {
		Image = "http://www.roblox.com/asset/?id=10257996022",
		Hover = "http://www.roblox.com/asset/?id=10258202550",
	},
}

Beespass.Free = {
	[1] = {
		Image = "http://www.roblox.com/asset/?id=10182558977",
		Xp = 100,
		Rewards = {
			["Fertilizer"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Rare"
	},
	[2] = {
		Image = "http://www.roblox.com/asset/?id=8640150472",
		Xp = 125,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Classic"
	},
	[3] = {
		Image = "http://www.roblox.com/asset/?id=9679523465",
		Xp = 150,
		Rewards = {
			["Honey"] = {
				Type = "IStats",
				Amount = 7500,
			},
		},
		Rarity = "Epic"
	},
	[4] = {
		Image = "rbxassetid://8602349626",
		Xp = 175,
		Rewards = {
			["Sprout"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Classic"
	},
	[5] = {
		Image = "http://www.roblox.com/asset/?id=10111315888",
		Xp = 200,
		Rewards = {
			["Gifted Jelly"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Legendary"
	},
	[6] = {
		Image = "http://www.roblox.com/asset/?id=9646728824",
		Xp = 225,
		Rewards = {
			["Butter"] = {
				Type = "Inventory",
				Amount = 2,
			},
		},
		Rarity = "Classic"
	},
	[7] = {
		Image = "rbxassetid://9080969518",
		Xp = 250,
		Rewards = {
			["Rare Sprout"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Rare"
	},
	[8] = {
		Image = "http://www.roblox.com/asset/?id=8640150472",
		Xp = 275,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 10,
			},
		},
		Rarity = "Epic"
	},
	[9] = {
		Image = "http://www.roblox.com/asset/?id=9647286588",
		Xp = 300,
		Rewards = {
			["Instant Converter"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Classic"
	},
	[10] = {
		Image = "rbxassetid://8427450912",
		Xp = 350,
		Rewards = {
			["Golden Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Legendary"
	},
	[11] = {
		Image = "http://www.roblox.com/asset/?id=9252379440",
		Xp = 400,
		Rewards = {
			["Caramel"] = {
				Type = "Inventory",
				Amount = 15,
			},
		},
		Rarity = "Rare"
	},
	[12] = {
		Image = "rbxassetid://8730752530",
		Xp = 425,
		Rewards = {
			["Royal Jelly"] = {
				Type = "Inventory",
				Amount = 5,
			},
		},
		Rarity = "Classic"
	},
	[13] = {
		Image = "http://www.roblox.com/asset/?id=9911777787",
		Xp = 450,
		Rewards = {
			["Firefly Vial"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Epic"
	},
	[14] = {
		Image = "http://www.roblox.com/asset/?id=9518907653",
		Xp = 475,
		Rewards = {
			["Shroom"] = {
				Type = "Inventory",
				Amount = 15,
			},
		},
		Rarity = "Classic"
	},
	[15] = {
		Image = "http://www.roblox.com/asset/?id=10244938074",
		Xp = 500,
		Rewards = {
			["Gifted Silver Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[16] = {
		Image = "http://www.roblox.com/asset/?id=10257800380",
		Xp = 525,
		Rewards = {
			["Sugar"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Cookie"] = {
				Type = "Inventory",
				Amount = 55,
			},
		},
		Rarity = "Classic"
	},
	[17] = {
		Image = "http://www.roblox.com/asset/?id=10257861548",
		Xp = 550,
		Rewards = {
			["Caramel Bottle"] = {
				Type = "Inventory",
				Amount = 3,
			},
			["Honey"] = {
				Type = "IStats",
				Amount = 15000,
			},
		},
		Rarity = "Rare"
	},
	[18] = {
		Image = "http://www.roblox.com/asset/?id=10258244784",
		Xp = 575,
		Rewards = {
			["Strawberry"] = {
				Type = "Inventory",
				Amount = 25,
			},
			["Blueberry"] = {
				Type = "Inventory",
				Amount = 25,
			},
		},
		Rarity = "Classic"
	},
	[19] = {
		Image = "http://www.roblox.com/asset/?id=10258271681",
		Xp = 600,
		Rewards = {
			["Epic Sprout"] = {
				Type = "Inventory",
				Amount = 1,
			},
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Epic"
	},
	[20] = {
		Image = "http://www.roblox.com/asset/?id=9962746736",
		Xp = 625,
		Rewards = {
			["Night-Bell"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Legendary"
	},
	[21] = {
		Image = "http://www.roblox.com/asset/?id=10258422206",
		Xp = 650,
		Rewards = {
			["Loot Luck"] = {
				Type = "AllStats",
				Amount = 15,
				P = "Percent",
			},
		},
		Rarity = "Epic"
	},
	[22] = {
		Image = "http://www.roblox.com/asset/?id=10258595917",
		Xp = 675,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 15,
			},
		},
		Rarity = "Classic"
	},
	[23] = {
		Image = "http://www.roblox.com/asset/?id=10259386455",
		Xp = 700,
		Rewards = {
			["Blueberry Juice"] = {
				Type = "Inventory",
				Amount = 5,
			},
			["Strawberry Juice"] = {
				Type = "Inventory",
				Amount = 5,
			},
		},
		Rarity = "Rare"
	},
	[24] = {
		Image = "http://www.roblox.com/asset/?id=9679523465",
		Xp = 725,
		Rewards = {
			["Honey"] = {
				Type = "IStats",
				Amount = 27500,
			},
		},
		Rarity = "Classic"
	},
	[25] = {
		Image = "rbxassetid://8427446329",
		Xp = 750,
		Rewards = {
			["Diamond Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Legendary"
	},
	[26] = {
		Image = "http://www.roblox.com/asset/?id=10259599761",
		Xp = 775,
		Rewards = {
			["Rare Sprout"] = {
				Type = "Inventory",
				Amount = 2,
			},
			["Seed"] = {
				Type = "Inventory",
				Amount = 50,
			},
		},
		Rarity = "Rare"
	},
	[27] = {
		Image = "http://www.roblox.com/asset/?id=10259653321",
		Xp = 800,
		Rewards = {
			["Cookie"] = {
				Type = "Inventory",
				Amount = 250,
			},
			["Shroom"] = {
				Type = "Inventory",
				Amount = 75,
			},
		},
		Rarity = "Classic"
	},
	[28] = {
		Image = "http://www.roblox.com/asset/?id=10259693184",
		Xp = 825,
		Rewards = {
			["Fertilizer"] = {
				Type = "Inventory",
				Amount = 3,
			},
			["Butter"] = {
				Type = "Inventory",
				Amount = 5,
			},
		},
		Rarity = "Epic"
	},
	[29] = {
		Image = "http://www.roblox.com/asset/?id=10259750133",
		Xp = 850,
		Rewards = {
			["Royal Jelly"] = {
				Type = "Inventory",
				Amount = 25,
			},
			["Ticket"] = {
				Type = "Inventory",
				Amount = 10,
			},
		},
		Rarity = "Rare"
	},
	[30] = {
		Image = "http://www.roblox.com/asset/?id=10259791504",
		Xp = 875,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 100,
			},
		},
		Rarity = "Grand"
	},
	[31] = {
		Image = "http://www.roblox.com/asset/?id=10260307621",
		Xp = 900,
		Rewards = {
				["White Pollen"] = {
				Type = "AllStats",
				Amount = 10,
				P = "Percent",
			},
		},
		Rarity = "Epic"
	},
	[32] = {
		Image = "http://www.roblox.com/asset/?id=10260339034",
		Xp = 925,
		Rewards = {
				["Sprout"] = {
					Type = "Inventory",
					Amount = 10,
				},
		},
		Rarity = "Classic"
	},
	[33] = {
		Image = "http://www.roblox.com/asset/?id=10260377748",
		Xp = 950,
		Rewards = {
				["Silver Egg"] = {
					Type = "Inventory",
					Amount = 1,
				},
				["Pollen From Tools"] = {
					Type = "AllStats",
					Amount = 25,
					P = "Percent",
			},
		},
		Rarity = "Rare"
	},
	[34] = {
		Image = "http://www.roblox.com/asset/?id=10261498928",
		Xp = 975,
		Rewards = {
				["Caramel Bottle"] = {
					Type = "Inventory",
					Amount = 7,
				},
				["Butter"] = {
					Type = "Inventory",
					Amount = 7,
				},
				["Caramel"] = {
					Type = "Inventory",
					Amount = 35,
			},
		},
		Rarity = "Classic"
	},
	[35] = {
		Image = "http://www.roblox.com/asset/?id=10261529594",
		Xp = 1000,
		Rewards = {
				["Gifted Jelly"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Legendary"
	},
	[36] = {
		Image = "http://www.roblox.com/asset/?id=10262564003",
		Xp = 1050,
		Rewards = {
			["Legendary Sprout"] = {
				Type = "Inventory",
				Amount = 1,
			},
			["Epic Sprout"] = {
				Type = "Inventory",
				Amount = 2,
			},
			["Rare Sprout"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Epic"
	},
	[37] = {
		Image = "http://www.roblox.com/asset/?id=10262598331",
		Xp = 1100,
		Rewards = {
			["Fertilizer"] = {
				Type = "Inventory",
				Amount = 10,
			},
			["Ticket"] = {
				Type = "Inventory",
				Amount = 25,
			},
			["Blue Pollen"] = {
				Type = "AllStats",
				Amount = 15,
				P = "Percent",
			},
		},
		Rarity = "Rare"
	},
	[38] = {
		Image = "http://www.roblox.com/asset/?id=10262632568",
		Xp = 1150,
		Rewards = {
			["Strawberry"] = {
				Type = "Inventory",
				Amount = 150,
			},
			["Seed"] = {
				Type = "Inventory",
				Amount = 150,
			},
			["Blueberry"] = {
				Type = "Inventory",
				Amount = 150,
			},
		},
		Rarity = "Classic"
	},
	[39] = {
		Image = "http://www.roblox.com/asset/?id=10262660155",
		Xp = 1200,
		Rewards = {
			["Book"] = {
				Type = "Inventory",
				Amount = 3,
			},
			["Enchanted Book"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Classic"
	},
	[40] = {
		Image = "http://www.roblox.com/asset/?id=10259296261",
		Xp = 1250,
		Rewards = {
			["Mythic Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[41] = {
		Image = "http://www.roblox.com/asset/?id=10262701353",
		Xp = 1300,
		Rewards = {
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Sugar"] = {
				Type = "Inventory",
				Amount = 300,
			},
		},
		Rarity = "Rare"
	},
	[42] = {
		Image = "http://www.roblox.com/asset/?id=10263107841",
		Xp = 1325,
		Rewards = {
			["Caramel Bottle"] = {
				Type = "Inventory",
				Amount = 10,
			},
			["Caramel"] = {
				Type = "Inventory",
				Amount = 75,
			},
		},
		Rarity = "Classic"
	},
	[43] = {
		Image = "http://www.roblox.com/asset/?id=10263165806",
		Xp = 1350,
		Rewards = {
			["Strawberry Juice"] = {
				Type = "Inventory",
				Amount = 10,
			},
			["Strawberry"] = {
				Type = "Inventory",
				Amount = 250,
			},
			["Red Pollen"] = {
				Type = "AllStats",
				Amount = 15,
				P = "Percent",
			},
		},
		Rarity = "Epic"
	},
	[44] = {
		Image = "http://www.roblox.com/asset/?id=10111315888",
		Xp = 1350,
		Rewards = {
			["Gifted Jelly"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Classic"
	},
	[45] = {
		Image = "http://www.roblox.com/asset/?id=10244938995",
		Xp = 1375,
		Rewards = {
			["Gifted Golden Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Legendary"
	},
	[46] = {
		Image = "http://www.roblox.com/asset/?id=10258595917",
		Xp = 1400,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 50,
			},
		},
		Rarity = "Rare"
	},
	[47] = {
		Image = "http://www.roblox.com/asset/?id=9679523465",
		Xp = 1450,
		Rewards = {
			["Honey"] = {
				Type = "IStats",
				Amount = 150000,
			},
		},
		Rarity = "Classic"
	},
	[48] = {
		Image = "http://www.roblox.com/asset/?id=9332878411",
		Xp = 1475,
		Rewards = {
			["Legendary Sprout"] = {
				Type = "Inventory",
				Amount = 2,
			},
		},
		Rarity = "Epic"
	},
	[49] = {
		Image = "http://www.roblox.com/asset/?id=10262632568",
		Xp = 1500,
		Rewards = {
			["Seed"] = {
				Type = "Inventory",
				Amount = 250,
			},
			["Strawberry"] = {
				Type = "Inventory",
				Amount = 250,
			},
			["Blueberry"] = {
				Type = "Inventory",
				Amount = 250,
			},
		},
		Rarity = "Classic"
	},
	[50] = {
		Image = "http://www.roblox.com/asset/?id=9961078660",
		Xp = math.huge,
		Rewards = {
			["Star Cookie"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
}

Beespass.Paid = {
	[1] = {
		Image = "http://www.roblox.com/asset/?id=10261529594",
		Xp = 100,
		Rewards = {
			["Gifted Jelly"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Epic"
	},
	[2] = {
		Image = "http://www.roblox.com/asset/?id=10286067045",
		Xp = 125,
		Rewards = {
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 3,
			},
			["Caramel Bottle"] = {
				Type = "Inventory",
				Amount = 3,
			},
			["Cookie"] = {
				Type = "Inventory",
				Amount = 100,
			},
		},
		Rarity = "Rare"
	},
	[3] = {
		Image = "http://www.roblox.com/asset/?id=10260339034",
		Xp = 150,
		Rewards = {
			["Sprout"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Epic"
	},
	[4] = {
		Image = "http://www.roblox.com/asset/?id=10295595950",
		Xp = 175,
		Rewards = {
			["Book"] = {
				Type = "Inventory",
				Amount = 1,
			},
			["Honey"] = {
				Type = "IStats",
				Amount = 50000,
			},
		},
		Rarity = "Classic"
	},
	[5] = {
		Image = "http://www.roblox.com/asset/?id=10244938074",
		Xp = 200,
		Rewards = {
			["Gifted Silver Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[6] = {
		Image = "http://www.roblox.com/asset/?id=9657045478",
		Xp = 225,
		Rewards = {
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 5,
			},
		},
		Rarity = "Rare"
	},
	[7] = {
		Image = "rbxassetid://9080979925",
		Xp = 250,
		Rewards = {
			["Epic Sprout"] = {
				Type = "Inventory",
				Amount = 2,
			},
		},
		Rarity = "Epic"
	},
	[8] = {
		Image = "http://www.roblox.com/asset/?id=10258595917",
		Xp = 275,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 30,
			},
		},
		Rarity = "Legendary"
	},
	[9] = {
		Image = "http://www.roblox.com/asset/?id=10182558977",
		Xp = 300,
		Rewards = {
			["Fertilizer"] = {
				Type = "Inventory",
				Amount = 5,
			},
		},
		Rarity = "Epic"
	},
	[10] = {
		Image = "http://www.roblox.com/asset/?id=10244938995",
		Xp = 350,
		Rewards = {
			["Gifted Golden Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[11] = {
		Image = "http://www.roblox.com/asset/?id=10295648348",
		Xp = 400,
		Rewards = {
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 10,
			},
			["Instant Converter"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Rare"
	},
	[12] = {
		Image = "http://www.roblox.com/asset/?id=10261529594",
		Xp = 425,
		Rewards = {
			["Gifted Jelly"] = {
				Type = "Inventory",
				Amount = 6,
			},
		},
		Rarity = "Legendary"
	},
	[13] = {
		Image = "http://www.roblox.com/asset/?id=9252182292",
		Xp = 450,
		Rewards = {
			["Sugar"] = {
				Type = "Inventory",
				Amount = 100,
			},
		},
		Rarity = "Rare"
	},
	[14] = {
		Image = "http://www.roblox.com/asset/?id=9252379440",
		Xp = 475,
		Rewards = {
			["Caramel"] = {
				Type = "Inventory",
				Amount = 50,
			},
		},
		Rarity = "Epic"
	},
	[15] = {
		Image = "http://www.roblox.com/asset/?id=10341295876",
		Xp = 500,
		Rewards = {
			["Silky Bee Jelly"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[16] = {
		Image = "http://www.roblox.com/asset/?id=10295696662",
		Xp = 525,
		Rewards = {
			["Caramel Bottle"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Caramel"] = {
				Type = "Inventory",
				Amount = 100,
			},
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 10,
			},
		},
		Rarity = "Legendary"
	},
	[17] = {
		Image = "http://www.roblox.com/asset/?id=10295715666",
		Xp = 550,
		Rewards = {
			["Honey"] = {
				Type = "IStats",
				Amount = 1000000,
			},
		},
		Rarity = "Rare"
	},
	[18] = {
		Image = "http://www.roblox.com/asset/?id=9962746736",
		Xp = 575,
		Rewards = {
			["Night-Bell"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Classic"
	},
	[19] = {
		Image = "http://www.roblox.com/asset/?id=10259386455",
		Xp = 600,
		Rewards = {
			["Strawberry Juice"] = {
				Type = "Inventory",
				Amount = 5,
			},
			["Blueberry Juice"] = {
				Type = "Inventory",
				Amount = 5,
			},
		},
		Rarity = "Epic"
	},
	[20] = {
		Image = "http://www.roblox.com/asset/?id=10295793883",
		Xp = 625,
		Rewards = {
			["Instant Converter"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Fertilizer"] = {
				Type = "Inventory",
				Amount = 5,
			},
			["Caramel"] = {
				Type = "Inventory",
				Amount = 150,
			},
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 15,
			},
		},
		Rarity = "Legendary"
	},
	[21] = {
		Image = "http://www.roblox.com/asset/?id=10295761896",
		Xp = 650,
		Rewards = {
			["Pollen From Tools"] = {
				Type = "AllStats",
				Amount = 1.25,
				P = "Mult",
			},
		},
		Rarity = "Epic"
	},
	[22] = {
		Image = "http://www.roblox.com/asset/?id=10259791504",
		Xp = 675,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 250,
			},
		},
		Rarity = "Grand"
	},
	[23] = {
		Image = "http://www.roblox.com/asset/?id=9647286588",
		Xp = 700,
		Rewards = {
			["Instant Converter"] = {
				Type = "Inventory",
				Amount = 10,
			},
		},
		Rarity = "Rare"
	},
	[24] = {
		Image = "http://www.roblox.com/asset/?id=10295671447",
		Xp = 725,
		Rewards = {
			["Gifted Diamond Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
			["Gifted Jelly"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Legendary"
	},
	[25] = {
		Image = "http://www.roblox.com/asset/?id=9961078660",
		Xp = 750,
		Rewards = {
			["Star Cookie"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[26] = {
		Image = "http://www.roblox.com/asset/?id=9332878411",
		Xp = 775,
		Rewards = {
			["Legendary Sprout"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Epic"
	},
	[27] = {
		Image = "http://www.roblox.com/asset/?id=10341267290",
		Xp = 800,
		Rewards = {
			["Cookie"] = {
				Type = "Inventory",
				Amount = 10000,
			},
			["Strawberry"] = {
				Type = "Inventory",
				Amount = 250,
			},
			["Blueberry"] = {
				Type = "Inventory",
				Amount = 250,
			},
			["Seed"] = {
				Type = "Inventory",
				Amount = 250,
			},
		},
		Rarity = "Rare"
	},
	[28] = {
		Image = "http://www.roblox.com/asset/?id=10259693184",
		Xp = 825,
		Rewards = {
			["Fertilizer"] = {
				Type = "Inventory",
				Amount = 5,
			},
			["Butter"] = {
				Type = "Inventory",
				Amount = 10,
			},
		},
		Rarity = "Epic"
	},
	[29] = {
		Image = "rbxassetid://8730752530",
		Xp = 850,
		Rewards = {
			["Royal Jelly"] = {
				Type = "Inventory",
				Amount = 150,
			},
		},
		Rarity = "Rare"
	},
	[30] = {
		Image = "http://www.roblox.com/asset/?id=10346946077",
		Xp = 875,
		Rewards = {
			["Water-Beetle Bee Jelly"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[31] = {
		Image = "http://www.roblox.com/asset/?id=10341354691",
		Xp = 900,
		Rewards = {
			["Bee Movespeed"] = {
				Type = "AllStats",
				Amount = 10,
				P = "Percent",
			},
		},
		Rarity = "Epic"
	},
	[32] = {
		Image = "http://www.roblox.com/asset/?id=10341340422",
		Xp = 925,
		Rewards = {
			["Night-Bell"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Epic"
	},
	[33] = {
		Image = "rbxassetid://8427446329",
		Xp = 950,
		Rewards = {
			["Diamond Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Rare"
	},
	[34] = {
		Image = "http://www.roblox.com/asset/?id=10259791504",
		Xp = 975,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 500,
			},
		},
		Rarity = "Epic"
	},
	[35] = {
		Image = "http://www.roblox.com/asset/?id=10263285852",
		Xp = 1000,
		Rewards = {
			["Star Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[36] = {
		Image = "http://www.roblox.com/asset/?id=10341408868",
		Xp = 1050,
		Rewards = {
			["Legendary Sprout"] = {
				Type = "Inventory",
				Amount = 3,
			},
			["Epic Sprout"] = {
				Type = "Inventory",
				Amount = 5,
			},
			["Rare Sprout"] = {
				Type = "Inventory",
				Amount = 8,
			},
		},
		Rarity = "Epic"
	},
	[37] = {
		Image = "http://www.roblox.com/asset/?id=10341447582",
		Xp = 1100,
		Rewards = {
			["Enchanted Book"] = {
				Type = "Inventory",
				Amount = 1,
			},
			["Ticket"] = {
				Type = "Inventory",
				Amount = 25,
			},
			["Capacity"] = {
				Type = "AllStats",
				Amount = 15,
				P = "Percent",
			},
		},
		Rarity = "Epic"
	},
	[38] = {
		Image = "http://www.roblox.com/asset/?id=10259386455",
		Xp = 1150,
		Rewards = {
			["Strawberry Juice"] = {
				Type = "Inventory",
				Amount = 25,
			},
			["Blueberry Juice"] = {
				Type = "Inventory",
				Amount = 25,
			},
		},
		Rarity = "Rare"
	},
	[39] = {
		Image = "http://www.roblox.com/asset/?id=10341550112",
		Xp = 1200,
		Rewards = {
			["Shroom"] = {
				Type = "Inventory",
				Amount = 75,
			},
			["Sugar"] = {
				Type = "Inventory",
				Amount = 150,
			},
			["Pollen"] = {
				Type = "AllStats",
				Amount = 1.1,
				P = "Mult",
			},
		},
		Rarity = "Epic"
	},
	[40] = {
		Image = "http://www.roblox.com/asset/?id=10346940420",
		Xp = 1250,
		Rewards = {
			["Bedbug Bee Jelly"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Grand"
	},
	[41] = {
		Image = "http://www.roblox.com/asset/?id=10295793883",
		Xp = 1300,
		Rewards = {
			["Instant Converter"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Fertilizer"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Caramel"] = {
				Type = "Inventory",
				Amount = 350,
			},
			["Energy Drink"] = {
				Type = "Inventory",
				Amount = 35,
			},
		},
		Rarity = "Epic"
	},
	[42] = {
		Image = "http://www.roblox.com/asset/?id=10295715666",
		Xp = 1325,
		Rewards = {
			["Honey"] = {
				Type = "IStats",
				Amount = 10000000,
			},
		},
		Rarity = "Rare"
	},
	[43] = {
		Image = "http://www.roblox.com/asset/?id=10261498928",
		Xp = 1350,
		Rewards = {
			["Caramel Bottle"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Butter"] = {
				Type = "Inventory",
				Amount = 15,
			},
			["Caramel"] = {
				Type = "Inventory",
				Amount = 135,
			},
		},
		Rarity = "Epic"
	},
	[44] = {
		Image = "http://www.roblox.com/asset/?id=10261529594",
		Xp = 1350,
		Rewards = {
			["Gifted Jelly"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Legendary"
	},
	[45] = {
		Image = "http://www.roblox.com/asset/?id=10295595950",
		Xp = 1375,
		Rewards = {
			["Book"] = {
				Type = "Inventory",
				Amount = 3,
			},
			["Honey"] = {
				Type = "IStats",
				Amount = 500000,
			},
		},
		Rarity = "Epic"
	},
	[46] = {
		Image = "http://www.roblox.com/asset/?id=10258595917",
		Xp = 1400,
		Rewards = {
			["Ticket"] = {
				Type = "Inventory",
				Amount = 50,
			},
		},
		Rarity = "Rare"
	},
	[47] = {
		Image = "http://www.roblox.com/asset/?id=10244940227",
		Xp = 1450,
		Rewards = {
			["Gifted Diamond Egg"] = {
				Type = "Inventory",
				Amount = 1,
			},
		},
		Rarity = "Legendary"
	},
	[48] = {
		Image = "http://www.roblox.com/asset/?id=10341701909",
		Xp = 1475,
		Rewards = {
			["Legendary Sprout"] = {
				Type = "Inventory",
				Amount = 5,
			},
		},
		Rarity = "Epic"
	},
	[49] = {
		Image = "http://www.roblox.com/asset/?id=10262632568",
		Xp = 1500,
		Rewards = {
			["Seed"] = {
				Type = "Inventory",
				Amount = 500,
			},
			["Strawberry"] = {
				Type = "Inventory",
				Amount = 500,
			},
			["Blueberry"] = {
				Type = "Inventory",
				Amount = 500,
			},
		},
		Rarity = "Rare"
	},
	[50] = {
		Image = "http://www.roblox.com/asset/?id=10341609184",
		Xp = math.huge,
		Rewards = {
			["Star Cookie"] = {
				Type = "Inventory",
				Amount = 3,
			},
		},
		Rarity = "Grand"
	},
}

return Beespass
