--// PLAYER STATUS 3.0
--// STATUS + GAME + AVATAR + CONNECT
--// MINIMIZE + CLOSE

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")

local LP = Players.LocalPlayer

--------------------------------------------------
-- REQUEST
--------------------------------------------------

local requestFunc =
    request
    or http_request
    or (syn and syn.request)
    or (http and http.request)

if not requestFunc then
    warn("HTTP request не найден в Delta.")
    return
end

--------------------------------------------------
-- HTTP
--------------------------------------------------

local function HTTP(method, url, body)

    local options = {
        Url = url,
        Method = method,
        Headers = {
            ["Content-Type"] = "application/json"
        }
    }

    if body then
        options.Body = HttpService:JSONEncode(body)
    end

    local success, response = pcall(function()
        return requestFunc(options)
    end)

    if not success or not response then
        return nil
    end

    local responseBody = response.Body
    if not responseBody then
        return nil
    end

    local ok, data = pcall(function()
        return HttpService:JSONDecode(responseBody)
    end)

    if ok then
        return data
    end

    return nil
end

--------------------------------------------------
-- GUI
--------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "RocketStatus"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    gui.Parent = CoreGui
end)

if not gui.Parent then
    gui.Parent = LP:WaitForChild("PlayerGui")
end

--------------------------------------------------
-- MAIN
--------------------------------------------------

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(430, 500)
main.Position = UDim2.new(0.5, -215, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(17,18,23)
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0,14)
mainCorner.Parent = main

--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -120, 0, 45)
title.Position = UDim2.fromOffset(15, 5)
title.BackgroundTransparency = 1
title.Text = "PLAYER STATUS"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

--------------------------------------------------
-- MINUS
--------------------------------------------------

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(40,40)
minimize.Position = UDim2.new(1,-90,0,7)
minimize.BackgroundColor3 = Color3.fromRGB(40,41,48)
minimize.Text = "—"
minimize.TextColor3 = Color3.new(1,1,1)
minimize.TextSize = 22
minimize.Font = Enum.Font.GothamBold
minimize.Parent = main

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0,9)
minCorner.Parent = minimize

--------------------------------------------------
-- CLOSE
--------------------------------------------------

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(40,40)
close.Position = UDim2.new(1,-45,0,7)
close.BackgroundColor3 = Color3.fromRGB(190,55,65)
close.Text = "✕"
close.TextColor3 = Color3.new(1,1,1)
close.TextSize = 17
close.Font = Enum.Font.GothamBold
close.Parent = main

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0,9)
closeCorner.Parent = close

--------------------------------------------------
-- CONTENT
--------------------------------------------------

local content = Instance.new("Frame")
content.Size = UDim2.new(1,0,1,-55)
content.Position = UDim2.fromOffset(0,55)
content.BackgroundTransparency = 1
content.Parent = main

--------------------------------------------------
-- INPUT
--------------------------------------------------

local box = Instance.new("TextBox")
box.Size = UDim2.new(1,-30,0,43)
box.Position = UDim2.fromOffset(15,10)
box.BackgroundColor3 = Color3.fromRGB(30,31,38)
box.PlaceholderText = "Введите ник..."
box.PlaceholderColor3 = Color3.fromRGB(130,130,140)
box.TextColor3 = Color3.new(1,1,1)
box.Text = ""
box.TextSize = 16
box.Font = Enum.Font.Gotham
box.ClearTextOnFocus = false
box.Parent = content

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0,9)
boxCorner.Parent = box

--------------------------------------------------
-- CHECK
--------------------------------------------------

local check = Instance.new("TextButton")
check.Size = UDim2.new(1,-30,0,42)
check.Position = UDim2.fromOffset(15,63)
check.BackgroundColor3 = Color3.fromRGB(40,115,245)
check.Text = "ПРОВЕРИТЬ"
check.TextColor3 = Color3.new(1,1,1)
check.TextSize = 16
check.Font = Enum.Font.GothamBold
check.Parent = content

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0,9)
checkCorner.Parent = check

--------------------------------------------------
-- RESULT
--------------------------------------------------

local result = Instance.new("Frame")
result.Size = UDim2.new(1,-30,0,280)
result.Position = UDim2.fromOffset(15,115)
result.BackgroundColor3 = Color3.fromRGB(24,25,31)
result.BorderSizePixel = 0
result.Parent = content

local resultCorner = Instance.new("UICorner")
resultCorner.CornerRadius = UDim.new(0,12)
resultCorner.Parent = result

--------------------------------------------------
-- AVATAR
--------------------------------------------------

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.fromOffset(78,78)
avatar.Position = UDim2.fromOffset(15,15)
avatar.BackgroundColor3 = Color3.fromRGB(35,36,43)
avatar.BorderSizePixel = 0
avatar.Parent = result

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1,0)
avatarCorner.Parent = avatar

