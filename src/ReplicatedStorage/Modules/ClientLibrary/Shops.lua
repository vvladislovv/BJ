local module = {}
local UserInputService = game:GetService("UserInputService")
local ClientUtilities = require(game.ReplicatedStorage.ClientUtilities)
local Items = require(script.Parent.Parent.Items)
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local ClientUtilities = require(game.ReplicatedStorage.ClientUtilities)
local Utilities = require(game.ReplicatedStorage.Utilities)
local Remotes = game.ReplicatedStorage.Remotes
local TS = game:GetService("TweenService")
local Camera = workspace.Camera
local UI = nil
local Shop = nil
local ShopItems = nil
local List = nil
local ShopUI = nil
local LeftProd = nil
local RightProd = nil
local Index = 1

function module:Freeze()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Disable()
end

function module:Unfreeze()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Enable()
end

function module:checkIngridients(Ingridients)
	local ingridientsCompleted = 0

	for _, amount in pairs(Ingridients:GetChildren()) do
		if _G.PData.Inventory[amount.Name] >= amount.Amount.Value then
			ingridientsCompleted += 1
		end
	end

	return ingridientsCompleted
end

function module:GetItemIDs(Items)
	local T = {}
	for _, Item in pairs(Items:GetChildren()) do
		T[Item.Order.Value] = Item.Name
	end
	return T
end

