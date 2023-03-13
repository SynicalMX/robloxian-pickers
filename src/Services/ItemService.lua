local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)
local SizeService

local ItemService = Knit.CreateService {
    Name = "ItemService",
    Client = {},
    _ItemBasePrices = {
        TestPart = 100
    }
}

--- LIFECYCLE
function ItemService:KnitInit()
    print("ItemService initialized.")
end
function ItemService:KnitStart()
    print("ItemService started.")
    SizeService = Knit.GetService("SizeService")
end

--- SERVER
function ItemService:GetItemPrice(item: BasePart)
    local size = SizeService:CalculatePart(item)
    local baseprice = self._ItemBasePrices[item.Name]

    local tax = math.floor(baseprice / size)
    local total = baseprice + tax

    return total
end

return ItemService