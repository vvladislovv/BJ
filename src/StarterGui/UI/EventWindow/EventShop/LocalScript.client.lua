local dn = require(game.ReplicatedStorage.Modules.Donations)



for GN, FI in pairs(script.Parent:GetChildren()) do
	if FI:IsA("Frame") then
		if dn[FI.Name] then
			FI.Content.Text = dn[FI.Name].Content1
			FI.Content2.Text = dn[FI.Name].Content2
		end
	end
end