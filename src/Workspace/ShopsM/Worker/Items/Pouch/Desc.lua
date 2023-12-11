local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Accessorys[script.Parent.Name]
local Capacity = Item.Capacity
local Name = script.Parent.Name
return "\n The first backpack, simple bag \n\n [Backpack] \n +"..Capacity.." Capacity \n "
