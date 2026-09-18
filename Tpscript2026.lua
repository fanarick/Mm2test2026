--// ❄️ WINTER V6
--// Key: acou090

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Destroyed = false
local Connections = {}

--// CLEAN OLD FUNCTIONS
pcall(function()
    if getgenv().WinterCleanup then
        getgenv().WinterCleanup()
    end
end)

getgenv().WinterMenuBuilt = false

local function Connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(Connections, connection)
    return connection
end

local function Cleanup()
    if Destroyed then return end
    Destroyed = true

    for _, connection in ipairs(Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end

    Connections = {}

    local character = LocalPlayer.Character

    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local root = character:FindFirstChild("HumanoidRootPart")

        if humanoid then
            humanoid.PlatformStand = false
            humanoid.AutoRotate = true
        end

        if root then
            for _, object in ipairs(root:GetChildren()) do
                if object.Name == "WinterFlyVelocity"
                    or object.Name == "WinterFlyGyro" then
                    pcall(function()
                        object:Destroy()
                    end)
                end
            end
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            for _, object in ipairs(player.Character:GetDescendants()) do
                if object.Name == "WinterESP"
                    or object.Name == "WinterESPHighlight"
                    or object.Name == "WinterESPTracer" then

                    pcall(function()
                        object:Destroy()
                    end)
                end
            end
        end
    end
end

getgenv().WinterCleanup = Cleanup

--// RAYFIELD
local Rayfield = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"
))()

local Window = Rayfield:CreateWindow({
    Name = "❄️ WINTER",
    LoadingTitle = "❄️ WINTER",
    LoadingSubtitle = "acou090",

    ConfigurationSaving = {
        Enabled = false
    },

    Discord = {
        Enabled = false
    },

    KeySystem = true,

    KeySettings = {
        Title = "❄️ WINTER",
        Subtitle = "Password",
        Note = "Enter password",
        FileName = "WinterKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"acou090"}
    }
})

--// LANGUAGES
local Languages = {
    ["🇷🇺 Русский"] = "ru",
    ["🇬🇧 English"] = "en",
    ["🇩🇪 Deutsch"] = "de",
    ["🇫🇷 Français"] = "fr",
    ["🇪🇸 Español"] = "es",
    ["🇮🇹 Italiano"] = "it",
    ["🇵🇱 Polski"] = "pl",
    ["🇺🇦 Українська"] = "uk"
}

local LanguageList = {
    "🇷🇺 Русский",
    "🇬🇧 English",
    "🇩🇪 Deutsch",
    "🇫🇷 Français",
    "🇪🇸 Español",
    "🇮🇹 Italiano",
    "🇵🇱 Polski",
    "🇺🇦 Українська"
}

