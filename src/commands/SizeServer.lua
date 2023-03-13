local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

return function (context, partName)
    local part = workspace:FindFirstChild(partName)

    if not part then
        return `"{partName}" doesn't exist inside the workspace.`
    end

    local SizeService = Knit.GetService("SizeService")
    local size = SizeService:CalculatePart(part)
    return part.Name.." has a size of "..tostring(size).."."
end