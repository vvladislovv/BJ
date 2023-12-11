local Player = game.Players.LocalPlayer
local UI = Player.PlayerGui.UI
local Remotes = game.ReplicatedStorage:WaitForChild("Remotes")
local InventoryModule = require(game.ReplicatedStorage.Modules.Items)
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local Mouse = Player:GetMouse()

local ColorsSSS = {
	Classic = Color3.fromRGB(108, 88, 75),
	Rare = Color3.fromRGB(248, 248, 248),
	Epic = Color3.fromRGB(245, 205, 48),
	Legendary = Color3.fromRGB(18, 238, 212),
	Mythic = Color3.fromRGB(147, 94, 238),
	Event = Color3.fromRGB(132, 221, 109)
}

local Item = script.Parent
local ItemModule = InventoryModule.Eggs[Item.Name]

local function CreateItemDecal(Name, Item, Pos)
	local NewItem = Item:Clone()
	NewItem.ImageTransparency = 0.3
	NewItem.AnchorPoint = Vector2.new(0.5, 0.85)
	NewItem.Position = UDim2.new(0, Pos.X / UI.UIScale.Scale, 0, Pos.Y / UI.UIScale.Scale)
	NewItem.Size = UDim2.new(0, 90, 0, 90)
	NewItem.BackgroundTransparency = 1
	NewItem.ZIndex = 99
	NewItem.Amount:Destroy()
	NewItem.Name = "Drag"
	NewItem.Parent = UI
end

local function HighlightHive(HiveGiven)
	if ItemModule.Type == "Egg" then
		for _, Slot in pairs(HiveGiven:GetChildren()) do
			if Slot:IsA("BasePart") and Slot.BeeN.Value == "" then
				Slot.Material = Enum.Material.Neon
				Slot.Color = Color3.fromRGB(75, 171, 97)
				Slot.Transparency = 0
			elseif Slot:IsA("BasePart") and Slot.BeeN.Value ~= "" then
				Slot.Material = Enum.Material.Neon
				Slot.Color = Color3.fromRGB(218, 70, 70)
				Slot.Transparency = 0
			else
				local BeeMod = require(game.ReplicatedStorage.Bees[Slot.BeeN.Value])
				Slot.Color = ColorsSSS[BeeMod.Rarity]
				Slot.Material = Enum.Material.SmoothPlastic
				Slot.Transparency = 0
			end
		end
	elseif ItemModule.Type == "Food" then
		for _, Slot in pairs(HiveGiven:GetChildren()) do
			if Slot:IsA("BasePart") and Slot.BeeN.Value ~= "" then
				if _G.PData.Bees[tonumber(Slot.Name)].Level < 15 then
					Slot.Material = Enum.Material.Neon
					Slot.Color = Color3.fromRGB(75, 171, 97)
					Slot.Transparency = 0
				end
			end
		end
	elseif ItemModule.Type == "EffectFood" then
		for _, Slot in pairs(HiveGiven:GetChildren()) do
			if Slot:IsA("BasePart") and Slot.BeeN.Value ~= "" then
				Slot.Material = Enum.Material.Neon
				Slot.Color = Color3.fromRGB(75, 171, 97)
				Slot.Transparency = 0
			end
		end
	elseif ItemModule.Type == "Jelly" then
		for _, Slot in pairs(HiveGiven:GetChildren()) do
			if Slot:IsA("BasePart") and Slot.BeeN.Value ~= "" then
				Slot.Material = Enum.Material.Neon
				Slot.Color = Color3.fromRGB(75, 171, 97)
				Slot.Transparency = 0
			end
		end
	end
end

local function ClearHive(Hive)
	for _, Slot in pairs(Hive:GetChildren()) do
		if Slot:IsA("BasePart") then
			if Slot.BeeN.Value == "" then
				Slot.Material = Enum.Material.SmoothPlastic
				Slot.Color = Color3.fromRGB(25,25,25)
				Slot.Transparency = 0.5
			else
				local BeeMod = require(game.ReplicatedStorage.Bees[Slot.BeeN.Value])
				Slot.Material = Enum.Material.SmoothPlastic
				Slot.Color = ColorsSSS[BeeMod.Rarity]
				Slot.Transparency = 0
			end
		end
	end
end

local Dragging = false
local ChoosenSlot

local Button = Item:FindFirstChild("Button")
local bindsui = UI.Binds
local cii = false
local ci = 0

