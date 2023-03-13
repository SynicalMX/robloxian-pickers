local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Knit = require(ReplicatedStorage.Packages.knit)
local DataStoreService = game:GetService("DataStoreService")
local MoneyStore = DataStoreService:GetDataStore("Money")

local MoneyService = Knit.CreateService {
    Name = "MoneyService",
    Client = {
        MoneyUpdated = Knit:CreateSignal()
    },
    _MoneyPerPlayer = {},
    _StartingMoney = 5000,
}

-- Server
function MoneyService:GetMoney(player: Player)
    local money = self._MoneyPerPlayer[player] or self._StartingMoney
    return money
end

function MoneyService:AddMoney(player: Player, amount: number)
    local money = self:GetMoney(player)
    money += amount
    self._MoneyPerPlayer[player] = money

    self.Client.MoneyUpdated:Fire(player, money)
end

function MoneyService:RemoveMoney(player: Player, amount: number)
    local money = self:GetMoney(player)
    money -= amount
    self._MoneyPerPlayer[player] = money

    self.Client.MoneyUpdated:Fire(player, money)
end

function MoneyService:CanBuy(player: Player, price: number)
    local money = self:GetMoney(player)

    if money >= price then
        return true
    else
        return false
    end
end

function MoneyService:SetMoney(player: Player, amount: number)
    self._MoneyPerPlayer[player] = amount
    self.Client.MoneyUpdated:Fire(player, amount)
end

function MoneyService:KnitStart()
    print("MoneyService started.")
end

function MoneyService:KnitInit()
    print("MoneyService initialized.")

    Players.PlayerAdded:Connect(function(player)
        local id = tostring(player.UserId)
        local money = MoneyStore:GetAsync(id)

        self._MoneyPerPlayer[player] = money
    end)

    Players.PlayerRemoving:Connect(function(player)
        local id = tostring(player.UserId)
        local money = self:GetMoney(player)
        MoneyStore:SetAsync(id, money)

        self._MoneyPerPlayer[player] = nil
    end)
end

-- Client
function MoneyService.Client:GetMoney(player: Player)
    return self.Server:GetMoney(player)
end

return MoneyService