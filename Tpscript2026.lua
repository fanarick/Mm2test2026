local Rayfield = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"
))()

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Point = nil
local CurrentLanguage = "Русский"
local SelectedLanguage = "Русский"

local TotalLaunches = "Недоступно"

local Executor = "Неизвестно"
if identifyexecutor then
    local Name, Version = identifyexecutor()
    Executor = tostring(Name or "Неизвестно")
    if Version then
        Executor = Executor .. " " .. tostring(Version)
    end
end

local T = {
    ["Русский"] = {
        Teleport = "📍 Телепорт",
        Languages = "🌐 Языки",
        Social = "🔗 Соц. сети",
        Credits = "👑 Кредиты",
        Stats = "📊 Статистика",
        Set = "📍 Поставить точку",
        TP = "✈️ Телепорт к точке",
        Select = "🌐 Выбор языка",
        Apply = "✅ Применить язык",
        SetOK = "Точка поставлена :Þ",
        TPOK = "Телепортация сделана",
        NoPoint = "Сначала поставьте точку!",
        Applied = "Русский язык применён",
        FunPay = "🛒 FunPay",
        StatsTitle = "📊 Статистика",
        Players = "👥 Сейчас играют: ",
        Launches = "🚀 Всего запусков: ",
        Executor = "⚙️ Экзекутор: ",
        Creator = "Создатель: acou090",
        Tester = "Тестер: acou090",
        CoCreator = "Соавтор: ChatGPT",
        Owner = "👑 ВЛАДЕЛЕЦ: @acou090"
    },

    ["English"] = {
        Teleport = "📍 Teleport",
        Languages = "🌐 Languages",
        Social = "🔗 Social Networks",
        Credits = "👑 Credits",
        Stats = "📊 Statistics",
        Set = "📍 Set Point",
        TP = "✈️ TP to Point",
        Select = "🌐 Select Language",
        Apply = "✅ Apply Language",
        SetOK = "Point set :Þ",
        TPOK = "Teleportation complete",
        NoPoint = "Set a point first!",
        Applied = "English language applied",
        FunPay = "🛒 FunPay",
        StatsTitle = "📊 Statistics",
        Players = "👥 Playing now: ",
        Launches = "🚀 Total launches: ",
        Executor = "⚙️ Executor: ",
        Creator = "Creator: acou090",
        Tester = "Tester: acou090",
        CoCreator = "Co-creator: ChatGPT",
        Owner = "👑 OWNER: @acou090"
    },

    ["Deutsch"] = {
        Teleport = "📍 Teleport",
        Languages = "🌐 Sprachen",
        Social = "🔗 Soziale Netzwerke",
        Credits = "👑 Credits",
        Stats = "📊 Statistik",
        Set = "📍 Punkt setzen",
        TP = "✈️ Zum Punkt",
        Select = "🌐 Sprache auswählen",
        Apply = "✅ Sprache anwenden",
        SetOK = "Punkt gesetzt :Þ",
        TPOK = "Teleportation abgeschlossen",
        NoPoint = "Setze zuerst einen Punkt!",
        Applied = "Deutsch angewendet",
        FunPay = "🛒 FunPay",
        StatsTitle = "📊 Statistik",
        Players = "👥 Jetzt im Spiel: ",
        Launches = "🚀 Starts insgesamt: ",
        Executor = "⚙️ Executor: ",
        Creator = "Ersteller: acou090",
        Tester = "Tester: acou090",
        CoCreator = "Mitentwickler: ChatGPT",
        Owner = "👑 BESITZER: @acou090"
    },

    ["Español"] = {
        Teleport = "📍 Teletransporte",
        Languages = "🌐 Idiomas",
        Social = "🔗 Redes sociales",
        Credits = "👑 Créditos",
        Stats = "📊 Estadísticas",
        Set = "📍 Establecer punto",
        TP = "✈️ Ir al punto",
        Select = "🌐 Seleccionar idioma",
        Apply = "✅ Aplicar idioma",
        SetOK = "Punto establecido :Þ",
        TPOK = "Teletransporte completado",
        NoPoint = "¡Primero establece un punto!",
        Applied = "Español aplicado",
        FunPay = "🛒 FunPay",
        StatsTitle = "📊 Estadísticas",
        Players = "👥 Jugando ahora: ",
        Launches = "🚀 Lanzamientos totales: ",
        Executor = "⚙️ Ejecutor: ",
        Creator = "Creador: acou090",
        Tester = "Probador: acou090",
        CoCreator = "Co-creador: ChatGPT",
        Owner = "👑 PROPIETARIO: @acou090"
    },

    ["Français"] = {
        Teleport = "📍 Téléportation",
        Languages = "🌐 Langues",
        Social = "🔗 Réseaux sociaux",
        Credits = "👑 Crédits",
        Stats = "📊 Statistiques",
        Set = "📍 Définir le point",
        TP = "✈️ Aller au point",
        Select = "🌐 Choisir la langue",
        Apply = "✅ Appliquer la langue",
        SetOK = "Point défini :Þ",
        TPOK = "Téléportation terminée",
        NoPoint = "Définissez d'abord un point !",
        Applied = "Français appliqué",
        FunPay = "🛒 FunPay",
        StatsTitle = "📊 Statistiques",
        Players = "👥 Joueurs actuels : ",
        Launches = "🚀 Lancements totaux : ",
        Executor = "⚙️ Exécuteur : ",
        Creator = "Créateur : acou090",
        Tester = "Testeur : acou090",
        CoCreator = "Co-créateur : ChatGPT",
        Owner = "👑 PROPRIÉTAIRE : @acou090"
    },

    ["Português"] = {
        Teleport = "📍 Teleporte",
        Languages = "🌐 Idiomas",
        Social = "🔗 Redes sociais",
        Credits = "👑 Créditos",
        Stats = "📊 Estatísticas",
        Set = "📍 Definir ponto",
        TP = "✈️ Ir para o ponto",
        Select = "🌐 Selecionar idioma",
        Apply = "✅ Aplicar idioma",
        SetOK = "Ponto definido :Þ",
        TPOK = "Teleporte concluído",
        NoPoint = "Defina um ponto primeiro!",
        Applied = "Português aplicado",
        FunPay = "🛒 FunPay",
        StatsTitle = "📊 Estatísticas",
        Players = "👥 Jogando agora: ",
        Launches = "🚀 Total de inicializações: ",
        Executor = "⚙️ Executor: ",
        Creator = "Criador: acou090",
        Tester = "Testador: acou090",
        CoCreator = "Co-criador: ChatGPT",
        Owner = "👑 PROPRIETÁRIO: @acou090"
    },

    ["Türkçe"] = {
        Teleport = "📍 Teleport",
        Languages = "🌐 Diller",
        Social = "🔗 Sosyal ağlar",
        Credits = "👑 Krediler",
        Stats = "📊 İstatistikler",
        Set = "📍 Nokta belirle",
        TP = "✈️ Noktaya git",
        Select = "🌐 Dil seç",
        Apply = "✅ Dili uygula",
        SetOK = "Nokta belirlendi :Þ",
        TPOK = "Işınlanma tamamlandı",
        NoPoint = "Önce bir nokta belirle!",
        Applied = "Türkçe uygulandı",
        FunPay = "🛒 FunPay",
        StatsTitle = "📊 İstatistikler",
        Players = "👥 Şu anda oynayan: ",
        Launches = "🚀 Toplam çalıştırma: ",
        Executor = "⚙️ Executor: ",
        Creator = "Oluşturan: acou090",
        Tester = "Test eden: acou090",
        CoCreator = "Ortak oluşturucu: ChatGPT",
        Owner = "👑 SAHİP: @acou090"
    }
}

