
local module = {
	Name = "Resin Bear Morph",
	BoostImage = "http://www.roblox.com/asset/?id=9474486353",
	Color = Color3.fromRGB(165, 126, 64),
	Time = 30,
	MaxStack = 1,
	Layout = 19,
	StringNames = {"Pollen", "Jump Power", "Player Movespeed"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.5,
		},
		{
			["Type"] = "Jump Power",
			["Mod"] = "Mult",
			["Amount"] = 2,
		},
		{
			["Type"] = "Player Movespeed",
			["Mod"] = "Mult",
			["Amount"] = 1.7,
		},
	},
}

return module
