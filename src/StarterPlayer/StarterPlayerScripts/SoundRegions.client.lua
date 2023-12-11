local plr = game.Players.LocalPlayer
repeat wait() until plr.Character
local char = plr.Character
plr.CharacterAdded:Connect(function()
	char=plr.Character
end)

local ts = game:GetService("TweenService")
local MainBackground = game.SoundService.MainBackground

local info = TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)

local regions = {}

for i,v in pairs(workspace.Regions:GetChildren()) do
	tab = {
		["CFrame"] = v.CFrame,
		["Sound"] = v.Sound,
		["Active"] = false,
		["Size"] = v.Size,
		["Volume"] = v.Sound.Volume
	}
	tab.Sound.Looped=true
	tab.Sound.Volume=0
	tab.Sound:Play()
	tab.Sound.Parent=game.SoundService
	table.insert(regions,tab)
end
workspace.Regions:Destroy()

function fade(sound,vol)
	local goal = {}
	goal.Volume= vol
	local tween = ts:Create(sound,info,goal)
	tween:Play()
end

function checkisinregion()
	for i,v in pairs(regions) do
		local ovlapparams = OverlapParams.new()
		ovlapparams.FilterType= Enum.RaycastFilterType.Whitelist
		ovlapparams.FilterDescendantsInstances= {char}
		local found = #workspace:GetPartBoundsInBox(v.CFrame,v.Size,ovlapparams)>0 and true or false
		if found then
			if not v.Active then
				v.Active=true
				fade(MainBackground,0)
				MainBackground:Stop()
				wait(0.5)
				v.Sound:Play()
				fade(v.Sound,v.Volume)
			end
		else
			if v.Active then
				v.Active=false
				fade(v.Sound,0)
				v.Sound:Stop()
				wait(0.5)
				MainBackground:Play()
				fade(MainBackground,0.5)
			end
		end
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	if char and char:FindFirstChild("Humanoid") then
		if char.Humanoid.MoveDirection.Magnitude > 0 then
			checkisinregion()
		end
	end
	
end)