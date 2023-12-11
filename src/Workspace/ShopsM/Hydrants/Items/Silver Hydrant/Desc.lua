local mod = require(game.ReplicatedStorage.Modules.Hydrants).HStats[script.Parent.Name]
return "\n [Hydrant] \n\n Stats: \n\n Radius: "..mod.Radius.."\n Power: "..mod.Power.."\n Setup Time: "..mod.Setup.."\n Count: "..mod.Count.."\n Rate: "..mod.Rate.."\n"