function module:UpdateShop()
	_G.PData = Remotes.GetPlayerData:InvokeServer()
	if List ~= nil and List[Index] ~= nil then
		Utils:TweenCam(nil, CFrame.new(ShopItems:WaitForChild(List[Index]).View.WorldPosition, ShopItems:WaitForChild(List[Index]).Position))
		if ShopItems:WaitForChild(List[Index]).ItemType.Value == "HiveSlot" then
			ShopUI.Info.Desc.Text = require(ShopItems:WaitForChild(List[Index]).Desc)
		end
		if ShopItems:WaitForChild(List[Index]).ItemType.Value ~= "HiveSlot" then
			local CostType = ShopItems:WaitForChild(List[Index]).CostType.Value
			local Cost = ShopItems:WaitForChild(List[Index]).Cost.Value
			local CostStr = Utils:AbNumber(Cost).." "..CostType
			if ShopItems:WaitForChild(List[Index]).ItemAType.Value == "Inventory" then
				ShopUI.Info.Desc.Text = require(ShopItems:WaitForChild(List[Index]).Desc)
				ShopUI.Info.Item.Text = ShopItems:WaitForChild(List[Index]).ItemType.Value

				ShopUI.Center.Shop.Text = Shop.." Shop"
				ShopUI.Center.Cost.Text = CostStr--.." "--..ShopItems:WaitForChild(List[Index]).CostType.Value
				if ShopItems:WaitForChild(List[Index]):FindFirstChild("Craft") then
					ShopUI.Info.Craft.Visible = true
					ShopUI.Info.Craft:TweenSize(UDim2.new(1.003, 0,0.19, 0),"Out","Back",0.2,true)
					ShopUI.Info.DC.Visible = true
					for k,g in pairs(ShopUI.Info.Craft:GetChildren()) do
						if g:IsA("ImageLabel") then
							g:Destroy()
						end
					end
					for _, Item in pairs(ShopItems:WaitForChild(List[Index]).Craft:GetChildren()) do
						local AllItems = Items.Eggs
						local ItemTemp = script.CItemTemplate:Clone()
						ItemTemp.Image = AllItems[Item.Name].Image
						ItemTemp.Am.Text = "x"..Item.Amount.Value
						if _G.PData.Inventory[Item.Name] >= Item.Amount.Value then
							ItemTemp.Am.TextColor3 = Color3.fromRGB(255, 255, 255)
						else
							ItemTemp.Am.TextColor3 = Color3.fromRGB(255, 73, 73)
						end
						ItemTemp.Parent = ShopUI.Info.Craft
					end
				else
					ShopUI.Info.Craft.Size = UDim2.new(1.003, 0,0, 0)
					ShopUI.Info.Craft.Visible = false
					ShopUI.Info.DC.Visible = false
				end

				if _G.PData[ShopItems:WaitForChild(List[Index]).CostAType.Value][ShopItems:WaitForChild(List[Index]).CostType.Value] >= ShopItems:WaitForChild(List[Index]).Cost.Value and not ShopItems:WaitForChild(List[Index]):FindFirstChild("Craft") and not ShopItems:WaitForChild(List[Index]):FindFirstChild("ItemCType")  then
					ShopUI.Center.Buy.Text = "Buy"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(98, 222, 96)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
					ShopUI.Center.Buy.BackgroundTransparency = 0
					ShopUI.Center.Buy.TextStrokeTransparency = 0.88
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
				elseif _G.PData[ShopItems:WaitForChild(List[Index]).CostAType.Value][ShopItems:WaitForChild(List[Index]).CostType.Value] >= ShopItems:WaitForChild(List[Index]).Cost.Value and ShopItems:WaitForChild(List[Index]):FindFirstChild("Craft") and not ShopItems:WaitForChild(List[Index]):FindFirstChild("ItemCType")  then
					if module:checkIngridients(ShopItems:WaitForChild(List[Index]).Craft) >= #ShopItems:WaitForChild(List[Index]).Craft:GetChildren() then
						ShopUI.Center.Buy.Text = "Buy"
						ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(98, 222, 96)
						ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
						ShopUI.Center.Buy.BackgroundTransparency = 0
						ShopUI.Center.Buy.TextStrokeTransparency = 0.88
						ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
					else
						ShopUI.Center.Buy.Text = "Can't afford"
						ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(229, 54, 54)
						ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255, 131, 131)
						ShopUI.Center.Buy.BackgroundTransparency = 0.15
						ShopUI.Center.Buy.TextStrokeTransparency = 1
						ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255, 71, 71)
					end
				else
					ShopUI.Center.Buy.Text = "Can't afford"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(229, 54, 54)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255, 131, 131)
					ShopUI.Center.Buy.BackgroundTransparency = 0.15
					ShopUI.Center.Buy.TextStrokeTransparency = 1
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255, 71, 71)
				end
				if ShopItems:WaitForChild(List[Index]).ItemType.Value == "Basic Egg" then
					local EggCost
					ShopUI.Info.Craft.Visible = false
					ShopUI.Info.DC.Visible = false
					if _G.PData.IStats.BasicEggs < 25 then
						EggCost = Items.EggCosts[tostring(_G.PData.IStats.BasicEggs)]
					else
						EggCost = Items.EggCosts["25"]
					end
					local EggCostStr =  Utils:AbNumber(EggCost)
					ShopUI.Center.Cost.Text = EggCostStr
				end
				if ShopItems:WaitForChild(List[Index]):FindFirstChild("Bee") and ShopItems:WaitForChild(List[Index]):FindFirstChild("Bee").Value == "BPBee" then
					if not _G.PData.BPBees[ShopItems:WaitForChild(List[Index]).ItemType.Value] then
						if _G.PData[ShopItems:WaitForChild(List[Index]).CostAType.Value][ShopItems:WaitForChild(List[Index]).CostType.Value] >= ShopItems:WaitForChild(List[Index]).Cost.Value and not ShopItems:WaitForChild(List[Index]):FindFirstChild("Craft") then
							ShopUI.Center.Buy.Text = "Buy"
							ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(98, 222, 96)
							ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
							ShopUI.Center.Buy.BackgroundTransparency = 0
							ShopUI.Center.Buy.TextStrokeTransparency = 0.88
							ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
						else
							ShopUI.Center.Buy.Text = "Can't afford"
							ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(229, 54, 54)
							ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255, 131, 131)
							ShopUI.Center.Buy.BackgroundTransparency = 0.15
							ShopUI.Center.Buy.TextStrokeTransparency = 1
							ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255, 71, 71)
						end
					else
						ShopUI.Center.Buy.Text = "Purchased"
						ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(66, 149, 63)
						ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
						ShopUI.Center.Buy.BackgroundTransparency = 0
						ShopUI.Center.Buy.TextStrokeTransparency = 0.75
						ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
					end
				end
			elseif ShopItems:WaitForChild(List[Index]).ItemAType.Value == "Equipment" then

				ShopUI.Info.Desc.Text = require(ShopItems:WaitForChild(List[Index]).Desc)
				ShopUI.Info.Item.Text = ShopItems:WaitForChild(List[Index]).ItemType.Value
				ShopUI.Center.Shop.Text = Shop.." Shop"
				ShopUI.Center.Cost.Text = CostStr--.." "--..ShopItems:WaitForChild(List[Index]).CostType.Value
				if ShopItems:WaitForChild(List[Index]):FindFirstChild("Craft") then
					ShopUI.Info.Craft.Visible = true
					ShopUI.Info.Craft:TweenSize(UDim2.new(1.003, 0,0.19, 0),"Out","Back",0.2)
					ShopUI.Info.DC.Visible = true
					for k,g in pairs(ShopUI.Info.Craft:GetChildren()) do
						if g:IsA("ImageLabel") then
							g:Destroy()
						end
					end
					for _, Item in pairs(ShopItems:WaitForChild(List[Index]).Craft:GetChildren()) do
						local AllItems = Items.Eggs
						local ItemTemp = script.CItemTemplate:Clone()
						ItemTemp.Image = AllItems[Item.Name].Image
						ItemTemp.Am.Text = "x"..Item.Amount.Value
						if _G.PData.Inventory[Item.Name] >= Item.Amount.Value then
							ItemTemp.Am.TextColor3 = Color3.fromRGB(255, 255, 255)
						else
							ItemTemp.Am.TextColor3 = Color3.fromRGB(255, 73, 73)
						end
						ItemTemp.Parent = ShopUI.Info.Craft
					end
				else
					ShopUI.Info.Craft.Size = UDim2.new(1.003, 0,0, 0)
					--wait(0.2)
					ShopUI.Info.Craft.Visible = false
					ShopUI.Info.DC.Visible = false
				end
				if _G.PData.Equipment[ShopItems:WaitForChild(List[Index]).ItemCType.Value] == ShopItems:WaitForChild(List[Index]).ItemType.Value then
					ShopUI.Center.Buy.Text = "Equipped"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(69, 158, 68)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(77, 132, 77)
					ShopUI.Center.Buy.TextStrokeTransparency = 1
					ShopUI.Center.Buy.BackgroundTransparency = 0.15
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
				elseif _G.PData.Equipment[ShopItems:WaitForChild(List[Index]).ItemCType.Value.."s"][ShopItems:WaitForChild(List[Index]).ItemType.Value] and _G.PData.Equipment[ShopItems:WaitForChild(List[Index]).ItemCType.Value] ~= ShopItems:WaitForChild(List[Index]).ItemType.Value then
					ShopUI.Center.Buy.Text = "Equip"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(98, 222, 96)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
					ShopUI.Center.Buy.BackgroundTransparency = 0
					ShopUI.Center.Buy.TextStrokeTransparency = 0.88
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
				elseif _G.PData[ShopItems:WaitForChild(List[Index]).CostAType.Value][ShopItems:WaitForChild(List[Index]).CostType.Value] >= ShopItems:WaitForChild(List[Index]).Cost.Value and not ShopItems:WaitForChild(List[Index]):FindFirstChild("Craft") then
					ShopUI.Center.Buy.Text = "Buy"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(98, 222, 96)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
					ShopUI.Center.Buy.BackgroundTransparency = 0
					ShopUI.Center.Buy.TextStrokeTransparency = 0.88
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
				elseif _G.PData[ShopItems:WaitForChild(List[Index]).CostAType.Value][ShopItems:WaitForChild(List[Index]).CostType.Value] >= ShopItems:WaitForChild(List[Index]).Cost.Value and ShopItems:WaitForChild(List[Index]):FindFirstChild("Craft") then
					if module:checkIngridients(ShopItems:WaitForChild(List[Index]).Craft) >= #ShopItems:WaitForChild(List[Index]).Craft:GetChildren() then
						ShopUI.Center.Buy.Text = "Buy"
						ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(98, 222, 96)
						ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
						ShopUI.Center.Buy.BackgroundTransparency = 0
						ShopUI.Center.Buy.TextStrokeTransparency = 0.88
						ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
					else
						ShopUI.Center.Buy.Text = "Can't afford"
						ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(229, 54, 54)
						ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255, 131, 131)
						ShopUI.Center.Buy.BackgroundTransparency = 0.15
						ShopUI.Center.Buy.TextStrokeTransparency = 1
						ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255, 71, 71)
					end
				else
					ShopUI.Center.Buy.Text = "Can't afford"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(229, 54, 54)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255, 131, 131)
					ShopUI.Center.Buy.BackgroundTransparency = 0.15
					ShopUI.Center.Buy.TextStrokeTransparency = 1
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255, 71, 71)
				end
			end
		else
			ShopUI.Center.Shop.Text = Shop.." Shop"
			ShopUI.Center.Cost.Text = Utils:CommaNumber(Items.SlotCosts[_G.PData.TotalSlots - 24]) --.." "--..ShopItems:WaitForChild(List[Index]).CostType.Value
			if _G.PData.TotalSlots < 50 then
				local Cost = Items.SlotCosts[_G.PData.TotalSlots - 24]
				if _G.PData.IStats.Honey >= Cost then
					ShopUI.Center.Buy.Text = "Buy"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(98, 222, 96)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
					ShopUI.Center.Buy.BackgroundTransparency = 0
					ShopUI.Center.Buy.TextStrokeTransparency = 0.88
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
				else
					ShopUI.Center.Buy.Text = "Can't afford"
					ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(229, 54, 54)
					ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255, 131, 131)
					ShopUI.Center.Buy.BackgroundTransparency = 0.15
					ShopUI.Center.Buy.TextStrokeTransparency = 1
					ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255, 71, 71)
				end
			elseif _G.PData.TotalSlots >= 50 then
				ShopUI.Center.Buy.Text = "Purchased"
				ShopUI.Center.Buy.BackgroundColor3 = Color3.fromRGB(66, 149, 63)
				ShopUI.Center.Buy.TextColor3 = Color3.fromRGB(255,255,255)
				ShopUI.Center.Buy.BackgroundTransparency = 0
				ShopUI.Center.Buy.TextStrokeTransparency = 0.75
				ShopUI.Center.Cost.TextColor3 = Color3.fromRGB(255,255,255)
			end
		end
	end
