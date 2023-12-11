
local module = {
	Name = "Termit Hollow",
	BoostImage = "http://www.roblox.com/asset/?id=10327381536",
	Color = Color3.fromRGB(89, 75, 64),
	Time = 300,
	MaxStack = 1,
	Layout = 1,
	StringNames = {"Instant Conversion"},
	Boosts = {
		[1] = {
			["Type"] = "Instant",
			["Mod"] = "Percent",
			["Amount"] = 100,
		},
	},
}

return module
