local Data = require(game.ServerScriptService.Server.Data)
local AmuletsModule = require(game.ReplicatedStorage.Modules.AmuletsModule)
local Tasks = require(game.ReplicatedStorage.Modules.HALLOWEEN).TaskTypes
local Remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
local GetRealStats = require(game.ServerScriptService.Functions.GetRealStats)

local module = {}

function PTask(Type)
	if string.find(Type, "PTask") then
		return "Premium"
	else
		return "Classic"
	end
end

function module.MakeTask(Player, Type)
	local PData = Data:Get(Player)
	local FoundedTask = false
	local TaskID = ""
	local AvaibleList = {
		
	}
	if Type == "Classic" then
		for i,v in pairs(PData.HTasks) do
			if not v.Locked then
				AvaibleList[i] = v
			end
		end
		for i,v in pairs(AvaibleList) do
			if not v.Locked and not FoundedTask then
				FoundedTask = true
				v.Locked = true
				v.TaskID = math.random(1,#Tasks["Classic"])
				v.Progress = 0
				TaskID = i
			end
		end
		PData.HTasks[TaskID] = AvaibleList[TaskID]
		print(PData.HTasks)
	else
		for i,v in pairs(PData.HPremTasks) do
			if not v.Locked then
				AvaibleList[i] = v
			end
		end
		for i,v in pairs(AvaibleList) do
			if not v.Locked and not FoundedTask then
				FoundedTask = true
				v.Locked = true
				v.TaskID = math.random(1,#Tasks["Classic"])
				v.Progress = 0
				TaskID = i
			end
		end
		PData.HPremTasks[TaskID] = AvaibleList[TaskID]
		print(PData.HPremTasks)
	end
end

return module