end

function module:OpenShop(ShopName)
	if not _G.OpenedShop then
		Shop = ShopName
		local ShopT = workspace:WaitForChild("ShopsM"):WaitForChild(ShopName)
		local OrderedItems = module:GetItemIDs(ShopT.Items)
		ShopItems = ShopT.Items
		List = Utils:DeepCopy(OrderedItems)
		module:Freeze()
		if #List <= 1 then
			LeftProd.Visible = false
			RightProd.Visible = false
		else
			LeftProd.Visible = true
			RightProd.Visible = true
		end
		ShopUI.Visible = true
		UI.Binds.Visible = false
		ShopUI:TweenSize(UDim2.new(1, 0,1, 0),"Out","Back",0.2)
		module:UpdateShop()
		_G.OpenedShop = true
	end
end

function module:CloseShop()
	if _G.OpenedShop then
		Shop = nil
		Index = 1

		List = nil
		ShopItems = nil

		Camera.CameraType = Enum.CameraType.Custom
		TS:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
		module:Unfreeze()
		ShopUI.Size = UDim2.new(1.2, 0,1.2, 0)
		ShopUI.Visible = false
		UI.Binds.Visible = true
		_G.OpenedShop = false
	end
end


function module.Init()
	local players = game:GetService("Players")
	local Player = players.LocalPlayer
	local pGui = Player:WaitForChild("PlayerGui")
	UI = pGui:WaitForChild("UI")
	
	ShopUI = UI.Shop
	LeftProd = ShopUI.Center.Prev
	RightProd = ShopUI.Center.Next
	
	RightProd.MouseButton1Click:Connect(function()
		if Shop then
			if Index < #List then
				RightProd:TweenSize(UDim2.new(0.228, 0,0.803, 0),"In","Back",0.05)
				wait(0.05)
				Index += 1
				RightProd:TweenSize(UDim2.new(0.284, 0,1, 0),"Out","Back",0.1)
			else
				Index = 1
			end

			module:UpdateShop()
		end
	end)
	LeftProd.MouseButton1Click:Connect(function()
		if Shop then
			if Index > 1 then
				LeftProd:TweenSize(UDim2.new(0.228, 0,0.803, 0),"In","Back",0.05)
				wait(0.05)
				Index -= 1
				LeftProd:TweenSize(UDim2.new(0.284, 0,1, 0),"Out","Back",0.1)
			else
				Index = #List
			end

			module:UpdateShop()
		end
	end)
	ShopUI.Center.Buy.MouseButton1Click:Connect(function()
		if List ~= nil and List[Index] ~= nil then
			Remotes.Shop:FireServer(ShopItems:WaitForChild(List[Index]))
			wait(0.05)
			module:UpdateShop()
		end
	end)
end

return module
