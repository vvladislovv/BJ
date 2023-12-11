wait(3)
local Remotes = game.ReplicatedStorage.Remotes
local Items = require(game.ReplicatedStorage.Modules.Items)

local Modules = game.ReplicatedStorage.Modules

local Blacklist = {
	["Tool"] = true,
	["Tools"] = true,
	["Bag"] = true,
	["Bags"] = true,
	["Belts"] = true,
	["Boots"] = true,
	["Hats"] = true,
	["Gilder"] = true,
	["Gilders"] = true,

	["Hydrant"] = true,
	["Hydrants"] = true,
}



Remotes.UIEquip.OnClientEvent:Connect(function(EquipName, Operation)
	if Operation == "Create" and not Blacklist[EquipName] then
		local Temp = script.ThingTemplate:Clone()
		Temp.Name = EquipName
		Temp.Parent = script.Parent
		Temp.Image = Items.Accessorys[EquipName].Image
		Temp.Hover.Disabled = false
	elseif Operation == "Remove Item" then
		script.Parent:FindFirstChild(EquipName):Destroy()
	end
end)