--// ❄️ WINTER
--// PASSWORD: acou090
--// OWNER: acou090
--// CO-OWNER: gumbazino1
--// TELEPORT + FLY + ESP + SOCIAL + CREDITS + STATS

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"
))()

--==================================================
-- WINDOW
--==================================================

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
        teleport = "📍 Телепорт",
        fly = "✈️ Полёт",
        esp = "👁 ESP",
        social = "🌐 Соцсети",
        credits = "👑 Создатели",
        stats = "📊 Статистика",

        set = "📍 Поставить точку",
        tp = "🚀 Телепорт к точке",

        setDone = "Точка поставлена :Þ",
        tpDone = "Телепортация сделана",

        flyOn = "✈️ Полёт",
        speed = "Скорость полёта",

        espOn = "👁 Включить ESP",
        espNames = "🏷 Показывать ники",
        espDistance = "📏 Показывать расстояние",
        espHighlight = "✨ Подсветка игроков",
        espTeamCheck = "🛡 Не показывать союзников",
        espMaxDistance = "Максимальная дистанция ESP",

        funpay = "💰 FunPay",
        copied = "Ссылка скопирована!",

        creator = "Создатель",
        tester = "Тестер",
        cocreator = "Соавтор",
        owner = "Владелец",
        coowner = "Совладелец",

        players = "Игроков на сервере",
        executor = "Экзекутор",
        launches = "Запусков"
    },

    en = {
        teleport = "📍 Teleport",
        fly = "✈️ Flight",
        esp = "👁 ESP",
        social = "🌐 Social",
        credits = "👑 Creators",
        stats = "📊 Statistics",

        set = "📍 Set Point",
        tp = "🚀 TP to Point",

        setDone = "Point set :Þ",
        tpDone = "Teleport completed",

        flyOn = "✈️ Flight",
        speed = "Flight Speed",

        espOn = "👁 Enable ESP",
        espNames = "🏷 Show Names",
        espDistance = "📏 Show Distance",
        espHighlight = "✨ Player Highlight",
        espTeamCheck = "🛡 Hide Teammates",
        espMaxDistance = "Maximum ESP Distance",

        funpay = "💰 FunPay",
        copied = "Link copied!",

        creator = "Creator",
        tester = "Tester",
        cocreator = "Co-creator",
        owner = "Owner",
        coowner = "Co-Owner",

        players = "Players on server",
        executor = "Executor",
        launches = "Launches"
    },

    de = {
        teleport = "📍 Teleport",
        fly = "✈️ Flug",
        esp = "👁 ESP",
        social = "🌐 Soziales",
        credits = "👑 Ersteller",
        stats = "📊 Statistik",

        set = "📍 Punkt setzen",
        tp = "🚀 Zum Punkt",

        setDone = "Punkt gesetzt :Þ",
        tpDone = "Teleport abgeschlossen",

        flyOn = "✈️ Flug",
        speed = "Fluggeschwindigkeit",

        espOn = "👁 ESP aktivieren",
        espNames = "🏷 Namen anzeigen",
        espDistance = "📏 Entfernung anzeigen",
        espHighlight = "✨ Spieler hervorheben",
        espTeamCheck = "🛡 Teammitglieder ausblenden",
        espMaxDistance = "Maximale ESP-Distanz",

        funpay = "💰 FunPay",
        copied = "Link kopiert!",

        creator = "Ersteller",
        tester = "Tester",
        cocreator = "Mitentwickler",
        owner = "Besitzer",
        coowner = "Mitbesitzer",

        players = "Spieler auf dem Server",
        executor = "Executor",
        launches = "Starts"
    },

    fr = {
        teleport = "📍 Téléportation",
        fly = "✈️ Vol",
        esp = "👁 ESP",
        social = "🌐 Social",
        credits = "👑 Créateurs",
        stats = "📊 Statistiques",

        set = "📍 Définir le point",
        tp = "🚀 Aller au point",

        setDone = "Point défini :Þ",
        tpDone = "Téléportation terminée",

        flyOn = "✈️ Vol",
        speed = "Vitesse de vol",

        espOn = "👁 Activer ESP",
        espNames = "🏷 Afficher les noms",
        espDistance = "📏 Afficher la distance",
        espHighlight = "✨ Surbrillance",
        espTeamCheck = "🛡 Masquer les alliés",
        espMaxDistance = "Distance maximale ESP",

        funpay = "💰 FunPay",
        copied = "Lien copié !",

        creator = "Créateur",
        tester = "Testeur",
        cocreator = "Co-créateur",
        owner = "Propriétaire",
        coowner = "Co-propriétaire",

        players = "Joueurs sur le serveur",
        executor = "Exécuteur",
        launches = "Lancements"
    },

    es = {
        teleport = "📍 Teletransporte",
        fly = "✈️ Vuelo",
        esp = "👁 ESP",
        social = "🌐 Social",
        credits = "👑 Creadores",
        stats = "📊 Estadísticas",

        set = "📍 Establecer punto",
        tp = "🚀 Ir al punto",

        setDone = "Punto establecido :Þ",
        tpDone = "Teletransporte completado",

        flyOn = "✈️ Vuelo",
        speed = "Velocidad de vuelo",

        espOn = "👁 Activar ESP",
        espNames = "🏷 Mostrar nombres",
        espDistance = "📏 Mostrar distancia",
        espHighlight = "✨ Resaltar jugadores",
        espTeamCheck = "🛡 Ocultar compañeros",
        espMaxDistance = "Distancia máxima ESP",

        funpay = "💰 FunPay",
        copied = "¡Enlace copiado!",

        creator = "Creador",
        tester = "Probador",
        cocreator = "Co-creador",
        owner = "Propietario",
        coowner = "Copropietario",

        players = "Jugadores",
        executor = "Ejecutor",
        launches = "Inicios"
    },

    it = {
        teleport = "📍 Teletrasporto",
        fly = "✈️ Volo",
        esp = "👁 ESP",
        social = "🌐 Social",
        credits = "👑 Creatori",
        stats = "📊 Statistiche",

        set = "📍 Imposta punto",
        tp = "🚀 Vai al punto",

        setDone = "Punto impostato :Þ",
        tpDone = "Teletrasporto completato",

        flyOn = "✈️ Volo",
        speed = "Velocità di volo",

        espOn = "👁 Attiva ESP",
        espNames = "🏷 Mostra nomi",
        espDistance = "📏 Mostra distanza",
        espHighlight = "✨ Evidenzia giocatori",
        espTeamCheck = "🛡 Nascondi compagni",
        espMaxDistance = "Distanza massima ESP",

        funpay = "💰 FunPay",
        copied = "Link copiato!",

        creator = "Creatore",
        tester = "Tester",
        cocreator = "Co-creatore",
        owner = "Proprietario",
        coowner = "Co-proprietario",

        players = "Giocatori",
        executor = "Executor",
        launches = "Avvii"
    },

    pl = {
        teleport = "📍 Teleportacja",
        fly = "✈️ Lot",
        esp = "👁 ESP",
        social = "🌐 Społeczność",
        credits = "👑 Twórcy",
        stats = "📊 Statystyki",

        set = "📍 Ustaw punkt",
        tp = "🚀 Teleportuj do punktu",

        setDone = "Punkt ustawiony :Þ",
        tpDone = "Teleportacja zakończona",

        flyOn = "✈️ Lot",
        speed = "Prędkość lotu",

        espOn = "👁 Włącz ESP",
        espNames = "🏷 Pokaż nazwy",
        espDistance = "📏 Pokaż odległość",
        espHighlight = "✨ Podświetl graczy",
        espTeamCheck = "🛡 Ukryj sojuszników",
        espMaxDistance = "Maksymalny zasięg ESP",

        funpay = "💰 FunPay",
        copied = "Link skopiowany!",

        creator = "Twórca",
        tester = "Tester",
        cocreator = "Współtwórca",
        owner = "Właściciel",
        coowner = "Współwłaściciel",

        players = "Gracze na serwerze",
        executor = "Executor",
        launches = "Uruchomienia"
    },

    uk = {
        teleport = "📍 Телепорт",
        fly = "✈️ Політ",
        esp = "👁 ESP",
        social = "🌐 Соцмережі",
        credits = "👑 Творці",
        stats = "📊 Статистика",

        set = "📍 Встановити точку",
        tp = "🚀 Телепорт до точки",

        setDone = "Точку встановлено :Þ",
        tpDone = "Телепортацію виконано",

        flyOn = "✈️ Політ",
        speed = "Швидкість польоту",

        espOn = "👁 Увімкнути ESP",
        espNames = "🏷 Показувати ніки",
        espDistance = "📏 Показувати відстань",
        espHighlight = "✨ Підсвічування гравців",
        espTeamCheck = "🛡 Не показувати союзників",
        espMaxDistance = "Максимальна дистанція ESP",

        funpay = "💰 FunPay",
        copied = "Посилання скопійовано!",

        creator = "Творець",
        tester = "Тестер",
        cocreator = "Співавтор",
        owner = "Власник",
        coowner = "Співвласник",

        players = "Гравців на сервері",
        executor = "Екзекутор",
        launches = "Запусків"
    }
}

