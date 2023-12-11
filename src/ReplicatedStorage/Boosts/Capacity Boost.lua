
local module = {
	Name = "Capacity Boost",
	BoostImage = "http://www.roblox.com/asset/?id=9313900634",
	Color = Color3.fromRGB(63, 63, 63),
	Time = 10800,
	MaxStack = 1,
	Layout = 17,
	StringNames = {"Capacity"},
	Boosts = {
		[1] = {
			["Type"] = "Capacity",
			["Mod"] = "Mult",
			["Amount"] = 2,
		},
	},
}

return module
