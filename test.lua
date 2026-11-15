-- ==========================================
-- MAZHAR'S PREMIUM HUB (Reverse Engineered)
-- ==========================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- 1. AUTO TREADMILL
function AutoTreadmill()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    -- Game mein Treadmill dhoondo
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name == "TreadmillBottom" or obj.Name == "TreadmillUpgrade" then
            char.HumanoidRootPart.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
            print("Teleported to Treadmill: " .. obj:GetFullName())
            return
        end
    end
    print("Treadmill nahi mila is server mein!")
end

-- 2. SPEED BOOST (Using Game's WriteWalkSpeed)
function SetSpeed(speed)
    local remote = ReplicatedStorage:FindFirstChild("Packages")
    if remote then
        remote = remote:FindFirstChild("Networking")
        if remote then
            remote = remote:FindFirstChild("RE")
            if remote then
                local speedRemote = remote:FindFirstChild("StaffConsole") 
                if speedRemote then
                     speedRemote = speedRemote:FindFirstChild("WriteWalkSpeed")
                     if speedRemote then
                         speedRemote:FireServer(speed)
                     end
                end
            end
        end
    end
    
    -- Fallback (Agar remote kaam na kare)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = speed
    end
end

-- 3. AUTO STEAL (Beanstalk Event)
function AutoSteal()
    local remote = ReplicatedStorage:FindFirstChild("Packages")
    if remote then
        remote = remote:FindFirstChild("Networking")
        if remote then
            remote = remote:FindFirstChild("RE")
            if remote then
                local stealRemote = remote:FindFirstChild("BeanstalkEvent")
                if stealRemote then
                    stealRemote = stealRemote:FindFirstChild("AskStealEgg")
                    if stealRemote then
                        stealRemote:FireServer()
                        print("Steal Triggered!")
                        return
                    end
                end
            end
        end
    end
    print("Steal Remote nahi mila.")
end
