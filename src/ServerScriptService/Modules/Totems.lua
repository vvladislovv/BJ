local module = {}


local Remotes = game.ReplicatedStorage.Remotes

function module.CheckMarks(Player)
	local BoostAmount = 0
	spawn(function()
	while game.Players:FindFirstChild(Player) do wait()
	local Character = game.Workspace:FindFirstChild(Player.Name)
	for _,Totem in pairs(game.Workspace.PlayerEffects:FindFirstChild(Player.Name):GetChildren()) do
		if Totem.Name == "Totem" then
			if (Totem.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 13 then
				local MainTotem = Totem

				if (Totem.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 12 then
					if MainTotem:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency > 0 then
						MainTotem:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0
						BoostAmount += 1
						Remotes.Boost:Fire(Player, Totem:FindFirstChild("BoostType").Value, 1)
					end

					for _,v in pairs(game.Workspace.PlayerEffects[Player.Name]:GetChildren()) do
						if v ~= MainTotem and v.Name == "Totem" then
							if (MainTotem.PrimaryPart.Position - v.PrimaryPart.Position).Magnitude <= 24 and (MainTotem.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 12 then
								if v:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency > 0 then
									v:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0
									BoostAmount += 1
									Remotes.Boost:Fire(Player, Totem:FindFirstChild("BoostType").Value, 1)
								end
								for _,b in pairs(game.Workspace.PlayerEffects[Player.Name]:GetChildren()) do
									if b ~= v and b ~= MainTotem and b.Name == "Totem" then
										if (b.PrimaryPart.Position - v.PrimaryPart.Position).Magnitude <= 24 and (MainTotem.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 12 then
											if b:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency > 0 then
												b:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0
												BoostAmount += 1
												Remotes.Boost:Fire(Player, Totem:FindFirstChild("BoostType").Value, 1)
											end
										end
									end
								end
							end
						end
					end
				else
					for i,v in pairs(game.Workspace.PlayerEffects[Player.Name]:GetChildren()) do
						v:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0.7
						if BoostAmount > 0 then
							Remotes.Boost:Fire(Player, Totem:FindFirstChild("BoostType").Value, -BoostAmount)
							BoostAmount = 0
						end
					end
				end
			end
		end
	end
		end
	end)
end

return module