for _, Bind in pairs(bindsui:GetChildren()) do
	if Bind:IsA("ImageButton") then
		Bind.MouseEnter:Connect(function()
			if cii then
				ci = tonumber(Bind.Name)
				Bind:TweenSize(UDim2.new(0,79,0,79), "Out", "Back", 0.15, true)
			else
				Bind:TweenSize(UDim2.new(0,74,0,74), "Out", "Back", 0.15, true)
			end
		end)

		Bind.MouseLeave:Connect(function()
			if cii then
				ci = 0
				Bind:TweenSize(UDim2.new(0,74,0,74), "Out", "Back", 0.15, true)
			else
				Bind:TweenSize(UDim2.new(0,69,0,69), "Out", "Back", 0.15, true)
			end
		end)
	end
end

Button.MouseButton1Down:Connect(function()
	if not Dragging then
		Dragging = true
		if ItemModule.CanBar then
			for _, Bind in pairs(bindsui:GetChildren()) do
				if Bind:IsA("ImageButton") then
					Bind.ImageColor3 = Color3.fromRGB(133, 255, 112)
					Bind:TweenSize(UDim2.new(0,74,0,74), "Out", "Back", 0.15, true)
					cii = true
				end
			end
		end
		if ItemModule.Type == "Egg" or ItemModule.Type == "Food" or ItemModule.Type == "EffectFood" or ItemModule.Type == "Jelly" then
			if _G.PData.Vars.Hive ~= "" then
				HighlightHive(workspace.Hives[_G.PData.Vars.Hive].Slots)
			end
		end
	end
end)

local function EndEgg()
	if Dragging and _G.PData.Vars.Hive ~= "" then
		Dragging = false
		ClearHive(workspace.Hives[_G.PData.Vars.Hive].Slots)
		if ItemModule.Type == "Egg" then
			if ChoosenSlot then
				Remotes.CreateBeeSlot:FireServer(Item.Name, ChoosenSlot)
			end
		elseif ItemModule.Type == "Jelly" then
			if ChoosenSlot then
				Remotes.CreateBeeSlot:FireServer(Item.Name, ChoosenSlot)
			end
		elseif ItemModule.Type == "Food" then
			if ChoosenSlot then
				Remotes.OpenFoodGui:FireServer(Item.Name)
				_G.ItemName = Item.Name
				_G.CSlot = ChoosenSlot
			end
		elseif ItemModule.Type == "EffectFood" then
			if ChoosenSlot then
				Remotes.FoodBee:FireServer(Item.Name, ChoosenSlot, "EffectFood", 1)
			end
		elseif ItemModule.Type == "FieldEffect" or "Buff" or "Sower" then
			if ci <= 0 then
				Remotes.Item:FireServer(Item.Name)
			end
		end
	end
end

if UIS.TouchEnabled then
	UIS.TouchEnded:Connect(function(Input, GPE)
		EndEgg()
		for _, Bind in pairs(bindsui:GetChildren()) do
			if Bind:IsA("ImageButton") then
				Bind.ImageColor3 = Color3.fromRGB(255, 255, 255)
				Bind:TweenSize(UDim2.new(0,69,0,69), "Out", "Back", 0.15, true)
				cii = false
			end
		end
		ChoosenSlot = nil
	end)
end

local function GetUnique(Item)
	local total = 0
	for _, v in pairs(_G.PData.Binds) do
		if v.Item == Item then
			total += 1
		end
	end
	return total
end

