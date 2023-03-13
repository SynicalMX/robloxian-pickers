local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

local DataStoreService = game:GetService("DataStoreService")
local BanStore = DataStoreService:GetDataStore("Bans")

local Players = game:GetService("Players")

local BanService = Knit.CreateService {
    Name = "BanService",
    Client = {}
}

function BanService:KnitInit()
    print("BanService initialized.")

    Players.PlayerAdded:Connect(function(player)
        local id = tostring(player.UserId)
        local banData = BanStore:GetAsync(id)
        
        if banData and banData.Banned then
            if banData.Goal <= os.time() then
                banData.Banned = false
                BanStore:SetAsync(id, banData)
            else
                local seconds = banData.Goal - os.time()
                local message = self:CreateReason(banData.Reason, seconds)
                player:Kick(message)
            end
        else
            BanStore:SetAsync(id, {
                Banned = false,
                Goal = 0,
                Reason = ""
            })
        end
    end)
end

function BanService:KnitStart()
    print("BanService started.")
end

function BanService:Ban(player: Player, length: number, reason: string)
    local id = tostring(player.UserId)

    local ban = {
        Banned = true,
        Goal = os.time() + length,
        Reason = reason
    }

    BanStore:SetAsync(id, ban)

    local message = self:CreateReason(reason, length)
    player:Kick(message)
end

function BanService:BanID(id: number, length: number, reason: string)
    local idStr = tostring(id)

    local ban = {
        Banned = true,
        Goal = os.time() + length,
        Reason = reason
    }

    BanStore:SetAsync(idStr, ban)

    local player = Players:GetPlayerByUserId(id)
    if player then
        local message = self:CreateReason(reason, length)
        player:Kick(message)
    end
end

function BanService:CreateReason(reason: string, length: number)
    local message = "You have been banned!"
    message = message.."Reason: "..reason
    message = message.."You are banned for "..length.." more seconds."

    return message
end

return BanService