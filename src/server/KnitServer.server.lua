local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Services = game:GetService("ServerStorage").Services
local Knit = require(ReplicatedStorage.Packages.knit)

Knit.AddServices(Services)

Knit.Start():andThen(function()
    print("Knit started.")
end):catch(warn)