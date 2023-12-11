local StarterGui = game:GetService("StarterGui")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Remotes = game:GetService("ReplicatedStorage").Remotes
local UIS = game:GetService("UserInputService")
local ParachuteSys = require(game.ReplicatedStorage.Modules.Client.Parachute)

repeat wait() until StarterGui:GetCore("ChatWindowSize") ~= nil
local chatWindowSize = StarterGui:GetCore("ChatWindowSize")

StarterGui:SetCore("ChatWindowPosition", UDim2.new((1 - chatWindowSize.X.Scale), 0, 0, 0))
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

--local ClientFunctions = require(game.ReplicatedStorage.Modules.Client.ClientFunctions).Start(Player)
local ParachuteSystem = require(game.ReplicatedStorage.Modules.Client.ParachuteSystem).Start(Player)

Character:WaitForChild("Humanoid").Died:Connect(function()
	Remotes.Death:FireServer(Player)
	Player.CharacterAdded:Wait()
	_G.PData = Remotes.GetPlayerData:InvokeServer()
	
	ParachuteSystem = require(game.ReplicatedStorage.Modules.Client.ParachuteSystem).Start(Player)
end)

UIS.InputBegan:Connect(function(key, gpe)
	if not gpe and key.KeyCode == Enum.KeyCode.C then
		Remotes.Item:FireServer("Caramel")
	end
end)