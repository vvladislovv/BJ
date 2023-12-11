local Items = {} do
	Items.FieldTotemReward = {
		["Mushroom"] = {
			MinTokens = 2,
			MaxTokens = 7,
			Drop = {
				["Ticket"] = {Item = "Ticket", Chance = 1, APT = 1, Type = "Inventory"},
				["Honey"] = {Item = "Honey", Chance = 65, APT = 50, Type = "IStats"},
				["Strawberry"] = {Item = "Strawberry", Chance = 34, APT = 1, Type = "Inventory"},
				["Sugar"] = {Item = "Strawberry", Chance = 1, APT = 1, Type = "Inventory"},
			},
		},
		["Strawberry"] = {
			MinTokens = 2,
			MaxTokens = 7,
			Drop = {
				["Ticket"] = {Item = "Ticket", Chance = 1, APT = 1, Type = "Inventory"},
				["Honey"] = {Item = "Honey", Chance = 65, APT = 50, Type = "IStats"},
				["Strawberry"] = {Item = "Strawberry", Chance = 34, APT = 3, Type = "Inventory"},

				["Sugar"] = {Item = "Strawberry", Chance = 1, APT = 1, Type = "Inventory"},
			},
		},
	}
	
	Items.Equipments = {
		Belt = {},
		Boot = {},
		Hat = {},
	}
	
	Items.FieldSproutHPMultiplie = {
		["Mushroom"] = 2.5,
		["Sunflower"] = 2.5,
		["Blue Flowers"] = 2.5,
		["Red Flowers"] = 7.5,
		["Strawberry"] = 5,
		["Pumpkin"] = 5,
		["Daisy"] = 2.5,
		["Clover"] = 3,
		["Cactus"] = 5,
		["Cattail"] = 7.5,
		["Pine Tree"] = 5,
		["Dandelion"] = 7.5,
		["Mountain Top"] = 15,
	}
	
	Items.FieldsDrop = {
		["Daisy"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Cookie"] = {Name = "Cookie", Rarity = 50, APT = 1},
			["Sunflower"] = {Name = "Cookie", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Mushroom"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Strawberry"] = {Name = "Strawberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Strawberry"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Strawberry"] = {Name = "Strawberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Sunflower"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Seed"] = {Name = "Seed", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Pumpkin"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Seed"] = {Name = "Seed", Rarity =50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Blue Flowers"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Blueberry"] = {Name = "Blueberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Pine Tree"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Blueberry"] = {Name = "Blueberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Cactus"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Blueberry"] = {Name = "Blueberry", Rarity = 50, APT = 1},
			["Strawberry"] = {Name = "Strawberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Cattail"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Blueberry"] = {Name = "Blueberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Red Flowers"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Strawberry"] = {Name = "Strawberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Dandelion"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Seed"] = {Name = "Seed", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Cookie"] = {Name = "Cookie", Rarity = 50, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Bamboo"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Blueberry"] = {Name = "Seed", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Cookie"] = {Name = "Cookie", Rarity = 50, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Apple Tree"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Strawberry"] = {Name = "Seed", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Cookie"] = {Name = "Cookie", Rarity = 50, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
		["Clover"] = {
			["Honey"] = {Name = "Honey", Rarity = 99, APT = 1},
			["Blueberry"] = {Name = "Blueberry", Rarity = 50, APT = 1},
			["Strawberry"] = {Name = "Strawberry", Rarity = 50, APT = 1},
			["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 5, APT = 1},
			["Ticket"] = {Name = "Ticket", Rarity = 3, APT = 1},
			["Shroom"] = {Name = "Shroom", Rarity = 1, APT = 1},
		},
	}
	
	Items.SowersConfig = {
		["Toy"] = {
			Timer = 1800,
			Capacity = 25000,
			Rewards = 20,
			AuraBoost = 1,
			Color = "White",
			Drop = {
				White = {
					["Ticket"] = {Name = "Ticket", Chance = 16, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 50, APT = 5},
					["Seed"] = {Name = "Seed", Chance = 25, APT = 3},
					["Diamond Egg"] = {Name = "Diamond Egg", Chance = 0.0001, APT = 1},
					["Basic Egg"] = {Name = "Basic Egg", Chance = 0.9999, APT = 1},
				},
				Blue = {
					["Ticket"] = {Name = "Ticket", Chance = 16, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 50, APT = 5},
					["Diamond Egg"] = {Name = "Diamond Egg", Chance = 0.0001, APT = 1},
					["Basic Egg"] = {Name = "Basic Egg", Chance = 0.9999, APT = 1},
					["Blueberry"] = {Name = "Blueberry", Chance = 4, APT = 3},
				},
				Red = {
					["Ticket"] = {Name = "Ticket", Chance = 16, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 50, APT = 5},
					["Diamond Egg"] = {Name = "Diamond Egg", Chance = 0.0001, APT = 1},
					["Basic Egg"] = {Name = "Basic Egg", Chance = 0.9999, APT = 1},
					["Strawberry"] = {Name = "Strawberry", Chance = 4, APT = 3},
				},
			},
		},
		
		["Aquatic"] = {
			Timer = 7200,
			Capacity = 350000,
			Rewards = 70,
			AuraBoost = 5,
			Color = "Blue",
			Drop = {
				White = {
					["Ticket"] = {Name = "Ticket", Chance = 15, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 15, APT = 5},
					["Seed"] = {Name = "Seed", Chance = 50, APT = 3},
					["Blueberry"] = {Name = "Blueberry", Chance = 15, APT = 1},
					["Silver Egg"] = {Name = "Silver Egg", Chance = 0.5, APT = 1},
					["Blueberry Juice"] = {Name = "Blueberry Juice", Chance = 4.5, APT = 1},
				},
				Blue = {
					["Ticket"] = {Name = "Ticket", Chance = 15, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 15, APT = 5},
					["Blueberry"] = {Name = "Blueberry", Chance = 54, APT = 5},
					["Silver Egg"] = {Name = "Silver Egg", Chance = 0.5, APT = 1},
					["Blueberry Juice"] = {Name = "Blueberry Juice", Chance = 15.5, APT = 1},
				},
				Red = {
					["Ticket"] = {Name = "Ticket", Chance = 15, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 15, APT = 5},
					["Strawberry"] = {Name = "Strawberry", Chance = 50, APT = 3},
					["Blueberry"] = {Name = "Blueberry", Chance = 15, APT = 1},
					["Silver Egg"] = {Name = "Silver Egg", Chance = 0.5, APT = 1},
					["Blueberry Juice"] = {Name = "Blueberry Juice", Chance = 4.5, APT = 1},
				},
			},
		},
		
		["Heated"] = {
			Timer = 7200,
			Capacity = 350000,
			AuraBoost = 5,
			Rewards = 70,
			Color = "Red",
			Drop = {
				White = {
					["Ticket"] = {Name = "Ticket", Chance = 15, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 15, APT = 5},
					["Seed"] = {Name = "Seed", Chance = 50, APT = 3},
					["Strawberry"] = {Name = "Strawberry", Chance = 15, APT = 1},
					["Silver Egg"] = {Name = "Silver Egg", Chance = 0.5, APT = 1},
					["Strawberry Juice"] = {Name = "Strawberry Juice", Chance = 4.5, APT = 1},
				},
				Blue = {
					["Ticket"] = {Name = "Ticket", Chance = 15, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 15, APT = 5},
					["Strawberry"] = {Name = "Strawberry", Chance = 15, APT = 3},
					["Blueberry"] = {Name = "Blueberry", Chance = 50, APT = 1},
					["Silver Egg"] = {Name = "Silver Egg", Chance = 0.5, APT = 1},
					["Blueberry Juice"] = {Name = "Blueberry Juice", Chance = 4.5, APT = 1},
				},
				Red = {
					["Ticket"] = {Name = "Ticket", Chance = 15, APT = 1},
					["Cookie"] = {Name = "Cookie", Chance = 15, APT = 5},
					["Strawberry"] = {Name = "Strawberry", Chance = 54, APT = 5},
					["Silver Egg"] = {Name = "Silver Egg", Chance = 0.5, APT = 1},
					["Strawberry Juice"] = {Name = "Strawberry Juice", Chance = 15.5, APT = 1},
				},
			},
		},
	}
	
	Items.Tokens = {
		
		["Honey Gift"] = {
			TKColor = Color3.fromRGB(255, 185, 43),
			Image = "http://www.roblox.com/asset/?id=10315355688",
			Chance = 25,
			Time = 7,
			Desc = "Gives 100 Honey Multiplied by the Level of the Bee Squared",
			Idle = true,
			Sound = "rbxassetid://359623376",
			SoundVolume = 1,
			Debounce = 7,
			Visible = true,
			ColorT = "Colorless",
			Type = "Honey",
		},
		["Honey Gift+"] = {
			TKColor = Color3.fromRGB(255, 185, 43),
			Image = "http://www.roblox.com/asset/?id=10315463765",
			Chance = 25,
			Time = 10,
			Desc = "Gives 250 Honey Multiplied by the Level of the Bee Squared",
			Idle = true,
			Sound = "rbxassetid://359623376",
			SoundVolume = 1,
			Debounce = 15,
			Visible = true,
			ColorT = "Colorless",
			Type = "Honey",
		},
		
		["Sting"] = {
			TKColor = Color3.fromRGB(196, 40, 28),
			Image = "http://www.roblox.com/asset/?id=10326370731",
			Chance = 25,
			Time = 24,
			Desc = "Gives +1 Attack to bees \n (stacks up to 3 times)",
			Idle = false,
			Attack = true,
			Sound = "",
			SoundVolume = 1,
			Debounce = 45,
			Visible = true,
			ColorT = "Red",
			Type = "Attack",
		},
		
		["Star-Talent"] = {
			TKColor = Color3.fromRGB(105, 102, 92),
			Image = "http://www.roblox.com/asset/?id=10316011337",
			Chance = 1,
			Time = 8,
			Desc = "x2 Pollen",
			Idle = true,
			Sound = "",
			SoundVolume = 1,
			Debounce = 120,
			Visible = true,
			ColorT = "Colorless",
			Type = "Star-Talent",
		},
		
		["Shark-Balloon"] = {
			TKColor = Color3.fromRGB(152, 194, 219),
			Image = "http://www.roblox.com/asset/?id=9994638407",
			Chance = 25,
			Time = 10,
			Desc = "Summons a Balloon Shark that dives under the field and collects 210 pollen per Flower",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Debounce = 45,
			Visible = true,
			ColorT = "Colorless",
			Type = "",
		},
		
		["Threads"] = {
			TKColor = Color3.fromRGB(115, 93, 80),
			Image = "http://www.roblox.com/asset/?id=10317508233",
			Chance = 35,
			Time = 15,
			Desc = "The Bee Rises above the Field and Releases 5 Threads (+1 Per 5 Levels) and Collects 7 Pollen (+10% Per Level) from each Flower within a Radius",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Debounce = 45,
			Visible = true,
			ColorT = "Colorless",
			Type = "",
		},
		
		["Air Supply"] = {
			TKColor = Color3.fromRGB(82, 124, 174),
			Image = "http://www.roblox.com/asset/?id=10342875621",
			Chance = 15,
			Time = 7,
			Desc = "Creates 3 Bubbles (+1 Per 3 Levels) When touched, 12 Pollen is Collected from nearby Flowers and immediately Restores them \n (Gives a Boost of +5% Capacity for each Bubble if the Bee is Gifted)",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Debounce = 10,
			Visible = true,
			ColorT = "Blue",
			Type = "",
		},
		
		["Fire Ring"] = {
			TKColor = Color3.fromRGB(196, 40, 28),
			Image = "http://www.roblox.com/asset/?id=10358126269",
			Chance = 15,
			Time = 10,
			Desc = "Creates a Ring of Fire of 12 Fires that Collect Pollen within a Radius of 3 Flowers",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Debounce = 5,
			Visible = true,
			ColorT = "Red",
			Type = "",
		},
		
		["Spraying"] = {
			TKColor = Color3.fromRGB(138, 171, 133),
			Image = "http://www.roblox.com/asset/?id=10317668637",
			Chance = 15,
			Time = 50,
			Desc = "Pollinates 30 Flowers every Second for 30 Seconds",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Debounce = 120,
			Visible = true,
			ColorT = "Colorless",
			Type = "",
		},
		
		["Tools Totem"] = {
			TKColor = Color3.fromRGB(255, 255, 255),
			Image = "http://www.roblox.com/asset/?id=9808470665",
			Chance = 35,
			Time = 7,
			Desc = "Compare the Tools Totem on a Random Flower that Connects to the Next Five Totems",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Debounce = 12,
			Visible = true,
			ColorT = "Colorless",
			Type = "",
		},
		
		["Pollen Totem"] = {
			TKColor = Color3.fromRGB(255, 255, 255),
			Image = "http://www.roblox.com/asset/?id=9809722110",
			Chance = 35,
			Time = 7,
			Desc = "Compare the Pollen Totem on a Random Flower that Connects to the Next Five Totems",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Debounce = 12,
			Visible = true,
			ColorT = "Colorless",
			Type = "",
		},
		
		["Haste"] = {
			TKColor = Color3.fromRGB(248, 248, 248),
			Image = "http://www.roblox.com/asset/?id=10315851918",
			Chance = 25,
			Time = 2,
			Desc = "Gives a boost to the player's speed by 10%. \n Stacks up to 10",
			Idle = true,
			Sound = "rbxassetid://9438158763",
			SoundVolume = 1,
			Debounce = 5,
			Visible = true,
			ColorT = "Colorless",
			Type = "Haste",
		},
		
		["Wet Cloud"] = {
			TKColor = Color3.fromRGB(27, 42, 53),
			Image = "http://www.roblox.com/asset/?id=9405046201",
			Chance = 30,
			Time = 15,
			Desc = "Calls a Ladybug together with a Cloud to a Field, drops of which are collected by 21 Pollen from White Flowers and 42 Pollen from Red Flowers in 9 Flowers",
			Idle = false,
			Debounce = 45,
			Sound = "",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Red",
			Type = "Wet Cloud",
		},
		
		["Healing Lantern"] = {
			TKColor = Color3.fromRGB(124, 156, 107),
			Image = "http://www.roblox.com/asset/?id=9585624706",
			Chance = 100,
			Time = 15,
			Desc = "Summons a Lantern to the Field, along with fireflies that regenerate the Field within 60 seconds",
			Idle = false,
			Debounce = 90,
			Sound = "",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Colorless",
			Type = "Healing Lantern",
		},

		["Rhino Stomp"] = {
			TKColor = Color3.fromRGB(27, 42, 53),
			Image = "http://www.roblox.com/asset/?id=9405476589",
			Chance = 100,
			Time = 15,
			Desc = "Summons a Rhino Beetle that runs around the Field 15 times and collects 20 Pollen from White Flowers and 40 Pollen from Blue Flowers",
			Idle = false,
			Debounce = 30,
			Sound = "",
			SoundVolume = 5,
			Visible = true,
			ColorT = "Blue",
			Type = "Rhino Stomp",
		},
		
		["Caramel Party"] = {
			TKColor = Color3.fromRGB(226, 155, 64),
			Image = "http://www.roblox.com/asset/?id=10316787555",
			Chance = 50,
			Time = 10,
			Desc = "Causes a little caramel rain that covers the Flowers in Caramel",
			Idle = false,
			Sound = "",
			Debounce = 25,
			SoundVolume = 7,
			Visible = true,
			ColorT = "Colorless",
			Type = "Caramel Party",
		},
		["Blob"] = {
			TKColor = Color3.fromRGB(226, 155, 64),
			Image = "http://www.roblox.com/asset/?id=10316788475",
			Chance = 50,
			Time = 10,
			Desc = "Leaves a Caramel Blob on the Field",
			Idle = false,
			Sound = "",
			Debounce = 25,
			SoundVolume = 7,
			Visible = true,
			ColorT = "Colorless",
			Type = "Blob",
		},
		
		["Brown Bear Morph"] = {
			TKColor = Color3.fromRGB(108, 88, 75),
			Image = "http://www.roblox.com/asset/?id=9349024326",
			Chance = 25,
			Time = 10,
			Desc = "Turns you into a bear. \n gives x1.75 Pollen \n x2 Player Speed \n x1.1 Jump Power.",
			Idle = true,
			Debounce = 60,
			Sound = "",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Colorless",
			Type = "Brown Bear Morph",
		},
		
		["Mama Bear Morph"] = {
			TKColor = Color3.fromRGB(188, 155, 93),
			Image = "http://www.roblox.com/asset/?id=9474487382",
			Chance = 25,
			Time = 10,
			Desc = "Turns you into a bear. \n gives x2 Pollen \n x2 Player Speed \n x2 Jump Power.",
			Idle = true,
			Debounce = 60,
			Sound = "",
			SoundVolume = 1,
			Visible = false,
			ColorT = "Colorless",
			Type = "Mama Bear Morph",
		},
		
		["Resin Bear Morph"] = {
			TKColor = Color3.fromRGB(226, 155, 64),
			Image = "http://www.roblox.com/asset/?id=9474486353",
			Chance = 25,
			Time = 10,
			Desc = "Turns you into a bear. \n gives x2 Pollen \n x2 Player Speed \n x2 Jump Power.",
			Idle = true,
			Debounce = 60,
			Sound = "",
			SoundVolume = 1,
			Visible = false,
			ColorT = "Colorless",
			Type = "Resin Bear Morph",
		},
		
		["Black Bear Morph"] = {
			TKColor = Color3.fromRGB(61, 61, 61),
			Image = "http://www.roblox.com/asset/?id=9474488077",
			Chance = 25,
			Time = 10,
			Desc = "Turns you into a bear. \n gives x2 Pollen \n x2 Player Speed \n x2 Jump Power.",
			Idle = true,
			Debounce = 60,
			Sound = "",
			SoundVolume = 1,
			Visible = false,
			ColorT = "Colorless",
			Type = "Black Bear Morph",
		},
		
		["Hermit Bear Morph"] = {
			TKColor = Color3.fromRGB(90, 90, 90),
			Image = "http://www.roblox.com/asset/?id=9569885538",
			Chance = 25,
			Time = 10,
			Desc = "Turns you into a bear. \n gives x2 Pollen \n x2 Player Speed \n x2 Jump Power.",
			Idle = true,
			Debounce = 60,
			Sound = "",
			SoundVolume = 1,
			Visible = false,
			ColorT = "Colorless",
			Type = "Hermit Bear Morph",
		},
		
		["Support"] = {
			TKColor = Color3.fromRGB(136, 249, 255),
			Image = "http://www.roblox.com/asset/?id=10314834064",
			Chance = 15,
			Time = 10,
			Debounce = 30,
			Desc = "Gives x2 Pollen a boost for 30 seconds",
			Idle = true,
			Sound = "",
			SoundVolume = 7,
			Visible = true,
			ColorT = "Colorless",
			Type = "Support",
		},
		
		["Token Link"] = {
			TKColor = Color3.fromRGB(255, 255, 255),
			Image = "http://www.roblox.com/asset/?id=10314866522",
			Chance = 99,
			Time = 5,
			Debounce = 5,
			Desc = "Collects all other Ability Tokens and Grants 10 Honey per Token \n (+10 Honey per Level)",
			Idle = false,
			Sound = "",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Colorless",
			Type = "Link",
		},
		
		["Bomb"] = {
			TKColor = Color3.fromRGB(25, 25, 25),
			Image = "http://www.roblox.com/asset/?id=10314710437",
			Chance = 45,
			Time = 3,
			Debounce = 10,
			Desc = "Collects 20 pollen from 13 nearby Flowers of any colors",
			Idle = false,
			Sound = "rbxassetid://10314094099",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Colorless",
			Type = "Bomb",
		},
		["Red Bomb"] = {
			TKColor = Color3.fromRGB(25, 25, 25),
			Image = "http://www.roblox.com/asset/?id=9360204829",
			Chance = 45,
			Time = 3,
			Debounce = 10,
			Desc = "Collects 30 pollen from 13 nearby Red Flowers",
			Idle = false,
			Sound = "rbxassetid://10314094099",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Red",
			Type = "Bomb",
		},
		["Blue Bomb"] = {
			TKColor = Color3.fromRGB(25, 25, 25),
			Image = "http://www.roblox.com/asset/?id=10314741369",
			Chance = 45,
			Time = 3,
			Debounce = 10,
			Desc = "Collects 30 pollen from 13 nearby Blue Flowers",
			Idle = false,
			Sound = "rbxassetid://10314094099",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Blue",
			Type = "Bomb",
		},
		["Bomb+"] = {
			TKColor = Color3.fromRGB(25, 25, 25),
			Image = "http://www.roblox.com/asset/?id=10314764592",
			Chance = 25,
			Time = 3,
			Debounce = 10,
			Desc = "Collects 40 pollen from 24 nearby Flowers of any colors",
			Idle = false,
			Sound = "rbxassetid://10314094099",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Colorless",
			Type = "Bomb",
		},
		["Red Bomb+"] = {
			TKColor = Color3.fromRGB(25, 25, 25),
			Image = "http://www.roblox.com/asset/?id=10314763802",
			Chance = 25,
			Time = 3,
			Debounce = 10,
			Desc = "Collects 60 pollen from 24 nearby Red Flowers",
			Idle = false,
			Sound = "rbxassetid://10314094099",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Red",
			Type = "Bomb",
		},
		["Blue Bomb+"] = {
			TKColor = Color3.fromRGB(25, 25, 25),
			Image = "http://www.roblox.com/asset/?id=10314762894",
			Chance = 25,
			Time = 3,
			Debounce = 10,
			Desc = "Collects 60 pollen from 24 nearby Blue Flowers",
			Idle = false,
			Sound = "rbxassetid://10314094099",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Blue",
			Type = "Bomb",
		},
		
		
		["White Boost"] = {
			TKColor = Color3.fromRGB(127, 241, 127),
			Image = "http://www.roblox.com/asset/?id=10314626377",
			Chance = 45,
			Time = 5,
			Desc = "Gives a Boost for White Pollen by 10%. \n Stacks up to 10",
			Idle = false,
			Debounce = 10,
			Sound = "rbxassetid://9436887777",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Colorless",
			Type = "Boost",
		},
		
		["Light Rain"] = {
			TKColor = Color3.fromRGB(241, 115, 65),
			Image = "http://www.roblox.com/asset/?id=8631771659",
			Chance = 99,
			Time = 52,
			Desc = "gfgfdgdf",
			Idle = false,
			Debounce = 10,
			--Sound = "rbxassetid://9427513369",
			Sound = "rbxassetid://9436887777",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Colorless",
		},
		
		["Blue Boost"] = {
			TKColor = Color3.fromRGB(127, 241, 127),
			Image = "http://www.roblox.com/asset/?id=10314627431",
			Chance = 45,
			Time = 5,
			Desc = "Gives a Boost for Blue Pollen by 10%. \n Stacks up to 10",
			Idle = false,
			Debounce = 10,
			Sound = "rbxassetid://9436887777",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Blue",
			Type = "Boost",
		},
		["Red Boost"] = {
			TKColor = Color3.fromRGB(127, 241, 127),
			Image = "http://www.roblox.com/asset/?id=10314628117",
			Chance = 45,
			Time = 5,
			Desc = "Gives a Boost for Red Pollen by 10%. \n Stacks up to 10",
			Idle = false,
			Debounce = 10,
			Sound = "rbxassetid://9436887777",
			SoundVolume = 1,
			Visible = true,
			ColorT = "Red",
			Type = "Boost",
		},
	}
	
	Items.SproutTypes = {
		["Sprout"] = {
			["Classic"] = {Name = "Classic", Rarity = 85, MinLevel = 1, MaxLevel = 3},
			["Rare"] = {Name = "Rare", Rarity = 15, MinLevel = 1, MaxLevel = 3},
			["Epic"] = {Name = "Epic", Rarity = 5, MinLevel = 1, MaxLevel = 3},
			["Legendary"] = {Name = "Legendary", Rarity = 3, MinLevel = 1, MaxLevel = 3},
		},

		["Rare Sprout"] = {
			["Rare"] = {Name = "Rare", Rarity = 60, MinLevel = 1, MaxLevel = 3},
			["Epic"] = {Name = "Epic", Rarity = 30, MinLevel = 1, MaxLevel = 3},
			["Legendary"] = {Name = "Legendary", Rarity = 10, MinLevel = 1, MaxLevel = 3},
		},

		["Epic Sprout"] = {
			["Epic"] = {Name = "Epic", Rarity = 75, MinLevel = 1, MaxLevel = 3},
			["Legendary"] = {Name = "Legendary", Rarity = 25, MinLevel = 1, MaxLevel = 3},
		},

		["Legendary Sprout"] = {
			["Legendary"] = {Name = "Legendary", Rarity = 100, MinLevel = 1, MaxLevel = 3},
		},
		
		["Ticket Sprout"] = {
			["Ticket"] = {Name = "Ticket", Rarity = 100, MinLevel = 1, MaxLevel = 3},
		},
	}

	Items.SproutsDrop = {
		["Classic"] = {

			Name = "Classic",
			Rarity = 85,
			HP = 10000,
			Tokens = 30,
			SColor = Color3.fromRGB(86, 165, 63),

			["Daisy"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Mushroom"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Blue Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Sunflower"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 25, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 5, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 5, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Strawberry"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},	
			["Cactus"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 20, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 20, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Clover"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 20, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 20, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 20, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Pumpkin"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Pine Tree"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Red Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Cattail"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Dandelion"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 1},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
			["Mountain Top"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 200},
				["Strawberry"] = {Name = "Strawberry", Rarity = 35, APT = 1},
				["Blueberry"] = {Name = "Blueberry", Rarity = 35, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 35, APT = 1},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
			},
		},

		["Rare"] = {

			Name = "Rare",
			Rarity = 15,
			HP = 25000,
			Tokens = 55,
			SColor = Color3.fromRGB(255, 255, 255),

			["Daisy"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 3},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 2, APT = 1},
			},

			["Mushroom"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 3},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 2, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
			},

			["Blue Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 3},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 2, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
			},

			["Sunflower"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 3},
				["Seed"] = {Name = "Seed", Rarity = 25, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 5, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 5, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 3, APT = 1},
			},
				
			["Strawberry"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 3},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 2, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
			},
				
			["Cactus"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 2, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 2, APT = 1},
			},
			
			["Clover"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 3},
				["Seed"] = {Name = "Seed", Rarity = 10, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 1, APT = 1},
			},
				
			["Pumpkin"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 3},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 2, APT = 1},
			},
				
			["Pine Tree"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 3},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 2, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
			},
			
			["Red Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 3},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 2, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
			},
			
			["Cattail"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 3},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 2, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
			},
			
			["Dandelion"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 3},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 3},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 1, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 2, APT = 1},
			},
			
			["Mountain Top"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 2000},
				["Strawberry"] = {Name = "Strawberry", Rarity = 35, APT = 3},
				["Blueberry"] = {Name = "Blueberry", Rarity = 35, APT = 3},
				["Butter"] = {Name = "Butter", Rarity = 5, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 5, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 5, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 35, APT = 3},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Silver Egg"] = {Name = "Silver Egg", Rarity = 0.1, APT = 1},
			},
		},

		["Epic"] = {

			Name = "Epic",
			Rarity = 5,
			HP = 50000,
			Tokens = 80,
			SColor = Color3.fromRGB(255, 200, 61),

			["Daisy"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 5},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 4, APT = 1},
			},

			["Mushroom"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 5},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 4, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
			},

			["Blue Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 5},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 4, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
			},

			["Sunflower"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 5},
				["Seed"] = {Name = "Seed", Rarity = 25, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 5, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 5, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 3, APT = 1},
			},

			["Strawberry"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 5},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 4, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
			},

			["Cactus"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 4, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 4, APT = 1},
			},

			["Clover"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 5},
				["Seed"] = {Name = "Seed", Rarity = 10, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 3, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 3, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 3, APT = 1},
			},

			["Pumpkin"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 5},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 4, APT = 1},
			},

			["Pine Tree"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 5},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 4, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
			},

			["Red Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 5},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 4, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
			},

			["Cattail"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 5},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 4, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 2, APT = 1},
			},

			["Dandelion"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 5},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 5},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 3, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 2, APT = 1},
			},
			
			["Mountain Top"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 10000},
				["Strawberry"] = {Name = "Strawberry", Rarity = 35, APT = 5},
				["Blueberry"] = {Name = "Blueberry", Rarity = 35, APT = 5},
				["Butter"] = {Name = "Butter", Rarity = 7, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 7, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 7, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 35, APT = 5},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
			},
		},

		["Legendary"] = {

			Name = "Legendary",
			Rarity = 3,
			HP = 100000,
			Tokens = 100,
			SColor = Color3.fromRGB(73, 246, 255),

			["Daisy"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 10},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 6, APT = 1},
			},

			["Mushroom"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 10},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 6, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
			},

			["Blue Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 10},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 6, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
			},

			["Sunflower"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 10},
				["Seed"] = {Name = "Seed", Rarity = 25, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 5, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 5, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 6, APT = 1},
			},

			["Strawberry"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 10},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 6, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
			},

			["Cactus"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 6, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 6, APT = 1},
			},

			["Clover"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 10},
				["Seed"] = {Name = "Seed", Rarity = 10, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 5, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 5, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 5, APT = 1},
			},

			["Pumpkin"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 10},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 6, APT = 1},
			},

			["Pine Tree"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 10},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 6, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
			},

			["Red Flowers"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 25, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 10},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 6, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
			},

			["Cattail"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 35, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 25, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 10},
				["Ticket"] = {Name = "Ticket", Rarity = 0.1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 6, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
			},

			["Dandelion"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Cookie"] = {Name = "Cookie", Rarity = 30, APT = 10},
				["Seed"] = {Name = "Seed", Rarity = 15, APT = 10},
				["Strawberry"] = {Name = "Strawberry", Rarity = 10, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 10, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 3, APT = math.random(1,3)},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Diamond Egg"] = {Name = "Diamond Egg", Rarity = 0.1, APT = 1},
				["Energy Drink"] = {Name = "Energy Drink", Rarity = 4, APT = 1},
				["Butter"] = {Name = "Butter", Rarity = 4, APT = 1},
			},
			
			["Mountain Top"] = {
				["Honey"] = {Name = "Honey", Rarity = 5, APT = 15000},
				["Strawberry"] = {Name = "Strawberry", Rarity = 35, APT = 10},
				["Blueberry"] = {Name = "Blueberry", Rarity = 35, APT = 10},
				["Butter"] = {Name = "Butter", Rarity = 7, APT = 1},
				["Blueberry Juice"] = {Name = "Blueberry Juice", Rarity = 7, APT = 1},
				["Strawberry Juice"] = {Name = "Strawberry Juice", Rarity = 7, APT = 1},
				["Seed"] = {Name = "Seed", Rarity = 35, APT = 10},
				["Royal Jelly"] = {Name = "Royal Jelly", Rarity = 1, APT = 1},
				["Ticket"] = {Name = "Ticket", Rarity = 1, APT = 1},
				["Golden Egg"] = {Name = "Golden Egg", Rarity = 0.1, APT = 1},
			},
		},
		
		["Ticket"] = {

			Name = "Ticket",
			Rarity = 2,
			HP = 1000000,

			["Daisy"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 1},
			},

			["Mushroom"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 1},
			},

			["Blue Flowers"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 2},
			},

			["Sunflower"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 1},
			},
			
			["Cactus"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 4},
			},

			["Pine Tree"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 4},
			},
			
			["Pumpkin"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 4},
			},

			["Strawberry"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 3},
			},
			
			["Cattail"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 3},
			},
			
			["Bamboo"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 3},
			},
			
			["Dandelion"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 3},
			},
			
			["Red Flowers"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 3},
			},
			
			["Apple Tree"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 3},
			},
			
			["Clover"] = {
				["Ticket"] = {Name = "Ticket", Rarity = 100, APT = 3},
			},

			Tokens = 30,
			SColor = Color3.fromRGB(255, 136, 0),
			Material = Enum.Material.Neon,
		},
	}
	
	Items.EggCosts = {
		["0"] = 700,
		["1"] = 1000,
		["2"] = 1250,
		["3"] = 2000,
		["4"] = 2500,
		["5"] = 3775,
		["6"] = 4565,
		["7"] = 7975,
		["8"] = 12575,
		["9"] = 17650,
		["10"] = 27655,
		["11"] = 39850,
		["12"] = 95000,
		["13"] = 121890,
		["14"] = 167500,
		["15"] = 267000,
		["16"] = 412275,
		["17"] = 550550,
		["18"] = 953277,
		["19"] = 1000000,
		["20"] = 2001900,
		["21"] = 3390013,
		["22"] = 4563784,
		["23"] = 5587542,
		["24"] = 7512745,
		["25"] = 10000000,
	}
	
	Items.SlotCosts = {
		[1] = 10000000,
		[2] = 25000000,
		[3] = 57500000,
		[4] = 120750000,
		[5] = 229425000,
		[6] = 390022500,
		[7] = 585033750,
		[8] = 760543875,
		[9] = 836598263,
		[10] = 920258089,
		[11] = 1196335516,
		[12] = 1794503274,
		[13] = 3050655566,
		[14] = 5186114462,
		[15] = 9853617478,
		[16] = 21677958452,
		[17] = 56362691975,
		[18] = 174724345123,
		[19] = 646480076955,
		[20] = 969720115423,
		[21] = 1260636150062,
		[22] = 1575795187578,
		[23] = 1812164465714,
		[24] = 2174597358856,
		[25] = 2826976566514,
	}
	
	Items.Passives = {
		["Test Passive"] = "rbxassetid://8602349626",
	}
	
	Items.Eggs = {
		["Ticket"] = {
			Name = "Ticket",
			Description = "A special currency used to activate and purchase special things.",
			Type = "Value",
			CanInput = false,
			Image = "http://www.roblox.com/asset/?id=8640150472",
			CanBar = false,
			Crafting = false,
			Layout = -2
		};
		
		["Bee-Pass"] = {
			Name = "Bee-Pass",
			Description = "This Ticket gives you the opportunity to get paid Rewards for One Season",
			Type = "Value",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10250127723",
			CanBar = false,
			Crafting = false,
			Layout = -1
		};
		
		["Hydrant Builder"] = {
			Name = "Hydrant Builder",
			Description = "Installs your hydrant on the field.",
			Type = "Hydrant Builder",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9804817666",
			CanBar = true,
			Crafting = false,
			Layout = 0
		};

		["Termit Pass"] = {
			Name = "Termit Pass",
			Description = "Makes it Possible to Get into the Hollow to Termites.",
			Type = "Termit",
			CanInput = false,
			Limit = 10,
			Image = "http://www.roblox.com/asset/?id=10327381536",
			CanBar = false,
			Crafting = false,
			Layout = 1
		};

		["Skull"] = {
			Name = "Skull",
			Description = "A special currency used to Halloween Event",
			Type = "Event",
			CanInput = false,
			Image = "rbxassetid://11161776452",
			CanBar = false,
			Crafting = false,
			Layout = 1
		};
		
		["Pumpkin"] = {
			Name = "Pumpkin",
			Description = "A special currency used to Halloween Event",
			Type = "Event",
			CanInput = false,
			Image = "rbxassetid://11156036796",
			CanBar = false,
			Crafting = false,
			Layout = 1
		};
		
		["Instant Converter"] = {
			Name = "Instant Converter",
			Description = "Instantly Converts your Pollen into Honey.",
			Type = "FieldEffect",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9647286588",
			CanBar = true,
			Crafting = false,
			Layout = 2
		};
		["Mystery Box"] = {
			Name = "Mystery Box",
			Description = "Lottery",
			Type = "Lottery",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=8640150472",
			CanBar = false,
			Crafting = false,
			Removing = true,
			Layout = 3
		};
		
		["Book"] = {
			Name = "Book",
			Description = "Book",
			Type = "Lottery",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9990362352",
			CanBar = false,
			Crafting = false,
			Removing = true,
			Layout = 4
		};
		
		["Enchanted Book"] = {
			Name = "Enchanted Book",
			Description = "Enchanted Book",
			Type = "Lottery",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9990037260",
			CanBar = false,
			Crafting = false,
			Removing = true,
			Layout = 5
		};
		
		["Sugar"] = {
			Name = "Sugar",
			Description = "It tastes very sweet, used in cooking Caramel.",
			Type = "EffectFood",
			CanInput = false,
			Amount = 50,
			Image = "http://www.roblox.com/asset/?id=9252182292",
			CanBar = false,
			Crafting = false,
			Layout = 6
		};
		["Caramel"] = {
			Name = "Caramel",
			Description = "Covers the flowers with sweet caramel and gives you a bonus honey. \n Press [C] for quick use",
			Type = "FieldEffect",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9252379440",
			CanBar = true,
			Crafting = true,
			CraftIndex = 1,
			ReceptNum = 3,
			Recept = {
				["Seed"] = 10,
				["Strawberry"] = 10,
				["Blueberry"] = 10,
			},
			Layout = 7
		};

		["Basic Egg"] = {
			Name = "Basic Egg",
			Description = "Hatches an ordinary bee.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8413520714",
			CanBar = false,
			Crafting = false,
			Layout = 27
		};

		["Silver Egg"] = {
			Name = "Silver Egg",
			Description = "Hatches a Rare Bee and with a small chance Epic and Legendary.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8427343959",
			CanBar = false,
			Crafting = false,
			Layout = 28
		};		
		["Golden Egg"] = {
			Name = "Golden Egg",
			Description = "Hatches an Epic Bee and with a small chance Legendary.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8427450912",
			CanBar = false,
			Crafting = false,
			Layout = 29
		};

		["Diamond Egg"] = {
			Name = "Diamond Egg",
			Description = "Legendary Bee hatches with 100% chance and .",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8427446329",
			CanBar = false,
			Crafting = false,
			CraftIndex = 1,
			Layout = 30
		};
		
		["Mythic Egg"] = {
			Name = "Mythic Egg",
			Description = "Mythic Bee hatches with 100% chance.",
			Type = "Egg",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10259296261",
			CanBar = false,
			Crafting = false,
			CraftIndex = 1,
			Layout = 31
		};
		
		["Star Egg"] = {
			Name = "Star Egg",
			Description = "Hatches a Gifted Bee that you Don't Have.",
			Type = "Egg",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10263285852",
			CanBar = false,
			Crafting = false,
			CraftIndex = 1,
			Layout = 32
		};
		
		["Gifted Silver Egg"] = {
			Name = "Gifted Silver Egg",
			Description = "Hatches a Gifted Rare Bee and with a small chance Gifted Epic and Gifted Legendary.",
			Type = "Egg",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10244938074",
			CanBar = false,
			Crafting = false,
			Layout = 36
		};	
		
		["Gifted Golden Egg"] = {
			Name = "Gifted Golden Egg",
			Description = "Hatches an Gifted Epic Bee and with a small chance Gifted Legendary.",
			Type = "Egg",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10244938995",
			CanBar = false,
			Crafting = false,
			Layout = 37
		};
		
		["Gifted Diamond Egg"] = {
			Name = "Gifted Diamond Egg",
			Description = "Gifted Legendary Bee hatches with 100% chance.",
			Type = "Egg",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10244940227",
			CanBar = false,
			Crafting = false,
			CraftIndex = 1,
			Layout = 38
		};
		
		["Gifted Mythic Egg"] = {
			Name = "Gifted Mythic Egg",
			Description = "Gifted Mythic Bee hatches with 100% chance.",
			Type = "Egg",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10263286698",
			CanBar = false,
			Crafting = false,
			CraftIndex = 1,
			Layout = 39
		};
		["Royal Jelly"] = {
			Name = "Royal Jelly",
			Description = "Replaces your Bee with any other.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Settings = false,
			SettingsType = "AutoJelly",
			Layout = 40
		};
		["Gifted Jelly"] = {
			Name = "Gifted Jelly",
			Description = "Replaces your Bee with any other Gifted.",
			Type = "Jelly",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10111315888",
			CanBar = false,
			Crafting = false,
			Settings = false,
			SettingsType = "AutoJelly",
			Layout = 41
		};
		["Cookie"] = {
			Name = "Cookie",
			Description = "Grants 20 Bonds for Bee.",
			Type = "Food",
			CanInput = true,
			Amount = 20,
			Image = "rbxassetid://8585456323",
			CanBar = false,
			Crafting = false,
			Layout = 8
		};
		["Star Cookie"] = {
			Name = "Star Cookie",
			Description = "с",
			Type = "EffectFood",
			CanInput = true,
			Amount = 20,
			Image = "http://www.roblox.com/asset/?id=9961078660",
			CanBar = false,
			Crafting = false,
			Layout = 9
		};
		
		["Debug Cookie"] = {
			Name = "Debug Cookie",
			Description = "Makes the bee of the maximum level.",
			Type = "EffectFood",
			CanInput = true,
			Image = "rbxassetid://8585456323",
			CanBar = false,
			Crafting = false,
			Layout = 98
		};

		["Spoiled Cookie"] = {
			Name = "Spoiled Cookie",
			Description = "Evicts the bee from the hive.",
			Type = "EffectFood",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9332858461",
			CanBar = false,
			Crafting = false,
			CraftIndex = 1,
			ReceptNum = 3,
			Recept = {
				["Royal Jelly"] = 100,
				["Cookie"] = 100,
				["Basic Egg"] = 10,
			},
			Layout = 99
		};

		["Strawberry"] = {
			Name = "Strawberry",
			Description = "Grants 50 Bonds for Bee.",
			Type = "Food",
			CanInput = true,
			Amount = 50,
			Image = "rbxassetid://8585429086",
			CanBar = false,
			Crafting = false,
			Layout = 9
		};

		["Blueberry"] = {
			Name = "Blueberry",
			Description = "Grants 50 Bonds for Bee.",
			Type = "Food",
			CanInput = true,
			Amount = 50,
			Image = "rbxassetid://8585415467",
			CanBar = false,
			Crafting = false,
			Layout = 10
		};

		["Seed"] = {
			Name = "Seed",
			Description = "Grants 50 Bonds for Bee.",
			Type = "Food",
			CanInput = true,
			Amount = 50,
			Image = "rbxassetid://8585994898",
			CanBar = false,
			Crafting = false,
			Layout = 11
		};
		
		["Shroom"] = {
			Name = "Shroom",
			Description = "Grants 100 Bonds for Bee.",
			Type = "Food",
			CanInput = true,
			Amount = 100,
			Image = "http://www.roblox.com/asset/?id=9518907653",
			CanBar = false,
			Crafting = false,
			Layout = 12
		};
		
		["Fertilizer"] = {
			Name = "Fertilizer",
			Description = "When used, It Fertilizes the Field on which you are Standing",
			Type = "Buff",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=10182558977",
			CanBar = true,
			Crafting = false,
			Layout = 13
		};
		
		["Caramel Bottle"] = {
			Name = "Caramel Bottle",
			Description = "Grants x1.25 Pollen From Tools, +5% Tools Speed",
			Type = "Buff",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9647377701",
			CanBar = true,
			Crafting = false,
			Layout = 14
		};
		
		["Butter"] = {
			Name = "Butter",
			Description = "Grants x1.25 Player Movespeed, x1.5 Bee Movespeed",
			Type = "Buff",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9646728824",
			CanBar = true,
			Crafting = false,
			Layout = 15
		};

		["Energy Drink"] = {
			Name = "Energy Drink",
			Description = "Grants x1.25 Convert Rate, x1.15 Instant Conversion",
			Type = "Buff",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9657045478",
			CanBar = true,
			Crafting = true,
			CraftIndex = 2,
			ReceptNum = 3,
			Recept = {
				["Seed"] = 50,
				["Cookie"] = 10,
				["Royal Jelly"] = 10,
			},
			Layout = 16
		};
		
		["Blueberry Juice"] = {
			Name = "Blueberry Juice",
			Description = "Grants x1.25 Blue Pollen, \n +10% Blue Instant Conversion",
			Type = "Buff",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9656864240",
			CanBar = true,
			Crafting = true,
			CraftIndex = 3,
			ReceptNum = 3,
			Recept = {
				["Blueberry"] = 50,
				["Cookie"] = 10,
				["Royal Jelly"] = 10,
			},
			Layout = 17
		};
		
		["Strawberry Juice"] = {
			Name = "Strawberry Juice",
			Description = "Grants x1.25 Red Pollen, \n +10% Red Instant Conversion",
			Type = "Buff",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9656864988",
			CanBar = true,
			Crafting = true,
			CraftIndex = 4,
			ReceptNum = 3,
			Recept = {
				["Strawberry"] = 50,
				["Cookie"] = 10,
				["Royal Jelly"] = 10,
			},
			Layout = 18
		};
		
		["Night-Bell"] = {
			Name = "Night-Bell",
			Description = "The Bell that Valls the Night Time",
			Type = "SummonNight",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9962746736",
			CanBar = true,
			Crafting = false,
			Layout = 19
		};
		
		["Firefly Vial"] = {
			Name = "Firefly Vial",
			Description = "A jar of Fireflies. gives a Bonus to Pollen in Fields, and is also used in the Purchase of Bee",
			Type = "Buff",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9911777787",
			CanBar = true,
			Crafting = false,
			Layout = 20
		};

		["Sprout"] = {
			Name = "Sprout",
			Description = "Spawn a random sprout (Classic, Rare, Epic, Legendary) the field you're standing on",
			Type = "Sprout",
			CanInput = true,
			Image = "rbxassetid://8602349626",
			CanBar = true,
			Crafting = false,
			Layout = 21
		};

		["Rare Sprout"] = {
			Name = "Rare Sprout",
			Description = "Spawn a random sprout (Rare, Epic, Legendary) the field you're standing on",
			Type = "Sprout",
			CanInput = true,
			Image = "rbxassetid://9080969518",
			CanBar = true,
			Crafting = true,
			CraftIndex = 5,
			ReceptNum = 2,
			Recept = {
				["Sprout"] = 3,
				["Silver Egg"] = 1,
			},
			Layout = 22
		};

		["Epic Sprout"] = {
			Name = "Epic Sprout",
			Description = "Spawn Epic or Legendary sprout the field you're standing on",
			Type = "Sprout",
			CanInput = true,
			Image = "rbxassetid://9080979925",
			CanBar = true,
			Crafting = true,
			CraftIndex = 6,
			ReceptNum = 2,
			Recept = {
				["Sprout"] = 3,
				["Golden Egg"] = 1,
			},
			Layout = 23
		};

		["Legendary Sprout"] = {
			Name = "Legendary Sprout",
			Description = "Spawn only Legendary Sprout the field you're standing on",
			Type = "Sprout",
			CanInput = true,
			Image = "http://www.roblox.com/asset/?id=9332878411",
			CanBar = true,
			Crafting = true,
			CraftIndex = 7,
			ReceptNum = 2,
			Recept = {
				["Sprout"] = 3,
				["Diamond Egg"] = 1,
			},
			Layout = 24
		};

		["Ticket Sprout"] = {
			Name = "Ticket Sprout",
			Description = "Spawn only Ticket Sprout the field you're standing on",
			Type = "Sprout",
			CanInput = true,
			Image = "rbxassetid://8602349626",
			CanBar = true,
			Crafting = false,
			CraftIndex = 10,
			ReceptNum = 4,
			Recept = {
				["Energy Drink"] = 25,
				["Ticket"] = 1000,
				["Royal Jelly"] = 5555,
				["Cookie"] = 99999,
			},
			Removed = false,
			Layout = 25
		};

		["Luscious Sprout"] = {
			Name = "Luscious Sprout",
			Description = "Spawn only Luscious Sprout the field you're standing on",
			Type = "Sprout",
			CanInput = true,
			Image = "rbxassetid://8602349626",
			CanBar = true,
			Crafting = false,
			Removed = false,
			Layout = 26
		};
		
		["Bear Bee Egg"] = {
			Name = "Bear Bee Egg",
			Description = "Hatches Bear Bee. Returns Bear Bee Egg to you if you remove Bear Bee from the hive.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8413520714",
			CanBar = false,
			Crafting = false,
			Layout = 100
		};
		
		["Rhino Bee Egg"] = {
			Name = "Rhino Bee Egg",
			Description = "Hatches Rhino Bee. Returns Rhino Bee Egg to you if you remove Rhino Bee from the hive.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8413520714",
			CanBar = false,
			Crafting = false,
			Layout = 101
		};
		
		["Ladybug Bee Egg"] = {
			Name = "Ladybug Bee Egg",
			Description = "Hatches Ladybug Bee. Returns Ladybug Bee Egg to you if you remove Ladybug Bee from the hive.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8413520714",
			CanBar = false,
			Crafting = false,
			Layout = 102
		};
		
		["Caramel Bee Egg"] = {
			Name = "Caramel Bee Egg",
			Description = "Hatches Caramel Bee. Returns Caramel Bee Egg to you if you remove Caramel Bee from the hive.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8413520714",
			CanBar = false,
			Crafting = false,
			Layout = 103
		};
		
		["Firefly Bee Egg"] = {
			Name = "Firefly Bee Egg",
			Description = "Hatches Firefly Bee. Returns Firefly Bee Egg to you if you remove Firefly Bee from the hive.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8413520714",
			CanBar = false,
			Crafting = false,
			Layout = 104
		};

		["Toothy Bee Egg"] = {
			Name = "Toothy Bee Egg",
			Description = "Hatches Toothy Bee. Returns Toothy Bee Egg to you if you remove Toothy Bee from the hive.",
			Type = "Egg",
			CanInput = true,
			Image = "rbxassetid://8413520714",
			CanBar = false,
			Crafting = false,
			Layout = 104
		};
		
		["Silky Bee Jelly"] = {
			Name = "Silky Bee Jelly",
			Description = "Replaces your Bee into the Silky Bee.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Layout = 145
		};
		["Bedbug Bee Jelly"] = {
			Name = "Bedbug Bee Jelly",
			Description = "Replaces your Bee into the Bedbug Bee.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Layout = 147
		};
		["Water-Beetle Bee Jelly"] = {
			Name = "Water-Beetle Bee Jelly",
			Description = "Replaces your Bee into the Water-Beetle Bee.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Layout = 146
		};
		
		["Momma Bee Jelly"] = {
			Name = "Momma Bee Jelly",
			Description = "Replaces your Bee into the Momma Bee.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Layout = 150
		};
		["Queen Bee Jelly"] = {
			Name = "Queen Bee Jelly",
			Description = "Replaces your Bee into the Queen Bee.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Layout = 150
		};
		["Hardworker Bee Jelly"] = {
			Name = "Hardworker Bee Jelly",
			Description = "Replaces your Bee into the Hardworker Bee.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Layout = 150
		};
		["Bumble Bee Jelly"] = {
			Name = "Bumble Bee Jelly",
			Description = "Replaces your Bee into the Bumble Bee.",
			Type = "Jelly",
			CanInput = true,
			Image = "rbxassetid://8730752530",
			CanBar = false,
			Crafting = false,
			Layout = 150
		};
	}


	Items.Collectors = {
		["Scooper"] = {
			Name = "Scooper",
			Description = "Placeholder",
			Cost = 0,
			Cooldown = 0.8,
			Pollen = 1,
			Power = 0.3,
			Stamp = "Scooper",
			ToolColor = "None",

		},
		["Rake"] = {
			Name = "Rake",
			Description = "Placeholder",
			Cost = 800,
			Cooldown = 0.7,
			Pollen = 2,
			Power = 0.18,
			Stamp = "Rake",
			ToolColor = "None",

		},
		["Scissors"] = {
			Name = "Scissors",
			Description = "Placeholder",
			Cost = 2200,
			Cooldown = 0.6,
			Pollen = 23,
			Power = 0.18,
			Stamp = "Scooper",
			ToolColor = "None",

		},
		["Magnet"] = {
			Name = "Magnet",
			Description = "Placeholder",
			Cost = 5500,
			Cooldown = 0.8,
			Pollen = 2,
			Power = 0.11,
			Stamp = "Magnet",
			ToolColor = "None",

		},
		["Vacuum"] = {
			Name = "Vacuum",
			Description = "Placeholder",
			Cost = 14000,
			Cooldown = 0.85,
			Pollen = 5,
			Power = 0.2,
			Stamp = "Vacuum",
			ToolColor = "None",

		},
		["Opener"] = {
			Name = "Opener",
			Description = "Placeholder",
			Cost = 14000,
			Cooldown = 0.5,
			Pollen = 4,
			Power = 0.4,
			Stamp = "Opener",
			ToolColor = "None",
		},
		["Brush"] = {
			Name = "Brush",
			Description = "Placeholder",
			Cost = 25000,
			Cooldown = 0.7,
			Pollen = 7,
			Power = 0.3,
			Stamp = "Brush",
			ToolColor = "None",
		},
		["Scrape"] = {
			Name = "Scrape",
			Description = "Placeholder",
			Cost = 100000,
			Cooldown = 0.7,
			Pollen = 9,
			Power = 0.6,
			Stamp = "Scrape",
			ToolColor = "None",
		},
		["Electro-Magnet"] = {
			Name = "Electro-Magnet",
			Description = "Placeholder",
			Cost = 250000,
			Cooldown = 0.75,
			Pollen = 12,
			Power = 0.3,
			Stamp = "Magnet2",
			ToolColor = "None",
		},
		["Honey-Spoon"] = {
			Name = "Honey-Spoon",
			Description = "Placeholder",
			Cost = 750000,
			Cooldown = 0.85,
			Pollen = 7,
			Power = 0.2,
			Stamp = "HoneySpoon",
			ToolColor = "None",
		},
		["Caramel Hammer"] = {
			Name = "Caramel Hammer",
			Description = "Placeholder",
			Cost = 750000,
			Cooldown = 0.9,
			Pollen = 15,
			Power = 0.4,
			Stamp = "HoneySpoon",
			PollenMultiplier = 1.25,
			ToolColor = "White",
		},
		["Scythe"] = {
			Name = "Scythe",
			Description = "Placeholder",
			Cost = 0,
			Cooldown = 0.5,
			Pollen = 10,
			Power = 0.2,
			ToolColor = "Red",
			PollenMultiplier = 2,
			Stamp = "Scythe",
		},
		["Snowflake Wand"] = {
			Name = "Snowflake Wand",
			Description = "Placeholder",
			Cost = 250000000,
			Cooldown = 0.75,
			Pollen = 21,
			Power = 0.4,
			ToolColor = "Blue",
			PollenMultiplier = 1.5,
			Stamp = "SnowflakeWand",
		},
		["Honey Cutter"] = {
			Name = "Honey Cutter",
			Description = "Placeholder",
			Cost = 4242424,
			Cooldown = 0.85,
			Pollen = 45,
			Power = 0.5,
			Stamp = "HoneyCutter",
			ToolColor = "None",
			Passive = "United Aura",
			PassiveReq = 15,
		},
	}

	Items.Accessorys = {
		["Bee's Larva"] = {
			Type = "Hat",
			Name = "Bee's Larva Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=9549867611",
			Cost = 0,
			Desc = "Bee's Larva Mask \n +5% Pollen \n +25% Convert Rate",
			Buffs = {{"Pollen", "Percent", 5}, {"Convert Rate", "Percent", 25}},
		},
		["Bee's-Queen Mask"] = {
			Type = "Hat",
			Name = "Bee's-Queen Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=10364019324",
			Cost = 0,
			Desc = "Bee's-Queen Mask \n +25% Pollen \n +150% Caramel \n +5% Instant Conversion \n +10% White Instant Conversion \n +100% Capacity \n x2 White Pollen \n x2 Convert Rate",
			Buffs = {{"Pollen", "Percent", 25}, {"Caramel", "Percent", 150}, {"Instant", "Percent", 5}, {"White Instant", "Percent", 10}, {"Capacity", "Percent", 100}, {"White Pollen", "Multiplier", 2}, {"Convert Rate", "Multiplier", 2}},
		},
		["Rhino's Doll Mask"] = {
			Type = "Hat",
			Name = "Rhino's Doll Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=10364018792",
			Cost = 0,
			Desc = "Rhino's Doll Mask \n x1.5 Blue Pollen \n +25% Pollen \n +15% Tools Speed \n +12% Blue Instant Conversion \n x2 Capacity \n x1.25 Convert Rate \n x3 Pollen From Bubbles",
			Buffs = {{"Pollen", "Percent", 25}, {"Tools Speed", "Percent", 15}, {"Blue Instant", "Percent", 12}, {"Capacity", "Multiplier", 2}, {"Blue Pollen", "Multiplier", 1.5}, {"Pollen From Bubbles", "Multiplier", 3}, {"Convert Rate", "Multiplier", 1.25}},
		},
		["Ladybug's Doll Mask"] = {
			Type = "Hat",
			Name = "Ladybug's Doll Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=10364020195",
			Cost = 0,
			Desc = "Ladybug's Doll Mask \n x1.75 Red Pollen \n +25% Pollen \n +35% Tools Speed \n +25% Red Instant Conversion \n x0.5 Capacity \n x1.75 Convert Rate \n x1.25 Pollen From Flames \n +5 Bee's Attack \n",
			Buffs = {{"Pollen", "Percent", 25}, {"Tools Speed", "Percent", 35}, {"Red Instant", "Percent", 25}, {"Capacity", "Multiplier", 0.5}, {"Red Pollen", "Multiplier", 1.75}, {"Pollen From Flames", "Multiplier", 1.25}, {"Convert Rate", "Multiplier", 1.75}, {"Bee's Attack", "Percent", 5}},
		},
		["Bee's-Doll Mask"] = {
			Type = "Hat",
			Name = "Bee's-Doll Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=9549868699",
			Cost = 0,
			Desc = "Bee's-Doll Mask \n +10% Pollen \n +5% Instant Conversion \n +50% Convert Rate",
			Buffs = {{"Pollen", "Percent", 10}, {"Instant", "Percent", 5}, {"Convert Rate", "Percent", 50}},
		},
		["Bee Mask"] = {
			Type = "Hat",
			Name = "Bee Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=9549767832",
			Cost = 0,
			Desc = "Bee Mask \n x1.15 White Pollen \n +50% White Pollen \n +10% Instant Conversion \n +300% Convert Rate \n +50% Caramel",
			Buffs = {
				{"White Pollen", "Percent", 50},
				{"White Pollen", "Multiplier", 1.15},
				{"Instant", "Percent", 10},
				{"Convert Rate", "Percent", 300},
				{"Caramel", "Percent", 50},
			},
		},
		["Burny-Wasp Mask"] = {
			Type = "Hat",
			Name = "Burny-Wasp Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=9549771617",
			Cost = 0,
			Desc = "Burny-Wasp Mask \n x1.5 Red Pollen \n +10% Red Instant Conversion \n +100% Convert Rate",
			Buffs = {{"Red Instant", "Percent", 10}, {"Red Pollen", "Multiplier", 1.5}, {"Convert Rate", "Percent", 100}},-- {"Flame Pollen", "Percent", 200}},
		},
		["Froze-Wasp Mask"] = {
			Type = "Hat",
			Name = "Froze-Wasp Mask",
			Description = "Placeholder3",
			Image = "http://www.roblox.com/asset/?id=9549770729",
			Cost = 0,
			Desc = "Froze-Wasp Mask  \n x1.5 Blue Pollen \n +10% Blue Instant Conversion \n +100% Convert Rate \n +25% Pollen From Bubbles",
			Buffs = {{"Blue Instant", "Percent", 10}, {"Blue Pollen", "Multiplier", 1.5}, {"Convert Rate", "Percent", 100},{"Pollen From Bubbles", "Percent", 25}},--, {"Snowflake Pollen", "Percent", 200}},
		},
		
		["Pouch"] = {
			Type = "Bag",
			Name = "Pouch",
			Description = "Placeholder1",
			Capacity = 200,
			Cost = 0,
		},
		["Jar"] = {
			Type = "Bag",
			Name = "Jar",
			Description = "Placeholder2",
			Capacity = 800,
			Cost = 0,
		},

		["Backpack"] = {
			Type = "Bag",
			Name = "Backpack",
			Description = "Placeholder3",
			Capacity = 1500,
			Cost = 0,
			--Buffs = {{"Convert Rate", "Percent", 25}, {"Pollen", "Percent", 0}},
		},

		["Knapsack"] = {
			Type = "Bag",
			Name = "Knapsack",
			Description = "Placeholder3",
			Capacity = 5500,
			Cost = 0,
			--Buffs = {{"Convert Rate", "Percent", 50}, {"Pollen", "Percent", 5}},
		},
		["Jousack"] = {
			Type = "Bag",
			Name = "Jousack",
			Description = "Placeholder3",
			Capacity = 15000,
			Cost = 0,
			--Buffs = {{"Convert Rate", "Percent", 50}, {"Pollen", "Percent", 5}},
		},
		["Satchel"] = {
			Type = "Bag",
			Name = "Satchel",
			Description = "Placeholder3",
			Capacity = 27500,
			Cost = 0,
			--Buffs = {{"Convert Rate", "Percent", 50}, {"Pollen", "Percent", 5}},
		},
		["Barrel"] = {
			Type = "Bag",
			Name = "Barrel",
			Description = "Placeholder3",
			Capacity = 52500,
			Cost = 0,
			--Buffs = {{"Convert Rate", "Percent", 50}, {"Pollen", "Percent", 5}},
		},
		["Nesting Box"] = {
			Type = "Bag",
			Name = "Nesting Box",
			Description = "Placeholder3",
			Capacity = 75000,
			Cost = 0,
			Buffs = {{"Convert Rate", "Percent", 25}},--, {"Pollen", "Percent", 5}},
		},
		["Jetpack"] = {
			Type = "Bag",
			Name = "Jetpack",
			Description = "Placeholder3",
			Capacity = 100000,
			Cost = 0,
			Buffs = {{"Convert Rate", "Percent", 50}},--, {"Pollen", "Percent", 5}},
		},
		["Port-Hive"] = {
			Type = "Bag",
			Name = "Port-Hive",
			Description = "Placeholder3",
			Capacity = 150000,
			Cost = 0,
			Buffs = {{"Convert Rate", "Percent", 75}, {"Pollen", "Percent", 15}},
		},
		["Fridge"] = {
			Type = "Bag",
			Name = "Fridge",
			Description = "Placeholder3",
			Capacity = 250000,
			Cost = 0,
			Buffs = {{"Convert Rate", "Percent", 125},{"Blue Pollen", "Percent", 100}},
		},
		
		["Furnace"] = {
			Type = "Bag",
			Name = "Furnace",
			Description = "Placeholder3",
			Capacity = 250000,
			Cost = 0,
			Buffs = {{"Convert Rate", "Percent", 125}, {"Red Pollen", "Percent", 100}},
		},
		
		["Waxed Port-Hive"] = {
			Type = "Bag",
			Name = "Furnace",
			Description = "Placeholder3",
			Capacity = 550000,
			Cost = 0,
			Buffs = {{"Convert Rate", "Percent", 250}, {"White Pollen", "Percent", 150}},
		},
		
		["United Bag"] = {
			Type = "Bag",
			Name = "United Bag",
			Description = "Placeholder3",
			Capacity = 1500000,
			Cost = 0,
			Buffs = {{"Convert Rate", "Percent", 500}, {"White Pollen", "Percent", 200},{"Blue Pollen", "Percent", 150},{"Red Pollen", "Percent", 150},{"Blue Pollen", "Multiplier", 1.15},{"Red Pollen", "Multiplier", 1.15},{"Pollen", "Multiplier", 1.5}},
		},

		["Worker"] = {
			Type = "Acc",
			AType = "Boots",
			Name = "Worker",
			DisName = "Worker Boots",
			Image = "http://www.roblox.com/asset/?id=9385918962",
			Desc = "Rubber Boots \n +1 Movement Collection \n +15% Player Movespeed \n +10% Jump Power",
			Buffs = {{"Movement Collection", "Percent", 1}, {"Player Movespeed", "Percent", 15}, {"Jump Power", "Percent", 10}},
		},
		
		["Leather"] = {
			Type = "Acc",
			AType = "Boots",
			Name = "Leather",
			DisName = "Leather Boots",
			Image = "rbxassetid://9385913761",
			Desc = "Leather Boots \n +3 Movement Collection \n +35% Player Movespeed \n +25% Jump Power",
			Buffs = {{"Movement Collection", "Percent", 3}, {"Player Movespeed", "Percent", 35}, {"Jump Power", "Percent", 25}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},
		
		["United"] = {
			Type = "Acc",
			AType = "Boots",
			Name = "United",
			DisName = "United Boots",
			Image = "http://www.roblox.com/asset/?id=9912340673",
			Desc = "United Boots \n +6 Movement Collection \n +55% Player Movespeed \n +40% Jump Power",
			Buffs = {{"Movement Collection", "Percent", 6}, {"Player Movespeed", "Percent", 55}, {"Jump Power", "Percent", 40}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},

		["Gold-plated Red Guard"] = {
			Type = "Acc",
			AType = "RightGuard",
			Name = "Gold-plated Red Guard",
			DisName = "Gold-plated Red Guard",
			Image = "http://www.roblox.com/asset/?id=9912510884",
			Desc = "Gold-plated Red Guard \n +25000 Capacity \n x1.25 Red Pollen",
			Capacity = 25000,
			Buffs = {{"Red Pollen", "Multiplier", 1.25}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},
		["Gold-plated Blue Guard"] = {
			Type = "Acc",
			AType = "LeftGuard",
			Name = "Gold-plated Blue Guard",
			DisName = "Gold-plated Blue Guard",
			Image = "http://www.roblox.com/asset/?id=9912509893",
			Desc = "Gold-plated Blue Guard \n +25000 Capacity \n x1.25 Blue Pollen",
			Capacity = 25000,
			Buffs = {{"Blue Pollen", "Multiplier", 1.25}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},

		["Improved Red Guard"] = {
			Type = "Acc",
			AType = "RightGuard",
			Name = "Improved Red Guard",
			DisName = "Improved Red Guard",
			Image = "http://www.roblox.com/asset/?id=9912492264",
			Desc = "Improved Red Guard \n +15000 Capacity \n x1.15 Red Pollen",
			Capacity = 15000,
			Buffs = {{"Red Pollen", "Multiplier", 1.15}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},
		["Improved Blue Guard"] = {
			Type = "Acc",
			AType = "LeftGuard",
			Name = "Improved Blue Guard",
			DisName = "Improved Blue Guard",
			Image = "http://www.roblox.com/asset/?id=9912491261",
			Desc = "Improved Blue Guard \n +15000 Capacity \n x1.15 Blue Pollen",
			Capacity = 15000,
			Buffs = {{"Blue Pollen", "Multiplier", 1.15}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},

		["Red Guard"] = {
			Type = "Acc",
			AType = "RightGuard",
			Name = "Red Guard",
			DisName = "Red Guard",
			Image = "http://www.roblox.com/asset/?id=9912472135",
			Desc = "Red Guard \n +7500 Capacity \n x1.05 Red Pollen",
			Capacity = 7500,
			Buffs = {{"Red Pollen", "Multiplier", 1.05}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},
		["Blue Guard"] = {
			Type = "Acc",
			AType = "LeftGuard",
			Name = "Improved Blue Guard",
			DisName = "Improved Blue Guard",
			Image = "http://www.roblox.com/asset/?id=9912471102",
			Desc = "Blue Guard \n +7500 Capacity \n x1.05 Blue Pollen",
			Capacity = 7500,
			Buffs = {{"Blue Pollen", "Multiplier", 1.05}},--, {"Pollen", "Percent", 25}, {"White Pollen", "Percent", 50}, {"Blue Pollen", "Percent", 50}, {"Red Pollen", "Percent", 50}},
		},
	}
end

return Items
