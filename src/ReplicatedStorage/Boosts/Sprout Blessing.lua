
local module = {
	Name = "Sprout Blessing",
	BoostImage = "rbxassetid://8602349626",
	Color = Color3.fromRGB(60, 126, 81),
	Time = 900,
	TimeUpdate = true,
	MaxStack = 10,
	Layout = 3,
	StringNames = {"Pollen"},
	Boosts = {
		[1] = {
			["Type"] = "Pollen",
			["Mod"] = "Percent",
			["Amount"] = 5,
		},
	},
}

return module
