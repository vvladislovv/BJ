
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Items = {
	["HCP"] = 7667776035,
}


for _, Item in pairs(script.Parent:GetChildren()) do
	if Items[Item.Name] then
		Item.Buy.MouseButton1Click:Connect(function()
			if not Player then
				return
			end
			local BundleID = Items[Item.Name]
			print(Items[Item.Name])
			if not BundleID then
				return
			end
			if not require(script.CheckBundle)(BundleID) then
				return
			end
			--pcall(function()
				MarketplaceService:PromptBundlePurchase(Player,BundleID)
			--end)
		end)
	end
end