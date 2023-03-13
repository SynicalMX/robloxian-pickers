local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)
local MoneyService, ItemService

local PurchaseService = Knit.CreateService {
    Name = "PurchaseService",
    Client = {}
}

function PurchaseService:KnitInit()
    print("PurchaseService initialized.")
end

function PurchaseService:KnitStart()
    print("PurchaseService started.")

    MoneyService = Knit.GetService("MoneyService")
    ItemService = Knit.GetService("ItemService")
end


function PurchaseService:Purchase(player: Player, part: BasePart)
    local price = self:CalculatePurchase(part)
    local canBuy = MoneyService:CanBuy(player, price)

    if canBuy then
        MoneyService:RemoveMoney(player, price)
        return `{player.Name} has bought {part.Name} for ${price}.`
    end
end

function PurchaseService:CalculatePurchase(part: BasePart)
    local price = ItemService:GetItemPrice(part)
    return price
end

return PurchaseService