--// ❄️ WINTER
--// PASSWORD: acou090
--// OWNER: gumbazino1
--// PASSWORD -> LANGUAGE -> MENU

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

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
        Subtitle = "Enter Password",
        Note = "Password: acou090",
        FileName = "WinterKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"acou090"}
    }
})

--==================================================
-- LANGUAGES
--==================================================

local Languages = {
    "🇷🇺 Русский",
    "🇬🇧 English",
    "🇩🇪 Deutsch",
    "🇫🇷 Français",
    "🇪🇸 Español",
    "🇮🇹 Italiano",
    "🇵🇱 Polski",
    "🇺🇦 Українська"
}

local Codes = {
    ["🇷🇺 Русский"] = "ru",
    ["🇬🇧 English"] = "en",
    ["🇩🇪 Deutsch"] = "de",
    ["🇫🇷 Français"] = "fr",
    ["🇪🇸 Español"] = "es",
    ["🇮🇹 Italiano"] = "it",
    ["🇵🇱 Polski"] = "pl",
    ["🇺🇦 Українська"] = "uk"
}

--==================================================
-- TRANSLATIONS
--==================================================

local T = {

    ru = {
        lang = "🌍 Язык",
        apply = "✅ Выбрать язык",
        teleport = "📍 Телепорт",
        fly = "✈️ Полёт",
        social = "🌐 Соцсети",
        credits = "👑 Создатели",
        stats = "📊 Статистика",

        set = "📍 Поставить точку",
        tp = "🚀 Телепорт к точке",

        setDone = "Точка поставлена :Þ",
        tpDone = "Телепортация сделана",

        flyOn = "✈️ Полёт",
        speed = "Скорость полёта",

        funpay = "💰 FunPay",
        copied = "Ссылка скопирована!",

        creator = "Создатель",
        tester = "Тестер",
        cocreator = "Соавтор",
        owner = "Владелец",

        players = "Игроков на сервере",
        executor = "Экзекутор",
        launches = "Запусков"
    },

    en = {
        lang = "🌍 Language",
        apply = "✅ Select Language",
        teleport = "📍 Teleport",
        fly = "✈️ Flight",
        social = "🌐 Social",
        credits = "👑 Creators",
        stats = "📊 Statistics",

        set = "📍 Set Point",
        tp = "🚀 TP to Point",

        setDone = "Point set :Þ",
        tpDone = "Teleport completed",

        flyOn = "✈️ Flight",
        speed = "Flight Speed",

        funpay = "💰 FunPay",
        copied = "Link copied!",

        creator = "Creator",
        tester = "Tester",
        cocreator = "Co-creator",
        owner = "Owner",

        players = "Players on server",
        executor = "Executor",
        launches = "Launches"
    },

    de = {
        lang = "🌍 Sprache",
        apply = "✅ Sprache auswählen",
        teleport = "📍 Teleport",
        fly = "✈️ Flug",
        social = "🌐 Soziales",
        credits = "👑 Ersteller",
        stats = "📊 Statistik",

        set = "📍 Punkt setzen",
        tp = "🚀 Zum Punkt",

        setDone = "Punkt gesetzt :Þ",
        tpDone = "Teleport abgeschlossen",

        flyOn = "✈️ Flug",
        speed = "Fluggeschwindigkeit",

        funpay = "💰 FunPay",
        copied = "Link kopiert!",

        creator = "Ersteller",
        tester = "Tester",
        cocreator = "Mitentwickler",
        owner = "Besitzer",

        players = "Spieler auf dem Server",
        executor = "Executor",
        launches = "Starts"
    },

    fr = {
        lang = "🌍 Langue",
        apply = "✅ Choisir la langue",
        teleport = "📍 Téléportation",
        fly = "✈️ Vol",
        social = "🌐 Social",
        credits = "👑 Créateurs",
        stats = "📊 Statistiques",

        set = "📍 Définir le point",
        tp = "🚀 Aller au point",

        setDone = "Point défini :Þ",
        tpDone = "Téléportation terminée",

        flyOn = "✈️ Vol",
        speed = "Vitesse de vol",

        funpay = "💰 FunPay",
        copied = "Lien copié !",

        creator = "Créateur",
        tester = "Testeur",
        cocreator = "Co-créateur",
        owner = "Propriétaire",

        players = "Joueurs sur le serveur",
        executor = "Exécuteur",
        launches = "Lancements"
    },

    es = {
        lang = "🌍 Idioma",
        apply = "✅ Elegir idioma",
        teleport = "📍 Teletransporte",
        fly = "✈️ Vuelo",
        social = "🌐 Social",
        credits = "👑 Creadores",
        stats = "📊 Estadísticas",

        set = "📍 Establecer punto",
        tp = "🚀 Ir al punto",

        setDone = "Punto establecido :Þ",
        tpDone = "Teletransporte completado",

        flyOn = "✈️ Vuelo",
        speed = "Velocidad de vuelo",

        funpay = "💰 FunPay",
        copied = "¡Enlace copiado!",

        creator = "Creador",
        tester = "Probador",
        cocreator = "Co-creador",
        owner = "Propietario",

        players = "Jugadores",
        executor = "Ejecutor",
        launches = "Inicios"
    },

    it = {
        lang = "🌍 Lingua",
        apply = "✅ Scegli lingua",
        teleport = "📍 Teletrasporto",
        fly = "✈️ Volo",
        social = "🌐 Social",
        credits = "👑 Creatori",
        stats = "📊 Statistiche",

        set = "📍 Imposta punto",
        tp = "🚀 Vai al punto",

        setDone = "Punto impostato :Þ",
        tpDone = "Teletrasporto completato",

        flyOn = "✈️ Volo",
        speed = "Velocità di volo",

        funpay = "💰 FunPay",
        copied = "Link copiato!",

        creator = "Creatore",
        tester = "Tester",
        cocreator = "Co-creatore",
        owner = "Proprietario",

        players = "Giocatori",
        executor = "Executor",
        launches = "Avvii"
    },

    pl = {
        lang = "🌍 Język",
        apply = "✅ Wybierz język",
        teleport = "📍 Teleportacja",
        fly = "✈️ Lot",
        social = "🌐 Społeczność",
        credits = "👑 Twórcy",
        stats = "📊 Statystyki",

        set = "📍 Ustaw punkt",
        tp = "🚀 Teleportuj do punktu",

        setDone = "Punkt ustawiony :Þ",
        tpDone = "Teleportacja zakończona",

        flyOn = "✈️ Lot",
        speed = "Prędkość lotu",

        funpay = "💰 FunPay",
        copied = "Link skopiowany!",

        creator = "Twórca",
        tester = "Tester",
        cocreator = "Współtwórca",
        owner = "Właściciel",

        players = "Gracze na serwerze",
        executor = "Executor",
        launches = "Uruchomienia"
    },

    uk = {
        lang = "🌍 Мова",
        apply = "✅ Вибрати мову",
        teleport = "📍 Телепорт",
        fly = "✈️ Політ",
        social = "🌐 Соцмережі",
        credits = "👑 Творці",
        stats = "📊 Статистика",

        set = "📍 Встановити точку",
        tp = "🚀 Телепорт до точки",

        setDone = "Точку встановлено :Þ",
        tpDone = "Телепортацію виконано",

        flyOn = "✈️ Політ",
        speed = "Швидкість польоту",

        funpay = "💰 FunPay",
        copied = "Посилання скопійовано!",

        creator = "Творець",
        tester = "Тестер",
        cocreator = "Співавтор",
        owner = "Власник",

        players = "Гравців на сервері",
        executor = "Екзекутор",
        launches = "Запусків"
    }
}

