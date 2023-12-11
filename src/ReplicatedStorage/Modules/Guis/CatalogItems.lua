local Catalog = {
	["Star Cookie"] = {
		Layout = 100,

		Limit = 3,

		Image = "rbxassetid://9961078660",
		Description = "Makes a Bee into a Gifted Bee.",

		Content = {
			{
				ItemType = "Star Cookie",
				ItemAmount = 1,
			},
		},

		Cost = {
			{
				ItemType = "Diamond Egg",
				ItemAmount = 5,
			},
			{
				ItemType = "Legendary Sprout",
				ItemAmount = 5,
			},
			{
				ItemType = "Night-Bell",
				ItemAmount = 5,
			},
		},
	},
	
	["Night-Bell"] = {
		Layout = 100,

		Limit = 3,

		Image = "rbxassetid://9961078660",
		Description = "Makes a Bee into a Gifted Bee.",

		Content = {
			{
				ItemType = "Night-Bell",
				ItemAmount = 1,
			},
		},

		Cost = {
			{
				ItemType = "Ticket",
				ItemAmount = 50,
			},
			{
				ItemType = "Instant Converter",
				ItemAmount = 5,
			},
		},
	},

	["Booster Bundle"] = {
		Layout = 300,
		
		Limit = 2,
		
		Image = "rbxassetid://8413520714",
		Description = "Bundle Content: 10 Instant Converters, Caramel Bottle, Butter, Energy Drink, Strawberry and Blueberry Juice.",

		Content = {
			{
				ItemType = "Caramel Bottle",
				ItemAmount = 1,
			},
			{
				ItemType = "Instant Converter",
				ItemAmount = 10,
			},
			{
				ItemType = "Butter",
				ItemAmount = 1,
			},
			{
				ItemType = "Energy Drink",
				ItemAmount = 1,
			},
			{
				ItemType = "Strawberry Juice",
				ItemAmount = 1,
			},
			{
				ItemType = "Blueberry Juice",
				ItemAmount = 1,
			},
		},

		Cost = {
			{
				ItemType = "Golden Egg",
				ItemAmount = 1,
			},
			{
				ItemType = "Ticket",
				ItemAmount = 50,
			},
		},
	},
	
	["Conversion Bundle"] = {
		Layout = 400,

		Limit = 1,

		Image = "rbxassetid://8413520714",
		Description = "Bundle Content: 30 Instant Converters and 3 Energy Drinks.",

		Content = {
			{
				ItemType = "Instant Converter",
				ItemAmount = 30,
			},
			{
				ItemType = "Energy Drink",
				ItemAmount = 3,
			},
		},

		Cost = {
			{
				ItemType = "Diamond Egg",
				ItemAmount = 1,
			},
			{
				ItemType = "Ticket",
				ItemAmount = 100,
			},
			{
				ItemType = "Spoiled Cookie",
				ItemAmount = 25,
			},
		},
	},
	
	["Toothy Bee Egg"] = {
		Layout = 500,

		Limit = 1,

		Image = "rbxassetid://8413520714",
		Description = "Bundle Content: 30 Instant Converters and 3 Energy Drinks.",

		Content = {
			{
				ItemType = "Toothy Bee Egg",
				ItemAmount = 1,
			},
		},

		Cost = {
			{
				ItemType = "Diamond Egg",
				ItemAmount = 1,
			},
			{
				ItemType = "Ticket",
				ItemAmount = 300,
			},
			{
				ItemType = "Blueberry Juice",
				ItemAmount = 50,
			},
			{
				ItemType = "Night-Bell",
				ItemAmount = 1,
			},
		},
	},
}

return Catalog
