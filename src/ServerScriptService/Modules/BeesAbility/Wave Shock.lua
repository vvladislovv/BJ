local CaramelHandler = require(game.ServerScriptService.Modules.CaramelHandler)
local v1 = {}

local Tween = game:GetService("TweenService")

function v1.Spawn(p3, Player)
	local Character = game.Workspace:FindFirstChild(Player.Name)
	local beeinfo = p3.PData.Bees[tonumber(p3.Bee)]
	local wave = script.Wave:Clone()
	wave.CFrame = CFrame.new(p3.TokenPos)
	wave.Parent = workspace.PlayerEffects[Player.Name]
	local totalX = 1
	local x = 1
	if beeinfo.Gifted then
		x = 2 + (beeinfo.Level / 10)
	else
		x = 1 + (beeinfo.Level / 10)
	end
	totalX *= beeinfo.Level
	totalX *= x
	Tween:Create(wave, TweenInfo.new(1 / x, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = CFrame.new(p3.TokenPos) * CFrame.new(0,0,10 * totalX)}):Play()
end

return v1