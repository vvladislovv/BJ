script.Parent.MouseButton1Click:Connect(function()
	game.ReplicatedStorage.Remotes.AdminCommand:FireServer({
		Operation = "DataReset",
		Player = script.Parent.Parent.Parent["Admin Pannel"].Drop.DataReset.Player.Text,
	})
end)