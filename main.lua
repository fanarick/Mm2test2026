-- Очистка прошлых версий
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "DeltaPremiumMenuMM2" or v.Name == "DeltaMenu" then
        v:Destroy()
    end
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Флаги функций
local AimEnabled = false
local EspEnabled = false
local MurdererOnly = true
local AutoPickup = false
local MaxFOV = 150
local AimKey = Enum.UserInputType.MouseButton2
local LastPickupTime = 0
local IsMinimized = false

-- СОЗДАНИЕ КРУГА FOV (Используем встроенное Drawing API инжектора)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1.5
FOVCircle.NumSides = 60
FOVCircle.Radius = MaxFOV
FOVCircle.Filled = false
FOVCircle.Color = Color3.fromRGB(255, 85, 85) -- Красный цвет круга
FOVCircle.Visible = false -- По умолчанию скрыт, пока аим выключен

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaPremiumMenuMM2"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 260, 0, 410)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(60, 60, 75)
UIStroke.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Title.Text = "  ⚡ DELTA MM2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 14)
TitleCorner.Parent = Title

-- Кнопка МИНУСИК [-]
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -40, 0, 7)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 18
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Parent = MainFrame

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -45)
ContentFrame.Position = UDim2.new(0, 0, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local function createButton(text, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 38)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    btn.TextSize = 13
    btn.Font = Enum.Font.Helvetica
    btn.Parent = ContentFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1
    btnStroke.Color = Color3.fromRGB(65, 65, 80)
    btnStroke.Parent = btn

    btn.Activated:Connect(function()
        callback(btn, btnStroke)
    end)
    return btn
end

-- Свернуть / Развернуть меню
MinimizeBtn.Activated:Connect(function()
    IsMinimized = not IsMinimized
    if IsMinimized then
        ContentFrame.Visible = false
        MainFrame.Size = UDim2.new(0, 260, 0, 45)
        MinimizeBtn.Text = "+"
    else
        ContentFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 260, 0, 410)
        MinimizeBtn.Text = "-"
    end
end)

-- Создание функций меню
local AimBtn = createButton("АИМБОТ: ВЫКЛ", UDim2.new(0.075, 0, 0.05, 0), function(btn)
    AimEnabled = not AimEnabled
    btn.BackgroundColor3 = AimEnabled and Color3.fromRGB(46, 139, 87) or Color3.fromRGB(40, 40, 50)
    btn.Text = AimEnabled and "AIMBOT: ВКЛ" or "АИМБОТ: ВЫКЛ"
    FOVCircle.Visible = AimEnabled -- Показываем круг, только если включен Аим
end)

local EspBtn = createButton("ESP (ВХ): ВЫКЛ", UDim2.new(0.075, 0, 0.18, 0), function(btn)
    EspEnabled = not EspEnabled
    btn.BackgroundColor3 = EspEnabled and Color3.fromRGB(46, 139, 87) or Color3.fromRGB(40, 40, 50)
    btn.Text = EspEnabled and "ESP (ВХ): ВКЛ" or "ESP (ВХ): ВЫКЛ"
end)

local GunPickupBtn = createButton("АВТОПОДБОР ПЕСТА: ВЫКЛ", UDim2.new(0.075, 0, 0.31, 0), function(btn)
    AutoPickup = not AutoPickup
    btn.BackgroundColor3 = AutoPickup and Color3.fromRGB(180, 100, 30) or Color3.fromRGB(40, 40, 50)
    btn.Text = AutoPickup and "АВТОПОДБОР ПЕСТА: ВКЛ" or "АВТОПОДБОР ПЕСТА: ВЫКЛ"
end)

