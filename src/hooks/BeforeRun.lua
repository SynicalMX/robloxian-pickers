local Admins = {
	[1] = 99140945,
	[2] = 513337513,
	[3] = 1258475863,
	[4] = 1879685834
}

return function (registry)
	registry:RegisterHook("BeforeRun", function(context)
		local canRun = false
		for _, user in pairs(Admins) do
			if context.Group == "DefaultAdmin" and context.Executor.UserId ~= user then
				continue
			else
				canRun = true
				break
			end
		end

		if not canRun then
			return "You do not have permission to run this command."
		end
	end)
end