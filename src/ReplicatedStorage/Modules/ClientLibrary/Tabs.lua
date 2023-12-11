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

function module.Init()
	wait(6.2)
	local players = game:GetService("Players")
	local Player = players.LocalPlayer
	local pGui = Player:WaitForChild("PlayerGui")
	UI = pGui:WaitForChild("UI")
	local TweenTime = 0.1
	local OpenedMenu = "None"
	local Tabs = UI:WaitForChild("Tabs")
	local Menu = UI:WaitForChild("Menu").List
	
	local function OpenTab(Tab, Button)
		if Tab.Name ~= "RobuxShop" then
			Tab:TweenPosition(UDim2.new(0, -15, 0, -76), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, TweenTime, true)
			Button.ImageTransparency = 0
			Button:TweenSize(UDim2.new(0, 60, 0, 60), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.15, true)
		else
			if not _G.PData.IStats["RSAlert"] then
				Remotes.Parent.AlertBtn:FireServer()
				Button.Alert:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true)
				spawn(function()
					wait(0.4)
					Button.Alert.Visible = false
				end)
			end
			Tab:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, TweenTime, true)
			Button.ImageTransparency = 0
			Button:TweenSize(UDim2.new(0, 60, 0, 60), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.15, true)
		end
	end
	
	local function CloseAllTabs()
		for _, Tab in pairs(Tabs:GetChildren()) do
			if Tab:IsA("Frame") or Tab:IsA("ScrollingFrame") or Tab:IsA("ImageLabel") then
				spawn(function()
					Tab:TweenPosition(UDim2.new(-1, -115, 0, -76), Enum.EasingDirection.In, Enum.EasingStyle.Quad, TweenTime, true)
				end)
			end
		end

		UI:FindFirstChild("RobuxShop"):TweenPosition(UDim2.new(-4, 0, 0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, TweenTime, true)

		for _, Button in pairs(UI.Menu.List:GetChildren()) do
			if Button:IsA("ImageButton") then
				spawn(function()
					Button.ImageTransparency = 0.15
					Button:TweenSize(UDim2.new(0, 50, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.15, true)
				end)
			end
		end
	end
	
	for _, Button in pairs(Menu:GetChildren()) do
		if Button:IsA("ImageButton") then
			Button.MouseButton1Click:Connect(function()
				local Tab
				if Button.Name ~= "Shop" then
					Tab = Tabs:FindFirstChild(Button.Name)
				else
					Tab = UI:FindFirstChild("RobuxShop")
				end
				if Tab then
					if OpenedMenu == "None" then
						OpenedMenu = Tab.Name
						OpenTab(Tab, Button)
					elseif OpenedMenu == Tab.Name then
						OpenedMenu = "None"
						Button.ImageTransparency = 0.15
						CloseAllTabs()
					else
						if Button.Name ~= "Shop" then
							Tab = Tabs:FindFirstChild(Button.Name)
						else
							Tab = UI:FindFirstChild("RobuxShop")
						end
						Button.ImageTransparency = 0
						local PreviousTab = Tabs:FindFirstChild(OpenedMenu)
						OpenedMenu = Tab.Name
						Button.ImageTransparency = 0.15
						CloseAllTabs()
						wait(TweenTime)
						OpenTab(Tab, Button)
					end
				end
			end)

		end
	end
end

return module
