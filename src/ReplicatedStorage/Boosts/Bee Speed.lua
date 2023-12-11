
local module = {
	Name = "Bee Speed",
	BoostImage = "rbxassetid://8631925461",
	Color = Color3.fromRGB(255, 255, 255),
	Time = 86400,
	MaxStack = 1,
	Layout = 1,
	StringNames = {"Bee Movespeed"},
	Boosts = {
		[1] = {
			["Type"] = "Bee Movespeed",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
