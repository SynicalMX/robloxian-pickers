local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

local SizeService = Knit.CreateService {
    Name = "SizeService",
    Client = {},
    _Sizes = {
        Size1 = 0.5,
        Size2 = 1,
        Size3 = 2,
        Size4 = 3,
        Size5 = 5,
    }
}

function SizeService:KnitInit()
    print("SizeService initialized.")
end

function SizeService:KnitStart()
    print("SizeService started.")
end

-- Server
function SizeService:CalculatePart(part: BasePart): number
    if not part then
        return nil
    end

    local size = part.Size

    if size.X <= self._Sizes.Size1 and size.Y <= self._Sizes.Size1 and size.Z <= self._Sizes.Size1 then
        return 1
    elseif size.X <= self._Sizes.Size2 and size.Y <= self._Sizes.Size2 and size.Z <= self._Sizes.Size2 then
        return 2
    elseif size.X <= self._Sizes.Size3 and size.Y <= self._Sizes.Size3 and size.Z <= self._Sizes.Size3 then
        return 3
    elseif size.X <= self._Sizes.Size4 and size.Y <= self._Sizes.Size4 and size.Z <= self._Sizes.Size4 then
        return 4
    elseif size.X <= self._Sizes.Size5 and size.Y <= self._Sizes.Size5 and size.Z <= self._Sizes.Size5 then
        return 5
    elseif size.X > self._Sizes.Size5 and size.Y > self._Sizes.Size5 and size.Z > self._Sizes.Size5 then
        return 6
    else
        return nil
    end
end

-- Client
function SizeService.Client:CalculatePart(part: BasePart)
    self.Server:CalculatePart(part)
end

return SizeService