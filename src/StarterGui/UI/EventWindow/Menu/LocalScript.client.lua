local plr = game.Players.LocalPlayer
local Remotes = game.ReplicatedStorage.Remotes
local Modules = game.ReplicatedStorage.Modules
wait(6)

script.Parent.Skull.MouseButton1Click:Connect(function()
	Remotes.HatchSkull:InvokeServer("Skull")
	wait(1)
end)
script.Parent.Pump.MouseButton1Click:Connect(function()
	Remotes.HatchSkull:InvokeServer("Pump")
	wait(1)
end)