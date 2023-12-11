
local module = {
	Name = "Haste",
	BoostImage = require(game.ReplicatedStorage.Modules.Items).Tokens.Haste.Image,
	Color = Color3.fromRGB(248, 248, 248),
	Time = 10,
	MaxStack = 10,
	Layout = 15,
	StringNames = {"Player Movespeed"},
	Boosts = {
		{
			["Type"] = "Player Movespeed",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
