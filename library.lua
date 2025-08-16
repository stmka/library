-- GuiLibrary (ModuleScript in ReplicatedStorage)

local Library = {}
Library.__index = Library

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- CONFIG
local CONFIG = {
    Theme = "dark",
    AccentColor = Color3.fromRGB(124, 58, 237),
    BorderRadius = 12,
    Transparency = 0.08,
    Animations = true
}

local THEMES = {
    dark = {
        Background = Color3.fromRGB(20, 24, 33),
        WindowBg = Color3.fromRGB(30, 34, 45),
        SidebarBg = Color3.fromRGB(25, 29, 40),
        Text = Color3.fromRGB(255, 255, 255),
        Secondary = Color3.fromRGB(170, 170, 170),
        Border = Color3.fromRGB(60, 65, 80)
    }
}

-- WINDOW CREATION
function Library:CreateWindow(title, subtitle)
    local Window = {}
    Window.Tabs = {}

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "GuiLibrary"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 650, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -325, 0.5, -200)
    MainFrame.BackgroundColor3 = THEMES[CONFIG.Theme].WindowBg
    MainFrame.BackgroundTransparency = CONFIG.Transparency
    MainFrame.BorderSizePixel = 0

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, CONFIG.BorderRadius)
    Instance.new("UIStroke", MainFrame).Color = THEMES[CONFIG.Theme].Border

    -- HEADER
    local Header = Instance.new("Frame")
    Header.Parent = MainFrame
    Header.Size = UDim2.new(1, 0, 0, 50)
    Header.BackgroundColor3 = CONFIG.AccentColor
    Header.BorderSizePixel = 0
    Instance.new("UICorner", Header).CornerRadius = UDim.new(0, CONFIG.BorderRadius)

    local Title = Instance.new("TextLabel")
    Title.Parent = Header
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 5)
    Title.Size = UDim2.new(1, -20, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title or "Window"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Subtitle = Instance.new("TextLabel")
    Subtitle.Parent = Header
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.new(0, 15, 0, 25)
    Subtitle.Size = UDim2.new(1, -20, 0, 20)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Text = subtitle or "Subtitle"
    Subtitle.TextColor3 = Color3.fromRGB(230, 230, 230)
    Subtitle.TextTransparency = 0.3
    Subtitle.TextSize = 14
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left

    -- SIDEBAR
    local Sidebar = Instance.new("Frame")
    Sidebar.Parent = MainFrame
    Sidebar.Size = UDim2.new(0, 150, 1, -50)
    Sidebar.Position = UDim2.new(0, 0, 0, 50)
    Sidebar.BackgroundColor3 = THEMES[CONFIG.Theme].SidebarBg
    Sidebar.BorderSizePixel = 0

    local SidebarList = Instance.new("UIListLayout")
    SidebarList.Parent = Sidebar
    SidebarList.Padding = UDim.new(0, 6)
    SidebarList.SortOrder = Enum.SortOrder.LayoutOrder

    -- CONTENT
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Parent = MainFrame
    ContentFrame.Size = UDim2.new(1, -150, 1, -50)
    ContentFrame.Position = UDim2.new(0, 150, 0, 50)
    ContentFrame.BackgroundTransparency = 1

    -- DRAGGING
    local dragging, dragStart, startPos
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                           startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- CREATE TAB
    function Window:CreateTab(name, icon)
        local Tab = {}

        local Button = Instance.new("TextButton")
        Button.Parent = Sidebar
        Button.Size = UDim2.new(1, -10, 0, 35)
        Button.BackgroundColor3 = THEMES[CONFIG.Theme].Border
        Button.Text = (icon or "📄") .. " " .. name
        Button.Font = Enum.Font.Gotham
        Button.TextColor3 = THEMES[CONFIG.Theme].Text
        Button.TextSize = 16
        Button.TextXAlignment = Enum.TextXAlignment.Left
        Button.BackgroundTransparency = 0.3
        Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

        local TabFrame = Instance.new("ScrollingFrame")
        TabFrame.Parent = ContentFrame
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.BackgroundTransparency = 1
        TabFrame.Visible = false
        TabFrame.ScrollBarThickness = 4
        TabFrame.ScrollBarImageColor3 = CONFIG.AccentColor

        local Layout = Instance.new("UIListLayout")
        Layout.Parent = TabFrame
        Layout.Padding = UDim.new(0, 10)
        Layout.SortOrder = Enum.SortOrder.LayoutOrder

        local Padding = Instance.new("UIPadding")
        Padding.Parent = TabFrame
        Padding.PaddingTop = UDim.new(0, 15)
        Padding.PaddingLeft = UDim.new(0, 15)
        Padding.PaddingRight = UDim.new(0, 15)

        Button.MouseButton1Click:Connect(function()
            for _, child in pairs(ContentFrame:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    child.Visible = false
                end
            end
            for _, b in pairs(Sidebar:GetChildren()) do
                if b:IsA("TextButton") then
                    b.BackgroundTransparency = 0.3
                end
            end
            Button.BackgroundTransparency = 0
            TabFrame.Visible = true
        end)

        function Tab:CreateSection(name)
            local Section = {}
            local Frame = Instance.new("Frame")
            Frame.Parent = TabFrame
            Frame.Size = UDim2.new(1, 0, 0, 50)
            Frame.BackgroundColor3 = THEMES[CONFIG.Theme].Background
            Frame.BorderSizePixel = 0
            Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

            local Label = Instance.new("TextLabel")
            Label.Parent = Frame
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, -10, 0, 25)
            Label.Position = UDim2.new(0, 10, 0, 5)
            Label.Font = Enum.Font.GothamBold
            Label.Text = name
            Label.TextColor3 = THEMES[CONFIG.Theme].Text
            Label.TextSize = 16
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local Layout = Instance.new("UIListLayout")
            Layout.Parent = Frame
            Layout.SortOrder = Enum.SortOrder.LayoutOrder
            Layout.Padding = UDim.new(0, 8)

            local Padding = Instance.new("UIPadding")
            Padding.Parent = Frame
            Padding.PaddingTop = UDim.new(0, 30)
            Padding.PaddingLeft = UDim.new(0, 10)
            Padding.PaddingRight = UDim.new(0, 10)

            function Section:CreateButton(text, callback)
                local Btn = Instance.new("TextButton")
                Btn.Parent = Frame
                Btn.Size = UDim2.new(1, 0, 0, 35)
                Btn.BackgroundColor3 = CONFIG.AccentColor
                Btn.Text = text
                Btn.Font = Enum.Font.Gotham
                Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Btn.TextSize = 16
                Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
                Btn.MouseButton1Click:Connect(callback or function() end)
                return Btn
            end

            function Section:CreateToggle(text, default, callback)
                local ToggleBtn = Instance.new("TextButton")
                ToggleBtn.Parent = Frame
                ToggleBtn.Size = UDim2.new(1, 0, 0, 35)
                ToggleBtn.BackgroundColor3 = THEMES[CONFIG.Theme].Border
                ToggleBtn.Text = text .. (default and " [ON]" or " [OFF]")
                ToggleBtn.Font = Enum.Font.Gotham
                ToggleBtn.TextSize = 16
                ToggleBtn.TextColor3 = THEMES[CONFIG.Theme].Text
                Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

                local toggled = default
                ToggleBtn.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    ToggleBtn.Text = text .. (toggled and " [ON]" or " [OFF]")
                    if callback then callback(toggled) end
                end)
            end

            return Section
        end

        if #Window.Tabs == 0 then
            Button.BackgroundTransparency = 0
            TabFrame.Visible = true
        end

        table.insert(Window.Tabs, Tab)
        return Tab
    end

    return Window
end

return Library
