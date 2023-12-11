local module = {}

module.Dialogs = {
	--["BeezBuzz Bear"] = {
	--	Dialogue = {
	--		"Hello My Two-Legged Bee!",
	--		"I came here to give you Rewards for gaining Experience",
	--		"It's called a \n [''Bee's Pass'']",
	--		"There is a Free Reward Line and a Paid One",
	--		"You can open it with \n [''Bee's Pass Ticket'']",
	--		"With a Small Chance, you may get Lucky and get this \n [''Bee's Pass Ticket''] \n for Free, But you need to be Lucky",
	--		"But you can buy a \n [''Bee's Pass Ticket''] \n from Me",
	--	}
	--}
}

module.Quests = {
	["Black Bear"] = {
		Name = "Black Bear",
		NoQuests = {"At the moment, you have completed all the tasks! come back later"},--, "<3"},
		Quests = {
			[1] = {
				Name = "The beginning of the great way",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Hello my dear friend! I haven't met you before, maybe you're a beginner? Okay, let me give you the first training tasks",
						"First, you need to collect 100 Red pollen, as well as 100 pollen from Daisy Field",
					},
					During = {
						"You've already taken the quest from me. Do it so that I can give you a new one",
					},
					Completed = {
						"Well done, you have completed my task! Here you go! You deserve your 250 Honey",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 100,
					},

					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 250,
					}
				},
			},
			[2] = {
				Name = "The Bee tamer",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"So. You have to make friends with bees. they give you all sorts of good stuff from time to time. these things are called tokens",
						"In order for them to give you tokens, you must collect pollen from the fields with them",
						"Good luck",
					},
					During = {
						"Don't be lazy, I will give you a reward only after completing",
					},
					Completed = {
						"Good job! here, treat your hard workers",
					}
				},
				Tasks = {
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 15,
					},

					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 500,
					},
					{
						Present = "Inventory",
						ValueType = "Cookie",
						Amount = 10,
					},
				},
			},
			[3] = {
				Name = "What's that up there on the hill?",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"See that hill over there? Who's there? a bear? go there",
						"And collect 800 pollen from Sunflower Field and collect 5 Strawberry Tokens",
					},
					During = {
						"I'm waiting for pollen. I need pollen",
					},
					Completed = {
						"Well Done! you were able to do it, at the moment you are completed the 3rd quest. Did I tell you that for 15 quests you will get a Diamond Egg?",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = 800,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 5,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 1200,
					},
				},
			},
			[4] = {
				Name = "Journey to New Lands",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Have you already opened a location for 5 bees?",
						"Okay, then go there to Blue Flowers Field and collect 2,500 pollen for me",
						"And...",
						"That's all. Go!",
					},
					During = {
						"Still collecting pollen? Okay, I'm waiting",
						"How are you doing with my Quest?",
					},
					Completed = {
						"Good! Keep it!",
						"This is a new currency. you can buy a lot of things for it",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 3000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 3500,
					},

					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
				},
			},
			[5] = {
				Name = "Red Blue and White!",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Yeah, you did my quests so fast.",
						"Then. Collect Me 1500 Pollen From Blue Flowers, Daisy and Mushroom Fields",
					},
					During = {
						"You've already taken the quest from me. Do it so that I can give you a new one",
					},
					Completed = {
						"Well done! keep your Silver Egg and a bunch of Honey",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 1500,
					},

					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 1500,
					},

					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 1500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 4000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Silver Egg",
						Amount = 1,
					},
				},
			},
			[6] = {
				Name = "Blue Strawberry?",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Go and collect me 8,500 Pollen from Strawberry Field",
						"And a little more blue",
					},
					During = {
						"Still collecting pollen? Okay, I'm waiting",
					},
					Completed = {
						"Yes!! well done, treat your bees to strawberries",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 8500,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 1500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 15000,
					},

					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 3,
					},

					{
						Present = "Inventory",
						ValueType = "Strawberry",
						Amount = 25,
					},
				},
			},
			[7] = {
				Name = "Everything is so sticky",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Have you noticed that the flowers are covered with some kind of sticky stuff",
						"Collect this strange thing for me",
					},
					During = {
						"Still collecting pollen? Okay, I'm waiting",
					},
					Completed = {
						"Keep up the good work! Take it",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 15000,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 25,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 15000,
					},

					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 3,
					},

					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},

					{
						Present = "Inventory",
						ValueType = "Sugar",
						Amount = 15,
					},
				},
			},
			[8] = {
				Name = "Red + Blue = Purple",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Do you know what happens if you mix red with blue?",
						"Collect 15,000 Pollen from Strawberry and Pine Tree fields for me",
						"And...",
						"Collect 3,500 Pollen from Mushroom and Blue Flowers fields",
					},
					During = {
						"Have you finished my quest? no??",
						"I will give you a new quest only after the end of this",
					},
					Completed = {
						"Good job! here, treat your hard workers",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 3500,
					},
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 7500,
					},
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 3500,
					},
					{
						Type = "FieldPollen",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 7500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 25000,
					},

					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry",
						Amount = 15,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 15,
					},
				},
			},
			[9] = {
				Name = "Ouch!! it stings",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Go and collect me 50,000 Pollen from Cactus Field",
						"And 25,000 pollen any colors",
					},
					During = {
						"I am waiting",
					},
					Completed = {
						"KEEP IT UP! Ay, what is prickly you brought me?",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Cactus",
						StartAmount = 0,
						NeedAmount = 50000,
					},
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 25000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 150000,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 50,
					},
				},
			},
			[10] = {
				Name = "Holy Moly!",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Well. Now I'll give you a more difficult task",
						"Collect 150,000 pollen from Pine Tree Field",
						"50,000 Pollen from Daisy",
						"50,000 Red Pollen and...",
						"Collect 150 any tokens",
					},
					During = {
						"Still not giving up?  I'm proud of you",
					},
					Completed = {
						"You're good. you can put up a monument",
						"he-he",
						"You completed 10 quests. Take it! Your Golden Egg",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 150000,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 50000,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 50000,
					},
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 150,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 200000,
					},
					{
						Present = "Inventory",
						ValueType = "Golden Egg",
						Amount = 1,
					},
				},
			},
			[11] = {
				Name = "Flower Cocktail",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Keep this quest, I don't know how long it will take you",
						"But I am patient",
					},
					During = {
						"Aren't you tired of running yet?",
					},
					Completed = {
						"You're good. Take it!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "FieldPollen",
						Field = "Pumpkin",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "FieldPollen",
						Field = "Cactus",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 15000,
					},
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 15000,
					},
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = 15000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 225000,
					},
					{
						Present = "Inventory",
						ValueType = "Sprout",
						Amount = 2,
					},
					{
						Present = "Inventory",
						ValueType = "Cookie",
						Amount = 150,
					},
				},
			},
			[12] = {
				Name = "Only Blue",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Keep this quest, I don't know how long it will take you",
						"But I am patient",
					},
					During = {
						"Aren't you tired of running yet?",
					},
					Completed = {
						"You're good. Take it!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 55000,
					},
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 32500,
					},
					{
						Type = "FieldPollen",
						Field = "Cattail",
						StartAmount = 0,
						NeedAmount = 75000,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 265000,
					},
					{
						Present = "Inventory",
						ValueType = "Sprout",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry Juice",
						Amount = 3,
					},
				},
			},
			[13] = {
				Name = "Reded!",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Hehe.. now red",
						"Keep this quest, I don't know how long it will take you",
						"You have 2 Quests left before Diamond Egg",
					},
					During = {
						"Aren't you tired of running yet?",
					},
					Completed = {
						"You're good. Take it!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 85000,
					},
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 65000,
					},
					{
						Type = "FieldPollen",
						Field = "Red Flowers",
						StartAmount = 0,
						NeedAmount = 115000,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 150,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 315000,
					},
					{
						Present = "Inventory",
						ValueType = "Rare Sprout",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry Juice",
						Amount = 5,
					},
				},
			},
			[14] = {
				Name = "Penultimate Quest",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"Well, this is your penultimate Quest",
						"it won't be as complicated as the last one",
						"You have 1 Quests left before Diamond Egg",
					},
					During = {
						"Aren't you tired of running yet?",
					},
					Completed = {
						"You're good. Take it!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						--Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 450000,
					},
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = 65000,
					},
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 115000,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 75000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 350000,
					},
					{
						Present = "Inventory",
						ValueType = "Cookie",
						Amount = 245,
					},
				},
			},
			[15] = {
				Name = "On the way to Diamond",
				Giver = "Black Bear",
				Dialogue = {
					Start = {
						"My friend, this is your last quest",
						"I don't know when I'll be able to give you new Quests again",
						"As soon as they say from above",
					},
					During = {
						"Aren't you tired of running yet?",
					},
					Completed = {
						"Good job! see you again",
						"Here's your well-deserved Diamond Egg",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 5000000,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 500000,
					},
					{
						Present = "Inventory",
						ValueType = "Diamond Egg",
						Amount = 1,
					},
				},
			},
		}
	},
	
	["Brown Bear2"] = {
		Name = "Brown Bear2",
		NoQuests = {"Hello my friend! I'll give you a task in half an hour, come back later"},--, "<3"},
		Quests = {
			[1] = {
				Name = "Pollination!",
				Giver = "Brown Bear2",
				Dialogue = {
					Start = {
						"Hello! Here, I have a quest for you",
					},
					During = {
						"As soon as you're done with the quest, come to me",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = math.random(10000,15000),
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = math.random(2500,5000),
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = math.random(2500,5000),
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 10000,
					},
					{
						Present = "Inventory",
						ValueType = "Sprout",
						Amount = 1,
					},
				},
			},
			[2] = {
				Name = "White Flowers!",
				Giver = "Brown Bear2",
				Dialogue = {
					Start = {
						"Hello! Here, I have a quest for you",
					},
					During = {
						"As soon as you're done with the quest, come to me",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = math.random(45000,75000),
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 15000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = math.random(1,3),
					},
				},
			},
			[3] = {
				Name = "Back to the Beginning",
				Giver = "Brown Bear2",
				Dialogue = {
					Start = {
						"Hello! Here, I have a quest for you",
					},
					During = {
						"As soon as you're done with the quest, come to me",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = math.random(10000,15000),
					},
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = math.random(10000,15000),
					},
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = math.random(10000,15000),
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 10000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = math.random(1,3),
					},
				},
			},
			[4] = {
				Name = "Beekeeping!",
				Giver = "Brown Bear2",
				Dialogue = {
					Start = {
						"Hello! Here, I have a quest for you",
					},
					During = {
						"As soon as you're done with the quest, come to me",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = math.random(20000,35000),
					},
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = math.random(15,50),
					},
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = math.random(20000,35000),
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 15000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = math.random(1,3),
					},
				},
			},
			[5] = {
				Name = "Pollen Time!",
				Giver = "Brown Bear2",
				Dialogue = {
					Start = {
						"Hello! Here, I have a quest for you",
					},
					During = {
						"As soon as you're done with the quest, come to me",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = math.random(10000,50000),
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = math.random(10000,50000),
					},
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = math.random(25000,50000),
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 20000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = math.random(1,5),
					},
				},
			},
		}
	},
	
	["Resin Bear"] = {
		Name = "Resin Bear",
		NoQuests = {"You have completed all my quests and at the moment your bonus to the Convert Rate is 150%"},--, "<3"},
		Quests = {
			[1] = {
				Name = "Fast Beehive",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hello, my friend! For my quests you will receive a bonus to the Convert Rate",
						"10% for each quest",
						"I have 15 quests in total",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 56721,
					},
					{
						Type = "FieldPollen",
						Field = "Cactus",
						StartAmount = 0,
						NeedAmount = 46789,
					},
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 37895,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 45672,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
				},
			},
			[2] = {
				Name = "Wood Resin",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
					    NColor = "White",
						StartAmount = 0,
						NeedAmount = 23564,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "FieldPollen",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 75093,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 56782,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Sprout",
						Amount = 1,
					},
				},
			},
			[3] = {
				Name = "Pollen Scout",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 35687,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 25468,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 45642,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 34531,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 2,
					},
				},
			},
			[4] = {
				Name = "Exotic Fruits",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 125623,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 150,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 150,
					},
					{
						Type = "TypeTokens",
						Token = "Seed",
						StartAmount = 0,
						NeedAmount = 150,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 47813,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry Juice",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry Juice",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
				},
			},
			[5] = {
				Name = "Sticky Flowers!",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 125623,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 25,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 61453,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
				},
			},
			[6] = {
				Name = "Fieeeesta!",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 12634,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 5632,
					},
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = 72952,
					},
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 38312,
					},
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 21634,
					},
					{
						Type = "FieldPollen",
						Field = "Pumpkin",
						StartAmount = 0,
						NeedAmount = 16123,
					},
					{
						Type = "FieldPollen",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 43123,
					},
					{
						Type = "FieldPollen",
						Field = "Cactus",
						StartAmount = 0,
						NeedAmount = 23743,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 82634,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
				},
			},
			[7] = {
				Name = "Tokens!",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 264,
					},
					{
						Type = "TypeTokens",
						Token = "Cookie",
						StartAmount = 0,
						NeedAmount = 321,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 184,
					},
					{
						Type = "TypeTokens",
						Token = "Silver Egg",
						StartAmount = 0,
						NeedAmount = 1,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 152145,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 10,
					},
				},
			},
			[8] = {
				Name = "White + Blue + Red = ???",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 350687,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 250468,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 278343,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 212835,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 5,
					},
				},
			},
			[9] = {
				Name = "New Lands!",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Cattail",
						StartAmount = 0,
						NeedAmount = 678234,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 157562,
					},
					{
						Type = "UseItem",
						Item = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 10,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 159341,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 142,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry",
						Amount = 76,
					},
				},
			},
			[10] = {
				Name = "Rad flavers???",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Red Flowers",
						StartAmount = 0,
						NeedAmount = 678234,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 157562,
					},
					{
						Type = "UseItem",
						Item = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 10,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 159341,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 142,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry",
						Amount = 76,
					},
				},
			},
			[11] = {
				Name = "Flower Color Configuration",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 510561,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 561510,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 515160,
					},
					{
						Type = "UseItem",
						Item = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 4,
					},
					{
						Type = "UseItem",
						Item = "Strawberry Juice",
						StartAmount = 0,
						NeedAmount = 4,
					},
					{
						Type = "UseItem",
						Item = "Energy Drink",
						StartAmount = 0,
						NeedAmount = 4,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 1016016,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 7,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 67,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry",
						Amount = 76,
					},
				},
			},
			[12] = {
				Name = "Slippery Flowers",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 1234567,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 75,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 61453,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Energy Drink",
						Amount = 3,
					},
				},
			},
			[13] = {
				Name = "Sticky Honey",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 756675,
					},
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 756675,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 756675,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 153463,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
				},
			},
			[14] = {
				Name = "Flowers Pollen Honey!",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 2563741,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 234512,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 3,
					},
				},
			},
			[15] = {
				Name = "Last Conquest",
				Giver = "Resin Bear",
				Dialogue = {
					Start = {
						"Hold my quest, you can do it!",
					},
					During = {
						"Didn't you finish the Quest? as soon as you finish - come to me and I will give you a reward",
					},
					Completed = {
						"Well done! You've earned your Convert Rate Bonus!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 5850395,
					},
					{
						Type = "FieldPollen",
						Field = "Cactus",
						StartAmount = 0,
						NeedAmount = 755621,
					},
					{
						Type = "FieldPollen",
						Field = "Cattail",
						StartAmount = 0,
						NeedAmount = 1253411,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 345211,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 150,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 645233,
					},
					{
						Present = "AllStats",
						ValueType = "Convert Rate",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 9,
					},
					{
						Present = "Inventory",
						ValueType = "Golden Egg",
						Amount = 1,
					},
				},
			},
		}
	},
	
	["Caramel Bear"] = {
		Name = "Caramel Bear",
		NoQuests = {"You have completed all my quests and have already received a reward"},--, "<3"},
		Quests = {
			[1] = {
				Name = "Sticky Moment",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"Who are you?",
						"Where am I??",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "AnyCaramel",
						StartAmount = 0,
						NeedAmount = 100,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 5,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 100,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 1,
					},
				},
			},
			[2] = {
				Name = "Milk Sap",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your second quest",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					},
				},
				Tasks = {
					{
						Type = "CaramelColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 250,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 1,
					},
				},
			},
			[3] = {
				Name = "So Salty!!",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your third quest",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelField",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = 3000,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 30,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 565,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 1,
					},
				},
			},
			[4] = {
				Name = "Acceleration",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your fourth quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelField",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 1500,
					},
					{
						Type = "CaramelColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 1500,
					},
					{
						Type = "CaramelField",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 1500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 1000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 2,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 1,
					},
				},
			},
			[5] = {
				Name = "Blue Toffee!",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your fifth quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "AnyCaramel",
						StartAmount = 0,
						NeedAmount = 5500,
					},
					{
						Type = "CaramelField",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 3500,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 45,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 2350,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Sugar",
						Amount = 5,
					},
				},
			},
			[6] = {
				Name = "White?",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your sixth quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "AnyCaramel",
						StartAmount = 0,
						NeedAmount = 15000,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 3450,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Sugar",
						Amount = 15,
					},
				},
			},
			[7] = {
				Name = "Not White!",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your seventh quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "AnyCaramel",
						StartAmount = 0,
						NeedAmount = 100,
					},
					{
						Type = "CaramelField",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 10000,
					},
					{
						Type = "CaramelColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 10000,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 9,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 3450,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Sugar",
						Amount = 1,
					},
				},
			},
			[8] = {
				Name = "Multi-Colored Caramel!!!",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your the 8th quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "AnyCaramel",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "CaramelColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 30000,
					},
					{
						Type = "CaramelColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 30000,
					},
					{
						Type = "CaramelColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 30000,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 7890,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 5,
					},
				},
			},
			[9] = {
				Name = "Cones are not Cones",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your the 9th quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelField",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 75000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 15000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 7,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 5,
					},
				},
			},
			[10] = {
				Name = "Cones are not Cones",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your the 10th quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 100000,
					},
					{
						Type = "CaramelColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 100000,
					},
					{
						Type = "CaramelColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 100000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 35000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Sugar",
						Amount = 25,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 15,
					},
				},
			},
			[11] = {
				Name = "White Conquest!",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your the 11th quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 250000,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 150,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 67000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 1,
					},
				},
			},
			[12] = {
				Name = "Confrontation!",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your the 12th quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 330000,
					},
					{
						Type = "CaramelField",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 330000,
					},
					{
						Type = "CaramelField",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 200000,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 50,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 150000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 3,
					},
				},
			},
			[13] = {
				Name = "Seeds - Life",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your the 13th quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelField",
						Field = "Pumpkin",
						StartAmount = 0,
						NeedAmount = 500000,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "TypeTokens",
						Token = "Seed",
						StartAmount = 0,
						NeedAmount = 50,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 250000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 1,
					},
				},
			},
			[14] = {
				Name = "The end?",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your the 14th quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
					}
				},
				Tasks = {
					{
						Type = "CaramelColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 750000,
					},
					{
						Type = "CaramelColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 50000,
					},
					{
						Type = "CaramelColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 50000,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 50,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 550000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 1,
					},
				},
			},
			[15] = {
				Name = "Next to the caramel!!!",
				Giver = "Caramel Bear",
				Dialogue = {
					Start = {
						"This is your Last Quest!!",
						"Hold it and go!",
					},
					During = {
						"Have time to complete all the tasks, otherwise you may not get a Bee",
					},
					Completed = {
						"Here's the reward. Only it's a little Sticky",
						"Your Sticky Caramel...",
						"...",
						"um...",
						"BEE!!!",
					}
				},
				Tasks = {
					{
						Type = "AnyCaramel",
						StartAmount = 0,
						NeedAmount = 1000000,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 800000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel Bee Egg",
						Amount = 1,
					},
				},
			},
		}
	},
	
	["Cengdop Bear"] = {
		Name = "Cengdop Bear",
		NoQuests = {"sidf}@%@ldPDFShgf**@%*@_Fs#(9fdsFD", "$_$", "^_^"},--, "<3"},
		Quests = {
			[1] = {
				Name = "BJ Weekends Reformation",
				Giver = "Cengdop Bear",
				Dialogue = {
					Start = {
						"Hello, I am the developer of Bees Journey!",
						"I have prepared a small event for you.",
						"One quest, but not everyone can complete it.",
						"Crazy Rewards. Crazy Tasks.",
						"But hurry up. I'll be leaving soon and there will be something here",
						"To get the rewards, you need to find me!",
						"Gooood lucckk!!",
						"Use code: BeesJourneyWeekends",
						"Join our Discord server pls ^^",
						"??S>DS?@>@",
					},
					During = {
						"Wow you found me!",
						"But you didn't do my quest.",
						"Come back here when you've done it!",
						"I'll be leaving soon and there will be something here",
						"Gooood lucckk!!",
					},
					Completed = {
						"YOU'RE JUST CRAZY",
						"OKAY",
						"YOU ARE THE GOD OF THIS GAME",
						"Where are you in the leaderboard?)",
						"claim rewards",
						"^^",
					}
				},
				Tasks = {
					{
						Type = "AnyCaramel",
						StartAmount = 0,
						NeedAmount = 334433,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 999,
					},
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 2424,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 31,
					},
					{
						Type = "UseItem",
						Item = "Sprout",
						StartAmount = 0,
						NeedAmount = 13,
					},
					{
						Type = "UseItem",
						Item = "Legendary Sprout",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "UseItem",
						Item = "Epic Sprout",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "UseItem",
						Item = "Rare Sprout",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 14567891,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 33286156,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 95,
					},
					{
						Present = "Inventory",
						ValueType = "Spoiled Cookie",
						Amount = 5161,
					},
					{
						Present = "Inventory",
						ValueType = "Cookie",
						Amount = 51662,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 107,
					},
					{
						Present = "Inventory",
						ValueType = "Firefly Vial",
						Amount = 7,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry Juice",
						Amount = 11,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry Juice",
						Amount = 11,
					},
					{
						Present = "Inventory",
						ValueType = "Energy Drink",
						Amount = 7,
					},
					{
						Present = "Inventory",
						ValueType = "Shroom",
						Amount = 121,
					},
					{
						Present = "Inventory",
						ValueType = "Sugar",
						Amount = 78,
					},
					{
						Present = "Inventory",
						ValueType = "Sprout",
						Amount = 23,
					},
					{
						Present = "Inventory",
						ValueType = "Rare Sprout",
						Amount = 6,
					},
					{
						Present = "Inventory",
						ValueType = "Epic Sprout",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Legendary Sprout",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Diamond Egg",
						Amount = 2,
					},
				},
				--ReqRewards = {
				--	{
				--		Present = "IStats",
				--		ValueType = "Honey",
				--		Amount = 3,
				--	},
				--	{
				--		Present = "Boost",
				--		ValueType = "Fenix Blessing",
				--		Amount = 1,
				--	},
				--},
			},
		}
	},
	
	["Sand Dog"] = {
		Name = "Sand Dog",
		NoQuests = {"You're great, I'm proud of you! you are the best :3"},--, "<3"},
		Quests = {
			[1] = {
				Name = "Sand in Boots",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"Hi! I just arrived from the beach, found a mini shark on the sand",
						"She must have been lying sunbathing",
						"Have you ever been to the beach?",
						"I even have a photo from the beach.",
						"Do you want to see?",
						"Okay!",
						"Image...",
						"What do you think?",
						"Oh oh oh, right! I wanted to offer you, if you complete all my tasks, then I will give you this shark",
						"I hope you need a shark? Because I can't take her back.",
					},
					During = {
						"The sand is so warm and pleasant...",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 1000,
					},
					{
						Type = "BeesTokens",
						TokenColor = "Blue",
						StartAmount = 0,
						NeedAmount = 5,
					},
					{
						Type = "BeesTokens",
						TokenType = "Blue Bomb",
						StartAmount = 0,
						NeedAmount = 5,
					},
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 15,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 2500,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 15,
					},
				},
			},
			[2] = {
				Name = "The Bruise",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your Second Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 15000,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "BeesTokens",
						TokenType = "Blue Boost",
						StartAmount = 0,
						NeedAmount = 10,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 10000,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry Juice",
						Amount = 1,
					},
				},
			},
			[3] = {
				Name = "a Friend among Strangers",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your Third Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Daisy",
						Color = "Blue",
						StartAmount = 0,
						NeedAmount = 2500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 15000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
				},
			},
			[4] = {
				Name = "Wet Pollination",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your Fourth Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						Color = "Blue",
						StartAmount = 0,
						NeedAmount = 25000,
					},
					{
						Type = "BeesTokens",
						TokenType = "Blue Boost",
						StartAmount = 0,
						NeedAmount = 35,
					},
					{
						Type = "UseItem",
						Item = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 1,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 35000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 3,
					},
				},
			},
			[5] = {
				Name = "Something on Red",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your Fifth Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Clover",
						Color = "Red",
						StartAmount = 0,
						NeedAmount = 150,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 1,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 60000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Cookie",
						Amount = 25,
					},
				},
			},
			[6] = {
				Name = "Blu Blob",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your Sixth Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						Color = "Red",
						StartAmount = 0,
						NeedAmount = 150,
					},
					{
						Type = "UseDispenser",
						Dispenser = "Blueberry Dispenser",
						StartAmount = 0,
						NeedAmount = 2,
					},
					{
						Type = "BeesTokens",
						TokenType = "Blue Boost",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 100000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
				},
			},
			[7] = {
				Name = "Cropped Blue Spheres",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your Seventh Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "BeesTokens",
						TokenColor = "Red",
						StartAmount = 0,
						NeedAmount = 250,
					},
					{
						Type = "BeesTokens",
						TokenColor = "Blue",
						StartAmount = 0,
						NeedAmount = 250,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 125000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Seed",
						Amount = 50,
					},
				},
			},
			[8] = {
				Name = "Wildling!!",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your 8th Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Daisy",
						Color = "Red",
						StartAmount = 0,
						NeedAmount = 17500,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						Color = "Blue",
						StartAmount = 0,
						NeedAmount = 17500,
					},
					{
						Type = "FieldPollen",
						Field = "Pumpkin",
						Color = "Red",
						StartAmount = 0,
						NeedAmount = 75000,
					},
					{
						Type = "FieldPollen",
						Field = "Pumpkin",
						Color = "Blue",
						StartAmount = 0,
						NeedAmount = 75000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 175000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Diamond Egg",
						Amount = 1,
					},
				},
			},
			[9] = {
				Name = "Friendship - Further Promotion",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your 9th Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Sprout",
						StartAmount = 0,
						NeedAmount = 10,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 250,
					},
					{
						Type = "TypeTokens",
						Token = "Seed",
						StartAmount = 0,
						NeedAmount = 250,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 250,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 225000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 15,
					},
					{
						Present = "Inventory",
						ValueType = "Instant Converter",
						Amount = 1,
					},
				},
			},
			[10] = {
				Name = "Sharp as Teeth",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your 10th Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Cactus",
						Color = "White",
						StartAmount = 0,
						NeedAmount = 275000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 325000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry",
						Amount = 250,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 250,
					},
				},
			},
			[11] = {
				Name = "My Favorite",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your 11th Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "UseDispenser",
						Dispenser = "Honey Dispenser",
						StartAmount = 0,
						NeedAmount = 2,
					},
					{
						Type = "UseDispenser",
						Dispenser = "Strawberry Dispenser",
						StartAmount = 0,
						NeedAmount = 3,
					},
					{
						Type = "UseDispenser",
						Dispenser = "Blueberry Dispenser",
						StartAmount = 0,
						NeedAmount = 4,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 375000,
					},
					{
						Present = "Inventory",
						ValueType = "Sugar",
						Amount = 300,
					},
				},
			},
			[12] = {
				Name = "Unies.. Onions",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your 12th Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 500000,
					},
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						Color = "Red",
						StartAmount = 0,
						NeedAmount = 150000,
					},
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						Color = "Blue",
						StartAmount = 0,
						NeedAmount = 150000,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						Color = "White",
						StartAmount = 0,
						NeedAmount = 150000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 275000,
					},
					{
						Present = "Inventory",
						ValueType = "Caramel",
						Amount = 25,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
				},
			},
			[13] = {
				Name = "Not Onions",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your 13th Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 5000000,
					},
					{
						Type = "BeesTokens",
						TokenColor = "Blue",
						StartAmount = 0,
						NeedAmount = 500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 505050,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry Juice",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
				},
			},
			[14] = {
				Name = "Penultimate",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your 14th Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
					}
				},
				Tasks = {
					{
						Type = "BeesTokens",
						TokenColor = "Blue",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "BeesTokens",
						TokenColor = "Red",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "BeesTokens",
						TokenType = "Blue Boost",
						StartAmount = 0,
						NeedAmount = 35,
					},
					{
						Type = "BeesTokens",
						TokenType = "Red Boost",
						StartAmount = 0,
						NeedAmount = 35,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 10000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 1,
					},
				},
			},
			[15] = {
				Name = "Last!!!",
				Giver = "Sand Dog",
				Dialogue = {
					Start = {
						"It's Your Last Quest!",
						"If you are tired, then take a break, you will definitely have time before my departure",
					},
					During = {
						"You're so good! I'd be tired by now if I were you",
					},
					Completed = {
						"Good! Keep up the good work!",
						"Here's yours..",
						"Very Tired..",
						"SHARK!!!!",
					}
				},
				Tasks = {
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 10000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 10000,
					},
					{
						Present = "Inventory",
						ValueType = "Toothy Bee Egg",
						Amount = 1,
					},
				},
			},
		}
	},
	
	["Hermit Bear"] = {
		Name = "Hermit Bear",
		NoQuests = {"I need some time alone. Come back later"},
		Timer = {"Come to me later.. I need to get some sleep"},
		Quests = {
			[1] = {
				Name = "Time",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Who are you? do we know each other?",
						"How long did I sleep?",
						"You.... you.. Oh, no, I was wrong..",
						"Oh...",
						"I don't like to talk",
						"But since you've come",
						"...",
						"...",
						"Keep my Quest",
					},
					During = {
						"Well, when you're done, come to me",
						"I will reward you",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 150000,
					},
					{
						Present = "Inventory",
						ValueType = "Rare Sprout",
						Amount = 1,
					},
				},
			},
			[2] = {
				Name = "Partnership",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Oh...",
						"You again",
						"Okay",
						"...",
						"Keep my Quest",
					},
					During = {
						"Well, when you're done, come to me",
						"I will reward you",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Sprout",
						StartAmount = 0,
						NeedAmount = 5,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 500000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 100000,
					},
					{
						Present = "Inventory",
						ValueType = "Energy Drink",
						Amount = 2,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry Juice",
						Amount = 2,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry Juice",
						Amount = 2,
					},
				},
			},
			[3] = {
				Name = "Leave me Alone...",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Oh... DAMN",
						"It's you again",
						"You know.. I'm so tired..",
						"...",
						"Keep it",
					},
					During = {
						"Well, when you're done, come to me",
						"I will reward you",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "AnyPollen",
						StartAmount = 0,
						NeedAmount = 5000000,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 125000,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 10,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
				},
			},
			[4] = {
				Name = "Dejected",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Oh... how much does my head hurt",
						"...",
						"Keep it",
					},
					During = {
						"Well, when you're done, come to me",
						"I will reward you",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 250,
					},
					{
						Type = "TypeTokens",
						Token = "Strawberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "TypeTokens",
						Token = "Seed",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "TypeTokens",
						Token = "Blueberry",
						StartAmount = 0,
						NeedAmount = 50,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 150,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 50000,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 5,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 1,
					},
				},
			},
			[5] = {
				Name = "Am I not alone?",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Oh, you're back after all",
						"...",
						"I thought you'd never come back",
						"One day my only friend left and never came back",
						".....",
						"Keep it.",
					},
					During = {
						"I believe in you! you will succeed",
						"Necessarily!...",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "UseDispenser",
						Dispenser = "Honey Dispenser",
						StartAmount = 0,
						NeedAmount = 3,
					},
					{
						Type = "FromTokens",
						Res = "Sprout",
						StartAmount = 0,
						NeedAmount = 150,
					},
					{
						Type = "CaramelColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 54500,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 100000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = math.random(5,10),
					},
					{
						Present = "Inventory",
						ValueType = "Caramel Bottle",
						Amount = 1,
					},
				},
			},
			[6] = {
				Name = "White without Bombs",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Hello!!",
						"...",
						"You know, I'm already used to you",
						"You look like an old friend of mine! he was just as single-minded",
						".....",
						"He still doesn't come...",
						"Sorry.. Hold the Quest",
					},
					During = {
						"You.. You're such a wonderful person",
						"I believe in you! you will succeed",
						"I'll be waiting for you!",
					},
					Completed = {
						"Well done! Here's the reward",
						"I don't tell anyone, I only give this to you my Bro)",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Dandelion",
						StartAmount = 0,
						NeedAmount = 10000000,
					},
					{
						Type = "BeesTokens",
						TokenType = "Bomb",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 100000,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 3,
					},
					{
						Present = "Inventory",
						ValueType = "Butter",
						Amount = 1,
					},
				},
			},
			[7] = {
				Name = "Blue Absolute",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Hello!!",
						"...",
						"You... You.. Precisely!!!",
						".....",
						"Hello my friend!!",
						"I'm sorry, I have memory problems.",
						"You know. I love to talking, it's interesting with you!",
						"Please.. Don't leave me alone",
						"I'm afraid of loneliness",
						"aww.. Are you in a hurry",
						"All right, keep the Quest",
						"You're coming back, right?",
					},
					During = {
						"Oooo, you've come!!",
						"How are you, friend?",
						"I wish you a good day, complete the Quest",
					},
					Completed = {
						"Well done! Here's the reward",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Cattail",
						StartAmount = 0,
						NeedAmount = 3500000,
					},
					{
						Type = "FieldPollen",
						Field = "Pine Tree",
						StartAmount = 0,
						NeedAmount = 2500000,
					},
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
					{
						Type = "UseItem",
						Item = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 3,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 124500,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry Juice",
						Amount = 1,
					},
					{
						Present = "Inventory",
						ValueType = "Royal Jelly",
						Amount = 3,
					},
				},
			},
			[8] = {
				Name = "Something's Wrong.",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"I haven't slept much",
						".....",
						"...",
						"Never mind, I just need to rest.",
						"Take it..."
					},
					During = {
						"You already are..",
						"Already have the Quest",
						"...",
					},
					Completed = {
						"Well done...",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 56900,
					},
					{
						Type = "TypeTokens",
						Token = "Honey",
						StartAmount = 0,
						NeedAmount = 750,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 7500,
					},
					{
						Present = "Inventory",
						ValueType = "Blueberry",
						Amount = 15,
					},
					{
						Present = "Inventory",
						ValueType = "Seed",
						Amount = 7,
					},
				},
			},
			[9] = {
				Name = "A Premonition",
				Giver = "Hermit Bear",
				Dialogue = {
					Start = {
						"Aren't you tired of me?",
						"Maybe my Quests are too hard",
						"Well.. I need to rest",
						"...",
						"Hold. it's not too hard",
					},
					During = {
						"You already are..",
						"Already have the Quest",
						"...",
					},
					Completed = {
						"Well done!...",
					}
				},
				Tasks = {
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 1500000,
					},
					{
						Type = "FieldPollen",
						Field = "Clover",
						StartAmount = 0,
						NeedAmount = 31000,
					},
					{
						Type = "TypeTokens",
						Token = "Seed",
						StartAmount = 0,
						NeedAmount = 15,
					},
				},
				Rewards = {
					{
						Present = "IStats",
						ValueType = "Honey",
						Amount = 5000,
					},
					{
						Present = "Inventory",
						ValueType = "Strawberry",
						Amount = 7,
					},
					{
						Present = "Inventory",
						ValueType = "Ticket",
						Amount = 1,
					},
				},
			},
		}
	},
	["BeezBuzz Bear"] = {
		Name = "BeezBuzz Bear",
		NoQuests = {"I need some time alone. Come back later"},
		Quests = {
			[1] = {
				Name = "Alt Daisy",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"take the quest",
						"* boom boom *",
						"* Buzz Buzz *",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 5678,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 25,
					},
				},
			},
			[2] = {
				Name = "Alt Sunflowers",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Sprout",
						StartAmount = 0,
						NeedAmount = 2,
					},
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = 3765,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 50,
					},
				},
			},
			[3] = {
				Name = "Alt Strawberry",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
						"red",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Strawberry Juice",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 83232,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 75,
					},
				},
			},
			[4] = {
				Name = "Alt Blueberry",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
						"blu",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 2,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 99991,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 100,
					},
				},
			},
			[5] = {
				Name = "again",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
						"go again",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
						"again.",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Blueberry Juice",
						StartAmount = 0,
						NeedAmount = 4,
					},
					{
						Type = "UseItem",
						Item = "Strawberry Juice",
						StartAmount = 0,
						NeedAmount = 2,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 2,
					},
					{
						Type = "UseItem",
						Item = "Sprout",
						StartAmount = 0,
						NeedAmount = 2,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 19991 * 2,
					},
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 2678 * 2,
					},
					{
						Type = "FieldPollen",
						Field = "Sunflower",
						StartAmount = 0,
						NeedAmount = 4765 * 2,
					},
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 33232 * 2,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 150,
					},
				},
			},
			[6] = {
				Name = "mistake",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
						"oh, my bad..",
						"oh, maybe its last quest",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
						"buz.",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Energy Drink",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "PollenColor",
						NColor = "White",
						StartAmount = 0,
						NeedAmount = 100000,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 100000,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 100000,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 100,
					},
				},
			},
			[7] = {
				Name = "think",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
						"buz.",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Energy Drink",
						StartAmount = 0,
						NeedAmount = 1,
					},
					{
						Type = "PollenColor",
						NColor = "Red",
						StartAmount = 0,
						NeedAmount = 33333,
					},
					{
						Type = "PollenColor",
						NColor = "Blue",
						StartAmount = 0,
						NeedAmount = 33333,
					},
					{
						Type = "FieldPollen",
						Field = "Clover",
						StartAmount = 0,
						NeedAmount = 66665,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 100,
					},
				},
			},
			[8] = {
				Name = "termit moment",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
						"buz.",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Daisy",
						StartAmount = 0,
						NeedAmount = 25000,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 100,
					},
				},
			},
			[9] = {
				Name = "fibi",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
						"buz.",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Clover",
						StartAmount = 0,
						NeedAmount = 27800 * 2,
					},
					{
						Type = "FieldPollen",
						Field = "Mushroom",
						StartAmount = 0,
						NeedAmount = 27800,
					},
					{
						Type = "FieldPollen",
						Field = "Blue Flowers",
						StartAmount = 0,
						NeedAmount = 27800,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 100,
					},
				},
			},
			[10] = {
				Name = "again 2",
				Giver = "BeezBuzz Bear",
				Dialogue = {
					Start = {
						"* buzz buzz buzz *",
					},
					During = {
						"???",
					},
					Completed = {
						"oh yea",
						"buz.",
					}
				},
				Tasks = {
					{
						Type = "FieldPollen",
						Field = "Clover",
						StartAmount = 0,
						NeedAmount = 27800 * 5,
					},
					{
						Type = "FieldPollen",
						Field = "Strawberry",
						StartAmount = 0,
						NeedAmount = 25000 * 2,
					},
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 5,
					},
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 22,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 200,
					},
				},
			},
		}
	},
	["Worm Ethan"] = {
		Name = "Worm Ethan",
		NoQuests = {"pls wait some time."},
		Quests = {
			[1] = {
				Name = "1 Quest - More Books",
				Giver = "Worm Ethan",
				Dialogue = {
					Start = {
						"learn",
						"* boom boom *",
						"* Buzz Buzz *",
						"stop what",
						"do not pay attention",
					},
					During = {
						"???",
					},
					Completed = {
						"buz buz",
					}
				},
				Tasks = {
					{
						Type = "UseItem",
						Item = "Caramel",
						StartAmount = 0,
						NeedAmount = 25,
					},
					{
						Type = "AnyTokens",
						StartAmount = 0,
						NeedAmount = 100,
					},
				},
				Rewards = {
					{
						Present = "Beespass",
						ValueType = "Xp",
						Amount = 150,
					},
					{
						Present = "Book",
						ValueType = "Inventory",
						Amount = 5,
					},
					{
						Present = "Ticket",
						ValueType = "Inventory",
						Amount = 25,
					},
				},
			},
		}
	},
}

return module