
local module = {
	Name = "Pine Tree Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9413245016",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 10,
	StringNames = {"Pine Tree Field Pollen"},
	Boosts = {
		{
			["Type"] = "Pine Tree",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
