local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Accessorys[script.Parent.Name]
local Capacity = Item.Capacity
local Name = script.Parent.Name
return "\n Why would I wear a birdhouse on my back? \n\n [Backpack] \n +"..Capacity.." Capacity \n +50% Convertion Rate \n"
