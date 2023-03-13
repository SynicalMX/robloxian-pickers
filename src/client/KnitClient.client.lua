local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

Knit.AddControllers(ReplicatedStorage.Controllers)

Knit.Start():andThen(function()
    print("Knit started.")
end):catch(warn)