UIS.InputEnded:Connect(function(key)
	if key.UserInputType == Enum.UserInputType.MouseButton1 then
		EndEgg()
		Dragging = false
		if UI:FindFirstChild("Drag") then
			UI:FindFirstChild("Drag"):Destroy()
		end
		for _, Bind in pairs(bindsui:GetChildren()) do
			if Bind:IsA("ImageButton") then
				Bind.ImageColor3 = Color3.fromRGB(255, 255, 255)
				Bind:TweenSize(UDim2.new(0,69,0,69), "Out", "Back", 0.15, true)
				cii = false
			end
		end
		if ci > 0 then
			if _G.PData.Binds[tonumber(ci)].Item == ItemModule.Name then
				bindsui:FindFirstChild(tostring(ci)).Item.Image = ""
				Remotes.SetBind:FireServer("", ci)
				_G.PData.Binds[tonumber(ci)].Item = ""
			else
				if GetUnique(ItemModule.Name) == 0 then
					bindsui:FindFirstChild(tostring(ci)).Item.Image = ItemModule.Image
					Remotes.SetBind:FireServer(ItemModule.Name, ci)
					_G.PData.Binds[tonumber(ci)].Item = ItemModule.Name
				end
			end
			ci = 0
		end
		ChoosenSlot = nil
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if Dragging and ItemModule.CanInput == true then
		if not UI:FindFirstChild("Drag") then
			local mousePos = UIS:GetMouseLocation()
			CreateItemDecal(Item.Name, Item.Icon, mousePos)
			if _G.PData.Vars.Hive ~= "" then
				HighlightHive(workspace.Hives[_G.PData.Vars.Hive].Slots)
			end
		else
			local mousePos = UIS:GetMouseLocation()
			local dragable = UI:FindFirstChild("Drag")

			dragable.Position = UDim2.new(0, mousePos.X / UI.UIScale.Scale, 0, mousePos.Y / UI.UIScale.Scale)

			if ItemModule.Type == "Egg" or ItemModule.Type == "Food" or ItemModule.Type == "EffectFood" or ItemModule.Type == "Jelly" then
				local RayParams = RaycastParams.new()
				RayParams.FilterType = Enum.RaycastFilterType.Blacklist
				RayParams.FilterDescendantsInstances = {Player.Character, workspace.Bees}

				local MousePosition = UIS:GetMouseLocation()
				local UnitRay = Camera:ViewportPointToRay(MousePosition.X, MousePosition.Y)

				local Result = workspace:Raycast(UnitRay.Origin, UnitRay.Direction * 90, RayParams)
				if _G.PData.Vars.Hive ~= "" then
					HighlightHive(workspace.Hives[_G.PData.Vars.Hive].Slots)

					if Result and Result.Instance then
						if Result.Instance:IsA("MeshPart") and Result.Instance.Parent == workspace.Hives[_G.PData.Vars.Hive].Slots and Result.Instance.BeeN.Value == "" then
							local Slot = Result.Instance
							if ItemModule.Type == "Egg" then
								HighlightHive(workspace.Hives[_G.PData.Vars.Hive].Slots)
								Slot.Material = Enum.Material.Neon
								Slot.Color = Color3.fromRGB(135, 236, 124)
								Slot.Transparency = 0
								ChoosenSlot = Slot
							end
						elseif (Result.Instance:IsA("MeshPart") or Result.Instance:IsA("BasePart")) and (Result.Instance.Parent == workspace.Hives[_G.PData.Vars.Hive].Slots or (Result.Instance.Parent:FindFirstChild("BeeN") and Result.Instance.Parent.Parent == workspace.Hives[_G.PData.Vars.Hive].Slots)) then
							local Slot
							if Result.Instance.Parent:FindFirstChild("BeeN") then
								Slot = Result.Instance.Parent
							else
								Slot = Result.Instance
							end
							if Slot.BeeN.Value ~= "" then
								if ItemModule.Type == "Food" or ItemModule.Type == "EffectFood" or ItemModule.Type == "Jelly" then
									if ItemModule.Type == "Food" then
										if _G.PData.Bees[tonumber(Slot.Name)].Level < 15 then
											HighlightHive(workspace.Hives[_G.PData.Vars.Hive].Slots)
											Slot.Material = Enum.Material.Neon
											Slot.Color = Color3.fromRGB(135, 236, 124)
											Slot.Transparency = 0
											ChoosenSlot = Slot
										else
											ChoosenSlot = nil
										end
									else
										HighlightHive(workspace.Hives[_G.PData.Vars.Hive].Slots)
										Slot.Material = Enum.Material.Neon
										Slot.Color = Color3.fromRGB(135, 236, 124)
										Slot.Transparency = 0

										ChoosenSlot = Slot
									end
								elseif ItemModule.Type == "Egg" then
									HighlightHive(workspace.Hives[_G.PData.Vars.Hive].Slots)
									Slot.Material = Enum.Material.Neon
									Slot.Color = Color3.fromRGB(185, 59, 59)
									Slot.Transparency = 0

									ChoosenSlot = nil
								end
							end
						else
							if ChoosenSlot ~= nil then
								ChoosenSlot.Color = Color3.fromRGB(75, 171, 97)
								ChoosenSlot = nil
							end
						end
					end
				end
			end
		end
	end
end)