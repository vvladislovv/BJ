script.Parent.MouseButton1Click:Connect(function()
	if not script.Parent.Parent.Admin.Visible then
		script.Parent.Parent.Admin.Visible = true
	else
		script.Parent.Parent.Admin.Visible = false
	end
end)