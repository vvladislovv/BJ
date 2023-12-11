
local BoostsHandler = {} do
	
	--local Anim2 = game.ReplicatedStorage.Assets.BearsAnimations.Anim2
	--local Anim1 = game.ReplicatedStorage.Assets.BearsAnimations.Anim1
	--local anim = humanoid:LoadAnimation(Anim1)
	--local Anim3 = game.ReplicatedStorage.Assets.BearsAnimations.Anim3
	--local anim2 = humanoid:LoadAnimation(Anim3)

	--idleanim.Looped = true
	
	for _, Bear in pairs(game.Workspace.Bears:GetChildren()) do
		spawn(function()
		if Bear.Name == "Bear" then
		local humanoid = Bear:WaitForChild('Humanoid')
		local idleanim = humanoid:LoadAnimation(game.ReplicatedStorage.Assets.BearsAnimations.Anim2)
		local anim = humanoid:LoadAnimation(game.ReplicatedStorage.Assets.BearsAnimations.Anim1)
		anim.Looped = false
		idleanim.Looped = true
		idleanim:Play()
			while (math.random(15,35)) do
				idleanim:Stop()
				anim:Play()
				wait(anim.Length)
				anim:Stop()
				idleanim:Play()
				end
			elseif Bear.Name == "Dog" then
				local humanoid = Bear:WaitForChild('Humanoid')
				local idleanim = humanoid:LoadAnimation(game.ReplicatedStorage.Assets.BearsAnimations.DogAnim)
				idleanim:Play()
			end
		end)
	end
end

return BoostsHandler