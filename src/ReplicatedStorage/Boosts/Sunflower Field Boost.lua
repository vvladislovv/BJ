
local module = {
	Name = "Sunflower Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9304594876",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 6,
	StringNames = {"Sunflower Field Pollen"},
	Boosts = {
		{
			["Type"] = "Sunflower",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
