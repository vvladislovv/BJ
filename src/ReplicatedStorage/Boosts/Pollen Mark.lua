
local module = {
	Name = "Pollen Mark",
	BoostImage = "http://www.roblox.com/asset/?id=9809722110",
	Color = Color3.fromRGB(241, 235, 197),
	Time = -1,
	MaxStack = 3,
	Layout = 17,
	StringNames = {"Pollen"},
	Boosts = {
		[1] = {
			["Type"] = "Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.25,
		},
	},
}

return module
