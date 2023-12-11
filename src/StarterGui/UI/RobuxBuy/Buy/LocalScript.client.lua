local ts = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local Modules = game.ReplicatedStorage:WaitForChild("Modules")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Donations = require(Modules.Donations)

script.Parent.MouseButton1Click:Connect(function()
	local DonationInfo = Donations[_G.Donate]
	if DonationInfo then
		if DonationInfo.Type == "Product" then
			MarketplaceService:PromptProductPurchase(Player, DonationInfo.ID)
		else
			MarketplaceService:PromptGamePassPurchase(Player, DonationInfo.ID)
		end
	end
end)

script.Parent.MouseEnter:Connect(function()
	ts:Create(script.Parent, TweenInfo.new(0.2), {Rotation = 5}):Play()
	script.Parent:TweenSize(UDim2.new(0.29, 0, 0.106, 0), "Out", "Back", 0.2, true)
end)

script.Parent.MouseLeave:Connect(function()
	ts:Create(script.Parent, TweenInfo.new(0.2), {Rotation = 0}):Play()
	script.Parent:TweenSize(UDim2.new(0.265, 0, 0.081, 0), "Out", "Back", 0.2, true)
end)