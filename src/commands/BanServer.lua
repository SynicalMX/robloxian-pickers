local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

return function (context, player: Player, length: number, reason: string)
    local BanService = Knit.GetService("BanService")
    BanService:Ban(player, length, reason)

    return `Banned {player.Name} for {length} seconds because "{reason}".`
end