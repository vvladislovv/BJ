local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Accessorys[script.Parent.Name]
local Capacity = Item.Capacity
local Name = script.Parent.Name
return "\n This backpack is somewhat similar to the last one... \n\n [Backpack] \n +"..Capacity.." Capacity \n "
