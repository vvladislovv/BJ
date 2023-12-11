local FieldZones = game.Workspace.FieldZones
local Zone = require(game.ServerScriptService.Zone)
local Data = require(game.ServerScriptService.Server.Data)
local MapZones = game.Workspace.MapZones
local GetRealStats = require(game.ServerScriptService.Functions.GetRealStats)
local TermitsModule = require(game.ServerScriptService.Modules.Termits)

local FrogBoss = require(game.ServerScriptService.Modules.FrogBoss)

local module = {} do
	
spawn(function()
	for _,b in pairs(MapZones:GetChildren()) do
		local Zone = Zone.new(b)
		Zone.playerEntered:Connect(function(Player)
		local PData = Data:Get(Player)
		local Character = game.Workspace:FindFirstChild(Player.Name)
		if PData.TotalBees < tonumber(b.Name) then
		if PData.Vars.Hive ~= "" then
		Character:SetPrimaryPartCFrame(workspace.Hives[PData.Vars.Hive].Pad.Bottom.TP.WorldCFrame)
		else
		Character:SetPrimaryPartCFrame(workspace.Map.Main.SpawnLocation.Attachment.WorldCFrame)
		end
		end
		end)
	end
end)

spawn(function()
	for _,b in pairs(workspace.Map.Teleports:GetChildren()) do
	local Zone = Zone.new(b)
	Zone.playerEntered:Connect(function(Player)
		local Character = game.Workspace:FindFirstChild(Player.Name)
			Character:SetPrimaryPartCFrame(b.Attachment.WorldCFrame)
			if game.Workspace.Bees:FindFirstChild(Player.Name) then
			for i,v in pairs(game.Workspace.Bees:FindFirstChild(Player.Name):GetChildren()) do
			v:SetPrimaryPartCFrame(b.Attachment.WorldCFrame)
			end
		end
	end)
end
end)

for _,v in pairs(FieldZones:GetChildren()) do
	local Zone = Zone.new(v)
	Zone.playerEntered:Connect(function(Player)
		local PData = Data:Get(Player)
			PData.Vars.Field = v.Name
			PData.Vars.LastField = v.Name
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
			end
	end)

	Zone.playerExited:Connect(function(Player)
		local PData = Data:Get(Player)
			PData.Vars.Field = ""
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
			end
	end)
	end
end

local StumpFolder = workspace:FindFirstChild("StumpFrog")
local Stump = StumpFolder:FindFirstChild("Stump")
local Zone = Zone.new(Stump)
Zone.playerEntered:Connect(function(Player)
	FrogBoss.SummonFrog(Player)
end)

Zone.playerExited:Connect(function(Player)
	FrogBoss.RemoveFrog(Player)
end)

local TermiteZone = Zone.new(game.Workspace.Map.TermiteHollow.HitPart)
TermiteZone.playerEntered:Connect(function(Player)
	local PData = Data:Get(Player)
	if not PData.Boosts["Termit Hollow"] and TermitsModule.Table.Player == Player.Name then
		game.ReplicatedStorage.Remotes.Boost:Fire(Player, "Termit Hollow", 1)
	end
end)
TermiteZone.playerExited:Connect(function(Player)
	local PData = Data:Get(Player)
	if PData.Boosts["Termit Hollow"] then
		PData.Boosts["Termit Hollow"] = nil
		GetRealStats.GetRealStats(Player, PData)
		game.ReplicatedStorage.Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
		TermitsModule.FightEnd()
	end
end)

return module
