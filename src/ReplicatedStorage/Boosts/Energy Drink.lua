
local module = {
	Name = "Energy Drink",
	BoostImage = "http://www.roblox.com/asset/?id=9657045478",
	Color = Color3.fromRGB(255, 255, 255),
	Time = 600,
	MaxStack = 1,
	Layout = 14,
	StringNames = {"Convert Rate", "Instant Conversion"},
	Boosts = {
		{
			["Type"] = "Convert Rate",
			["Mod"] = "Mult",
			["Amount"] = 1.25,
		},
		{
			["Type"] = "Instant",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
