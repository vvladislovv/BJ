
local module = {
	Name = "Strawberry Juice",
	BoostImage = "http://www.roblox.com/asset/?id=9656864988",
	Color = Color3.fromRGB(255, 106, 106),
	Time = 600,
	MaxStack = 1,
	Layout = 12,
	StringNames = {"Red Pollen", "Red Instant Conversion"},
	Boosts = {
		{
			["Type"] = "Red Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.25,
		},
		{
			["Type"] = "Red Instant",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
