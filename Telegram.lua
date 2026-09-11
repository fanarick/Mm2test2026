local Rayfield = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"
))()

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

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Point = nil

-- 📍 TELEPORT
local TeleportTab = Window:CreateTab("📍 Teleport", "map-pin")

TeleportTab:CreateButton({
    Name = "📍 Set Point",
    Callback = function()
        local Character = Player.Character
        local Root = Character and Character:FindFirstChild("HumanoidRootPart")

        if Root then
            Point = Root.CFrame

            Rayfield:Notify({
                Title = "❄️ WINTER",
                Content = "Point set :Þ",
                Duration = 3
            })
        end
    end
})

TeleportTab:CreateButton({
    Name = "✈️ TP To Point",
    Callback = function()
        local Character = Player.Character
        local Root = Character and Character:FindFirstChild("HumanoidRootPart")

        if Root and Point then
            Root.CFrame = Point

            Rayfield:Notify({
                Title = "❄️ WINTER",
                Content = "Teleportation complete!",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "❄️ WINTER",
                Content = "Set a point first!",
                Duration = 3
            })
        end
    end
})

-- 🌐 SOCIAL NETWORKS
local SocialTab = Window:CreateTab("🌐 Social Networks", "globe")

SocialTab:CreateButton({
    Name = "🛒 FunPay",
    Callback = function()
        local Link = "https://funpay.com/users/16761126/"

        if setclipboard then
            setclipboard(Link)

            Rayfield:Notify({
                Title = "🌐 FunPay",
                Content = "Link copied!",
                Duration = 3
            })
        end
    end
})

-- 👑 CREDITS
local CreditsTab = Window:CreateTab("👑 Credits", "users")

CreditsTab:CreateParagraph({
    Title = "❄️ WINTER TEAM",
    Content =
        "Creator: acou090\n" ..
        "Tester: acou090\n" ..
        "Co-creator: ChatGPT\n" ..
        "Owner: acou090"
})

Rayfield:Notify({
    Title = "❄️ WINTER",
    Content = "Script loaded successfully!",
    Duration = 3
})
