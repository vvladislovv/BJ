local v1 = {}
local Data = require(game.ServerScriptService.Server:WaitForChild("Data"))
local flrModule = require(game.ServerScriptService.Server:WaitForChild("FlowerRegister"))
function v1:Spawn(plr)
	local PData = Data:Get(plr)
	local char = plr.Character
	local FieldVar = PData.Vars.Field
	if workspace.Fields:FindFirstChild(FieldVar) then
		for _,flr in pairs(workspace.Fields[FieldVar]:GetChildren()) do
			if flr:FindFirstChild("TopTexture") then
				local fire = Instance.new("Fire") 
				fire.Parent = flr
				fire.Size = 10
				fire.Heat = 15
				flrModule:CollectFlower(plr,PData,flr)
				game.Debris:AddItem(fire,3)
			end
		end
	end
end


return v1
