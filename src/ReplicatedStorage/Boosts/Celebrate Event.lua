
local module = {
	Name = "Celebrate Event",
	BoostImage = "rbxassetid://8631925461",
	Color = Color3.fromRGB(0, 213, 255),
	Time = 86400 / 2,
	MaxStack = 1,
	Layout = 0,
	StringNames = {"Pollen", "Convert Rate", "Player Movespeed", "Instant Conversion", "Bomb Pollen", "White Bomb Pollen", "Blue Bomb Pollen", "Red Bomb Pollen", "Bomb Instant", "White Bomb Instant", "Blue Bomb Instant", "Red Bomb Instant"},
	Boosts = {
		[1] = {
			["Type"] = "Pollen",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
		[2] = {
			["Type"] = "Convert Rate",
			["Mod"] = "Percent",
			["Amount"] = 300,
		},
		[3] = {
			["Type"] = "Player Movespeed",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
		[4] = {
			["Type"] = "Instant",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
		[5] = {
			["Type"] = "Bomb Pollen",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
		[6] = {
			["Type"] = "White Bomb Pollen",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
		[7] = {
			["Type"] = "Blue Bomb Pollen",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
		[8] = {
			["Type"] = "Red Bomb Pollen",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
		[9] = {
			["Type"] = "Bomb Instant",
			["Mod"] = "Percent",
			["Amount"] = 50,
		},
		[10] = {
			["Type"] = "White Bomb Instant",
			["Mod"] = "Percent",
			["Amount"] = 50,
		},
		[11] = {
			["Type"] = "Blue Bomb Instant",
			["Mod"] = "Percent",
			["Amount"] = 50,
		},
		[12] = {
			["Type"] = "Red Bomb Instant",
			["Mod"] = "Percent",
			["Amount"] = 50,
		},
	},
}

return module
