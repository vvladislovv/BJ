local v1 = {}

local LightingSTR = 'require(game.ReplicatedStorage:WaitForChild("Advanced Particles")):New(flr,10,7,0.3,3,Color3.new(0.984314, 1, 0),"rbxasset://textures/particles/sparkles_main.dds","Tornado",0,5,"Top",250)'
local Data = require(game.ServerScriptService.Server:WaitForChild("Data"))
local flrModule = require(game.ServerScriptService.Server:WaitForChild("FlowerRegister"))
function v1.Spawn(plr,token)
	local PData = Data:Get(plr)
	local char = plr.Character
	local FieldVar = PData.Vars.Field
	if workspace.Fields:FindFirstChild(FieldVar) then
		for i = 1,50 do
			local flr = workspace.Fields[FieldVar]:GetChildren()[math.random(1,#workspace.Fields[FieldVar]:GetChildren())]
			local try = 0
			repeat wait()
				try	 += 1
				flr = workspace.Fields[FieldVar]:GetChildren()[math.random(1,#workspace.Fields[FieldVar]:GetChildren())]
				if try >= 5 then
					try = 0
					flr = nil
					break
					end
			until flr:FindFirstChild("TopTexture")
			loadstring(LightingSTR)
			flrModule:CollectFlower(plr,PData,flr)
			wait(0.02)
		end
	end
end

return v1