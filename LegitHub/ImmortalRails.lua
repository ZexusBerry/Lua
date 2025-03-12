local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZexusBerry/HydraHubRecodeV2.5/refs/heads/main/SourceV2.5.lua'))()
local Window = UILib.new("Dead Rails", game.Players.LocalPlayer.Name, "" .. identifyexecutor() .. " | LegitHub")

local Chest = Window:Category("Gun", "http://www.roblox.com/asset/?id=139200181003203")
local Chests = Chest:Button("Gun", "http://www.roblox.com/asset/?id=126480518771226")
local ChestSel = Chests:Section("Settings", "Left")
local ChestSe = Chests:Section("Ofter", "Right")

local Player = Window:Category("Player", "http://www.roblox.com/asset/?id=89363207631739")
local Plr = Player:Button(game.Players.LocalPlayer.Name, "http://www.roblox.com/asset/?id=84189911430981")
local PlayerB = Plr:Section("Movement", "Left")
local PlayerBs = Plr:Section("Main", "Right")

local Mob = Window:Category("Mob", "http://www.roblox.com/asset/?id=91973236390505")
local MB = Mob:Button("Enemy", "http://www.roblox.com/asset/?id=138637608534052")
local MBs = Mob:Button("Visuals", "http://www.roblox.com/asset/?id=89674952577322")

local Visual = Window:Category("Visuals", "http://www.roblox.com/asset/?id=71207765178575")
local VIS = Visual:Button("World", "http://www.roblox.com/asset/?id=100023905960342")
local VISs = Visual:Button("Player", "http://www.roblox.com/asset/?id=124502355450177")
local VISs = Visual:Button("Effect", "http://www.roblox.com/asset/?id=138737765702521")
local WS = VIS:Section("World Setting", "Left")

local Items = Window:Category("Items", "http://www.roblox.com/asset/?id=85901925160532")
local Item = Items:Button("Item", "http://www.roblox.com/asset/?id=94868031864873")

local Grabb = Item:Section("Grabber", "Left")

game:GetService("Lighting").ColorCorrection.Enabled = false
game:GetService("Lighting").Brightness = 0
game:GetService("Lighting").Atmosphere.Haze = 0

local player = game:GetService("Players").LocalPlayer
local backpack = player.Backpack
local character = player.Character

local function getGuns(container)
    local guns = {}
    for _, gun in ipairs(container:GetChildren()) do
        if gun:IsA("Tool") and (gun.Name == "Revolver" or gun.Name == "Shotgun" or gun.Name == "Rifle") then
            table.insert(guns, gun)
        end
    end
    return guns
end

ChestSel:Toggle({
    Title = "Nospread",
    Description = "Nospread function",
    Default = false
}, function(value)
    local guns = getGuns(character)
    for _, gun in ipairs(guns) do
        for _, gunin in ipairs(gun:GetChildren()) do
            if gunin:FindFirstChild("SpreadAngle") then
                gunin.SpreadAngle.Value = value and 0 or 0.9
            end
        end
    end
end)

ChestSel:Checkbox({
    Title = "Quick Reload",
    Description = "Fast gun reload",
    Default = false
}, function(value)
    local guns = getGuns(character)
    for _, gun in ipairs(guns) do
        for _, gunin in ipairs(gun:GetChildren()) do
            if gunin:FindFirstChild("ReloadDuration") then
                gunin.ReloadDuration.Value = value and 0 or 2
            end
        end
    end
end)

ChestSel:Checkbox({
    Title = "RapidFire",
    Description = "RapidFire more ammo shot",
    Default = false
}, function(value)
    local guns = getGuns(character)
    for _, gun in ipairs(guns) do
        for _, gunin in ipairs(gun:GetChildren()) do
            if gunin:FindFirstChild("FireDelay") then
                gunin.FireDelay.Value = value and 0 or 0.35
            end
        end
    end
end)

local ammoRechargeEnabled = false

