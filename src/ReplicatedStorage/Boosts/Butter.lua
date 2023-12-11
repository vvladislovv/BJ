
local module = {
	Name = "Butter",
	BoostImage = "http://www.roblox.com/asset/?id=9646728824",
	Color = Color3.fromRGB(255, 255, 128),
	Time = 600,
	MaxStack = 1,
	Layout = 14,
	StringNames = {"Player Movespeed", "Bee Movespeed"},
	Boosts = {
		{
			["Type"] = "Player Movespeed",
			["Mod"] = "Mult",
			["Amount"] = 1.25,
		},
		{
			["Type"] = "Bee Movespeed",
			["Mod"] = "Mult",
			["Amount"] = 1.5,
		},
	},
}

return module
