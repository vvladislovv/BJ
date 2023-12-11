
local module = {
	Name = "Redflower Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9541803772",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 8,
	StringNames = {"Redflower Field Pollen"},
	Boosts = {
		{
			["Type"] = "Red Flowers",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