local T = {

    ru = {
        language = "🌍 Язык",
        languageSection = "Выбор языка",
        languageInfo = "Выберите язык меню",
        continueText = "▶️ Продолжить",

        fly = "✈️ Полёт",
        flyToggle = "Полёт",
        speed = "Скорость",

        teleport = "📍 Телепорт",
        savePoint = "💾 Сохранить точку",
        teleportPoint = "↩️ Телепорт на точку",
        player = "👤 Игрок",
        teleportPlayer = "📍 Телепорт к игроку",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Имена",
        health = "❤️ Здоровье",
        distance = "📏 Дистанция",
        teamColor = "🎨 Цвет команды",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 Скопировать FunPay",
        copied = "Ссылка скопирована",

        credits = "👑 Создатели",
        stats = "📊 Статистика",
        serverPlayers = "Игроков на сервере",
        executor = "Экзекьютор",
        launches = "Запусков",

        noPlayer = "Игрок не выбран",
        noPoint = "Точка не сохранена"
    },

    en = {
        language = "🌍 Language",
        languageSection = "Language Selection",
        languageInfo = "Select menu language",
        continueText = "▶️ Continue",

        fly = "✈️ Fly",
        flyToggle = "Fly",
        speed = "Speed",

        teleport = "📍 Teleport",
        savePoint = "💾 Save Point",
        teleportPoint = "↩️ Teleport To Point",
        player = "👤 Player",
        teleportPlayer = "📍 Teleport To Player",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Names",
        health = "❤️ Health",
        distance = "📏 Distance",
        teamColor = "🎨 Team Color",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 Copy FunPay",
        copied = "Link copied",

        credits = "👑 Credits",
        stats = "📊 Statistics",
        serverPlayers = "Server Players",
        executor = "Executor",
        launches = "Launches",

        noPlayer = "No player selected",
        noPoint = "Point not saved"
    },

    de = {
        language = "🌍 Sprache",
        languageSection = "Sprachauswahl",
        languageInfo = "Menüsprache auswählen",
        continueText = "▶️ Weiter",

        fly = "✈️ Fliegen",
        flyToggle = "Fliegen",
        speed = "Geschwindigkeit",

        teleport = "📍 Teleport",
        savePoint = "💾 Punkt speichern",
        teleportPoint = "↩️ Zum Punkt teleportieren",
        player = "👤 Spieler",
        teleportPlayer = "📍 Zu Spieler teleportieren",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Namen",
        health = "❤️ Gesundheit",
        distance = "📏 Distanz",
        teamColor = "🎨 Teamfarbe",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 FunPay kopieren",
        copied = "Link kopiert",

        credits = "👑 Credits",
        stats = "📊 Statistik",
        serverPlayers = "Spieler auf Server",
        executor = "Executor",
        launches = "Starts",

        noPlayer = "Kein Spieler ausgewählt",
        noPoint = "Punkt nicht gespeichert"
    },

    fr = {
        language = "🌍 Langue",
        languageSection = "Choix de la langue",
        languageInfo = "Sélectionnez la langue",
        continueText = "▶️ Continuer",

        fly = "✈️ Vol",
        flyToggle = "Vol",
        speed = "Vitesse",

        teleport = "📍 Téléportation",
        savePoint = "💾 Sauvegarder le point",
        teleportPoint = "↩️ Téléporter au point",
        player = "👤 Joueur",
        teleportPlayer = "📍 Téléporter au joueur",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Noms",
        health = "❤️ Santé",
        distance = "📏 Distance",
        teamColor = "🎨 Couleur équipe",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 Copier FunPay",
        copied = "Lien copié",

        credits = "👑 Crédits",
        stats = "📊 Statistiques",
        serverPlayers = "Joueurs serveur",
        executor = "Exécuteur",
        launches = "Lancements",

        noPlayer = "Aucun joueur sélectionné",
        noPoint = "Point non sauvegardé"
    },

    es = {
        language = "🌍 Idioma",
        languageSection = "Selección de idioma",
        languageInfo = "Selecciona el idioma",
        continueText = "▶️ Continuar",

        fly = "✈️ Volar",
        flyToggle = "Volar",
        speed = "Velocidad",

        teleport = "📍 Teletransporte",
        savePoint = "💾 Guardar punto",
        teleportPoint = "↩️ Teletransportar al punto",
        player = "👤 Jugador",
        teleportPlayer = "📍 Teletransportar al jugador",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Nombres",
        health = "❤️ Salud",
        distance = "📏 Distancia",
        teamColor = "🎨 Color del equipo",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 Copiar FunPay",
        copied = "Enlace copiado",

        credits = "👑 Créditos",
        stats = "📊 Estadísticas",
        serverPlayers = "Jugadores del servidor",
        executor = "Ejecutor",
        launches = "Lanzamientos",

        noPlayer = "Ningún jugador seleccionado",
        noPoint = "Punto no guardado"
    },

    it = {
        language = "🌍 Lingua",
        languageSection = "Selezione lingua",
        languageInfo = "Seleziona la lingua",
        continueText = "▶️ Continua",

        fly = "✈️ Volo",
        flyToggle = "Volo",
        speed = "Velocità",

        teleport = "📍 Teletrasporto",
        savePoint = "💾 Salva punto",
        teleportPoint = "↩️ Teletrasporta al punto",
        player = "👤 Giocatore",
        teleportPlayer = "📍 Teletrasporta al giocatore",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Nomi",
        health = "❤️ Salute",
        distance = "📏 Distanza",
        teamColor = "🎨 Colore squadra",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 Copia FunPay",
        copied = "Link copiato",

        credits = "👑 Crediti",
        stats = "📊 Statistiche",
        serverPlayers = "Giocatori server",
        executor = "Executor",
        launches = "Avvii",

        noPlayer = "Nessun giocatore selezionato",
        noPoint = "Punto non salvato"
    },

    pl = {
        language = "🌍 Język",
        languageSection = "Wybór języka",
        languageInfo = "Wybierz język menu",
        continueText = "▶️ Dalej",

        fly = "✈️ Latanie",
        flyToggle = "Latanie",
        speed = "Prędkość",

        teleport = "📍 Teleport",
        savePoint = "💾 Zapisz punkt",
        teleportPoint = "↩️ Teleportuj do punktu",
        player = "👤 Gracz",
        teleportPlayer = "📍 Teleportuj do gracza",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Nazwy",
        health = "❤️ Zdrowie",
        distance = "📏 Odległość",
        teamColor = "🎨 Kolor drużyny",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 Kopiuj FunPay",
        copied = "Link skopiowany",

        credits = "👑 Twórcy",
        stats = "📊 Statystyki",
        serverPlayers = "Gracze serwera",
        executor = "Executor",
        launches = "Uruchomienia",

        noPlayer = "Nie wybrano gracza",
        noPoint = "Punkt nie zapisany"
    },

    uk = {
        language = "🌍 Мова",
        languageSection = "Вибір мови",
        languageInfo = "Оберіть мову меню",
        continueText = "▶️ Продовжити",

        fly = "✈️ Політ",
        flyToggle = "Політ",
        speed = "Швидкість",

        teleport = "📍 Телепорт",
        savePoint = "💾 Зберегти точку",
        teleportPoint = "↩️ Телепорт на точку",
        player = "👤 Гравець",
        teleportPlayer = "📍 Телепорт до гравця",

        esp = "👁️ ESP",
        espToggle = "ESP",
        box = "📦 Box ESP",
        tracer = "🦴 Tracers",
        names = "👤 Імена",
        health = "❤️ Здоров'я",
        distance = "📏 Дистанція",
        teamColor = "🎨 Колір команди",
        rgb = "🌈 RGB",

        funpay = "💰 FunPay",
        copyFunpay = "📋 Скопіювати FunPay",
        copied = "Посилання скопійовано",

        credits = "👑 Творці",
        stats = "📊 Статистика",
        serverPlayers = "Гравців на сервері",
        executor = "Екзек'ютор",
        launches = "Запусків",

        noPlayer = "Гравця не вибрано",
        noPoint = "Точку не збережено"
    }
}

