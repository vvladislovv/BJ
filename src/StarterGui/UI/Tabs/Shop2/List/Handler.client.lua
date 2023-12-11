local list = script.Parent.Products
local MarketplaceService = game:GetService("MarketplaceService")
local Modules = game.ReplicatedStorage:WaitForChild("Modules")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
--local Utils = require(Modules.Utils)
local Donations = require(Modules.Donations)



for _, Donation in pairs(list:GetChildren()) do
	if Donation:IsA("Frame") then
		if Donation:FindFirstChild("Buy1") then
			Donation.Buy1.MouseButton1Click:Connect(function()
				local DonationInfo = Donations[Donation.Buy1:FindFirstChild("Value").Value]
				if DonationInfo then
					if DonationInfo.Type == "Product" then
						MarketplaceService:PromptProductPurchase(Player, DonationInfo.ID)
					else
						MarketplaceService:PromptGamePassPurchase(Player, DonationInfo.ID)
					end
				end
			end)
		end
		Donation.Buy.MouseButton1Click:Connect(function()
			local DonationInfo = Donations[Donation.Name]
			if DonationInfo then
				if DonationInfo.Type == "Product" then
					MarketplaceService:PromptProductPurchase(Player, DonationInfo.ID)
				else
					MarketplaceService:PromptGamePassPurchase(Player, DonationInfo.ID)
				end
			end
		end)
	end
end