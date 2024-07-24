local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local NotNeeded = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local Welcomelo = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.43, 0, 0.3, 0.5)
Frame.Size = UDim2.new(0, 259, 0, 100)

NotNeeded.Name = "NotNeeded"
NotNeeded.Parent = Frame
NotNeeded.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
NotNeeded.Position = UDim2.new(0, 0, 0.25999999, 0)
NotNeeded.Size = UDim2.new(0, 259, 0, 2)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 259, 0, 26)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Yandere.xoxo"
TextLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel.TextSize = 25.000

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.536679566, 0, -0.100000001, 0)
ImageLabel.Size = UDim2.new(0, 120, 0, 110)
ImageLabel.Image = "http://www.roblox.com/asset/?id=12679798697"

Welcomelo.Name = "Welcome lo"
Welcomelo.Parent = Frame
Welcomelo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcomelo.BackgroundTransparency = 1.000
Welcomelo.BorderSizePixel = 0
Welcomelo.Position = UDim2.new(0.227799222, 0, 0.379999995, 0)
Welcomelo.Size = UDim2.new(0, 140, 0, 50)
Welcomelo.Font = Enum.Font.SourceSans
Welcomelo.Text = "Welcome, Setting up."
Welcomelo.TextColor3 = Color3.fromRGB(240, 240, 240)
Welcomelo.TextSize = 20.000
wait(1.5)
Welcomelo.Text = "Bypassing Anticheat.."
wait(1)
Welcomelo.Text = "Loading ui.."
wait(1)
Welcomelo.Text = "Done! Have fun."
wait(1)
Frame.Transparency = 0.100
wait(0.3)
Frame.Transparency = 0.200
wait(0.3)
Frame.Transparency = 0.300
wait(0.3)
Frame.Transparency = 0.400
wait(0.3)
Frame.Transparency = 0.500
wait(0.3)
Frame.Transparency = 0.600
wait(0.3)
Frame.Transparency = 0.700
wait(0.3)
Frame.Transparency = 0.800
wait(0.3)
Frame.Transparency = 0.900
wait(0.3)
Frame.Transparency = 1
Frame:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Firoxus/Yandere.xoxo/main/yandere.lua"))()
