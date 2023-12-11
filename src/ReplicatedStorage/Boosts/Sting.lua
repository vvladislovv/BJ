local Items = require(game.ReplicatedStorage.Modules.Items)
local module = {
	Name = "Sting",
	BoostImage = Items.Tokens.Sting.Image,
	Color = Items.Tokens.Sting.TKColor,
	Time = 45,
	MaxStack = 3,
	Layout = 1,
	StringNames = {"Bee's Attack"},
	Boosts = {
		[1] = {
			["Type"] = "Bee's Attack",
			["Mod"] = "Add",
			["Amount"] = 1,
		},
	},
}

return module
