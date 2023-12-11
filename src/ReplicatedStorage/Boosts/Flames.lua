
local module = {
	Name = "Flames",
	BoostImage = "http://www.roblox.com/asset/?id=10358126269",
	Color = Color3.fromRGB(196, 40, 28),
	Time = 10,
	MaxStack = 100,
	Layout = 1,
	Min = true,
	StringNames = {"Red Pollen"},
	Boosts = {
		[1] = {
			["Type"] = "Red Pollen",
			["Mod"] = "Percent",
			["Amount"] = 1,
		},
	},
}

return module
