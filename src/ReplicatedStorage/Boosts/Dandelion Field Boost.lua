
local module = {
	Name = "Dandelion Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9541802697",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 8,
	StringNames = {"Dandelion Field Pollen"},
	Boosts = {
		{
			["Type"] = "Dandelion",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
