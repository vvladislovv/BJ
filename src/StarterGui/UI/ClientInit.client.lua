repeat _G.PData = game.ReplicatedStorage.Remotes.GetPlayerData:InvokeServer() until _G.PData
require(game.ReplicatedStorage.Modules.InfoHover).Init()
for _, Script in pairs(game.ReplicatedStorage.Modules.ClientLibrary:GetChildren()) do
	require(Script).Init()
end