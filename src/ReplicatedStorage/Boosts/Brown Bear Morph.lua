
local module = {
	Name = "Brown Bear Morph",
	BoostImage = "rbxassetid://9349024326",
	Color = Color3.fromRGB(108, 88, 75),
	Time = 30,
	MaxStack = 1,
	Layout = 19,
	StringNames = {"Pollen", "Jump Power", "Player Movespeed"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.75,
		},
		{
			["Type"] = "Jump Power",
			["Mod"] = "Mult",
			["Amount"] = 2.25,
		},
		{
			["Type"] = "Player Movespeed",
			["Mod"] = "Mult",
			["Amount"] = 1.3,
		},
	},
}

return module
