local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local UIS = game:GetService("UserInputService")

local DEFAULT = 16
local RUNNING = 24

UIS.InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.LeftShift then
        humanoid.WalkSpeed = RUNNING
    end
end)

UIS.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.LeftShift then
        humanoid.WalkSpeed = DEFAULT
    end
end)