local Replicated = game:GetService("ReplicatedStorage")
local Remotes = Replicated:WaitForChild("Remotes")
local Items = require(Replicated:WaitForChild("Modules").Items)
local CraftItems = require(Replicated:WaitForChild("Modules").CraftingItems)
local Utilities = require(Replicated.Utilities)

local MainMenu = script.Parent
local RightButton = script.Parent.Frame.Right
local LeftButton = script.Parent.Frame.Left
local CraftButton = script.Parent.Frame.Use
local Item = script.Parent.Frame.Item
local Desc = script.Parent.Frame.Desc
local CenterImage = script.Parent.Frame.ImageCenter
local LeftImage = script.Parent.Frame.ImageLeft
local RightImage = script.Parent.Frame.ImageRight
local CraftingProgress = script.Parent.Frame.CraftingProgress
local ExitButton = script.Parent.Frame.Exit
local CraftingChoice = script.Parent.Frame.CraftingChoice
local ButtonIm = CraftButton.HoverImage
local MinIndex = 1
local Index = 2
local MaxIndex = 0
local MainItem = nil
local Deb = false
local Checked = false

for i,v in pairs(CraftItems.Items) do
	MaxIndex += 1
end

function GetCenterItem()
	for i,v in pairs(CraftItems.Items) do
		for b,d in pairs(v) do
			if b == "Layout" then
				if d == Index then
					return (i)
				end
			end
		end
	end
end

function GetLeftItem()
	for i,v in pairs(CraftItems.Items) do
		for b,d in pairs(v) do
			if b == "Layout" then
				if d == Index - 1 then
					return (i)
				end
			end
		end
	end
end

function GetRightItem()
	for i,v in pairs(CraftItems.Items) do
		for b,d in pairs(v) do
			if b == "Layout" then
				if d == Index + 1 then
					return (i)
				end
			end
		end
	end
end

function GetFirstItem()
	for i,v in pairs(CraftItems.Items) do
		for b,d in pairs(v) do
			if b == "Layout" then
				if d == 1 then
					return (i)
				end
			end
		end
	end
end

function GetLastItem()
	for i,v in pairs(CraftItems.Items) do
		for b,d in pairs(v) do
			if b == "Layout" then
				if d == MaxIndex then
					return (i)
				end
			end
		end
	end
end

local CanCraft = false

RightButton.MouseButton1Click:Connect(function()
	if Deb == false then
		Deb = true
		if Index >= MaxIndex then
			Index = MinIndex
		else
			Index += 1
		end

		RightButton:TweenSize(UDim2.new(0.117, 0,0.193, 0),"Out", "Back", 0.1)
		CenterImage:TweenSize(UDim2.new(0.158, 0, 0, 0), "In", "Quad", 0.1)
		RightImage:TweenSize(UDim2.new(0.109, 0, 0, 0), "In", "Quad", 0.1)
		LeftImage:TweenSize(UDim2.new(0.109, 0, 0, 0), "In", "Quad", 0.1)
		wait(0.1)

		CenterImage.Image = Items.Eggs[GetCenterItem()].Image
		MainItem = Items.Eggs[GetCenterItem()].Name
		
		for i,v in pairs(CraftItems.Items[MainItem].Ingredients) do
			if (_G.PData.Inventory[i]) > v then
				CanCraft = true
			else
				CanCraft = false
				break
			end
		end

		if CanCraft == true then
			CraftButton.ImageColor3 = Color3.fromRGB(145, 255, 112)
			CraftButton.Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
			CraftButton.HoverImage = ButtonIm
		else
			CraftButton.HoverImage = CraftButton.Image
			CraftButton.Txt.TextColor3 = Color3.fromRGB(177, 177, 177)
			CraftButton.ImageColor3 = Color3.fromRGB(85, 149, 65)
		end
		
		Item.Text = MainItem
		Desc.Text = Items.Eggs[GetCenterItem()].Description

		if Index <= MinIndex then
			LeftImage.Image = Items.Eggs[GetLastItem()].Image
		else
			LeftImage.Image = Items.Eggs[GetLeftItem()].Image
		end
		if Index >= MaxIndex then
			RightImage.Image = Items.Eggs[GetFirstItem()].Image
		else
			RightImage.Image = Items.Eggs[GetRightItem()].Image
		end

		RightButton:TweenSize(UDim2.new(0.104, 0,0.172, 0),"Out", "Back", 0.1)
		CenterImage:TweenSize(UDim2.new(0.158, 0, 0.261, 0), "Out", "Elastic", 0.1)
		RightImage:TweenSize(UDim2.new(0.109, 0, 0.18, 0), "Out", "Elastic", 0.1)
		LeftImage:TweenSize(UDim2.new(0.109, 0, 0.18, 0), "Out", "Elastic", 0.1)
		wait(0.1)

		Deb = false
	end
end)

