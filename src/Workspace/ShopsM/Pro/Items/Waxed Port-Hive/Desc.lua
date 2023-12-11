local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Accessorys[script.Parent.Name]
local Capacity = Item.Capacity
local Name = script.Parent.Name
return "\n Beehive made of wax \n\n [Backpack] \n +"..Capacity.." Capacity \n +150% Convertion Rate \n +125% White Pollen \n" 