--// LANGUAGE TAB
local LanguageTab = Window:CreateTab("🌍 Language", "languages")

local SelectedLanguage = "ru"

LanguageTab:CreateSection("❄️ WINTER")

LanguageTab:CreateParagraph({
    Title = "🌍 Language",
    Content = "Select your language"
})

LanguageTab:CreateDropdown({
    Name = "🌍 Language",
    Options = LanguageList,
    CurrentOption = {"🇷🇺 Русский"},
    MultipleOptions = false,

    Callback = function(option)
        if type(option) == "table" then
            option = option[1]
        end

        SelectedLanguage = Languages[option] or "ru"
    end
})

--// BUILD
local function BuildMenu(lang)

    if getgenv().WinterMenuBuilt then
        return
    end

    if Destroyed then
        return
    end

    getgenv().WinterMenuBuilt = true

    local t = T[lang] or T.ru

    --==================================================
    -- FLY
    --==================================================

    local FlyTab = Window:CreateTab(t.fly, "plane")

    local Flying = false
    local FlySpeed = 50
    local FlyVelocity = nil
    local FlyGyro = nil

    local function StopFly()

        Flying = false

        if FlyVelocity then
            pcall(function()
                FlyVelocity:Destroy()
            end)

            FlyVelocity = nil
        end

        if FlyGyro then
            pcall(function()
                FlyGyro:Destroy()
            end)

            FlyGyro = nil
        end

        local character = LocalPlayer.Character

        if character then
            local humanoid =
                character:FindFirstChildOfClass("Humanoid")

            if humanoid then
                humanoid.PlatformStand = false
                humanoid.AutoRotate = true
            end
        end
    end

    local function StartFly()

        StopFly()

        local character = LocalPlayer.Character

        if not character then
            return
        end

        local root =
            character:FindFirstChild("HumanoidRootPart")

        local humanoid =
            character:FindFirstChildOfClass("Humanoid")

        if not root or not humanoid then
            return
        end

        Flying = true

        humanoid.PlatformStand = true
        humanoid.AutoRotate = false

        FlyVelocity = Instance.new("BodyVelocity")
        FlyVelocity.Name = "WinterFlyVelocity"
        FlyVelocity.MaxForce =
            Vector3.new(math.huge, math.huge, math.huge)
        FlyVelocity.P = 25000
        FlyVelocity.Velocity = Vector3.zero
        FlyVelocity.Parent = root

        FlyGyro = Instance.new("BodyGyro")
        FlyGyro.Name = "WinterFlyGyro"
        FlyGyro.MaxTorque =
            Vector3.new(math.huge, math.huge, math.huge)
        FlyGyro.P = 30000
        FlyGyro.D = 800
        FlyGyro.Parent = root
    end

    FlyTab:CreateToggle({
        Name = "✈️ " .. t.flyToggle,
        CurrentValue = false,

        Callback = function(value)

            if value then
                StartFly()
            else
                StopFly()
            end

        end
    })

    FlyTab:CreateSlider({
        Name = "⚡ " .. t.speed,
        Range = {10, 100},
        Increment = 1,
        Suffix = " studs/s",
        CurrentValue = 50,

        Callback = function(value)
            FlySpeed = value
        end
    })

    Connect(RunService.RenderStepped, function()

        if not Flying or Destroyed then
            return
        end

        local character = LocalPlayer.Character

        if not character then
            return
        end

        local root =
            character:FindFirstChild("HumanoidRootPart")

        local humanoid =
            character:FindFirstChildOfClass("Humanoid")

        local camera = Workspace.CurrentCamera

        if not root or not humanoid or not camera then
            return
        end

        if not FlyVelocity or not FlyGyro then
            return
        end

        local direction = humanoid.MoveDirection

        if direction.Magnitude > 0 then
            FlyVelocity.Velocity =
                direction.Unit * FlySpeed
        else
            FlyVelocity.Velocity = Vector3.zero
        end

        local look = camera.CFrame.LookVector

        FlyGyro.CFrame =
            CFrame.lookAt(
                root.Position,
                root.Position + look
            )
    end)

    Connect(LocalPlayer.CharacterAdded, function()

        task.wait(0.5)

        if Flying then
            StartFly()
        end

    end)

    --==================================================
    -- TELEPORT
    --==================================================

    local TeleportTab =
        Window:CreateTab(t.teleport, "map-pin")

    local SavedPoint = nil
    local SelectedPlayer = nil

    local function GetPlayers()

        local result = {}

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer then
                table.insert(result, player.Name)
            end

        end

        if #result == 0 then
            table.insert(result, "No players")
        end

        return result
    end

    TeleportTab:CreateButton({
        Name = t.savePoint,

        Callback = function()

            local character = LocalPlayer.Character

            local root =
                character
                and character:FindFirstChild("HumanoidRootPart")

            if root then

                SavedPoint = root.CFrame

                Rayfield:Notify({
                    Title = "❄️ WINTER",
                    Content = "Point saved!",
                    Duration = 2
                })

            end
        end
    })

    TeleportTab:CreateButton({
        Name = t.teleportPoint,

        Callback = function()

            if not SavedPoint then

                Rayfield:Notify({
                    Title = "❄️ WINTER",
                    Content = t.noPoint,
                    Duration = 2
                })

                return
            end

            local character = LocalPlayer.Character

            local root =
                character
                and character:FindFirstChild("HumanoidRootPart")

            if root then
                root.CFrame = SavedPoint
            end

        end
    })

    TeleportTab:CreateDropdown({
        Name = t.player,
        Options = GetPlayers(),
        CurrentOption = {},
        MultipleOptions = false,

        Callback = function(option)

            if type(option) == "table" then
                option = option[1]
            end

            SelectedPlayer = option

        end
    })

    TeleportTab:CreateButton({
        Name = t.teleportPlayer,

        Callback = function()

            if not SelectedPlayer
                or SelectedPlayer == "No players" then

                Rayfield:Notify({
                    Title = "❄️ WINTER",
                    Content = t.noPlayer,
                    Duration = 2
                })

                return
            end

            local target =
                Players:FindFirstChild(SelectedPlayer)

            local targetCharacter =
                target and target.Character

            local targetRoot =
                targetCharacter
                and targetCharacter:FindFirstChild("HumanoidRootPart")

            local character = LocalPlayer.Character

            local root =
                character
                and character:FindFirstChild("HumanoidRootPart")

            if root and targetRoot then

                root.CFrame =
                    targetRoot.CFrame
                    + Vector3.new(0, 3, 0)

            end
        end
    })

    --==================================================
    -- ESP
    --==================================================

    local ESPTab =
        Window:CreateTab(t.esp, "eye")

    local ESPEnabled = false
    local BoxEnabled = true
    local TracerEnabled = false
    local NameEnabled = true
    local HealthEnabled = false
    local DistanceEnabled = true
    local TeamColorEnabled = false
    local RGBEnabled = false

    local ESPData = {}

    local function RemoveESP(player)

        local data = ESPData[player]

        if not data then
            return
        end

        for _, object in pairs(data) do

            pcall(function()
                object:Destroy()
            end)

        end

        ESPData[player] = nil
    end

    local function GetColor(player)

        if RGBEnabled then

            return Color3.fromHSV(
                (tick() % 5) / 5,
                1,
                1
            )
        end

        if TeamColorEnabled and player.Team then
            return player.Team.TeamColor.Color
        end

        return Color3.new(1, 1, 1)
    end

    local function CreateESP(player)

        if player == LocalPlayer then
            return
        end

        if not ESPEnabled then
            return
        end

        RemoveESP(player)

        local character = player.Character

        if not character then
            return
        end

        local head =
            character:FindFirstChild("Head")

        local root =
            character:FindFirstChild("HumanoidRootPart")

        if not head or not root then
            return
        end

        local data = {}

        --// BOX
        if BoxEnabled then

            local highlight = Instance.new("Highlight")

            highlight.Name = "WinterESPHighlight"
            highlight.Adornee = character
            highlight.DepthMode =
                Enum.HighlightDepthMode.AlwaysOnTop

            highlight.FillTransparency = 0.85
            highlight.OutlineTransparency = 0.25

            highlight.Parent = character

            data.Highlight = highlight
        end

        --// TEXT
        if NameEnabled
            or HealthEnabled
            or DistanceEnabled then

            local gui = Instance.new("BillboardGui")

            gui.Name = "WinterESP"
            gui.Adornee = head
            gui.Size = UDim2.fromOffset(140, 40)
            gui.StudsOffset =
                Vector3.new(0, 2.2, 0)

            gui.AlwaysOnTop = true
            gui.MaxDistance = 1500
            gui.Parent = head

            local label =
                Instance.new("TextLabel")

            label.BackgroundTransparency = 1
            label.Size = UDim2.fromScale(1, 1)
            label.Font = Enum.Font.GothamBold
            label.TextScaled = false
            label.TextSize = 12
            label.TextStrokeTransparency = 0.5
            label.TextWrapped = false

            label.Parent = gui

            data.Gui = gui
            data.Label = label
        end

        --// TRACER
        if TracerEnabled then

            local attachment =
                Instance.new("Attachment")

            attachment.Name =
                "WinterESPTracer"

            attachment.Parent = root

            data.Attachment = attachment
        end

        ESPData[player] = data
    end

    local function RefreshESP()

        for player in pairs(ESPData) do
            RemoveESP(player)
        end

        if not ESPEnabled then
            return
        end

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer then
                CreateESP(player)
            end

        end
    end

    ESPTab:CreateToggle({
        Name = "👁️ " .. t.espToggle,
        CurrentValue = false,

        Callback = function(value)

            ESPEnabled = value

            RefreshESP()

        end
    })

    ESPTab:CreateToggle({
        Name = t.box,
        CurrentValue = true,

        Callback = function(value)

            BoxEnabled = value

            RefreshESP()

        end
    })

    ESPTab:CreateToggle({
        Name = t.tracer,
        CurrentValue = false,

        Callback = function(value)

            TracerEnabled = value

            RefreshESP()

        end
    })

    ESPTab:CreateToggle({
        Name = t.names,
        CurrentValue = true,

        Callback = function(value)

            NameEnabled = value

            RefreshESP()

        end
    })

    ESPTab:CreateToggle({
        Name = t.health,
        CurrentValue = false,

        Callback = function(value)

            HealthEnabled = value

            RefreshESP()

        end
    })

    ESPTab:CreateToggle({
        Name = t.distance,
        CurrentValue = true,

        Callback = function(value)

            DistanceEnabled = value

            RefreshESP()

        end
    })

    ESPTab:CreateToggle({
        Name = t.teamColor,
        CurrentValue = false,

        Callback = function(value)

            TeamColorEnabled = value

            RefreshESP()

        end
    })

    ESPTab:CreateToggle({
        Name = t.rgb,
        CurrentValue = false,

        Callback = function(value)

            RGBEnabled = value

            RefreshESP()

        end
    })

    Connect(Players.PlayerAdded, function(player)

        task.wait(1)

        if ESPEnabled then
            CreateESP(player)
        end

    end)

    Connect(Players.PlayerRemoving, function(player)

        RemoveESP(player)

    end)

    Connect(RunService.RenderStepped, function()

        if not ESPEnabled then
            return
        end

        local localCharacter =
            LocalPlayer.Character

        local localRoot =
            localCharacter
            and localCharacter:FindFirstChild("HumanoidRootPart")

        for player, data in pairs(ESPData) do

            local character = player.Character

            local root =
                character
                and character:FindFirstChild("HumanoidRootPart")

            local head =
                character
                and character:FindFirstChild("Head")

            if not character
                or not root
                or not head then

                CreateESP(player)

                continue
            end

            local color = GetColor(player)

            if data.Highlight then

                data.Highlight.FillColor = color
                data.Highlight.OutlineColor = color

            end

            if data.Label then

                local text = {}

                if NameEnabled then
                    table.insert(text, player.Name)
                end

                if HealthEnabled then

                    local humanoid =
                        character:FindFirstChildOfClass("Humanoid")

                    if humanoid then

                        table.insert(
                            text,
                            "❤ "
                                .. math.floor(humanoid.Health)
                        )

                    end
                end

                if DistanceEnabled and localRoot then

                    local distance =
                        math.floor(
                            (
                                localRoot.Position
                                - root.Position
                            ).Magnitude
                        )

                    table.insert(
                        text,
                        "📏 "
                            .. distance
                            .. "m"
                    )
                end

                data.Label.Text =
                    table.concat(text, " | ")

                data.Label.TextColor3 = color
            end
        end
    end)

    --==================================================
    -- FUNPAY
    --==================================================

    local FunPayTab =
        Window:CreateTab(t.funpay, "coins")

    FunPayTab:CreateButton({
        Name = t.copyFunpay,

        Callback = function()

            local link =
                "https://funpay.com/users/16761126/"

            pcall(function()

                if setclipboard then
                    setclipboard(link)
                elseif toclipboard then
                    toclipboard(link)
                end

            end)

            Rayfield:Notify({
                Title = "❄️ WINTER",
                Content = t.copied,
                Duration = 3
            })
        end
    })

    --==================================================
    -- CREDITS
    --==================================================

    local CreditsTab =
        Window:CreateTab(t.credits, "crown")

    CreditsTab:CreateParagraph({
        Title = "❄️ WINTER",

        Content =
            "Creator: acou090\n"
            .. "Tester: acou090\n"
            .. "Co-creator: ChatGPT\n"
            .. "Owner: acou090\n"
            .. "Co-Owner: gumbazino1"
    })

    --==================================================
    -- STATISTICS
    --==================================================

    local StatsTab =
        Window:CreateTab(t.stats, "bar-chart-3")

    local executor = "Unknown"

    pcall(function()

        if identifyexecutor then
            executor = identifyexecutor()
        end

    end)

    getgenv().WinterLaunches =
        (getgenv().WinterLaunches or 0) + 1

    local StatsParagraph =
        StatsTab:CreateParagraph({
            Title = "📊 " .. t.stats,

            Content =
                t.serverPlayers
                .. ": "
                .. #Players:GetPlayers()
                .. "\n"
                .. t.executor
                .. ": "
                .. tostring(executor)
                .. "\n"
                .. t.launches
                .. ": "
                .. tostring(getgenv().WinterLaunches)
        })

    Connect(
        Players.PlayerAdded,
        function()
            pcall(function()

                StatsParagraph:Set({
                    Title = "📊 " .. t.stats,

                    Content =
                        t.serverPlayers
                        .. ": "
                        .. #Players:GetPlayers()
                        .. "\n"
                        .. t.executor
                        .. ": "
                        .. tostring(executor)
                        .. "\n"
                        .. t.launches
                        .. ": "
                        .. tostring(getgenv().WinterLaunches)
                })

            end)
        end
    )

    Connect(
        Players.PlayerRemoving,
        function()
            pcall(function()

                StatsParagraph:Set({
                    Title = "📊 " .. t.stats,

                    Content =
                        t.serverPlayers
                        .. ": "
                        .. #Players:GetPlayers()
                        .. "\n"
                        .. t.executor
                        .. ": "
                        .. tostring(executor)
                        .. "\n"
                        .. t.launches
                        .. ": "
                        .. tostring(getgenv().WinterLaunches)
                })

            end)
        end
    )
end

--// CONTINUE
LanguageTab:CreateButton({
    Name = "▶️ Continue",

    Callback = function()
        BuildMenu(SelectedLanguage)
    end
})
 
