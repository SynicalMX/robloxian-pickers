local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cmdr = require(ReplicatedStorage.Packages.cmdr)

Cmdr:RegisterDefaultCommands()
Cmdr:RegisterHooksIn(ReplicatedStorage.Hooks)
Cmdr:RegisterCommandsIn(game.ServerStorage:WaitForChild("Commands"))
