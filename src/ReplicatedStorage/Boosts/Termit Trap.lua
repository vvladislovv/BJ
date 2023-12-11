
local module = {
	Name = "Termit Trap",
	BoostImage = "http://www.roblox.com/asset/?id=10334263868",
	Color = Color3.fromRGB(50, 50, 50),
	Time = 300,
	MaxStack = 50,
	Layout = 14,
	StringNames = {"Pollen"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "MinusPercent",
			["Amount"] = 1,
		},
	},
}

return module
