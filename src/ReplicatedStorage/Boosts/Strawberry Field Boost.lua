
local module = {
	Name = "Strawberry Field Boost",
	BoostImage = "http://www.roblox.com/asset/?id=8585429086",
	Color = Color3.fromRGB(148, 190, 129),
	Time = 900,
	MaxStack = 4,
	Layout = 8,
	StringNames = {"Strawberry Field Pollen"},
	Boosts = {
		{
			["Type"] = "Strawberry",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
