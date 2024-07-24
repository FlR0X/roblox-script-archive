local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Firoxus/Yandere.xoxo/main/Lib/Cattoware.lua"))()
local Window = Library:CreateWindow("Yandere.xoxo | " .. game.Players.LocalPlayer.DisplayName .. " | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, Vector2.new(420, 420), Enum.KeyCode.RightControl) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Firoxus/Yandere.xoxo/main/Features/Silent.lua"))()

getgenv().Settings = {
    Enabled = false,
    Boxes = false,
    Color = Color3.new(255,0,0),
    Width = 3000, -- cool feature
    Filled = false,
    FillColor = Color3.fromRGB(0, 0, 0),
    Transparency = 0.2, -- Filled box transparency
    Healthbar = false, 
    Tracers = false,
    Tcolor = Color3.fromRGB(255, 0, 0), -- Trace color
    Tfrom = 2, -- where tracers locate
    TeamCheck = false,
    TeamColor = false,
    FriendlyColor = Color3.fromRGB(0,255,0), -- If teamcolor on set ur friendlies colors
    Lac = false, -- Link all colors
    Lc = Color3.fromRGB(84,233,154), -- Linked color
    Names = false, -- Yeah
    NameC = Color3.fromRGB(255,0,0), -- Name color
    TextSize = 20, -- Yh
    Offset = 30, -- Bit bugged cos further u are the higher it goes 
    Rainbow = false -- Rainbow esp coloer (not filled / outlines)
}
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/BlueButOutlined/Esps/main/Library'))()


-- Tab system?? --
local AimingTab = Window:CreateTab("Aiming") 
local VisualsTab = Window:CreateTab("Visuals")
local MiscTab = Window:CreateTab("Misc") 
local AntiTab = Window:CreateTab("Anti-Aim") 
local UserTab = Window:CreateTab("User-Interface") 

-- Aiming section --
local SilentSection = AimingTab:CreateSector("Silent-Aim", "left")
local AssistSection = AimingTab:CreateSector("Aim-Assist", "right")

-- Visual section --
local EspSection = VisualsTab:CreateSector("Esp", "left")
local MiscVisuals = VisualsTab:CreateSector("Misc Visuals", "right")

-- Misc section --
local WeaponSection = MiscTab:CreateSector("Weapon-Modifications", "left")
local MacroSection = MiscTab:CreateSector("Macros", "right")

-- Anti Section --
local VelocityAntis = AntiTab:CreateSector("Velocity-AntiAims", "left")
local BlatantAntis = AntiTab:CreateSector("Blatant-AntiAims", "right")

-- Ui tab --
local ConfigSystem = UserTab:CreateSector("Configuration", "left")
local UserInterface = UserTab:CreateSector("User-Interface", "right")

-- main code starts here 

SilentSection:AddToggle("Silent Aim", false, function(first)
    DaHoodSettings.SilentAim = first
end)

SilentSection:AddToggle("Visibility Check", false, function(first)
    Aiming.VisibleCheck = first
end)


local ColorToggle = SilentSection:AddToggle("Show Fov", false, function(e)
Aiming.ShowFOV = e
end)
ColorToggle:AddColorpicker(Color3.fromRGB(255,105,180), function(ztx)
   Aiming.FOVColour = ztx
end)

SilentSection:AddSlider("Fov", 0, 0, 360, 1, function(State)
    Aiming.FOV = State
end)

SilentSection:AddSlider("Hit Chance", 0, 100, 100, 1, function(State)
    Aiming.HitChance = State
end)

SilentSection:AddDropdown("Hit Part", {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, "UpperTorso", false, function(dropdown)
Aiming.AimPart = dropdown
end)


-- Visuals --
EspSection:AddToggle("Esp Enabled", false, function(first)
    Settings.Enabled = first
end)
local ColorToggle = EspSection:AddToggle("Boxes", false, function(e)
Settings.Boxes = e
end)
ColorToggle:AddColorpicker(Color3.fromRGB(255,105,180), function(ztx)
   Settings.Color = ztx
end)
local ColorToggle = EspSection:AddToggle("Boxes Filled", false, function(e)
Settings.Filled = e
end)
ColorToggle:AddColorpicker(Color3.fromRGB(255,105,180), function(ztx)
   Settings.FillColor = ztx
end)
local ColorToggle = EspSection:AddToggle("Names", false, function(e)
Settings.Names = e
end)
ColorToggle:AddColorpicker(Color3.fromRGB(255,105,180), function(ztx)
   Settings.NameC = ztx
end)

local ColorToggle = EspSection:AddToggle("Tracers", false, function(e)
Settings.Tracers = e
end)
ColorToggle:AddColorpicker(Color3.fromRGB(255,105,180), function(ztx)
   Settings.Tcolor = ztx
end)
EspSection:AddToggle("Healthbar", false, function(first)
    Settings.Healthbar = first
end)

EspSection:AddDropdown("Tracer Position", {"1", "2", "360"}, "360", false, function(dropdown)
Settings.Tfrom = dropdown
end)
EspSection:AddSlider("Boxes Width", 0, 3000, 5000, 1, function(State)
    Settings.Width = State
end)
EspSection:AddSlider("Text Size", 0, 20, 50, 1, function(State)
    Settings.TextSize = State
end)
EspSection:AddSlider("Text Offset", 0, 50, 100, 1, function(State)
    Settings.Offset  = State
end)

