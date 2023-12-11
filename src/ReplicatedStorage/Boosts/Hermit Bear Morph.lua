
local module = {
	Name = "Hermit Bear Morph",
	BoostImage = "http://www.roblox.com/asset/?id=9569885538",
	Color = Color3.fromRGB(90, 90, 90),
	Time = 30,
	MaxStack = 1,
	Layout = 19,
	StringNames = {"Pollen", "Jump Power", "Player Movespeed"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Mult",
			["Amount"] = 3,
		},
		{
			["Type"] = "Jump Power",
			["Mod"] = "Mult",
			["Amount"] = 1.5,
		},
		{
			["Type"] = "Player Movespeed",
			["Mod"] = "Mult",
			["Amount"] = 0.75,
		},
	},
}

return module
