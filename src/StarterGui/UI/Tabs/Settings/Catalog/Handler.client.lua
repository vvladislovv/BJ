local CatalogItems = require(game.ReplicatedStorage.Modules.Guis.CatalogItems)
local Items = require(game.ReplicatedStorage.Modules.Items).Eggs

_G.ChoosedBundle = ""

for OfferName, Offer in pairs(CatalogItems) do
	local OfferUI = script.Template:Clone()
	OfferUI.ItemName.ItemName.Text = OfferName
	OfferUI.LayoutOrder = Offer.Layout
	OfferUI.Name = OfferName
	for Layout, InfoCost in pairs(Offer.Cost) do
		local CostUI = script.CostTemplate:Clone()
		CostUI.Image = Items[InfoCost.ItemType].Image
		CostUI.Label.Text = "x"..InfoCost.ItemAmount
		CostUI.LayoutOrder = Layout
		CostUI.Parent = OfferUI.Cost.Cost
	end
	for Layout, InfoCost in pairs(Offer.Content) do
		local CostUI = script.CostTemplate:Clone()
		CostUI.Image = Items[InfoCost.ItemType].Image
		CostUI.Label.Text = "x"..InfoCost.ItemAmount
		CostUI.LayoutOrder = Layout
		CostUI.Parent = OfferUI.Content.Cost
	end
	OfferUI.Parent = script.Parent.List
	
	
	OfferUI.MouseEnter:Connect(function()
		OfferUI:TweenSize(UDim2.new(1, 0, 0, 200), "Out", "Back", 0.2, true)
	end)
	
	OfferUI.MouseLeave:Connect(function()
		OfferUI:TweenSize(UDim2.new(0.9, 0, 0, 180), "Out", "Back", 0.2, true)
	end)
	
	OfferUI.Buy.Buy.MouseButton1Click:Connect(function()
		_G.ChoosedBundle = OfferUI.Name
		script.Parent.Parent.Parent.Parent.CatalogBuy.Frame.TextLabel.Text = "Buy a "..OfferUI.Name.."?"
		script.Parent.Parent.Parent.Parent.CatalogBuy.Visible = true
	end)
end

game:GetService("RunService").RenderStepped:Connect(function()
	if _G.PData ~= nil then
	for _, frame in pairs(script.Parent.List:GetChildren()) do
		if frame:IsA("Frame") then
			if not _G.PData.IStats.Catalog1[frame.Name] then
				frame.Frame.Visible = false
			else
				frame.Frame.Visible = true
			end
		end
		end
	end
end)