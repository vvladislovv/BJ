
local module = {
	Name = "Pumpkin Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9226931900",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 9,
	StringNames = {"Pumpkin Field Pollen"},
	Boosts = {
		{
			["Type"] = "Pumpkin",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