--==================================================
-- LANGUAGE
--==================================================

local SelectedLanguage = Languages[1]
local Started = false

local LanguageTab = Window:CreateTab(
    "🌍 Language",
    4483362458
)

LanguageTab:CreateParagraph({
    Title = "❄️ WINTER",
    Content = "Выберите язык / Choose language"
})

LanguageTab:CreateDropdown({
    Name = "🌍 Language",
    Options = Languages,
    CurrentOption = {SelectedLanguage},
    MultipleOptions = false,

    Callback = function(Value)

        if type(Value) == "table" then
            SelectedLanguage = Value[1] or SelectedLanguage
        elseif type(Value) == "string" then
            SelectedLanguage = Value
        end
    end
})

LanguageTab:CreateButton({
    Name = "✅ Continue",

    Callback = function()

        if Started then
            return
        end

        Started = true

        local Code = Codes[SelectedLanguage] or "ru"
        local L = T[Code]

        --==================================================
        -- TELEPORT
        --==================================================

        local TeleportTab = Window:CreateTab(
            L.teleport,
            4483362458
        )

        local SavedPoint = nil

        TeleportTab:CreateButton({
            Name = L.set,

            Callback = function()

                local Character = LocalPlayer.Character
                local Root = Character
                    and Character:FindFirstChild("HumanoidRootPart")

                if Root then

                    SavedPoint = Root.CFrame

                    Rayfield:Notify({
                        Title = "❄️ WINTER",
                        Content = L.setDone,
                        Duration = 2
                    })
                end
            end
        })

        TeleportTab:CreateButton({
            Name = L.tp,

            Callback = function()

                local Character = LocalPlayer.Character
                local Root = Character
                    and Character:FindFirstChild("HumanoidRootPart")

                if Root and SavedPoint then

                    Root.CFrame = SavedPoint

                    Rayfield:Notify({
                        Title = "❄️ WINTER",
                        Content = L.tpDone,
                        Duration = 2
                    })
                end
            end
        })

        --==================================================
        -- FLY
        --==================================================

        local FlyTab = Window:CreateTab(
            L.fly,
            4483362458
        )

        local Flying = false
        local FlySpeed = 50

        local FlyVelocity = nil
        local FlyGyro = nil
        local FlyConnection = nil

        local PreviousAutoRotate = true

        --==================================================
        -- CHARACTER
        --==================================================

        local function GetCharacter()

            local Character = LocalPlayer.Character

            if not Character then
                return nil, nil, nil
            end

            local Humanoid =
                Character:FindFirstChildOfClass("Humanoid")

            local Root =
                Character:FindFirstChild("HumanoidRootPart")

            return Character, Humanoid, Root
        end

        --==================================================
        -- CLEAN
        --==================================================

        local function CleanFlyObjects()

            local Character =
                LocalPlayer.Character

            if not Character then
                return
            end

            local Root =
                Character:FindFirstChild("HumanoidRootPart")

            if not Root then
                return
            end

            for _, Object in ipairs(Root:GetChildren()) do

                if Object.Name == "WinterFlyVelocity"
                    or Object.Name == "WinterFlyGyro" then

                    pcall(function()
                        Object:Destroy()
                    end)
                end
            end
        end

        --==================================================
        -- STOP
        --==================================================

        local function StopFly()

            Flying = false

            if FlyConnection then
                FlyConnection:Disconnect()
                FlyConnection = nil
            end

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

            CleanFlyObjects()

            local Character,
                Humanoid,
                Root = GetCharacter()

            if Humanoid then
                Humanoid.AutoRotate =
                    PreviousAutoRotate
            end

            if Root then

                Root.AssemblyLinearVelocity =
                    Vector3.zero

                Root.AssemblyAngularVelocity =
                    Vector3.zero
            end
        end

        --==================================================
        -- CREATE
        --==================================================

        local function CreateFlyObjects()

            local Character,
                Humanoid,
                Root = GetCharacter()

            if not Character
                or not Humanoid
                or not Root then

                return false
            end

            CleanFlyObjects()

            PreviousAutoRotate =
                Humanoid.AutoRotate

            Humanoid.AutoRotate = false

            FlyVelocity =
                Instance.new("BodyVelocity")

            FlyVelocity.Name =
                "WinterFlyVelocity"

            FlyVelocity.MaxForce =
                Vector3.new(
                    math.huge,
                    math.huge,
                    math.huge
                )

            FlyVelocity.P =
                125000

            FlyVelocity.Velocity =
                Vector3.zero

            FlyVelocity.Parent =
                Root

            FlyGyro =
                Instance.new("BodyGyro")

            FlyGyro.Name =
                "WinterFlyGyro"

            FlyGyro.MaxTorque =
                Vector3.new(
                    math.huge,
                    math.huge,
                    math.huge
                )

            FlyGyro.P =
                150000

            FlyGyro.D =
                1500

            FlyGyro.CFrame =
                workspace.CurrentCamera.CFrame

            FlyGyro.Parent =
                Root

            return true
        end

        --==================================================
        -- UPDATE
        --==================================================

        local function UpdateFly()

            if not Flying then
                return
            end

            local Character,
                Humanoid,
                Root = GetCharacter()

            local Camera =
                workspace.CurrentCamera

            if not Character
                or not Humanoid
                or not Root
                or not Camera then

                return
            end

            if not FlyVelocity
                or not FlyVelocity.Parent
                or not FlyGyro
                or not FlyGyro.Parent then

                if not CreateFlyObjects() then
                    return
                end
            end

            local CameraCF =
                Camera.CFrame

            local LookVector =
                CameraCF.LookVector

            local RightVector =
                CameraCF.RightVector

            local MoveDirection =
                Humanoid.MoveDirection

            local VelocityDirection =
                Vector3.zero

            if MoveDirection.Magnitude > 0.01 then

                -- Горизонтальное направление камеры
                local FlatLook =
                    Vector3.new(
                        LookVector.X,
                        0,
                        LookVector.Z
                    )

                local FlatRight =
                    Vector3.new(
                        RightVector.X,
                        0,
                        RightVector.Z
                    )

                if FlatLook.Magnitude > 0.001 then
                    FlatLook =
                        FlatLook.Unit
                end

                if FlatRight.Magnitude > 0.001 then
                    FlatRight =
                        FlatRight.Unit
                end

                -- WASD / мобильный джойстик
                local Forward =
                    MoveDirection:Dot(FlatLook)

                local Strafe =
                    MoveDirection:Dot(FlatRight)

                -- Полное направление камеры
                VelocityDirection =
                    (LookVector * Forward)
                    + (FlatRight * Strafe)

                if VelocityDirection.Magnitude > 0.01 then

                    VelocityDirection =
                        VelocityDirection.Unit

                    FlyVelocity.Velocity =
                        VelocityDirection * FlySpeed

                else

                    FlyVelocity.Velocity =
                        Vector3.zero
                end

            else

                FlyVelocity.Velocity =
                    Vector3.zero
            end

            -- Всегда поворачиваем тело по камере
            FlyGyro.CFrame =
                CameraCF
        end

        --==================================================
        -- SPEED SLIDER
        --==================================================

        FlyTab:CreateSlider({

            Name = L.speed,

            Range = {
                1,
                100
            },

            Increment = 1,

            Suffix = " studs/s",

            CurrentValue = 50,

            Callback = function(Value)

                FlySpeed =
                    math.clamp(
                        tonumber(Value) or 50,
                        1,
                        100
                    )
            end
        })

        --==================================================
        -- FLY TOGGLE
        --==================================================

        FlyTab:CreateToggle({

            Name = L.flyOn,

            CurrentValue = false,

            Callback = function(Value)

                if not Value then

                    StopFly()

                    return
                end

                local Character,
                    Humanoid,
                    Root = GetCharacter()

                if not Character
                    or not Humanoid
                    or not Root then

                    return
                end

                Flying = true

                if not CreateFlyObjects() then

                    Flying = false

                    return
                end

                if FlyConnection then
                    FlyConnection:Disconnect()
                end

                FlyConnection =
                    RunService.RenderStepped:Connect(
                        UpdateFly
                    )
            end
        })

        --==================================================
        -- RESPAWN
        --==================================================

        LocalPlayer.CharacterAdded:Connect(
            function(Character)

                task.wait(0.5)

                if Flying then

                    FlyVelocity = nil
                    FlyGyro = nil

                    task.wait(0.1)

                    if Flying then
                        CreateFlyObjects()
                    end
                end
            end
        )

        --==================================================
        -- SOCIAL
        --==================================================

        local SocialTab = Window:CreateTab(
            L.social,
            4483362458
        )

        SocialTab:CreateButton({

            Name = L.funpay,

            Callback = function()

                local Link =
                    "https://funpay.com/users/16761126/"

                pcall(function()

                    if setclipboard then
                        setclipboard(Link)
                    elseif toclipboard then
                        toclipboard(Link)
                    end
                end)

                Rayfield:Notify({
                    Title = "FunPay",
                    Content = L.copied,
                    Duration = 2
                })
            end
        })

        --==================================================
        -- CREDITS
        --==================================================

        local CreditsTab = Window:CreateTab(
            L.credits,
            4483362458
        )

        CreditsTab:CreateParagraph({
            Title = L.creator,
            Content = "acou090"
        })

        CreditsTab:CreateParagraph({
            Title = L.tester,
            Content = "acou090"
        })

        CreditsTab:CreateParagraph({
            Title = L.cocreator,
            Content = "ChatGPT"
        })

        CreditsTab:CreateParagraph({
            Title = L.owner,
            Content = "gumbazino1"
        })

        --==================================================
        -- STATISTICS
        --==================================================

        local StatsTab = Window:CreateTab(
            L.stats,
            4483362458
        )

        getgenv().WinterLaunches =
            (getgenv().WinterLaunches or 0) + 1

        local StatsParagraph =
            StatsTab:CreateParagraph({
                Title = L.stats,
                Content = ""
            })

        local function GetExecutor()

            if identifyexecutor then

                local Success,
                    Name =
                    pcall(identifyexecutor)

                if Success and Name then
                    return tostring(Name)
                end
            end

            return "Unknown"
        end

        local function UpdateStats()

            StatsParagraph:Set({

                Title = L.stats,

                Content =
                    L.players
                    .. ": "
                    .. tostring(
                        #Players:GetPlayers()
                    )

                    .. "\n"

                    .. L.executor
                    .. ": "
                    .. GetExecutor()

                    .. "\n"

                    .. L.launches
                    .. ": "
                    .. tostring(
                        getgenv().WinterLaunches
                    )
            })
        end

        UpdateStats()

        task.spawn(function()

            while Started do

                task.wait(2)

                if not Started then
                    break
                end

                pcall(UpdateStats)
            end
        end)
    end
})
