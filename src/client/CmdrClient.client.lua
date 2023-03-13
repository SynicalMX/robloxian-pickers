local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cmdr = require(ReplicatedStorage:WaitForChild("CmdrClient"))

Cmdr:SetActivationKeys({ Enum.KeyCode.F2 })

local Admins = {
	[1] = 99140945,
	[2] = 513337513,
	[3] = 1258475863,
	[4] = 1879685834
}

local Player = game.Players.LocalPlayer
local Enabled = false
for _, player in pairs(Admins) do
    if player == Player.UserId then
        Enabled = true
        break
    end
end

Cmdr.Enabled = Enabled