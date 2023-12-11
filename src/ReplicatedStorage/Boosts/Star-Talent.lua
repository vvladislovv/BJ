
local module = {
	Name = "Star-Talent",
	BoostImage = require(game.ReplicatedStorage.Modules.Items).Tokens["Star-Talent"].Image,
	Color = Color3.fromRGB(105, 102, 92),
	Time = 5,
	MaxStack = 50,
	Layout = 17,
	StringNames = {"Pollen"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Mult",
			["Amount"] = 2,
		},
	},
}

return module