--------------------------------------------------
-- NAME
--------------------------------------------------

local playerName = Instance.new("TextLabel")
playerName.Size = UDim2.new(1,-115,0,32)
playerName.Position = UDim2.fromOffset(110,15)
playerName.BackgroundTransparency = 1
playerName.Text = "Игрок"
playerName.TextColor3 = Color3.new(1,1,1)
playerName.TextSize = 21
playerName.Font = Enum.Font.GothamBold
playerName.TextXAlignment = Enum.TextXAlignment.Left
playerName.Parent = result

--------------------------------------------------
-- STATUS
--------------------------------------------------

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,-115,0,30)
status.Position = UDim2.fromOffset(110,48)
status.BackgroundTransparency = 1
status.Text = "Статус: —"
status.TextColor3 = Color3.fromRGB(160,160,170)
status.TextSize = 15
status.Font = Enum.Font.Gotham
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = result

--------------------------------------------------
-- GAME
--------------------------------------------------

local gameText = Instance.new("TextLabel")
gameText.Size = UDim2.new(1,-30,0,60)
gameText.Position = UDim2.fromOffset(15,105)
gameText.BackgroundTransparency = 1
gameText.Text = "🎮 Игра: —"
gameText.TextColor3 = Color3.fromRGB(225,225,230)
gameText.TextSize = 15
gameText.Font = Enum.Font.Gotham
gameText.TextWrapped = true
gameText.TextXAlignment = Enum.TextXAlignment.Left
gameText.Parent = result

--------------------------------------------------
-- SERVER
--------------------------------------------------

local serverText = Instance.new("TextLabel")
serverText.Size = UDim2.new(1,-30,0,25)
serverText.Position = UDim2.fromOffset(15,160)
serverText.BackgroundTransparency = 1
serverText.Text = "Сервер: —"
serverText.TextColor3 = Color3.fromRGB(150,150,160)
serverText.TextSize = 14
serverText.Font = Enum.Font.Gotham
serverText.TextXAlignment = Enum.TextXAlignment.Left
serverText.Parent = result

--------------------------------------------------
-- CONNECT
--------------------------------------------------

local connect = Instance.new("TextButton")
connect.Size = UDim2.new(1,-30,0,45)
connect.Position = UDim2.fromOffset(15,210)
connect.BackgroundColor3 = Color3.fromRGB(55,55,62)
connect.Text = "ПОДКЛЮЧИТЬСЯ"
connect.TextColor3 = Color3.new(1,1,1)
connect.TextSize = 16
connect.Font = Enum.Font.GothamBold
connect.Parent = result

local connectCorner = Instance.new("UICorner")
connectCorner.CornerRadius = UDim.new(0,9)
connectCorner.Parent = connect

--------------------------------------------------
-- DATA
--------------------------------------------------

local currentPlaceId = nil
local currentJobId = nil
local minimized = false

--------------------------------------------------
-- AVATAR
--------------------------------------------------

local function getAvatar(userId)

    local url =
        "https://thumbnails.roblox.com/v1/users/avatar-headshot" ..
        "?userIds=" .. tostring(userId) ..
        "&size=150x150&format=Png&isCircular=true"

    local data = HTTP("GET",url)

    if data and data.data and data.data[1] then
        avatar.Image = data.data[1].imageUrl
    end
end

--------------------------------------------------
-- USER
--------------------------------------------------

local function findUser(username)

    local data = HTTP(
        "POST",
        "https://users.roblox.com/v1/usernames/users",
        {
            usernames = {username},
            excludeBannedUsers = false
        }
    )

    if data and data.data and data.data[1] then
        return data.data[1]
    end

    return nil
end

--------------------------------------------------
-- PRESENCE
--------------------------------------------------

