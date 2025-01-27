--[[
@gworld. on cord
https://firox.lol
remove this and you suck mad dick
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FlR0X/Horror/refs/heads/main/UI%20Library/UI%20Library.lua"))()
Library.theme.accentcolor = Color3.new(1, 0.6, 0)
local window = Library:CreateWindow("ERs", Vector2.new(500, 600), Enum.KeyCode.RightControl)

-- Tabs Start --
local AimingTab = window:CreateTab("Aiming") 
local Configtab = window:CreateTab("Configs") 
-- Tabs End --

--Aiming--
local AimingSection = AimingTab:CreateSector("Aimbot", "left")
Configtab:CreateConfigSystem("left")

getgenv().AimbotEnabled = false
getgenv().OldAimPart = "HumanoidRootPart"
getgenv().AimPart = "HumanoidRootPart"
getgenv().AirPart = "RightLeg"
getgenv().AimlockKey = nil
getgenv().AimRadius = 0
getgenv().FOV = false
getgenv().FOVColor = Color3.fromRGB(255, 153, 0)
getgenv().LineColor = Color3.fromRGB(255, 153, 0)
getgenv().ThirdPerson = false
getgenv().FirstPerson = false
getgenv().TeamCheck = false
getgenv().PredictMovement = false
getgenv().PredictionVelocity = 0
getgenv().CheckIfJumped = false
getgenv().Smoothness = false
getgenv().SmoothnessAmount = 0
getgenv().Mode = nil
getgenv().TracerEnabled = false

AimingSection:AddToggle("Aimbot", false, function(first)
    getgenv().AimbotEnabled = first
end)

AimingSection:AddToggle("Fov Visible", false, function(first)
    getgenv().FOV = first
end)

AimingSection:AddToggle("Line", false, function(first)
    getgenv().TracerEnabled = first
end)

AimingSection:AddSlider("Fov Size", 1, 100, 360, 1, function(State)
    getgenv().AimRadius = State
end)

AimingSection:AddToggle("Use Prediction", false, function(first)
    getgenv().PredictMovement = first
end)

AimingSection:AddSlider("Prediction", 0, 10, 15, 10, function(State)
    getgenv().PredictionVelocity = State
end)

AimingSection:AddToggle("Use Smoothness", false, function(first)
    getgenv().Smoothness = first
end)

AimingSection:AddSlider("Smoothing", 0, 0.1, 1, 100, function(State)
    getgenv().SmoothnessAmount = State
end)

AimingSection:AddSlider("Fov Size", 1, 100, 360, 1, function(State)
    getgenv().AimRadius = State
end)

AimingSection:AddKeybind("Aimbot Keybind", Enum.KeyCode.X, function(Keybind)
    getgenv().AimlockKey = Keybind
end)

AimingSection:AddColorpicker("Fov Color", Color3.fromRGB(255, 153, 0), function(ztx)
    getgenv().FOVColor = ztx
end)

AimingSection:AddColorpicker("Line Color", Color3.fromRGB(255, 153, 0), function(ztx)
    getgenv().LineColor = ztx
end)

AimingSection:AddDropdown("Keybind Method", {"hold", "toggle"}, "toggle", false, function(dropdown)
    getgenv().Mode = dropdown
end)

AimingSection:AddDropdown("Aimpart", {"Head", "HumanoidRootPart"}, "HumanoidRootPart", false, function(dropdown)
    getgenv().AimPart = dropdown
    getgenv().OldAimPart = dropdown
end)

AimingSection:AddToggle("Teamcheck", false, function(first)
    getgenv().TeamCheck = first
end)


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local aimlockActive = false
local aimlockTarget = nil
local keyHeld = false

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 30
fovCircle.Radius = getgenv().AimRadius
fovCircle.Filled = false
fovCircle.Transparency = 1
fovCircle.Color = getgenv().FOVColor
fovCircle.Visible = getgenv().FOV

local tracerLine = Drawing.new("Line")
tracerLine.Thickness = 2
tracerLine.Transparency = 1
tracerLine.Color = getgenv().LineColor
tracerLine.Visible = getgenv().TracerEnabled

local function updateFOVCircle()
    fovCircle.Radius = getgenv().AimRadius
    fovCircle.Color = getgenv().FOVColor
    fovCircle.Visible = getgenv().FOV
end

local function getNearestTarget()
    local closestPlayer = nil
    local closestDistance = getgenv().AimRadius

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local screenPosition, onScreen = Camera:WorldToViewportPoint(player.Character.Head.Position)
            local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            if onScreen and distance <= closestDistance and (not getgenv().TeamCheck or player.Team ~= LocalPlayer.Team) then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == getgenv().AimlockKey then
        if getgenv().Mode == "hold" then
            keyHeld = true
            aimlockTarget = getNearestTarget()
            aimlockActive = aimlockTarget ~= nil
        elseif getgenv().Mode == "toggle" then
            if aimlockTarget then
                aimlockTarget = nil
                aimlockActive = false
            else
                aimlockTarget = getNearestTarget()
                aimlockActive = aimlockTarget ~= nil
            end
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == getgenv().AimlockKey and getgenv().Mode == "hold" then
        keyHeld = false
        aimlockTarget = nil
        aimlockActive = false
    end
end)

RunService.RenderStepped:Connect(function()
    if getgenv().FOV then
        local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        fovCircle.Position = screenCenter
    end

    if getgenv().AimbotEnabled then
        if aimlockActive and aimlockTarget and aimlockTarget.Character then
            local aimPart = aimlockTarget.Character:FindFirstChild(getgenv().AimPart)
            if aimPart then
                local targetPosition = aimPart.Position

                if getgenv().PredictMovement then
                    targetPosition += aimPart.Velocity / getgenv().PredictionVelocity
                end

                local screenPosition, onScreen = Camera:WorldToViewportPoint(targetPosition)
                if getgenv().TracerEnabled and onScreen then
                    tracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    tracerLine.To = Vector2.new(screenPosition.X, screenPosition.Y)
                    tracerLine.Visible = true
                else
                    tracerLine.Visible = false
                end
                local desiredCFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                if getgenv().Smoothness then
                    Camera.CFrame = Camera.CFrame:Lerp(desiredCFrame, getgenv().SmoothnessAmount)
                else
                    Camera.CFrame = desiredCFrame
                end
            end
        else
            tracerLine.Visible = false
        end

        if getgenv().Mode == "hold" and not keyHeld then
            aimlockTarget = nil
            aimlockActive = false
        end
    else
        tracerLine.Visible = false
    end

    updateFOVCircle()
end)


setfpscap(999)
while true do
   game:GetService("CoreGui").ERs.main.top.title.Text = "E"
   wait(0.5)
   game:GetService("CoreGui").ERs.main.top.title.Text = "Er"
   wait(0.5)
   game:GetService("CoreGui").ERs.main.top.title.Text = "Ers"
   wait(0.5)
   game:GetService("CoreGui").ERs.main.top.title.Text = "Er"
   wait(0.5)
end
