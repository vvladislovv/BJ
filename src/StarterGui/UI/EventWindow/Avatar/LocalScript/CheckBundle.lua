--// Services
local AssetService = game:GetService("AssetService");

return function(BundleId)
	return pcall(function()
		AssetService:GetBundleDetailsAsync(BundleId)
	end)
end