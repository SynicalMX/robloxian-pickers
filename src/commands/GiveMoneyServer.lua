local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

return function (context, player, amount)
    local MoneyService = Knit.GetService("MoneyService")
    MoneyService:AddMoney(player, amount)

    return `Gave {player.Name} ${amount}.`
end