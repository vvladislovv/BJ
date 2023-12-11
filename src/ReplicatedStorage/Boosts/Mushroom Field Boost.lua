
local module = {
	Name = "Mushroom Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9303060654",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 5,
	StringNames = {"Mushroom Field Pollen"},
	Boosts = {
		{
			["Type"] = "Mushroom",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
