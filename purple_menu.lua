-- PURPLE MENU | LocalScript
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PurpleMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local purple = Color3.fromRGB(160, 65, 255)
local dark = Color3.fromRGB(25, 15, 40)

local speedValue = 32
local speedEnabled = false
local hitboxEnabled = false
local hitboxSize = Vector3.new(5, 5, 5)
local hitboxParts = {}

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(260, 440)
frame.Position = UDim2.new(0.5, -130, 0.5, -220)
frame.BackgroundColor3 = dark
frame.BorderSizePixel = 0
frame.Active = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = purple
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 42)
title.BackgroundTransparency = 1
title.Text = "💜 PURPLE MENU"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 19

local function button(text, y)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1, -24, 0, 34)
    b.Position = UDim2.fromOffset(12, y)
    b.BackgroundColor3 = Color3.fromRGB(70, 35, 110)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Text = text
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    return b
end

local function inputBox(placeholder, value, y)
    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(1, -24, 0, 32)
    box.Position = UDim2.fromOffset(12, y)
    box.BackgroundColor3 = Color3.fromRGB(45, 30, 65)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.PlaceholderColor3 = Color3.fromRGB(190, 160, 220)
    box.PlaceholderText = placeholder
    box.Text = tostring(value)
    box.Font = Enum.Font.Gotham
    box.TextSize = 14
    box.ClearTextOnFocus = false
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 7)
    return box
end

-- Speed
local speedButton = button("Speed: OFF", 50)
local speedInput = inputBox("Скорость", speedValue, 90)

speedInput.FocusLost:Connect(function()
    local value = tonumber(speedInput.Text)
    if value then
        speedValue = math.clamp(value, 0, 500)
        speedInput.Text = tostring(speedValue)
        if speedEnabled then
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = speedValue end
        end
    else
        speedInput.Text = tostring(speedValue)
    end
end)

speedButton.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedButton.Text = "Speed: " .. (speedEnabled and "ON" or "OFF")
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = speedEnabled and speedValue or 16
    end
end)

-- Hitbox settings
local hitboxButton = button("Hitbox: OFF", 135)
local xInput = inputBox("Размер X", 5, 175)
local yInput = inputBox("Размер Y", 5, 215)
local zInput = inputBox("Размер Z", 5, 255)

local function readHitboxSize()
    local x = tonumber(xInput.Text)
    local y = tonumber(yInput.Text)
    local z = tonumber(zInput.Text)
    if x and y and z then
        hitboxSize = Vector3.new(math.clamp(x,1,30), math.clamp(y,1,30), math.clamp(z,1,30))
        xInput.Text = tostring(hitboxSize.X)
        yInput.Text = tostring(hitboxSize.Y)
        zInput.Text = tostring(hitboxSize.Z)
    end
end

local function clearHitboxes()
    for _, part in pairs(hitboxParts) do
        if part and part.Parent then part:Destroy() end
    end
    table.clear(hitboxParts)
end

local function createHitboxes()
    clearHitboxes()
    for _, target in ipairs(Players:GetPlayers()) do
        if target ~= player and target.Character then
            local root = target.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "EditableHitbox"
                box.Adornee = root
                box.Size = hitboxSize
                box.Color3 = purple
                box.Transparency = 0.55
                box.AlwaysOnTop = true
                box.ZIndex = 5
                box.Parent = gui
                table.insert(hitboxParts, box)
            end
        end
    end
end

hitboxButton.MouseButton1Click:Connect(function()
    hitboxEnabled = not hitboxEnabled
    hitboxButton.Text = "Hitbox: " .. (hitboxEnabled and "ON" or "OFF")
    if hitboxEnabled then
        readHitboxSize()
        createHitboxes()
    else
        clearHitboxes()
    end
end)

for _, box in ipairs({xInput, yInput, zInput}) do
    box.FocusLost:Connect(function()
        readHitboxSize()
        if hitboxEnabled then createHitboxes() end
    end)
end

Players.PlayerAdded:Connect(function()
    if hitboxEnabled then
        task.wait(1)
        createHitboxes()
    end
end)

Players.PlayerRemoving:Connect(function()
    if hitboxEnabled then
        task.wait()
        createHitboxes()
    end
end)

-- Кнопка открытия
local open = Instance.new("TextButton", gui)
open.Size = UDim2.fromOffset(48, 48)
open.Position = UDim2.new(0, 15, 0.5, -24)
open.BackgroundColor3 = purple
open.Text = "💜"
open.TextSize = 24
open.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", open).CornerRadius = UDim.new(1, 0)

open.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- Перетаскивание
local dragging, dragStart, startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Свечение
RunService.RenderStepped:Connect(function()
    stroke.Transparency = 0.15 + math.abs(math.sin(os.clock() * 2)) * 0.5
end)

player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    if speedEnabled then
        hum.WalkSpeed = speedValue
    end
    if hitboxEnabled then
        task.wait(1)
        createHitboxes()
    end
end)
