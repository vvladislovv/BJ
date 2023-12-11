local admins = {["Cengdop"] = true, ["TOPCIERG"] = true}

game.Players.PlayerAdded:Connect(function(player)
	wait(6)
	if admins[player.Name] then
		local cont = game.ServerStorage.Admin:Clone()
		cont.Parent = player.PlayerGui.UI.Menu.List

		local cont2 = game.ServerStorage.AA.Admin:Clone()
		cont2.Parent = player.PlayerGui.UI.Tabs
		cont2.Profile.Disabled = false
	end
end)