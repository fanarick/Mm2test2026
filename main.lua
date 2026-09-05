local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local remote = ReplicatedStorage:WaitForChild("CheckFriendPresence")

local gui = Instance.new("ScreenGui")
gui.Name = "WinterFriendChecker"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- =========================
-- MAIN
-- =========================

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(430, 330)
main.Position = UDim2.new(0.5, -215, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(10, 20, 38)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(110, 190, 255)
stroke.Thickness = 2
stroke.Transparency = 0.2
stroke.Parent = main

-- =========================
-- SNOW
-- =========================

local snowFrame = Instance.new("Frame")
snowFrame.Size = UDim2.fromScale(1, 1)
snowFrame.BackgroundTransparency = 1
snowFrame.ClipsDescendants = true
snowFrame.Parent = main

for i = 1, 35 do
	local snow = Instance.new("TextLabel")

	snow.Text = "❄"
	snow.TextColor3 = Color3.fromRGB(220, 245, 255)
	snow.TextTransparency = math.random(0, 4) / 10
	snow.TextSize = math.random(10, 22)
	snow.BackgroundTransparency = 1
	snow.Size = UDim2.fromOffset(25, 25)

	snow.Position = UDim2.new(
		math.random(),
		0,
		-0.1,
		0
	)

	snow.Parent = snowFrame

	local time = math.random(5, 10)

	TweenService:Create(
		snow,
		TweenInfo.new(
			time,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.InOut,
			-1
		),
		{
			Position = UDim2.new(
				snow.Position.X.Scale + math.random(-10, 10) / 100,
				0,
				1.1,
				0
			),
			Rotation = 360
		}
	):Play()
end

-- =========================
-- TITLE
-- =========================

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -120, 0, 45)
title.Position = UDim2.fromOffset(20, 10)
title.BackgroundTransparency = 1
title.Text = "❄ WINTER CHECKER"
title.TextColor3 = Color3.fromRGB(235, 248, 255)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- =========================
-- CLOSE
-- =========================

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(40, 40)
close.Position = UDim2.new(1, -52, 0, 10)
close.Text = "×"
close.TextSize = 28
close.Font = Enum.Font.GothamBold
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundColor3 = Color3.fromRGB(190, 55, 70)
close.Parent = main

Instance.new("UICorner", close).CornerRadius = UDim.new(0, 10)

close.MouseButton1Click:Connect(function()

	local tween = TweenService:Create(
		main,
		TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
		{
			Size = UDim2.fromOffset(0, 0)
		}
	)

	tween:Play()
	tween.Completed:Wait()

	gui:Destroy()
end)

-- =========================
-- MINIMIZE
-- =========================

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(40, 40)
minimize.Position = UDim2.new(1, -100, 0, 10)
minimize.Text = "−"
minimize.TextSize = 25
minimize.Font = Enum.Font.GothamBold
minimize.TextColor3 = Color3.new(1,1,1)
minimize.BackgroundColor3 = Color3.fromRGB(45, 90, 135)
minimize.Parent = main

Instance.new("UICorner", minimize).CornerRadius = UDim.new(0, 10)

local minimized = false
local fullSize = UDim2.fromOffset(430, 330)

minimize.MouseButton1Click:Connect(function()

	minimized = not minimized

	if minimized then

		TweenService:Create(
			main,
			TweenInfo.new(0.3),
			{
				Size = UDim2.fromOffset(430, 65)
			}
		):Play()

	else

		TweenService:Create(
			main,
			TweenInfo.new(0.3),
			{
				Size = fullSize
			}
		):Play()

	end
end)

-- =========================
-- STATUS
-- =========================

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 35)
status.Position = UDim2.fromOffset(20, 65)
status.BackgroundTransparency = 1
status.Text = "🔎 Введи ник друга"
status.TextColor3 = Color3.fromRGB(210, 225, 240)
status.TextSize = 19
status.Font = Enum.Font.GothamBold
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = main

-- =========================
-- GAME
-- =========================

local gameLabel = Instance.new("TextLabel")
gameLabel.Size = UDim2.new(1, -40, 0, 30)
gameLabel.Position = UDim2.fromOffset(20, 100)
gameLabel.BackgroundTransparency = 1
gameLabel.Text = "🎮 Игра: —"
gameLabel.TextColor3 = Color3.fromRGB(185, 205, 225)
gameLabel.TextSize = 15
gameLabel.Font = Enum.Font.Gotham
gameLabel.TextXAlignment = Enum.TextXAlignment.Left
gameLabel.Parent = main

-- =========================
-- USERNAME
-- =========================

local nameBox = Instance.new("TextBox")
nameBox.Size = UDim2.new(1, -145, 0, 42)
nameBox.Position = UDim2.fromOffset(20, 140)
nameBox.BackgroundColor3 = Color3.fromRGB(22, 38, 60)
nameBox.TextColor3 = Color3.fromRGB(240, 248, 255)
nameBox.PlaceholderColor3 = Color3.fromRGB(130, 150, 175)
nameBox.PlaceholderText = "Ник игрока..."
nameBox.Text = ""
nameBox.TextSize = 15
nameBox.Font = Enum.Font.Gotham
nameBox.ClearTextOnFocus = false
nameBox.Parent = main

