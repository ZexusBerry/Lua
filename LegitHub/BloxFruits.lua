local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZexusBerry/HydraHubRecodeV2.5/refs/heads/main/SourceV2.5.lua'))()
local Window = UILib.new("Blox Fruit", game.Players.LocalPlayer.Name, "" .. identifyexecutor() .. " | LegitHub")
local Chest = Window:Category("Chest", "http://www.roblox.com/asset/?id=91791770440155")
local Chests = Chest:Button("Farm", "http://www.roblox.com/asset/?id=134570041444509")
local ChestSel = Chests:Section("Auto Farm Chest", "Left")
local ChestType = Chests:Section("Setting", "Right")

_G.FTG = false
local SP = 4

ChestSel:Toggle({
    Title = "Auto Farm",
    Description = "Auto Farm Chest (Beta)",
    Default = false
}, function(value)
    _G.FTG = value
    if value then
        startFarming()
    end
end)

ChestSel:Checkbox({
    Title = "Tween Farm",
	Description = "Tween Farm",
	Default = false
}, function(Tween)
    TWS = Tween
end)

ChestSel:Slider({
    Title = "Farm Speed",
    Description = "Speedy",
    Default = 4,
    Min = 3,
    Max = 15
}, function(value)
    SP = value
end)

ChestSel:Checkbox({
    Title = "Anti-kick",
	Description = "Dont Kick and Ban you",
	Default = false
}, function(TypeChest)
    TPD = TypeChest
	if TPD then
		print("GKVIIWR4I82I0SVJSAEIOQ3R4M20RJE0FAJE0Q3I4802JFI0ADF UNI key")
	end
end)


ChestType:Checkbox({
    Title = "Diamond Chest",
	Description = "Type to farm Chest",
	Default = true
}, function(TypeChest)
    TPD = TypeChest
end)

ChestType:Checkbox({
    Title = "Golden Chest",
	Description = "Type to farm Chest",
	Default = true
}, function(TypeChest)
    TPG = TypeChest
end)

ChestType:Checkbox({
    Title = "Silver Chest",
	Description = "Type to farm Chest",
	Default = true
}, function(TypeChest)
    TPS = TypeChest
end)

function startFarming()
    spawn(function()
        while _G.FTG do
            for _, ch in ipairs(workspace.ChestModels:GetChildren()) do
                if ch:IsA("Model") then
                    for _, che in ipairs(ch:GetChildren()) do
                        if che.Name == "PushBox" then
                            for i = 1, SP do
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = che.CFrame
                                task.wait(0.05)
                            end
                        end
                    end
                end
            end
            task.wait(0.26)
        end
    end)
end
