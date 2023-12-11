
local module = {
	Name = "Daisy Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9303071328",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 4,
	StringNames = {"Daisy Field Pollen"},
	Boosts = {
		{
			["Type"] = "Daisy",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