local TargetBtn = createButton("ЦЕЛЬ: ТОЛЬКО МАРДЕР", UDim2.new(0.075, 0, 0.44, 0), function(btn)
    MurdererOnly = not MurdererOnly
    btn.Text = MurdererOnly and "ЦЕЛЬ: ТОЛЬКО МАРДЕР" or "ЦЕЛЬ: ВСЕ ИГРОКИ"
    -- Меняем цвет круга, чтобы визуально понимать режим: красный — только мардер, синий — все
    FOVCircle.Color = MurdererOnly and Color3.fromRGB(255, 85, 85) or Color3.fromRGB(85, 170, 255)
end)

local FovBtn = createButton("РАДИУС FOV: 150", UDim2.new(0.075, 0, 0.57, 0), function(btn)
    if MaxFOV == 150 then MaxFOV = 250
    elseif MaxFOV == 250 then MaxFOV = 400
    else MaxFOV = 150 end
    btn.Text = "РАДИУС FOV: " .. tostring(MaxFOV)
    FOVCircle.Radius = MaxFOV -- Мгновенно обновляем размер круга на экране
end)

local KeyBtn = createButton("КНОПКА АИМА: ПКМ", UDim2.new(0.075, 0, 0.70, 0), function(btn)
    if AimKey == Enum.UserInputType.MouseButton2 then
        AimKey = Enum.KeyCode.E
        btn.Text = "КНОПКА АИМА: ЗАЖАТЬ [E]"
    else
        AimKey = Enum.UserInputType.MouseButton2
        btn.Text = "КНОПКА АИМА: ПКМ"
    end
end)

local CloseBtn = createButton("ЗАКРЫТЬ ЧИТ", UDim2.new(0.075, 0, 0.85, 0), function()
    FOVCircle:Remove() -- Полностью удаляем круг перед выходом
    ScreenGui:Destroy()
end)
CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)

-- ЛОГИКА ОПРЕДЕЛЕНИЯ РОЛЕЙ
local function isMurderer(player)
    if not player or not player.Character then return false end
    if player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife") then return true end
    if player.Character:FindFirstChild("Knife") then return true end
    return false
end

local function getTarget()
    local closestPlayer = nil
    local shortestDistance = math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if MurdererOnly and not isMurderer(player) then continue end
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if distance < shortestDistance and distance < MaxFOV then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end
    return closestPlayer
end

local function findDroppedGun()
    local gun = workspace:FindFirstChild("GunDrop") or workspace:FindFirstChild("Gun") or workspace:FindFirstChild("Luger")
    if not gun then
        for _, obj in pairs(workspace:GetChildren()) do
            if (obj.Name:match("Gun") or obj.Name:match("Drop")) and obj:IsA("Model") then
                gun = obj
                break
            end
        end
    end
    if gun then
        return gun:FindFirstChildWhichIsA("BasePart") or gun
    end
    return nil
end

-- ЕЖЕКАДРОВЫЙ ЦИКЛ ОБНОВЛЕНИЯ
RunService.RenderStepped:Connect(function()
    -- Обновление позиции круга FOV (всегда по центру экрана или мышки)
    if FOVCircle.Visible then
        FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    end

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    -- Логика телепорта к пистолету
    if AutoPickup and tick() - LastPickupTime > 1.0 then
        local gunPart = findDroppedGun()
        if gunPart then
            LastPickupTime = tick()
            local oldCFrame = root.CFrame
            root.CFrame = gunPart.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.02)
            root.CFrame = oldCFrame
        end
    end

    -- Логика Аимбота
    local isPressed = false
    if AimKey.UserType == Enum.UserInputType then
        isPressed = UserInputService:IsMouseButtonPressed(AimKey)
    else
        isPressed = UserInputService:IsKeyDown(AimKey)
    end

    if AimEnabled and isPressed then
        local target = getTarget()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end

    -- Логика ESP
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local highlight = player.Character:FindFirstChild("FixedHighlight")
            if EspEnabled then
                if not highlight then
                    highlight = Instance.new("Highlight", player.Character)
                    highlight.Name = "FixedHighlight"
                    highlight.FillTransparency = 0.4
                end
highlight.FillColor = isMurderer(player) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 100)elseif highlight then highlight:Destroy() endendendendend)
