local Items = require(game.ReplicatedStorage.Modules.Items)
local Item = Items.Collectors[script.Parent.Name]
local Pollen = Item.Pollen
local Cooldown = Item.Cooldown
local Name = script.Parent.Name
return "\n The "..Name.."\n Collects "..Pollen.." pollen from 32 ".."(x"..Item.PollenMultiplier.." from "..Item.ToolColor.." Flowers) flowers per \n "..Cooldown.." seconds \n"