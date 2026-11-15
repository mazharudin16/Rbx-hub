-- MAZHAR'S FINAL ENGINE (test.lua)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = game:GetService("Players").LocalPlayer

local Engine = {}

-- 1. STEAL FUNCTION (Using Exact Path)
function Engine.StealEgg()
    local RF = ReplicatedStorage.Packages.Networking.RF
    if RF and RF:FindFirstChild("EggWorld") and RF.EggWorld:FindFirstChild("AskFieldEggCarry") then
        -- Hum ek empty table bhej rahe hain, game khud handle karega
        RF.EggWorld.AskFieldEggCarry:InvokeServer({})
    end
end

-- 2. TRAIL UNLOCK FUNCTION (Using Exact Name)
function Engine.EquipTrail(trailName)
    local RF = ReplicatedStorage.Packages.Networking.RF
    if RF and RF:FindFirstChild("Trailwear") and RF.Trailwear:FindFirstChild("AskChoose") then
        RF.Trailwear.AskChoose:InvokeServer(trailName)
    end
end

-- 3. SPEED FUNCTION
function Engine.SetSpeed(speed)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = speed
    end
end

-- 4. TREADMILL (Safe Teleport)
function Engine.Treadmill()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name == "TreadmillUpgrade" or obj.Name == "TreadmillBottom" then
                char.HumanoidRootPart.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
                break
            end
        end
    end
end

return Engine
