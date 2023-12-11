wait(6)
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Remotes
local PData = _G.PData
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
local Tool = script.Parent.Parent

local Tools = require(game.ReplicatedStorage:WaitForChild("Modules").Items)

local UIS = game:GetService("UserInputService")
local CAS = game:GetService("ContextActionService")

local ToolInfo = Tools.Collectors[_G.PData.Equipment.Tool]
if not ToolInfo then warn("Tool is not in module!") return end

local Collecting = false
local Debounce = false

local SwingAnimation = "rbxassetid://522635514"

UIS.InputBegan:Connect(function(Input, GPE)
	if not GPE and Input.UserInputType == Enum.UserInputType.MouseButton1 then
		Collecting = true
	end
end)

UIS.InputEnded:Connect(function(Input, GPE)
	if not GPE and Input.UserInputType == Enum.UserInputType.MouseButton1 then
		Collecting = false
	end
end)

CAS:BindAction("Scoop", function(_, State)
	if State == Enum.UserInputState.Begin then
		Collecting = true
	else
		Collecting = false
	end
end, true, Enum.KeyCode.ButtonB)

CAS:SetPosition("Scoop", UDim2.new(1, -70, 0, 10))
CAS:SetTitle("Scoop", "Scoop")

game:GetService("RunService").RenderStepped:Connect(function()
	if Collecting and not Debounce then
		Debounce = true
		script.Parent.Server.Collect:FireServer(HRP)
		
		local Animation = Instance.new("Animation") 
		Animation.AnimationId = SwingAnimation

		
		local AnimationTrack = Humanoid:LoadAnimation(Animation)
		local Cooldown = ToolInfo.Cooldown-- / (PData.AllStats["Tools Speed"] / 100)
		AnimationTrack:Play()
		wait(Cooldown)
		Debounce = false
		
		
		spawn(function()
			wait(AnimationTrack.Length)
			Animation:Destroy()
		end)
	end
end)