LeftButton.MouseButton1Click:Connect(function()
	if Deb == false then
		Deb = true
		if Index <= MinIndex then
			Index = MaxIndex
		else
			Index -= 1
		end

		LeftButton:TweenSize(UDim2.new(0.117, 0,0.193, 0),"Out", "Back", 0.1)
		CenterImage:TweenSize(UDim2.new(0.158, 0, 0, 0), "In", "Quad", 0.1)
		RightImage:TweenSize(UDim2.new(0.109, 0, 0, 0), "In", "Quad", 0.1)
		LeftImage:TweenSize(UDim2.new(0.109, 0, 0, 0), "In", "Quad", 0.1)
		wait(0.1)

		CenterImage.Image = Items.Eggs[GetCenterItem()].Image
		MainItem = Items.Eggs[GetCenterItem()].Name
		
		for i,v in pairs(CraftItems.Items[MainItem].Ingredients) do
			if (_G.PData.Inventory[i]) > v then
				CanCraft = true
			else
				CanCraft = false
				break
			end
		end

		if CanCraft == true then
			CraftButton.ImageColor3 = Color3.fromRGB(145, 255, 112)
			CraftButton.Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
			CraftButton.HoverImage = ButtonIm
		else
			CraftButton.HoverImage = CraftButton.Image
			CraftButton.Txt.TextColor3 = Color3.fromRGB(177, 177, 177)
			CraftButton.ImageColor3 = Color3.fromRGB(85, 149, 65)
		end
		
		Item.Text = MainItem
		Desc.Text = Items.Eggs[GetCenterItem()].Description

		if Index <= MinIndex then
			LeftImage.Image = Items.Eggs[GetLastItem()].Image
		else
			LeftImage.Image = Items.Eggs[GetLeftItem()].Image
		end
		if Index >= MaxIndex then
			RightImage.Image = Items.Eggs[GetFirstItem()].Image
		else
			RightImage.Image = Items.Eggs[GetRightItem()].Image
		end

		LeftButton:TweenSize(UDim2.new(0.104, 0,0.172, 0),"Out", "Back", 0.1)
		CenterImage:TweenSize(UDim2.new(0.158, 0, 0.261, 0), "Out", "Elastic", 0.1)
		RightImage:TweenSize(UDim2.new(0.109, 0, 0.18, 0), "Out", "Elastic", 0.1)
		LeftImage:TweenSize(UDim2.new(0.109, 0, 0.18, 0), "Out", "Elastic", 0.1)
		wait(0.1)

		Deb = false
	end
end)

