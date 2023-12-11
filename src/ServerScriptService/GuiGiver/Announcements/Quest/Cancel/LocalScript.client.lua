script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent.Visible = false
	require(game.ReplicatedStorage.Modules.Alerts).Alert({
		Color = "Blue",
		Msg = "Canceled"
	})
end)