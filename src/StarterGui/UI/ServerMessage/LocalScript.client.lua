game.ReplicatedStorage.Reci.OnClientEvent:Connect(function(msg)
	script.Parent.TextBox.Text = msg
	script.Parent.Visible = true
	wait(60)
	script.Parent.Visible = false
end)