local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Accessorys[script.Parent.Name]
local Capacity = Item.Capacity
local Name = script.Parent.Name
return "\n A burning thing, in cold times it is very useful \n\n [Backpack] \n +"..Capacity.." Capacity \n +125% Convertion Rate \n +100% Red Pollen \n" 