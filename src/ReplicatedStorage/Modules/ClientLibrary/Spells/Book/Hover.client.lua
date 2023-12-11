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
local UIS = game:GetService("UserInputService")
local Modules = ReplicatedStorage.Modules
-- Constants
local UI = script.Parent.Parent.Parent.Parent

local Remotes = ReplicatedStorage.Remotes
local Boosts = game.ReplicatedStorage.Boosts

local UIScale = UI:WaitForChild("UIScale")
local Dragging = false
-- Variables
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HoverInfo = require(ReplicatedStorage.Modules.InfoHover)
local Data
local Utils = require(ReplicatedStorage.Modules.Utils)
Scale = UI.AbsoluteSize.Y / 1080 * 1.1
local CanUpdate = false

local HoverText
local BoostText = ""

for i, v in pairs(_G.PData.Books[script.Parent.Lay.Value].Content) do
	local TypeIn = "+"..v[3]..v[2].." "..v[1]
	if (i ~= 1) then
		BoostText = BoostText.. '\n'
	end
	BoostText = BoostText.. TypeIn
end

for _, Contype in pairs(_G.PData.Books[script.Parent.Lay.Value].Content) do
	if UI.Tabs.Settings.Player.Buffs:FindFirstChild(Contype[1]) then
		if UI.Tabs.Settings.Player.Buffs[Contype[1]]:FindFirstChild("ImageLabel") then
			local statt = script.Stat:Clone()
			statt.Image = UI.Tabs.Settings.Player.Buffs[Contype[1]]:FindFirstChild("ImageLabel").Image
			statt.Parent = script.Parent.Stats
		end
	end
end

Boost.MouseEnter:Connect(function()
	HoverInfo:UpdateText(_G.PData.Books[script.Parent.Lay.Value].Rank.." ".._G.PData.Books[script.Parent.Lay.Value].BookType.." \n\n"..BoostText)
	CanUpdate = true
	HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1), 0), Scale, Vector2.new(0,0.5))
end)
Boost.MouseLeave:Connect(function()
	CanUpdate = false
	HoverInfo:Remove()
end)
Boost.MouseMoved:Connect(function()
	Scale = UI.AbsoluteSize.Y / 1080 * 1.075
	HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1), 0), Scale, Vector2.new(0,0.5))
end)

local function CreateItemDecal(Pos)
	local NewItem = game.ReplicatedStorage.Modules.ClientLibrary.Spells.Drag53:Clone()
	NewItem.ImageTransparency = 0.3
	NewItem.AnchorPoint = Vector2.new(0.5, 0.85)
	NewItem.Position = UDim2.new(0, Pos.X / Scale, 0, Pos.Y / Scale)
	NewItem.Size = UDim2.new(0, 90, 0, 90)
	NewItem.BackgroundTransparency = 1
	NewItem.ZIndex = 99
	NewItem.Name = "Drag53"
	NewItem.Parent = UI
end

local choosen = 0

for _, Slot in pairs(UI.Spells.AllSlots:GetChildren()) do
	if Slot:IsA("Frame") then
		Slot.MouseEnter:Connect(function()
			if Dragging then
				choosen = tonumber(Slot.Name)
			end
		end)
		Slot.MouseLeave:Connect(function()
			choosen = 0
		end)
	end
end

local function Put()
	Dragging = false
	if UI:FindFirstChild("Drag53") then
		UI:FindFirstChild("Drag53"):Destroy()
	end
	if choosen > 0 then
		Remotes.MakeSpell:FireServer(choosen, tonumber(script.Parent.Name))
		wait(0.05)
		require(game.ReplicatedStorage.Modules.ClientLibrary.Spells).UpdSlots()
	end
end

Boost.Book.MouseButton1Down:Connect(function()
	Dragging = true
end)

Boost.Book.MouseButton1Up:Connect(function()
	Put()
end)

UIS.InputEnded:Connect(function(key)
	if key.UserInputType == Enum.UserInputType.MouseButton1 then
		Put()
	end
end)

if UIS.TouchEnabled then
	UIS.TouchEnded:Connect(function(Input, GPE)
		Dragging = false
		if UI:FindFirstChild("Drag53") then
			UI:FindFirstChild("Drag53"):Destroy()
		end
	end)
end

game:GetService("RunService").RenderStepped:Connect(function()
	if Dragging then
		if not UI:FindFirstChild("Drag53") then
			local mousePos = UIS:GetMouseLocation()
			CreateItemDecal(mousePos)
		else
			local mousePos = UIS:GetMouseLocation()
			local dragable = UI:FindFirstChild("Drag53")

			dragable.Position = UDim2.new(0, mousePos.X / UI.UIScale.Scale, 0, mousePos.Y / UI.UIScale.Scale)
		end
	else
		if UI:FindFirstChild("Drag53") then
			UI:FindFirstChild("Drag53"):Destroy()
		end
	end
end)