wait(5)
local UI = script.Parent.Parent.Parent.Parent
local bfolder = game.ReplicatedStorage.Bees
local HoverInfo = require(game.ReplicatedStorage.Modules.InfoHover)
local UserInputService = game:GetService("UserInputService")
local CanUpdate = false
local mouse = game.Players.LocalPlayer:GetMouse()
Scale = UI.AbsoluteSize.Y / 1080 * 1.1

--for _, sound in pairs(workspace.Regions:GetChildren()) do
--	sound.Sound.Volume = _G.PData.Settings["Music"]
--end

local music = script.Parent.Frame.Music
local vfx = script.Parent.Frame.VFX
local ms = ""
local musicvolume = 0.5
local vfxvolume = 0.5


music.MouseWheelForward:Connect(function()
	if musicvolume < 1 then
		musicvolume += 0.05
	else
		musicvolume = 1
	end
	music.FIll:TweenSize(UDim2.new(musicvolume,0,1,0), "Out", "Back", 0.1, true)
	game.SoundService.MainBackground.Volume = musicvolume
end)

music.MouseWheelBackward:Connect(function()
	if musicvolume > 0 then
		musicvolume -= 0.05
	else
		musicvolume = 0
	end
	music.FIll:TweenSize(UDim2.new(musicvolume,0,1,0), "Out", "Back", 0.1, true)
	game.SoundService.MainBackground.Volume = musicvolume
end)


vfx.MouseWheelForward:Connect(function()
	if vfxvolume < 1 then
		vfxvolume += 0.05
	else
		vfxvolume = 1
	end
	vfx.FIll:TweenSize(UDim2.new(vfxvolume,0,1,0), "Out", "Back", 0.1, true)
end)

vfx.MouseWheelBackward:Connect(function()
	if vfxvolume > 0 then
		vfxvolume -= 0.05
	else
		vfxvolume = 0
	end
	vfx.FIll:TweenSize(UDim2.new(vfxvolume,0,1,0), "Out", "Back", 0.1, true)
end)