local function checkPlayer(username)

    currentPlaceId = nil
    currentJobId = nil

    playerName.Text = username
    status.Text = "Проверяю..."
    status.TextColor3 = Color3.fromRGB(220,220,220)

    gameText.Text = "🎮 Игра: —"
    serverText.Text = "Сервер: —"

    connect.Text = "ПОДКЛЮЧИТЬСЯ"
    connect.BackgroundColor3 = Color3.fromRGB(55,55,62)

    local user = findUser(username)

    if not user then
        status.Text = "🔴 Игрок не найден"
        status.TextColor3 = Color3.fromRGB(255,80,80)
        avatar.Image = ""
        return
    end

    playerName.Text = user.name

    task.spawn(function()
        getAvatar(user.id)
    end)

    local data = HTTP(
        "POST",
        "https://presence.roblox.com/v1/presence/users",
        {
            userIds = {user.id}
        }
    )

    if not data
        or not data.userPresences
        or not data.userPresences[1] then

        status.Text = "❓ Статус недоступен"
        return
    end

    local p = data.userPresences[1]

    --------------------------------------------------
    -- OFFLINE
    --------------------------------------------------

    if p.userPresenceType == 0 then

        status.Text = "🔴 НЕ В СЕТИ"
        status.TextColor3 = Color3.fromRGB(255,80,80)

        gameText.Text = "🎮 Игра: —"
        serverText.Text = "Сервер: —"

    --------------------------------------------------
    -- ONLINE
    --------------------------------------------------

    elseif p.userPresenceType == 1 then

        status.Text = "🟢 В СЕТИ"
        status.TextColor3 = Color3.fromRGB(70,255,110)

        gameText.Text = "🎮 Сейчас не играет"
        serverText.Text = "Сервер: —"

    --------------------------------------------------
    -- IN GAME
    --------------------------------------------------

    elseif p.userPresenceType == 2 then

        status.Text = "🟢 ИГРАЕТ"
        status.TextColor3 = Color3.fromRGB(70,255,110)

        currentPlaceId = p.placeId
        currentJobId = p.gameId

        local location = p.lastLocation or "Неизвестная игра"

        -- Получаем название игры
        if currentPlaceId then

            local gameData = HTTP(
                "GET",
                "https://games.roblox.com/v1/games/multiget-place-details?placeIds="
                .. tostring(currentPlaceId)
            )

            if gameData and gameData[1] then
                location =
                    gameData[1].name
                    or gameData[1].universeName
                    or location
            end
        end

        gameText.Text = "🎮 Игра: " .. tostring(location)

        --------------------------------------------------
        -- SERVER ID
        --------------------------------------------------

        if currentJobId and currentJobId ~= "" then

            serverText.Text =
                "Сервер: найден ✓"

            connect.Text = "🚀 ПОДКЛЮЧИТЬСЯ"
            connect.BackgroundColor3 =
                Color3.fromRGB(35,175,80)

        else

            serverText.Text =
                "Сервер: Roblox не предоставил ID"

            connect.Text =
                "СЕРВЕР НЕДОСТУПЕН"

            connect.BackgroundColor3 =
                Color3.fromRGB(60,60,68)
        end

    --------------------------------------------------
    -- STUDIO
    --------------------------------------------------

    elseif p.userPresenceType == 3 then

        status.Text = "🟡 ROBLOX STUDIO"
        status.TextColor3 = Color3.fromRGB(255,210,60)

        gameText.Text = "🎮 Roblox Studio"
        serverText.Text = "Сервер: —"

    end
end

--------------------------------------------------
-- CONNECT
--------------------------------------------------

connect.MouseButton1Click:Connect(function()

    if not currentPlaceId or not currentJobId then
        return
    end

    connect.Text = "🚀 ПОДКЛЮЧЕНИЕ..."

    local success, errorMessage = pcall(function()

        TeleportService:TeleportToPlaceInstance(
            tonumber(currentPlaceId),
            tostring(currentJobId),
            LP
        )

    end)

    if not success then

        warn("Teleport error:",errorMessage)

        connect.Text = "ОШИБКА"

        task.wait(2)

        if currentPlaceId and currentJobId then
            connect.Text = "🚀 ПОДКЛЮЧИТЬСЯ"
        end
    end
end)

--------------------------------------------------
-- CHECK
--------------------------------------------------

check.MouseButton1Click:Connect(function()

    local username = box.Text
        :gsub("^%s+","")
        :gsub("%s+$","")

    if username == "" then
        status.Text = "Введите ник"
        status.TextColor3 = Color3.fromRGB(255,190,60)
        return
    end

    task.spawn(function()
        checkPlayer(username)
    end)
end)

--------------------------------------------------
-- ENTER
--------------------------------------------------

box.FocusLost:Connect(function(enter)

    if enter then
        check:Activate()
    end

end)

--------------------------------------------------
-- MINIMIZE
--------------------------------------------------

minimize.MouseButton1Click:Connect(function()

    minimized = not minimized

    content.Visible = not minimized

    if minimized then
        main.Size = UDim2.fromOffset(430,55)
        minimize.Text = "+"
    else
        main.Size = UDim2.fromOffset(430,500)
        minimize.Text = "—"
    end
end)

--------------------------------------------------
-- CLOSE
--------------------------------------------------

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

--------------------------------------------------
-- AUTO UPDATE
--------------------------------------------------

task.spawn(function()

    while gui.Parent do

        task.wait(5)

        if not minimized then

            local username = box.Text
                :gsub("^%s+","")
                :gsub("%s+$","")

            if username ~= "" then
                checkPlayer(username)
            end
        end
    end
end)
