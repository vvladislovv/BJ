local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Accessorys[script.Parent.Name]
local Capacity = Item.Capacity
local Name = script.Parent.Name
return "\n Port-Hive only means that you have finally become a real beekeeper \n\n [Backpack] \n +"..Capacity.." Capacity \n +75% Convertion Rate \n +15% Pollen \n " 