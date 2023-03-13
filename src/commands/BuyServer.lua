local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

return function (context, partName)
    local Player = context.Executor
    local part = workspace:FindFirstChild(partName)

    if not part then
        return `"{partName}" doesn't exist inside the workspace.`
    end

    local PurchaseService = Knit.GetService("PurchaseService")
    return PurchaseService:Purchase(Player, part)
end