Instance.new("UICorner", nameBox).CornerRadius = UDim.new(0, 10)

local check = Instance.new("TextButton")
check.Size = UDim2.fromOffset(105, 42)
check.Position = UDim2.new(1, -125, 0, 140)
check.Text = "🔎 Проверить"
check.TextSize = 13
check.Font = Enum.Font.GothamBold
check.TextColor3 = Color3.new(1,1,1)
check.BackgroundColor3 = Color3.fromRGB(45, 130, 195)
check.Parent = main

Instance.new("UICorner", check).CornerRadius = UDim.new(0, 10)

-- =========================
-- CHECK
-- =========================

local checking = false

check.MouseButton1Click:Connect(function()

	if checking then
		return
	end

	local username = nameBox.Text

	if username == "" then
		status.Text = "❗ Введи ник"
		status.TextColor3 = Color3.fromRGB(255, 200, 80)
		return
	end

	checking = true
	check.Text = "⏳ Жду..."

	status.Text = "🔎 Проверяю..."
	status.TextColor3 = Color3.fromRGB(220, 230, 245)

	gameLabel.Text = "🎮 Игра: —"

	local ok, result = pcall(function()
		return remote:InvokeServer(username)
	end)

	if not ok then

		status.Text = "❌ Ошибка"
		status.TextColor3 = Color3.fromRGB(255, 90, 100)

	elseif not result.success then

		status.Text = "❌ " .. result.message
		status.TextColor3 = Color3.fromRGB(255, 100, 110)

	else

		status.Text = result.text

		if result.status == "offline" then

			status.TextColor3 = Color3.fromRGB(255, 100, 110)
			gameLabel.Text = "🎮 Игра: —"

		elseif result.status == "ingame" then

			status.TextColor3 = Color3.fromRGB(100, 255, 160)
			gameLabel.Text = "🎮 Играет: " .. result.gameName

		else

			status.TextColor3 = Color3.fromRGB(100, 255, 160)
			gameLabel.Text = "🎮 " .. result.gameName

		end
	end

	checking = false
	check.Text = "🔎 Проверить"
end)

-- =========================
-- MUSIC
-- =========================

local musicBox = Instance.new("TextBox")
musicBox.Size = UDim2.new(1, -145, 0, 42)
musicBox.Position = UDim2.fromOffset(20, 195)
musicBox.BackgroundColor3 = Color3.fromRGB(22, 38, 60)
musicBox.TextColor3 = Color3.fromRGB(240, 248, 255)
musicBox.PlaceholderColor3 = Color3.fromRGB(130, 150, 175)
musicBox.PlaceholderText = "Sound ID..."
musicBox.Text = ""
musicBox.TextSize = 15
musicBox.Font = Enum.Font.Gotham
musicBox.ClearTextOnFocus = false
musicBox.Parent = main

Instance.new("UICorner", musicBox).CornerRadius = UDim.new(0, 10)

local musicButton = Instance.new("TextButton")
musicButton.Size = UDim2.fromOffset(105, 42)
musicButton.Position = UDim2.new(1, -125, 0, 195)
musicButton.Text = "▶ Музыка"
musicButton.TextSize = 13
musicButton.Font = Enum.Font.GothamBold
musicButton.TextColor3 = Color3.new(1,1,1)
musicButton.BackgroundColor3 = Color3.fromRGB(45, 130, 195)
musicButton.Parent = main

Instance.new("UICorner", musicButton).CornerRadius = UDim.new(0, 10)

local music = Instance.new("Sound")
music.Name = "WinterMusic"
music.Volume = 0.5
music.Looped = true
music.Parent = SoundService

local musicPlaying = false

musicButton.MouseButton1Click:Connect(function()

	if musicPlaying then

		music:Stop()
		musicPlaying = false

		musicButton.Text = "▶ Музыка"
		musicButton.BackgroundColor3 = Color3.fromRGB(45, 130, 195)

		return
	end

	local id = musicBox.Text:match("%d+")

	if not id then

		musicButton.Text = "❗ ID"

		task.delay(1, function()
			if not musicPlaying then
				musicButton.Text = "▶ Музыка"
			end
		end)

		return
	end

	music:Stop()
	music.SoundId = "rbxassetid://" .. id
	music:Play()

	musicPlaying = true

	musicButton.Text = "⏹ Стоп"
	musicButton.BackgroundColor3 = Color3.fromRGB(190, 60, 70)
end)

-- =========================
-- DRAG
-- =========================

local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPosition = main.Position

	end
end)

UserInputService.InputChanged:Connect(function(input)

	if not dragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = false
	end
end)

-- =========================
-- OPEN ANIMATION
-- =========================

main.Size = UDim2.fromOffset(0, 0)

TweenService:Create(
	main,
	TweenInfo.new(
		0.55,
		Enum.EasingStyle.Back,
		Enum.EasingDirection.Out
	),
	{
		Size = fullSize
	}
):Play()
