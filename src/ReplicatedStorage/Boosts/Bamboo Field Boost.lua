
local module = {
	Name = "Bamboo Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9541800987",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 6,
	StringNames = {"Bamboo Field Pollen"},
	Boosts = {
		{
			["Type"] = "Bamboo",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
