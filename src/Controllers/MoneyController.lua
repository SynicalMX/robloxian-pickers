local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

local MoneyController = Knit.CreateController {
    Name = "MoneyController"
}

function MoneyController:KnitStart()
    print("MoneyController started.")
end

function MoneyController:KnitInit()
    print("MoneyController initialized.")
end

return MoneyController