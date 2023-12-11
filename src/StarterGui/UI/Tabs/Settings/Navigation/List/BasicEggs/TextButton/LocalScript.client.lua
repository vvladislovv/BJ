local Show = false

script.Parent.MouseButton1Click:Connect(function()
	if not Show then
		Show = true
		local hl = script.HighlightT:Clone()
		hl.Parent = workspace.Map.Shops[script.Parent.Parent.Name]
		workspace.Map.Shops[script.Parent.Parent.Name].HighlightT:Clone()
	else
		Show = false
		if workspace.Map.Shops[script.Parent.Parent.Name]:FindFirstChild("HighlightT") then
			workspace.Map.Shops[script.Parent.Parent.Name]:FindFirstChild("HighlightT"):Destroy()
			if workspace.Map.Shops[script.Parent.Parent.Name]:FindFirstChild("HighlightT") then
				workspace.Map.Shops[script.Parent.Parent.Name]:FindFirstChild("HighlightT"):Destroy()
			end
		end
	end
end)