
local module = {
	Name = "Cactus Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9413297902",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 11,
	StringNames = {"Cactus Field Pollen"},
	Boosts = {
		{
			["Type"] = "Cactus",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}
return module