ChestSel:Toggle({
    Title = "Ammo Recharge",
    Description = "99999 ammo in one rapidfire hit",
    Default = false
}, function(value)
    ammoRechargeEnabled = value
    if value then
        spawn(function()
            while ammoRechargeEnabled do
                local guns = getGuns(character)
                for _, gun in ipairs(guns) do
                    local state = gun:FindFirstChild("ServerWeaponState")
                    if state then
                        local currentAmmo = state:FindFirstChild("CurrentAmmo")
                        if currentAmmo and currentAmmo.Value > 0 then
                            currentAmmo.Value = 99999
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
end)

ChestSe:Slider({
    Title = "Custom Spread",
    Description = "Gun Spread value",
    Default = 1,
    Min = 1,
    Max = 50
}, function(value)
    local guns = getGuns(character)
    for _, gun in ipairs(guns) do
        for _, gunin in ipairs(gun:GetChildren()) do
            if gunin:FindFirstChild("SpreadAngle") then
                gunin.SpreadAngle.Value = value
            end
        end
    end
end)

ChestSe:Slider({
    Title = "Custom Reload Duration",
    Description = "Reload Duration",
    Default = 1,
    Min = 1,
    Max = 50
}, function(value)
    local guns = getGuns(character)
    for _, gun in ipairs(guns) do
        for _, gunin in ipairs(gun:GetChildren()) do
            if gunin:FindFirstChild("ReloadDuration") then
                gunin.ReloadDuration.Value = value
            end
        end
    end
end)

ChestSe:Slider({
    Title = "Custom Fire Delay",
    Description = "Fire Delay",
    Default = 1,
    Min = 0,
    Max = 10
}, function(value)
    local guns = getGuns(character)
    for _, gun in ipairs(guns) do
        for _, gunin in ipairs(gun:GetChildren()) do
            if gunin:FindFirstChild("FireDelay") then
                gunin.FireDelay.Value = value
            end
        end
    end
end)

ChestSe:Slider({
    Title = "Cust. Magazine",
    Description = "Magazine Size (Fake)",
    Default = 6,
    Min = 1,
    Max = 100
}, function(value)
    local guns = getGuns(character)
    for _, gun in ipairs(guns) do
        for _, gunin in ipairs(gun:GetChildren()) do
            if gunin:FindFirstChild("MagazineSize") then
                gunin.MagazineSize.Value = value
            end
        end
    end
end)
------------------------------------------------------------------------------

PlayerB:Slider({
    Title = "WalkSpeed",
    Description = "Player Speed",
    Default = 16,
    Min = 1,
    Max = 450
    }, function(value)
    if value then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

PlayerB:Slider({
    Title = "JumpPower",
    Description = "Player jump Power",
    Default = 7,
    Min = 1,
    Max = 450
    }, function(value)
    if value then
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = value
    end
end)

PlayerBs:Slider({
    Title = "Fov",
    Description = "Player Camera Fov",
    Default = 70,
    Min = 10,
    Max = 120
    }, function(value)
    if value then
        workspace.Camera.FieldOfView = value
    end
end)

PlayerBs:Slider({
    Title = "Diagonal Fov",
    Description = "Camera Diagonal Fov",
    Default = 120,
    Min = 5,
    Max = 170
    }, function(value)
    if value then
        workspace.Camera.DiagonalFieldOfView = value
    end
end)

PlayerBs:Slider({
    Title = "Axis Fov",
    Description = "Camera Axis Fov",
    Default = 96,
    Min = 5,
    Max = 160
    }, function(value)
    if value then
        workspace.Camera.MaxAxisFieldOfView = value
    end
end)

PlayerBs:Slider({
    Title = "Max Camera Zoom",
    Description = "Max Zoom Distance",
    Default = 128,
    Min = 5,
    Max = 1000
    }, function(value)
    if value then
        game.Players.LocalPlayer.CameraMaxZoomDistance = value
    end
end)

PlayerBs:Slider({
    Title = "Min Camera Zoom",
    Description = "Min Zoom Distance",
    Default = 0,
    Min = 0,
    Max = 1000
    }, function(value)
    if value then
        game.Players.LocalPlayer.CameraMinZoomDistance = value
    end
end)

PlayerBs:Checkbox({
    Title = "ThirdPerson",
    Description = "ThirdPerson on Camera",
    Default = false
}, function(third)
    if third then
        game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
    else
        game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    end
end)

---------------------------------------------------------------------------------------------------------

WS:Checkbox({
    Title = "Enable World Color",
    Description = "Enabled World Color",
    Default = false
}, function(third)
    _G.WC = third
    if _G.WC then
        game:GetService("Lighting").ColorCorrection.Enabled = true
    else
        game:GetService("Lighting").ColorCorrection.Enabled = false
    end
end)

WS:ColorPicker({
    Title = "World Color",
    Description = "Change World Color",
    Default = Color3.new(255,255,255),
    }, function(value)
    if value and _G.WC then
    local r = math.floor(value.R * 255)
    local g = math.floor(value.G * 255)
    local b = math.floor(value.B * 255)
    game:GetService("Lighting").ColorCorrection.TintColor = Color3.fromRGB(r, g, b)
    end
end)

WS:Checkbox({
    Title = "Enable Fog Color",
    Description = "Enabled Fog Color",
    Default = false
}, function(third)
    _G.FG = third
    if _G.FG then
        game:GetService("Lighting").Atmosphere.Haze = 1
    else
        game:GetService("Lighting").Atmosphere.Haze = 0
    end
end)

WS:ColorPicker({
    Title = "Fog Color",
    Description = "Change Fog Color",
    Default = Color3.new(170,170,170),
    }, function(value)
    if value and _G.FG then
    local r = math.floor(value.R * 255)
    local g = math.floor(value.G * 255)
    local b = math.floor(value.B * 255)
    game:GetService("Lighting").Atmosphere.Color = Color3.fromRGB(r, g, b)
    game:GetService("Lighting").Atmosphere.Decay = Color3.fromRGB(r, g, b)
    end
end)

WS:Checkbox({
    Title = "Enable Lighting Color",
    Description = "Enabled Lighting Color",
    Default = false
}, function(third)
    _G.FG = third
    if _G.L then
        game:GetService("Lighting").Brightness = 1.5
    else
        game:GetService("Lighting").Brightness = 0
    end
end)

WS:ColorPicker({
    Title = "Lighting Color",
    Description = "Change Lighting Color",
    Default = Color3.new(255,255,255),
    }, function(value)
    if value and _G.L then
    local r = math.floor(value.R * 255)
    local g = math.floor(value.G * 255)
    local b = math.floor(value.B * 255)
    game:GetService("Lighting").Ambient = Color3.fromRGB(r, g, b)
    end
end)

--------------------------------------------------------------------------------

Grabb:Button({
    Title = "Grab All Item",
    ButtonName = "Grabbing all items",
    Description = "Grabbing all items"
}, function()
    local player = game:GetService("Players").LocalPlayer
    local backpack = player.Backpack
    local character = player.Character
    local sack = backpack:FindFirstChild("Sack")

    if sack then
        sack.Parent = character
        task.wait(0.6)
    end

    for _, item in ipairs(workspace.RuntimeItems:GetChildren()) do
        game:GetService("ReplicatedStorage").Remotes.StoreItem:FireServer(item)
    end
end)

