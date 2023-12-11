wait(3)
local Remotes = game.ReplicatedStorage.Remotes
local Items = require(game.ReplicatedStorage.Modules.Items)

local Modules = game.ReplicatedStorage.Modules
local PData = _G.PData

for PassiveName, STable in pairs(PData.Passives) do
	local Temp = script.Template:Clone()
	Temp.Name = PassiveName
	Temp.Image = Items.Passives[PassiveName]
	Temp.Count.Text = STable.Amount.."/"..STable.Need
	Temp.Parent = script.Parent
end

while true do
	wait(0.0001)
	PData = _G.PData
	for _, PassiveName in pairs(script.Parent:GetChildren()) do
		if PassiveName:IsA("ImageLabel") then
			local STable = PData.Passives[PassiveName.Name]
			PassiveName.Count.Text = STable.Amount.."/"..STable.Need
		end
	end
end