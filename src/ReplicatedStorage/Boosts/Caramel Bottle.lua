
local module = {
	Name = "Caramel Bottle",
	BoostImage = "http://www.roblox.com/asset/?id=9647377701",
	Color = Color3.fromRGB(89,85,76),
	Time = 600,
	MaxStack = 1,
	Layout = 14,
	StringNames = {"Pollen From Tools", "Tools Speed"},
	Boosts = {
		{
			["Type"] = "Pollen From Tools",
			["Mod"] = "Mult",
			["Amount"] = 1.25,
		},
		{
			["Type"] = "Tools Speed",
			["Mod"] = "Percent",
			["Amount"] = 5,
		},
	},
}

return module
