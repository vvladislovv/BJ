local BadgeType = script.Parent.Parent.Parent.Name
local deb = false
script.Parent.MouseButton1Click:Connect(function()
	if not deb then
		deb = true
		game.ReplicatedStorage.Remotes.Badges:FireServer(BadgeType)
		wait(1)
		deb = false
	end
end)
