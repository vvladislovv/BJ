
local module = {
	Name = "Black Bear Morph",
	BoostImage = "http://www.roblox.com/asset/?id=9474488077",
	Color = Color3.fromRGB(80, 80, 80),
	Time = 30,
	MaxStack = 1,
	Layout = 19,
	StringNames = {"Pollen", "Jump Power", "Player Movespeed"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Mult",
			["Amount"] = 2,
		},
		{
			["Type"] = "Jump Power",
			["Mod"] = "Mult",
			["Amount"] = 1,
		},
		{
			["Type"] = "Player Movespeed",
			["Mod"] = "Mult",
			["Amount"] = 1.3,
		},
	},
}

return module
