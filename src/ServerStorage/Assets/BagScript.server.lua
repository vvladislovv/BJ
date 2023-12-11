local Data = require(game.ServerScriptService.Server.Data)

repeat wait() until script.Parent.Parent.Parent == workspace
local Indicator = script.Parent:WaitForChild("Display")
local Utils = require(game.ReplicatedStorage.Modules.Utils)

local Player = game.Players:GetPlayerFromCharacter(script.Parent.Parent)

while script.Parent.Parent:FindFirstChild("Humanoid") do wait(0.1)
	local PData = Data:Get(Player)

	Indicator.Gui.ProgressLabel.Text = Utils:CommaNumber(math.round(PData.IStats.Pollen)).."/"..Utils:CommaNumber(math.round(PData.IStats.Capacity))
	Indicator.Gui.ProgressBar.Size = UDim2.new(PData.IStats.Pollen / PData.IStats.Capacity, 0, 1, 0)
end