
local module = {
	Name = "Cattail Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9541801780",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 8,
	StringNames = {"Cattail Field Pollen"},
	Boosts = {
		{
			["Type"] = "Cattail",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
