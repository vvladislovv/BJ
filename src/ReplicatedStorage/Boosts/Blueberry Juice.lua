
local module = {
	Name = "Blueberry Juice",
	BoostImage = "http://www.roblox.com/asset/?id=9656864240",
	Color = Color3.fromRGB(56, 162, 255),
	Time = 600,
	MaxStack = 1,
	Layout = 13,
	StringNames = {"Blue Pollen", "Blue Instant Conversion"},
	Boosts = {
		{
			["Type"] = "Blue Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.25,
		},
		{
			["Type"] = "Blue Instant",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