local Window = Rayfield:CreateWindow({
    Name = "❄️ WINTER",
    Icon = 0,
    LoadingTitle = "❄️ WINTER",
    LoadingSubtitle = "Rayfield",
    Theme = "Ocean",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = true,
    KeySettings = {
        Title = "🔒 Password",
        Subtitle = "Enter password",
        Note = "Winter access",
        FileName = "WinterKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"acou090"}
    }
})

local Tabs = {}
local Elements = {}

local function GetText()
    return T[CurrentLanguage]
end

local function UpdateStats()
    if not Elements.StatsParagraph then
        return
    end

    local L = GetText()

    Elements.StatsParagraph:Set({
        Title = L.StatsTitle,
        Content =
            L.Players .. tostring(#Players:GetPlayers()) .. "\n" ..
            L.Launches .. tostring(TotalLaunches) .. "\n" ..
            L.Executor .. Executor
    })
end

local function BuildUI()
    local L = GetText()

    Tabs.Teleport = Window:CreateTab(L.Teleport, "map-pin")

    Elements.SetPoint = Tabs.Teleport:CreateButton({
        Name = L.Set,
        Callback = function()
            local Character = Player.Character
            local Root = Character and Character:FindFirstChild("HumanoidRootPart")

            if Root then
                Point = Root.CFrame

                Rayfield:Notify({
                    Title = "❄️ WINTER",
                    Content = GetText().SetOK,
                    Duration = 3
                })
            end
        end
    })

    Elements.TP = Tabs.Teleport:CreateButton({
        Name = L.TP,
        Callback = function()
            local Character = Player.Character
            local Root = Character and Character:FindFirstChild("HumanoidRootPart")

            if Root and Point then
                Root.CFrame = Point

                Rayfield:Notify({
                    Title = "❄️ WINTER",
                    Content = GetText().TPOK,
                    Duration = 3
                })
            elseif not Point then
                Rayfield:Notify({
                    Title = "❄️ WINTER",
                    Content = GetText().NoPoint,
                    Duration = 3
                })
            end
        end
    })

    Tabs.Languages = Window:CreateTab(L.Languages, "languages")

    Tabs.Languages:CreateDropdown({
        Name = L.Select,
        Options = {
            "Русский",
            "English",
            "Deutsch",
            "Español",
            "Français",
            "Português",
            "Türkçe"
        },
        CurrentOption = {CurrentLanguage},
        MultipleOptions = false,

        Callback = function(Option)
            if type(Option) == "table" then
                SelectedLanguage = Option[1]
            else
                SelectedLanguage = Option
            end
        end
    })

    Elements.Apply = Tabs.Languages:CreateButton({
        Name = L.Apply,

        Callback = function()
            if not T[SelectedLanguage] then
                return
            end

            CurrentLanguage = SelectedLanguage

            local NewL = GetText()

            Elements.SetPoint:Set(NewL.Set)
            Elements.TP:Set(NewL.TP)
            Elements.Apply:Set(NewL.Apply)

            if Elements.StatsParagraph then
                Elements.StatsParagraph:Set({
                    Title = NewL.StatsTitle,
                    Content =
                        NewL.Players .. tostring(#Players:GetPlayers()) .. "\n" ..
                        NewL.Launches .. tostring(TotalLaunches) .. "\n" ..
                        NewL.Executor .. Executor
                })
            end

            if Elements.Credits then
                Elements.Credits:Set({
                    Title = NewL.Credits,
                    Content =
                        NewL.Creator .. "\n" ..
                        NewL.Tester .. "\n" ..
                        NewL.CoCreator .. "\n\n" ..
                        NewL.Owner
                })
            end

            Rayfield:Notify({
                Title = "🌐",
                Content = NewL.Applied,
                Duration = 3
            })
        end
    })

    Tabs.Social = Window:CreateTab(L.Social, "globe")

    Tabs.Social:CreateButton({
        Name = L.FunPay,

        Callback = function()
            local Link = "https://funpay.com/users/16761126/"

            if setclipboard then
                setclipboard(Link)

                Rayfield:Notify({
                    Title = "🛒 FunPay",
                    Content = "Link copied!",
                    Duration = 3
                })
            end
        end
    })

    Tabs.Stats = Window:CreateTab(L.Stats, "bar-chart-3")

    Elements.StatsParagraph = Tabs.Stats:CreateParagraph({
        Title = L.StatsTitle,
        Content =
            L.Players .. tostring(#Players:GetPlayers()) .. "\n" ..
            L.Launches .. tostring(TotalLaunches) .. "\n" ..
            L.Executor .. Executor
    })

    Tabs.Credits = Window:CreateTab(L.Credits, "users")

    Elements.Credits = Tabs.Credits:CreateParagraph({
        Title = L.Credits,
        Content =
            L.Creator .. "\n" ..
            L.Tester .. "\n" ..
            L.CoCreator .. "\n\n" ..
            L.Owner
    })
end

BuildUI()

Players.PlayerAdded:Connect(UpdateStats)
Players.PlayerRemoving:Connect(function()
    task.wait()
    UpdateStats()
end)

task.spawn(function()
    while task.wait(5) do
        UpdateStats()
    end
end)
