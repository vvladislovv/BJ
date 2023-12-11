wait(3)
local Boost = script.Parent
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Tween = game:GetService("TweenService")
--local ySize = math.clamp(BoostTime / Boosts[Boost.Name].Time, 0, 1)
--script.Parent.Bar.Size = UDim2.new(1,0,ySize,0)
-- Modules
local ClientUtilities = require(ReplicatedStorage.ClientUtilities)
local Utilities = require(ReplicatedStorage.Utilities)
local Items = require(ReplicatedStorage.Modules.Items)
local Modules = ReplicatedStorage.Modules
-- Constants
local UI = script.Parent.Parent

local Remotes = ReplicatedStorage.Remotes
local Boosts = game.ReplicatedStorage.Boosts
local HoverText
local list = script.Parent.ScrollingFrame.Products
local MarketplaceService = game:GetService("MarketplaceService")
local Modules = game.ReplicatedStorage:WaitForChild("Modules")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
--local Utils = require(Modules.Utils)
local Donations = require(Modules.Donations)
local HoverInfo = require(Modules.InfoHover)
Scale = UI.AbsoluteSize.Y / 1080 * 1.1

for _, Donation in pairs(list:GetDescendants()) do
	if Donation:IsA("ImageButton") and Donation.Name ~= "Gift" then
		Donation.MouseButton1Click:Connect(function()
			local DonationInfo = Donations[Donation.Name]
				if DonationInfo then
					if DonationInfo.Type == "Product" then
						MarketplaceService:PromptProductPurchase(Player, DonationInfo.ID)
					else
						MarketplaceService:PromptGamePassPurchase(Player, DonationInfo.ID)
				end
			end
		end)
		Donation.MouseEnter:Connect(function()
			--if Donation.Parent.Name == "Products" then
				local DonationInfo2 = Donations[Donation.Name]
				wait(0.01)
				HoverText = DonationInfo2.String
				wait(0.01)
				HoverInfo:UpdateText(HoverText)
				wait(0.01)
				HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1)), Scale, Vector2.new(0,0.5))
			--end
		end)
		Donation.MouseMoved:Connect(function()
			HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1)), Scale, Vector2.new(0,0.5))
		end)
		Donation.MouseLeave:Connect(function()
			HoverInfo:Remove()
		end)
	end
end