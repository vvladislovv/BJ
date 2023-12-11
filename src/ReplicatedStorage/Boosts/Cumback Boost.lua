
local module = {
	Name = "Cumback Boost",
	BoostImage = "rbxassetid://8631925461",
	Color = Color3.fromRGB(115, 31, 241),
	Time = 86400 * 7,
	MaxStack = 1,
	Layout = -99,
	StringNames = {"Attack", "Capacity", "Caramel", "Pollen", "White Instant", "Cactus Field Pollen"},
	Boosts = {
		{
			["Type"] = "Attack",
			["Mod"] = "Percent",
			["Amount"] = 200,
		},
		{
			["Type"] = "Capacity",
			["Mod"] = "Percent",
			["Amount"] = 200,
		},
		{
			["Type"] = "Caramel",
			["Mod"] = "Percent",
			["Amount"] = 200,
		},
		{
			["Type"] = "Pollen",
			["Mod"] = "Percent",
			["Amount"] = 200,
		},
		{
			["Type"] = "White Instant",
			["Mod"] = "Percent",
			["Amount"] = 5,
		},
		{
			["Type"] = "Cactus",
			["Mod"] = "Percent",
			["Amount"] = 200,
		},
	},
}

return module
