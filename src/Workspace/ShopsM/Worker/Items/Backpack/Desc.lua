local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Accessorys[script.Parent.Name]
local Capacity = Item.Capacity
local Name = script.Parent.Name
return "\n High-quality backpack, made of leather \n\n [Backpack] \n +"..Capacity.." Capacity \n "
