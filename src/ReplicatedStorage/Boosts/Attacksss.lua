
local module = {
	Name = "Attacksss",
	BoostImage = "rbxassetid://8631925461",
	Color = Color3.fromRGB(255, 0, 0),
	Time = 86400,
	MaxStack = 1000,
	Layout = 1,
	StringNames = {"Attack"},
	Boosts = {
		[1] = {
			["Type"] = "Attack",
			["Mod"] = "Percent",
			["Amount"] = 0.5,
		},
	},
}

return module
