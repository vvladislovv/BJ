
local module = {
	Name = "Firefly Vial",
	BoostImage = "rbxassetid://9449507215",
	Color = Color3.fromRGB(45, 45, 45),
	Time = 600,
	MaxStack = 10,
	Layout = 21,
	StringNames = {"Pollen"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
