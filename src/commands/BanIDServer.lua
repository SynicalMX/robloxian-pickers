local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

return function (context, player: number, length: number, reason: string)
    local BanService = Knit.GetService("BanService")
    BanService:BanID(player, length, reason)

    return `Banned player #{player} for {length} seconds because "{reason}".`
end