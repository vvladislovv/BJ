
local module = {
	Name = "Blue Flowers Field Boost",
	BoostImage = "rbxassetid://9304100743",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 7,
	StringNames = {"Blue Flowers Field Pollen"},
	Boosts = {
		{
			["Type"] = "Blue Flowers",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
	
}

return module
