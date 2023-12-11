local v1 = {}
local Data = require(game.ServerScriptService.Server:WaitForChild("Data"))
local flrModule = require(game.ServerScriptService.Server:WaitForChild("FlowerRegister"))
function v1:Spawn(plr)
	local PData = Data:Get(plr)
	local char = plr.Character
	local FieldVar = PData.Vars.Field
	if FieldVar ~= "" then
		for i,flr in pairs(workspace.Fields[FieldVar]:GetChildren()) do
			if flr:FindFirstChild("TopTexture") and (flr.Position-plr.Character.HumanoidRootPart.Position).magnitude <= 12 then
				local particles = script.Particles.Particle:clone()
				particles.Parent = flr
				local particles2 = script.Particles.Particle2:clone()
				particles2.Parent = flr
				game.Debris:AddItem(particles,5)
				game.Debris:AddItem(particles2,5)
				spawn(function()
					for t = 1,5 do
						if PData.Vars.Field ~= "" then
							flrModule:CollectFlower(plr,PData,flr)
						end
						wait(1)
					end
				end)
			end
		end
	end
end


return v1
