wait(5)

local af = script.Parent.List
local plr = game.Players.LocalPlayer

local Donations = require(game.ReplicatedStorage.Modules.Donations)

local PlayerIcon = game.Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

--//-----// Profile \\-----\\--

local Colors = {
	["Developer"] = Color3.fromRGB(194, 55, 55),
	["Administrator"] = Color3.fromRGB(52, 74, 194),
	["Moderator"] = Color3.fromRGB(45, 194, 88),
	["Support"] = Color3.fromRGB(194, 138, 190),
}

local ui = af.Profile

ui.PlayerIcon.Image = PlayerIcon
ui.Nick.Text = plr.Name

ui.Rank.rank.Text = _G.PData.IStats.AdminRank
ui.Rank.rank.TextColor3 = Colors[_G.PData.IStats.AdminRank]

game:GetService("RunService").RenderStepped:Connect(function()
	ui.AP.cn.Text = _G.PData.IStats.AP
end)