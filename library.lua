-- ✨ Aurora GUI Library ✨
-- Beautiful, Modern, Professional GUI Library for Lua
-- Created with love for the community

local Aurora = {}
Aurora.__index = Aurora

-- 🎨 Theme Configuration
local Themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 23),
        Surface = Color3.fromRGB(25, 25, 35),
        Primary = Color3.fromRGB(99, 102, 241),
        Secondary = Color3.fromRGB(139, 92, 246),
        Accent = Color3.fromRGB(6, 182, 212),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(156, 163, 175),
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(251, 191, 36),
        Error = Color3.fromRGB(239, 68, 68)
    },
    Light = {
        Background = Color3.fromRGB(248, 250, 252),
        Surface = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(99, 102, 241),
        Secondary = Color3.fromRGB(139, 92, 246),
        Accent = Color3.fromRGB(6, 182, 212),
        Text = Color3.fromRGB(15, 23, 42),
        TextSecondary = Color3.fromRGB(100, 116, 139),
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(251, 191, 36),
        Error = Color3.fromRGB(239, 68, 68)
    }
}

-- 🚀 Create New Window
function Aurora:CreateWindow(config)
    local Window = {
        Title = config.Title or "Aurora GUI",
        Theme = config.Theme or "Dark",
        Size = config.Size or UDim2.new(0, 580, 0, 460),
        Position = config.Position or UDim2.new(0.5, -290, 0.5, -230),
        Draggable = config.Draggable ~= false,
        Resizable = config.Resizable or false,
        MinimizeButton = config.MinimizeButton ~= false,
        CloseButton = config.CloseButton ~= false
    }
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AuroraGUI"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Main Frame with Glass Effect
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Themes[Window.Theme].Surface
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = Window.Position
    MainFrame.Size = Window.Size
    MainFrame.ClipsDescendants = true
    
    -- Rounded Corners
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 16)
    Corner.Parent = MainFrame
    
    -- Glass Effect
    local Blur = Instance.new("Frame")
    Blur.Name = "BlurEffect"
    Blur.Parent = MainFrame
    Blur.BackgroundColor3 = Themes[Window.Theme].Background
    Blur.BackgroundTransparency = 0.3
    Blur.BorderSizePixel = 0
    Blur.Size = UDim2.new(1, 0, 1, 0)
    
    local BlurCorner = Instance.new("UICorner")
    BlurCorner.CornerRadius = UDim.new(0, 16)
    BlurCorner.Parent = Blur
    
    -- Gradient Border
    local BorderFrame = Instance.new("Frame")
    BorderFrame.Name = "BorderFrame"
    BorderFrame.Parent = MainFrame
    BorderFrame.BackgroundTransparency = 1
    BorderFrame.Size = UDim2.new(1, 2, 1, 2)
    BorderFrame.Position = UDim2.new(0, -1, 0, -1)
    
    local BorderGradient = Instance.new("UIGradient")
    BorderGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Themes[Window.Theme].Primary),
        ColorSequenceKeypoint.new(0.5, Themes[Window.Theme].Secondary),
        ColorSequenceKeypoint.new(1, Themes[Window.Theme].Accent)
    }
    BorderGradient.Parent = BorderFrame
    
    local BorderStroke = Instance.new("UIStroke")
    BorderStroke.Color = Themes[Window.Theme].Primary
    BorderStroke.Thickness = 1
    BorderStroke.Transparency = 0.5
    BorderStroke.Parent = MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Themes[Window.Theme].Surface
    TitleBar.BackgroundTransparency = 0.2
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 16)
    TitleCorner.Parent = TitleBar
    
    -- Title Text with Gradient
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 20, 0, 0)
    TitleLabel.Size = UDim2.new(1, -100, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = Window.Title
    TitleLabel.TextColor3 = Themes[Window.Theme].Text
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Animated Glow Effect
    local TitleGlow = Instance.new("TextLabel")
    TitleGlow.Name = "TitleGlow"
    TitleGlow.Parent = TitleBar
    TitleGlow.BackgroundTransparency = 1
    TitleGlow.Position = UDim2.new(0, 20, 0, 0)
    TitleGlow.Size = UDim2.new(1, -100, 1, 0)
    TitleGlow.Font = Enum.Font.GothamBold
    TitleGlow.Text = Window.Title
    TitleGlow.TextColor3 = Themes[Window.Theme].Primary
    TitleGlow.TextSize = 16
    TitleGlow.TextTransparency = 0.8
    TitleGlow.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Control Buttons
    local ControlsFrame = Instance.new("Frame")
    ControlsFrame.Name = "ControlsFrame"
    ControlsFrame.Parent = TitleBar
    ControlsFrame.BackgroundTransparency = 1
    ControlsFrame.Position = UDim2.new(1, -80, 0, 10)
    ControlsFrame.Size = UDim2.new(0, 70, 0, 30)
    
    local ControlsLayout = Instance.new("UIListLayout")
    ControlsLayout.Parent = ControlsFrame
    ControlsLayout.FillDirection = Enum.FillDirection.Horizontal
    ControlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ControlsLayout.Padding = UDim.new(0, 5)
    
    -- Minimize Button
    if Window.MinimizeButton then
        local MinimizeBtn = Instance.new("TextButton")
        MinimizeBtn.Name = "MinimizeButton"
        MinimizeBtn.Parent = ControlsFrame
        MinimizeBtn.BackgroundColor3 = Themes[Window.Theme].Warning
        MinimizeBtn.BorderSizePixel = 0
        MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
        MinimizeBtn.Text = "−"
        MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        MinimizeBtn.TextSize = 18
        MinimizeBtn.Font = Enum.Font.GothamBold
        
        local MinCorner = Instance.new("UICorner")
        MinCorner.CornerRadius = UDim.new(0, 8)
        MinCorner.Parent = MinimizeBtn
    end
    
    -- Close Button
    if Window.CloseButton then
        local CloseBtn = Instance.new("TextButton")
        CloseBtn.Name = "CloseButton"
        CloseBtn.Parent = ControlsFrame
        CloseBtn.BackgroundColor3 = Themes[Window.Theme].Error
        CloseBtn.BorderSizePixel = 0
        CloseBtn.Size = UDim2.new(0, 30, 0, 30)
        CloseBtn.Text = "×"
        CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        CloseBtn.TextSize = 18
        CloseBtn.Font = Enum.Font.GothamBold
        
        local CloseCorner = Instance.new("UICorner")
        CloseCorner.CornerRadius = UDim.new(0, 8)
        CloseCorner.Parent = CloseBtn
        
        CloseBtn.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)
    end
    
    -- Content Frame
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Position = UDim2.new(0, 0, 0, 50)
    ContentFrame.Size = UDim2.new(1, 0, 1, -50)
    ContentFrame.ScrollBarThickness = 6
    ContentFrame.ScrollBarImageColor3 = Themes[Window.Theme].Primary
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    -- Auto-resize canvas
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Parent = ContentFrame
    ContentLayout.Padding = UDim.new(0, 10)
    ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Dragging functionality
    if Window.Draggable then
        local dragging = false
        local dragInput, mousePos, framePos
        
        TitleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                mousePos = input.Position
                framePos = MainFrame.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        TitleBar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)
        
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - mousePos
                MainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            end
        end)
    end
    
    Window.ScreenGui = ScreenGui
    Window.MainFrame = MainFrame
    Window.ContentFrame = ContentFrame
    Window.Theme = Themes[Window.Theme]
    
    return Window
end

return Aurora
