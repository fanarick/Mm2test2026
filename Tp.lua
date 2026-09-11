local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local Player = game:GetService("Players").LocalPlayer
local Point = nil

local T = {
    Russian = {
        Window = "❄️ WINTER",
        Teleport = "📍 Телепорт",
        SetPoint = "📍 Поставить точку",
        TP = "✈️ Телепорт к точке",
        Languages = "🌐 Языки",
        Select = "Выбрать язык",
        Apply = "✅ Применить язык",
        Social = "🌐 Социальные сети",
        FunPay = "🛒 FunPay",
        Credits = "👑 Кредиты",
        SetOK = "Точка поставлена :Þ",
        TPOK = "Телепортация сделана",
        Applied = "Русский язык применён"
    },

    English = {
        Window = "❄️ WINTER",
        Teleport = "📍 Teleport",
        SetPoint = "📍 Set Point",
        TP = "✈️ TP to Point",
        Languages = "🌐 Languages",
        Select = "Select language",
        Apply = "✅ Apply Language",
        Social = "🌐 Social Networks",
        FunPay = "🛒 FunPay",
        Credits = "👑 Credits",
        SetOK = "Point set :Þ",
        TPOK = "Teleportation complete",
        Applied = "English language applied"
    },

    German = {
        Window = "❄️ WINTER",
        Teleport = "📍 Teleport",
        SetPoint = "📍 Punkt setzen",
        TP = "✈️ Zum Punkt",
        Languages = "🌐 Sprachen",
        Select = "Sprache auswählen",
        Apply = "✅ Sprache anwenden",
        Social = "🌐 Soziale Netzwerke",
        FunPay = "🛒 FunPay",
        Credits = "👑 Credits",
        SetOK = "Punkt gesetzt :Þ",
        TPOK = "Teleportation abgeschlossen",
        Applied = "Deutsch angewendet"
    },

    Spanish = {
        Window = "❄️ WINTER",
        Teleport = "📍 Teletransporte",
        SetPoint = "📍 Establecer punto",
        TP = "✈️ Ir al punto",
        Languages = "🌐 Idiomas",
        Select = "Seleccionar idioma",
        Apply = "✅ Aplicar idioma",
        Social = "🌐 Redes sociales",
        FunPay = "🛒 FunPay",
        Credits = "👑 Créditos",
        SetOK = "Punto establecido :Þ",
        TPOK = "Teletransporte completado",
        Applied = "Español aplicado"
    },

    French = {
        Window = "❄️ WINTER",
        Teleport = "📍 Téléportation",
        SetPoint = "📍 Définir le point",
        TP = "✈️ Aller au point",
        Languages = "🌐 Langues",
        Select = "Choisir la langue",
        Apply = "✅ Appliquer la langue",
        Social = "🌐 Réseaux sociaux",
        FunPay = "🛒 FunPay",
        Credits = "👑 Crédits",
        SetOK = "Point défini :Þ",
        TPOK = "Téléportation terminée",
        Applied = "Français appliqué"
    },

    Portuguese = {
        Window = "❄️ WINTER",
        Teleport = "📍 Teleporte",
        SetPoint = "📍 Definir ponto",
        TP = "✈️ Ir para o ponto",
        Languages = "🌐 Idiomas",
        Select = "Selecionar idioma",
        Apply = "✅ Aplicar idioma",
        Social = "🌐 Redes sociais",
        FunPay = "🛒 FunPay",
        Credits = "👑 Créditos",
        SetOK = "Ponto definido :Þ",
        TPOK = "Teleporte concluído",
        Applied = "Português aplicado"
    },

    Turkish = {
        Window = "❄️ WINTER",
        Teleport = "📍 Teleport",
        SetPoint = "📍 Nokta belirle",
        TP = "✈️ Noktaya git",
        Languages = "🌐 Diller",
        Select = "Dil seç",
        Apply = "✅ Dili uygula",
        Social = "🌐 Sosyal ağlar",
        FunPay = "🛒 FunPay",
        Credits = "👑 Krediler",
        SetOK = "Nokta belirlendi :Þ",
        TPOK = "Işınlanma tamamlandı",
        Applied = "Türkçe uygulandı"
    }
}

local CurrentLanguage = "Russian"

local Window = Rayfield:CreateWindow({
    Name = "❄️ WINTER",
    Icon = 0,
    LoadingTitle = "❄️ WINTER",
    LoadingSubtitle = "Rayfield",
    Theme = "Ocean",
    ConfigurationSaving = {Enabled = false},
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

local function CreateUI(Lang)
    local L = T[Lang]

    local TeleportTab = Window:CreateTab(L.Teleport, "map-pin")

    TeleportTab:CreateButton({
        Name = L.SetPoint,
        Callback = function()
            local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if Root then
                Point = Root.CFrame
                Rayfield:Notify({
                    Title = L.Window,
                    Content = L.SetOK,
                    Duration = 3
                })
            end
        end
    })

    TeleportTab:CreateButton({
        Name = L.TP,
        Callback = function()
            local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if Root and Point then
                Root.CFrame = Point
                Rayfield:Notify({
                    Title = L.Window,
                    Content = L.TPOK,
                    Duration = 3
                })
            end
        end
    })

    local LanguageTab = Window:CreateTab(L.Languages, "languages")

    local LanguageDropdown = LanguageTab:CreateDropdown({
        Name = L.Select,
        Options = {
            "Russian",
            "English",
            "German",
            "Spanish",
            "French",
            "Portuguese",
            "Turkish"
        },
        CurrentOption = {CurrentLanguage},
        MultipleOptions = false,
        Callback = function(Option)
            CurrentLanguage = Option[1] or Option
        end
    })

    LanguageTab:CreateButton({
        Name = L.Apply,
        Callback = function()
            local NewLanguage = CurrentLanguage
            local NewL = T[NewLanguage]

            Rayfield:Notify({
                Title = "🌐",
                Content = NewL.Applied,
                Duration = 2
            })

            task.wait(0.2)

            Window:Destroy()

            Window = Rayfield:CreateWindow({
                Name = NewL.Window,
                Icon = 0,
                LoadingTitle = NewL.Window,
                LoadingSubtitle = "Rayfield",
                Theme = "Ocean",
                ConfigurationSaving = {Enabled = false},
                KeySystem = false
            })

            CreateUI(NewLanguage)
        end
    })

    local SocialTab = Window:CreateTab(L.Social, "globe")

    SocialTab:CreateButton({
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

    local CreditsTab = Window:CreateTab(L.Credits, "users")

    CreditsTab:CreateParagraph({
        Title = "❄️ WINTER",
        Content =
            "Creator: acou090\n" ..
            "Tester: acou090\n" ..
            "Co-creator: ChatGPT\n\n" ..
            "👑 OWNER: @acou090"
    })
end

CreateUI(CurrentLanguage)
