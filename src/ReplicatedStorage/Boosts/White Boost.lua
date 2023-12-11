
local module = {
	Name = "White Boost",
	BoostImage = require(game.ReplicatedStorage.Modules.Items).Tokens["White Boost"].Image,
	Color = Color3.fromRGB(127, 241, 127),
	Time = 20,
	MaxStack = 10,
	Layout = 16,
	StringNames = {"White Pollen"},
	Boosts = {
		[1] = {
			["Type"] = "White Pollen",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