CraftButton.MouseButton1Click:Connect(function()
	if Deb == false then
		Deb = true
	if CanCraft == true then
	RightButton.Visible = false
	LeftButton.Visible = false
	CraftButton.Visible = false
		
	CraftingChoice.Visible = true
	CraftingChoice.Item.Text = MainItem
	CraftingChoice.ItemImage.Image = Items.Eggs[MainItem].Image
	
	local CanMAdd = true
	
	for i,v in pairs(CraftItems.Items[MainItem].Ingredients) do
		local Ingredient = script.Ingredient:Clone()
		Ingredient.Parent = CraftingChoice.Ingr
		Ingredient.Image = Items.Eggs[i].Image
		Ingredient.Amount.Text = "x"..v
		Ingredient.Name = Items.Eggs[i].Name
	end
	
	local CraftAmount = 1
	CraftingChoice.Count.TextLabel.Text = CraftAmount
	
	local PlusImage = CraftingChoice.Plus.HoverImage
	
	for i,v in pairs(CraftItems.Items[MainItem].Ingredients) do
		for _, d in pairs(CraftingChoice.Ingr:GetChildren()) do
			if d.Name == i then
				d.Amount.Text = "x"..v * CraftAmount
				if _G.PData.Inventory[i] >= v * CraftAmount then
					CraftingChoice.Plus.ImageColor3 = Color3.fromRGB(188, 169, 123)
					CraftingChoice.Plus.Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
					CraftingChoice.Plus.HoverImage = PlusImage
				else
					CraftingChoice.Plus.HoverImage = CraftingChoice.Plus.Image
					CraftingChoice.Plus.ImageColor3 = Color3.fromRGB(122, 117, 101)
					CraftingChoice.Plus.Txt.TextColor3 = Color3.fromRGB(172, 172, 172)
				end
			end
		end
			end
			
			local DebTime = 0.3
			local CanClick
			
			CraftingChoice.Plus.MouseButton1Up:Connect(function()
				CanClick = false
				DebTime = 0.3
				wait(0.1)
				Deb = false
			end)
			
			CraftingChoice.Minus.MouseButton1Up:Connect(function()
				CanClick = false
				DebTime = 0.3
				wait(0.1)
				Deb = false
			end)
			
			CraftingChoice.Plus.MouseButton1Down:Connect(function()
				if Deb == false then
					Deb = true
				local CanAdd
				CanClick = true
				repeat
					
					for i,v in pairs(CraftItems.Items[MainItem].Ingredients) do
						if (_G.PData.Inventory[i]) > (v * (CraftAmount + 1)) then
							CanAdd = true
						else
							CanAdd = false
							break
						end
					end
					
					if CanAdd == true then
						CraftAmount += 1
						DebTime -= 0.01
						CraftingChoice.Count.TextLabel.Text = CraftAmount

						CraftingChoice.Minus.ImageColor3 = Color3.fromRGB(188, 169, 123)
						CraftingChoice.Minus.Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
						CraftingChoice.Minus.HoverImage = PlusImage

						CraftingChoice.Plus.ImageColor3 = Color3.fromRGB(188, 169, 123)
						CraftingChoice.Plus.Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
						CraftingChoice.Plus.HoverImage = PlusImage
						for _,v in pairs(CraftingChoice.Ingr:GetChildren()) do
							if v:IsA("ImageLabel") then
								v.Amount.Text = "x"..CraftItems.Items[MainItem].Ingredients[v.Name] * CraftAmount
							end
						end

						for i,v in pairs(CraftItems.Items[MainItem].Ingredients) do
							if (_G.PData.Inventory[i]) > (v * (CraftAmount + 1)) then
								CanAdd = true
							else
								CanAdd = false
								break
							end
						end

						if CanAdd == false then
							CraftingChoice.Plus.HoverImage = CraftingChoice.Plus.Image
							CraftingChoice.Plus.ImageColor3 = Color3.fromRGB(122, 117, 101)
							CraftingChoice.Plus.Txt.TextColor3 = Color3.fromRGB(172, 172, 172)
						end
						wait(DebTime)
					end
					
				until
					CanAdd == false or CanClick == false
					Deb = false
					end
				end)
	
	CraftingChoice.Minus.MouseButton1Down:Connect(function()
	if Deb == false then
	Deb = true
	if CraftAmount > 2 then
		CanClick = true
		repeat
			CraftAmount -= 1
			DebTime -= 0.01
			CraftingChoice.Count.TextLabel.Text = CraftAmount
			
			CraftingChoice.Plus.ImageColor3 = Color3.fromRGB(188, 169, 123)
			CraftingChoice.Plus.Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
			CraftingChoice.Plus.HoverImage = PlusImage

			CraftingChoice.Minus.ImageColor3 = Color3.fromRGB(188, 169, 123)
			CraftingChoice.Minus.Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
			CraftingChoice.Minus.HoverImage = PlusImage
			for _,v in pairs(CraftingChoice.Ingr:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.Amount.Text = "x"..CraftItems.Items[MainItem].Ingredients[v.Name] * CraftAmount
				end
			end
			wait(DebTime)
						
				until CraftAmount < 2 or CanClick == false
					if CraftAmount < 2 then
					Deb = false
					CraftAmount = 1
					CraftingChoice.Count.TextLabel.Text = CraftAmount
					CraftingChoice.Minus.HoverImage = CraftingChoice.Minus.Image
					CraftingChoice.Minus.ImageColor3 = Color3.fromRGB(122, 117, 101)
					CraftingChoice.Minus.Txt.TextColor3 = Color3.fromRGB(172, 172, 172)
					for _,v in pairs(CraftingChoice.Ingr:GetChildren()) do
						if v:IsA("ImageLabel") then
							v.Amount.Text = "x"..CraftItems.Items[MainItem].Ingredients[v.Name] * CraftAmount
						end
							end
						end
					end
				end
				
	end)
	
	CraftingChoice.Use.MouseButton1Click:Connect(function()
		if Deb == false then
			Deb = true
			Remotes.CraftItem:FireServer(MainItem, CraftAmount)
			CraftingChoice.Visible = false
			
				CraftingProgress.Visible = true
				CraftingProgress.Item.Text = "Crafting ".. MainItem.."..."
					CraftingProgress.ItemImage.Image = Items.Eggs[MainItem].Image
					
					CraftAmount = 1
					CraftingChoice.Count.TextLabel.Text = CraftAmount
					
			CraftingProgress.Use.MouseButton1Click:Connect(function()
				if _G.PData.Craft == true and _G.PData.Crafting[MainItem] then
					if _G.PData.Crafting[MainItem].Time - os.time() <= 0 then
							Remotes.GetItemsFromCraft:FireServer(MainItem)
							CraftingProgress.Visible = false
							CraftingChoice.Visible = false

								RightButton.Visible = true
								LeftButton.Visible = true
								CraftButton.Visible = true

								CraftingProgress.Use.Txt.Text = "Stop Crafting"
								CraftingProgress.Use.ImageColor3 = Color3.fromRGB(255, 73, 73)
								Deb = false

								CraftAmount = 1
								CraftingChoice.Count.TextLabel.Text = CraftAmount
								
								for i,v in pairs(CraftingChoice.Ingr:GetChildren()) do
									if v:IsA("ImageLabel") then
										v:Destroy()
									end
								end
					else
						Remotes.CancelCraft:FireServer(MainItem)
						CraftingProgress.Visible = false
						CraftingChoice.Visible = false
							
						RightButton.Visible = true
						LeftButton.Visible = true
						CraftButton.Visible = true
							
						CraftingProgress.Use.Txt.Text = "Stop Crafting"
						CraftingProgress.Use.ImageColor3 = Color3.fromRGB(255, 73, 73)
						Deb = false
								
						CraftAmount = 1
						CraftingChoice.Count.TextLabel.Text = CraftAmount
							
							for i,v in pairs(CraftingChoice.Ingr:GetChildren()) do
								if v:IsA("ImageLabel") then
									v:Destroy()
								end
							end
					end
				end
			end)
		end
	end)
	
	CraftingChoice.Cancel.MouseButton1Click:Connect(function()
		CraftingChoice.Visible = false
		
		for i,v in pairs(CraftingChoice.Ingr:GetChildren()) do
			if v:IsA("ImageLabel") then
				v:Destroy()
			end
		end
		
		CraftAmount = 1
		CraftingChoice.Count.TextLabel.Text = CraftAmount
		RightButton.Visible = true
		LeftButton.Visible = true
		CraftButton.Visible = true
	end)
		end
		wait(0.1)
		Deb = false
	end
end)

ExitButton.MouseButton1Click:Connect(function()
	MainMenu.Enabled = false
	game.Lighting.Blur.Enabled = false
	
	for i,v in pairs(CraftingChoice.Ingr:GetChildren()) do
		if v:IsA("ImageLabel") then
			v:Destroy()
		end
	end
end)

CraftButton.MouseEnter:Connect(function()
	if CanCraft == true then
	CraftButton:TweenSize(UDim2.new(0.452, 0,0.22, 0),"Out", "Back", 0.1)
	end
end)

CraftButton.MouseLeave:Connect(function()
	if CanCraft == true then
	CraftButton:TweenSize(UDim2.new(0.425, 0,0.207, 0),"Out", "Back", 0.1)
	end
end)

Remotes.OpenCraftGui.OnClientEvent:Connect(function(A)
	if A == true then
	_G.PData = Remotes.GetPlayerData:InvokeServer()
	MainMenu.Enabled = true
	game.Lighting.Blur.Enabled = true
		
		if _G.PData.Craft == true then
			for i,v in pairs(_G.PData.Crafting) do
				MainItem = i
			end
		CraftingProgress.Visible = true
		CraftingProgress.Item.Text = "Crafting ".. MainItem.."..."
		CraftingProgress.ItemImage.Image = Items.Eggs[MainItem].Image
		RightButton.Visible = false
		LeftButton.Visible = false
		CraftButton.Visible = false
			
		if Checked == false then
			Checked = true
				
				CraftingProgress.Use.MouseButton1Click:Connect(function()
					if _G.PData.Craft == true and _G.PData.Crafting[MainItem] then
						if _G.PData.Crafting[MainItem].Time - os.time() <= 0 then
							Remotes.GetItemsFromCraft:FireServer(MainItem)
							CraftingProgress.Visible = false
							CraftingChoice.Visible = false

							RightButton.Visible = true
							LeftButton.Visible = true
							CraftButton.Visible = true

							CraftingProgress.Use.Txt.Text = "Stop Crafting"
							CraftingProgress.Use.ImageColor3 = Color3.fromRGB(255, 73, 73)
							Deb = false
							
							for i,v in pairs(CraftingChoice.Ingr:GetChildren()) do
								if v:IsA("ImageLabel") then
									v:Destroy()
								end
							end
							
						else
							Remotes.CancelCraft:FireServer(MainItem)
							CraftingProgress.Visible = false
							CraftingChoice.Visible = false

							RightButton.Visible = true
							LeftButton.Visible = true
							CraftButton.Visible = true

							CraftingProgress.Use.Txt.Text = "Stop Crafting"
							CraftingProgress.Use.ImageColor3 = Color3.fromRGB(255, 73, 73)
							Deb = false
							
							for i,v in pairs(CraftingChoice.Ingr:GetChildren()) do
								if v:IsA("ImageLabel") then
									v:Destroy()
								end
							end
						end
					end
				end)
		end
	end
		
	if _G.PData.Craft == false then
	Index = 2
	CraftingProgress.Visible = false
	CraftingChoice.Visible = false

	RightButton.Visible = true
	LeftButton.Visible = true
	CraftButton.Visible = true

	CraftingProgress.Use.Txt.Text = "Stop Crafting"
	CraftingProgress.Use.ImageColor3 = Color3.fromRGB(255, 73, 73)
	Deb = false
			
	CenterImage.Image = Items.Eggs[GetCenterItem()].Image

	MainItem = Items.Eggs[GetCenterItem()].Name
			
	for i,v in pairs(CraftItems.Items[MainItem].Ingredients) do
		if (_G.PData.Inventory[i]) > v then
			CanCraft = true
		else
			CanCraft = false
		break
		end
	end
		
	Item.Text = MainItem
	Desc.Text = Items.Eggs[GetCenterItem()].Description
		
	LeftImage.Image = Items.Eggs[GetLeftItem()].Image
	RightImage.Image = Items.Eggs[GetRightItem()].Image
	end
		
	else
		MainMenu.Enabled = false
		game.Lighting.Blur.Enabled = false
	end
end)

game["Run Service"].RenderStepped:Connect(function()
	if _G.PData ~= nil then
	if _G.PData.Craft == true then
		if _G.PData.Crafting ~= {} then
			if _G.PData.Crafting[MainItem] then
				if _G.PData.Crafting[MainItem].Time - os.time() > 0 then
					CraftingProgress.Bar.Time.Text = Utilities:FormatTime(_G.PData.Crafting[MainItem].Time - os.time())
					CraftingProgress.Bar.TwoBar.Size = UDim2.new((_G.PData.Crafting[MainItem].Time - os.time()) / (_G.PData.Crafting[MainItem].ItemAmount * 300),0,1,0)
				else
					CraftingProgress.Bar.Time.Text = "Completed!"
					CraftingProgress.Use.ImageColor3 = Color3.fromRGB(145, 255, 112)
					CraftingProgress.Use.Txt.Text = "Claim"
					CraftingProgress.Bar.TwoBar.Size = UDim2.new(0,0,1,0)
				end
			else
				CraftingProgress.Use.Txt.Text = "Stop Crafting"
				CraftingProgress.Use.ImageColor3 = Color3.fromRGB(255, 73, 73)
			end
		end
		end
	end
end)