--==================================================
-- LANGUAGE
--==================================================

local SelectedLanguage = "🇷🇺 Русский"
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

        local function CleanFlyObjects()

            local Character = LocalPlayer.Character

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

            FlyVelocity.P = 125000
            FlyVelocity.Velocity = Vector3.zero
            FlyVelocity.Parent = Root

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

            FlyGyro.P = 150000
            FlyGyro.D = 1500
            FlyGyro.CFrame = workspace.CurrentCamera.CFrame
            FlyGyro.Parent = Root

            return true
        end

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

            local Look =
                CameraCF.LookVector

            local Right =
                CameraCF.RightVector

            local Move =
                Humanoid.MoveDirection

            if Move.Magnitude > 0.01 then

                local FlatLook =
                    Vector3.new(
                        Look.X,
                        0,
                        Look.Z
                    )

                local FlatRight =
                    Vector3.new(
                        Right.X,
                        0,
                        Right.Z
                    )

                if FlatLook.Magnitude > 0.001 then
                    FlatLook = FlatLook.Unit
                else
                    FlatLook = Vector3.new(0, 0, -1)
                end

                if FlatRight.Magnitude > 0.001 then
                    FlatRight = FlatRight.Unit
                else
                    FlatRight = Vector3.new(1, 0, 0)
                end

                local Forward =
                    Move:Dot(FlatLook)

                local Strafe =
                    Move:Dot(FlatRight)

                local Direction =
                    (Look * Forward)
                    + (FlatRight * Strafe)

                if Direction.Magnitude > 0.01 then

                    Direction =
                        Direction.Unit

                    FlyVelocity.Velocity =
                        Direction * FlySpeed

                else

                    FlyVelocity.Velocity =
                        Vector3.zero
                end

            else

                FlyVelocity.Velocity =
                    Vector3.zero
            end

            FlyGyro.CFrame =
                CameraCF
        end

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

        LocalPlayer.CharacterAdded:Connect(
            function()

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
        -- ESP
        --==================================================

        local ESPTab = Window:CreateTab(
            L.esp,
            4483362458
        )

        local ESPEnabled = false
        local ESPNames = true
        local ESPDistance = true
        local ESPHighlight = true
        local ESPTeamCheck = false
        local ESPMaxDistance = 1000

        local ESPObjects = {}
        local ESPConnection = nil
        local ESPPlayerConnections = {}

        --==================================================
        -- ESP CLEAN PLAYER
        --==================================================

        local function RemoveESP(Player)

            local Data = ESPObjects[Player]

            if Data then

                if Data.Highlight then
                    pcall(function()
                        Data.Highlight:Destroy()
                    end)
                end

                if Data.Billboard then
                    pcall(function()
                        Data.Billboard:Destroy()
                    end)
                end

                ESPObjects[Player] = nil
            end
        end

        --==================================================
        -- ESP CREATE
        --==================================================

        local function CreateESP(Player)

            if Player == LocalPlayer then
                return
            end

            RemoveESP(Player)

            local Character =
                Player.Character

            if not Character then
                return
            end

            local Head =
                Character:FindFirstChild("Head")

            local Root =
                Character:FindFirstChild("HumanoidRootPart")

            local Humanoid =
                Character:FindFirstChildOfClass("Humanoid")

            if not Head
                or not Root
                or not Humanoid then

                return
            end

            --==============================================
            -- HIGHLIGHT
            --==============================================

            local Highlight =
                Instance.new("Highlight")

            Highlight.Name =
                "WinterESPHighlight"

            Highlight.Adornee =
                Character

            Highlight.DepthMode =
                Enum.HighlightDepthMode.AlwaysOnTop

            Highlight.FillTransparency =
                0.65

            Highlight.OutlineTransparency =
                0

            Highlight.Enabled =
                ESPHighlight

            Highlight.Parent =
                Character

            --==============================================
            -- BILLBOARD
            --==============================================

            local Billboard =
                Instance.new("BillboardGui")

            Billboard.Name =
                "WinterESPBillboard"

            Billboard.Adornee =
                Head

            Billboard.Size =
                UDim2.new(
                    0,
                    220,
                    0,
                    60
                )

            Billboard.StudsOffset =
                Vector3.new(
                    0,
                    3,
                    0
                )

            Billboard.AlwaysOnTop =
                true

            Billboard.Parent =
                Head

            local Label =
                Instance.new("TextLabel")

            Label.Name =
                "WinterESPText"

            Label.BackgroundTransparency =
                1

            Label.Size =
                UDim2.new(
                    1,
                    0,
                    1,
                    0
                )

            Label.Font =
                Enum.Font.GothamBold

            Label.TextScaled =
                false

            Label.TextSize =
                14

            Label.TextStrokeTransparency =
                0

            Label.TextWrapped =
                true

            Label.Text =
                Player.Name

            Label.Parent =
                Billboard

            ESPObjects[Player] = {
                Highlight = Highlight,
                Billboard = Billboard,
                Label = Label,
                Character = Character,
                Root = Root,
                Head = Head
            }
        end

        --==================================================
        -- TEAM CHECK
        --==================================================

        local function ShouldShowPlayer(Player)

            if Player == LocalPlayer then
                return false
            end

            if not ESPEnabled then
                return false
            end

            if ESPTeamCheck then

                if LocalPlayer.Team ~= nil
                    and Player.Team ~= nil
                    and LocalPlayer.Team == Player.Team then

                    return false
                end
            end

            return true
        end

        --==================================================
        -- ESP UPDATE
        --==================================================

        local function UpdateESP()

            if not ESPEnabled then
                return
            end

            local MyCharacter =
                LocalPlayer.Character

            local MyRoot =
                MyCharacter
                and MyCharacter:FindFirstChild(
                    "HumanoidRootPart"
                )

            for _, Player in ipairs(
                Players:GetPlayers()
            ) do

                if Player ~= LocalPlayer then

                    local Character =
                        Player.Character

                    local Root =
                        Character
                        and Character:FindFirstChild(
                            "HumanoidRootPart"
                        )

                    local Head =
                        Character
                        and Character:FindFirstChild(
                            "Head"
                        )

                    if Character
                        and Root
                        and Head then

                        if not ESPObjects[Player]
                            or ESPObjects[Player].Character
                                ~= Character then

                            CreateESP(Player)
                        end

                        local Data =
                            ESPObjects[Player]

                        if Data then

                            local Show =
                                ShouldShowPlayer(Player)

                            local Distance =
                                0

                            if MyRoot then

                                Distance =
                                    (
                                        MyRoot.Position
                                        - Root.Position
                                    ).Magnitude
                            end

                            if Distance >
                                ESPMaxDistance then

                                Show = false
                            end

                            --==================================
                            -- HIGHLIGHT
                            --==================================

                            if Data.Highlight then

                                Data.Highlight.Enabled =
                                    Show
                                    and ESPHighlight
                            end

                            --==================================
                            -- TEXT
                            --==================================

                            if Data.Billboard then

                                Data.Billboard.Enabled =
                                    Show
                                    and (
                                        ESPNames
                                        or ESPDistance
                                    )
                            end

                            if Data.Label then

                                local TextParts = {}

                                if ESPNames then

                                    table.insert(
                                        TextParts,
                                        Player.DisplayName
                                        .. " ["
                                        .. Player.Name
                                        .. "]"
                                    )
                                end

                                if ESPDistance then

                                    table.insert(
                                        TextParts,
                                        tostring(
                                            math.floor(
                                                Distance
                                            )
                                        )
                                        .. " studs"
                                    )
                                end

                                Data.Label.Text =
                                    table.concat(
                                        TextParts,
                                        "\n"
                                    )
                            end
                        end

                    else

                        RemoveESP(Player)
                    end
                end
            end
        end

        --==================================================
        -- START ESP
        --==================================================

        local function StartESP()

            ESPEnabled = true

            for _, Player in ipairs(
                Players:GetPlayers()
            ) do

                if Player ~= LocalPlayer then
                    CreateESP(Player)
                end
            end

            if ESPConnection then
                ESPConnection:Disconnect()
            end

            ESPConnection =
                RunService.RenderStepped:Connect(
                    UpdateESP
                )
        end

        --==================================================
        -- STOP ESP
        --==================================================

        local function StopESP()

            ESPEnabled = false

            if ESPConnection then
                ESPConnection:Disconnect()
                ESPConnection = nil
            end

            for Player, _ in pairs(
                ESPObjects
            ) do

                RemoveESP(Player)
            end
        end

        --==================================================
        -- PLAYER ADDED
        --==================================================

        local function HookPlayer(Player)

            if Player == LocalPlayer then
                return
            end

            if ESPPlayerConnections[Player] then
                ESPPlayerConnections[Player]:Disconnect()
            end

            ESPPlayerConnections[Player] =
                Player.CharacterAdded:Connect(
                    function()

                        task.wait(0.5)

                        if ESPEnabled then
                            CreateESP(Player)
                        end
                    end
                )
        end

        for _, Player in ipairs(
            Players:GetPlayers()
        ) do

            HookPlayer(Player)
        end

        Players.PlayerAdded:Connect(
            function(Player)

                HookPlayer(Player)

                task.wait(0.5)

                if ESPEnabled then
                    CreateESP(Player)
                end
            end
        )

        Players.PlayerRemoving:Connect(
            function(Player)

                RemoveESP(Player)

                if ESPPlayerConnections[Player] then

                    ESPPlayerConnections[Player]
                        :Disconnect()

                    ESPPlayerConnections[Player] =
                        nil
                end
            end
        )

        --==================================================
        -- ESP MASTER TOGGLE
        --==================================================

        ESPTab:CreateToggle({

            Name = L.espOn,

            CurrentValue = false,

            Callback = function(Value)

                if Value then
                    StartESP()
                else
                    StopESP()
                end
            end
        })

        --==================================================
        -- ESP HIGHLIGHT
        --==================================================

        ESPTab:CreateToggle({

            Name = L.espHighlight,

            CurrentValue = true,

            Callback = function(Value)

                ESPHighlight = Value

                for _, Data in pairs(
                    ESPObjects
                ) do

                    if Data.Highlight then

                        Data.Highlight.Enabled =
                            ESPEnabled
                            and ESPHighlight
                    end
                end
            end
        })

        --==================================================
        -- ESP NAMES
        --==================================================

        ESPTab:CreateToggle({

            Name = L.espNames,

            CurrentValue = true,

            Callback = function(Value)

                ESPNames = Value
            end
        })

        --==================================================
        -- ESP DISTANCE
        --==================================================

        ESPTab:CreateToggle({

            Name = L.espDistance,

            CurrentValue = true,

            Callback = function(Value)

                ESPDistance = Value
            end
        })

        --==================================================
        -- ESP TEAM CHECK
        --==================================================

        ESPTab:CreateToggle({

            Name = L.espTeamCheck,

            CurrentValue = false,

            Callback = function(Value)

                ESPTeamCheck = Value
            end
        })

        --==================================================
        -- ESP MAX DISTANCE
        --==================================================

        ESPTab:CreateSlider({

            Name = L.espMaxDistance,

            Range = {
                50,
                5000
            },

            Increment = 50,

            Suffix = " studs",

            CurrentValue = 1000,

            Callback = function(Value)

                ESPMaxDistance =
                    tonumber(Value) or 1000
            end
        })

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
            Content = "acou090"
        })

        CreditsTab:CreateParagraph({
            Title = L.coowner,
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
