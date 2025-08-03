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

return Aurora`;

  const tabCode = `-- 📑 Tab System
function Window:CreateTab(config)
    local Tab = {
        Name = config.Name or "Tab",
        Icon = config.Icon or "rbxasset://textures/ui/GuiImagePlaceholder.png",
        PremiumOnly = config.PremiumOnly or false
    }
    
    -- Tab Button
    local TabButton = Instance.new("TextButton")
    TabButton.Name = Tab.Name .. "Tab"
    TabButton.Parent = self.TabsFrame
    TabButton.BackgroundColor3 = self.Theme.Surface
    TabButton.BackgroundTransparency = 0.3
    TabButton.BorderSizePixel = 0
    TabButton.Size = UDim2.new(1, -20, 0, 45)
    TabButton.Font = Enum.Font.Gotham
    TabButton.Text = "  " .. Tab.Name
    TabButton.TextColor3 = self.Theme.TextSecondary
    TabButton.TextSize = 14
    TabButton.TextXAlignment = Enum.TextXAlignment.Left
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 12)
    TabCorner.Parent = TabButton
    
    -- Tab Icon
    local TabIcon = Instance.new("ImageLabel")
    TabIcon.Name = "TabIcon"
    TabIcon.Parent = TabButton
    TabIcon.BackgroundTransparency = 1
    TabIcon.Position = UDim2.new(0, 15, 0.5, -10)
    TabIcon.Size = UDim2.new(0, 20, 0, 20)
    TabIcon.Image = Tab.Icon
    TabIcon.ImageColor3 = self.Theme.TextSecondary
    
    -- Tab Content Frame
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Name = Tab.Name .. "Content"
    TabContent.Parent = self.ContentFrame
    TabContent.BackgroundTransparency = 1
    TabContent.BorderSizePixel = 0
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.ScrollBarThickness = 6
    TabContent.ScrollBarImageColor3 = self.Theme.Primary
    TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContent.Visible = false
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Parent = TabContent
    TabLayout.Padding = UDim.new(0, 8)
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    -- Auto-resize canvas
    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContent.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Tab Selection Logic
    TabButton.MouseButton1Click:Connect(function()
        -- Hide all tabs
        for _, child in pairs(self.ContentFrame:GetChildren()) do
            if child:IsA("ScrollingFrame") then
                child.Visible = false
            end
        end
        
        -- Reset all tab buttons
        for _, button in pairs(self.TabsFrame:GetChildren()) do
            if button:IsA("TextButton") then
                button.BackgroundTransparency = 0.3
                button.TextColor3 = self.Theme.TextSecondary
                if button:FindFirstChild("TabIcon") then
                    button.TabIcon.ImageColor3 = self.Theme.TextSecondary
                end
            end
        end
        
        -- Activate selected tab
        TabContent.Visible = true
        TabButton.BackgroundTransparency = 0
        TabButton.TextColor3 = self.Theme.Text
        TabIcon.ImageColor3 = self.Theme.Primary
        
        -- Smooth animation
        local TweenService = game:GetService("TweenService")
        local tween = TweenService:Create(
            TabButton,
            TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            {BackgroundColor3 = self.Theme.Primary}
        )
        tween:Play()
    end)
    
    Tab.Button = TabButton
    Tab.Content = TabContent
    Tab.Layout = TabLayout
    
    return Tab
end`;

  const elementsCode = `-- 🎛️ GUI Elements
function Tab:CreateButton(config)
    local Button = Instance.new("TextButton")
    Button.Name = config.Name or "Button"
    Button.Parent = self.Content
    Button.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(1, -40, 0, 45)
    Button.Font = Enum.Font.GothamMedium
    Button.Text = config.Text or "Button"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 12)
    ButtonCorner.Parent = Button
    
    -- Gradient Effect
    local ButtonGradient = Instance.new("UIGradient")
    ButtonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(99, 102, 241)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 92, 246))
    }
    ButtonGradient.Rotation = 45
    ButtonGradient.Parent = Button
    
    -- Hover Effect
    Button.MouseEnter:Connect(function()
        local TweenService = game:GetService("TweenService")
        TweenService:Create(Button, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -35, 0, 45)
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        local TweenService = game:GetService("TweenService")
        TweenService:Create(Button, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -40, 0, 45)
        }):Play()
    end)
    
    Button.MouseButton1Click:Connect(function()
        if config.Callback then
            config.Callback()
        end
    end)
    
    return Button
end

function Tab:CreateToggle(config)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = config.Name or "Toggle"
    ToggleFrame.Parent = self.Content
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Size = UDim2.new(1, -40, 0, 50)
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 12)
    ToggleCorner.Parent = ToggleFrame
    
    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Parent = ToggleFrame
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
    ToggleLabel.Size = UDim2.new(1, -80, 1, 0)
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.Text = config.Text or "Toggle"
    ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabel.TextSize = 14
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Toggle Switch
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Parent = ToggleFrame
    ToggleButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Position = UDim2.new(1, -60, 0.5, -12)
    ToggleButton.Size = UDim2.new(0, 50, 0, 24)
    ToggleButton.Text = ""
    
    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(0, 12)
    SwitchCorner.Parent = ToggleButton
    
    local ToggleCircle = Instance.new("Frame")
    ToggleCircle.Parent = ToggleButton
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    ToggleCircle.BorderSizePixel = 0
    ToggleCircle.Position = UDim2.new(0, 2, 0, 2)
    ToggleCircle.Size = UDim2.new(0, 20, 0, 20)
    
    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(0, 10)
    CircleCorner.Parent = ToggleCircle
    
    local isToggled = config.Default or false
    
    local function updateToggle()
        local TweenService = game:GetService("TweenService")
        if isToggled then
            TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(99, 102, 241)
            }):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 28, 0, 2),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        else
            TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(55, 55, 65)
            }):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 2, 0, 2),
                BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            }):Play()
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        updateToggle()
        if config.Callback then
            config.Callback(isToggled)
        end
    end)
    
    updateToggle()
    
    return {
        Frame = ToggleFrame,
        SetValue = function(value)
            isToggled = value
            updateToggle()
        end
    }
end

function Tab:CreateSlider(config)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = config.Name or "Slider"
    SliderFrame.Parent = self.Content
    SliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Size = UDim2.new(1, -40, 0, 70)
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 12)
    SliderCorner.Parent = SliderFrame
    
    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Parent = SliderFrame
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Position = UDim2.new(0, 15, 0, 5)
    SliderLabel.Size = UDim2.new(1, -30, 0, 25)
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.Text = config.Text or "Slider"
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.TextSize = 14
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Parent = SliderFrame
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Position = UDim2.new(1, -80, 0, 5)
    ValueLabel.Size = UDim2.new(0, 65, 0, 25)
    ValueLabel.Font = Enum.Font.GothamMedium
    ValueLabel.Text = tostring(config.Default or config.Min or 0)
    ValueLabel.TextColor3 = Color3.fromRGB(99, 102, 241)
    ValueLabel.TextSize = 14
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    -- Slider Track
    local SliderTrack = Instance.new("Frame")
    SliderTrack.Parent = SliderFrame
    SliderTrack.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    SliderTrack.BorderSizePixel = 0
    SliderTrack.Position = UDim2.new(0, 15, 0, 40)
    SliderTrack.Size = UDim2.new(1, -30, 0, 6)
    
    local TrackCorner = Instance.new("UICorner")
    TrackCorner.CornerRadius = UDim.new(0, 3)
    TrackCorner.Parent = SliderTrack
    
    -- Slider Fill
    local SliderFill = Instance.new("Frame")
    SliderFill.Parent = SliderTrack
    SliderFill.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    SliderFill.BorderSizePixel = 0
    SliderFill.Size = UDim2.new(0, 0, 1, 0)
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0, 3)
    FillCorner.Parent = SliderFill
    
    -- Slider Handle
    local SliderHandle = Instance.new("Frame")
    SliderHandle.Parent = SliderFrame
    SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderHandle.BorderSizePixel = 0
    SliderHandle.Position = UDim2.new(0, 12, 0, 37)
    SliderHandle.Size = UDim2.new(0, 12, 0, 12)
    
    local HandleCorner = Instance.new("UICorner")
    HandleCorner.CornerRadius = UDim.new(0, 6)
    HandleCorner.Parent = SliderHandle
    
    local min = config.Min or 0
    local max = config.Max or 100
    local default = config.Default or min
    local currentValue = default
    
    local function updateSlider(value)
        currentValue = math.clamp(value, min, max)
        local percentage = (currentValue - min) / (max - min)
        
        SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
        SliderHandle.Position = UDim2.new(percentage, 9, 0, 37)
        ValueLabel.Text = tostring(math.floor(currentValue))
        
        if config.Callback then
            config.Callback(currentValue)
        end
    end
    
    local dragging = false
    
    SliderHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mouse = game.Players.LocalPlayer:GetMouse()
            local trackPosition = SliderTrack.AbsolutePosition.X
            local trackSize = SliderTrack.AbsoluteSize.X
            local mouseX = mouse.X
            
            local percentage = math.clamp((mouseX - trackPosition) / trackSize, 0, 1)
            local value = min + (percentage * (max - min))
            updateSlider(value)
        end
    end)
    
    updateSlider(default)
    
    return {
        Frame = SliderFrame,
        SetValue = updateSlider
    }
end`;

  const notificationCode = `-- 🔔 Notification System
local Notifications = {}

function Aurora:CreateNotification(config)
    local NotificationGui = Instance.new("ScreenGui")
    NotificationGui.Name = "AuroraNotification"
    NotificationGui.Parent = game.CoreGui
    
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Parent = NotificationGui
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Position = UDim2.new(1, 20, 0, 20)
    NotificationFrame.Size = UDim2.new(0, 350, 0, 80)
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 12)
    NotifCorner.Parent = NotificationFrame
    
    -- Notification Icon
    local NotifIcon = Instance.new("Frame")
    NotifIcon.Parent = NotificationFrame
    NotifIcon.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    NotifIcon.BorderSizePixel = 0
    NotifIcon.Position = UDim2.new(0, 15, 0.5, -20)
    NotifIcon.Size = UDim2.new(0, 40, 0, 40)
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 8)
    IconCorner.Parent = NotifIcon
    
    local IconText = Instance.new("TextLabel")
    IconText.Parent = NotifIcon
    IconText.BackgroundTransparency = 1
    IconText.Size = UDim2.new(1, 0, 1, 0)
    IconText.Font = Enum.Font.GothamBold
    IconText.Text = config.Icon or "✨"
    IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
    IconText.TextSize = 20
    
    -- Notification Title
    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Parent = NotificationFrame
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Position = UDim2.new(0, 70, 0, 10)
    NotifTitle.Size = UDim2.new(1, -90, 0, 25)
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.Text = config.Title or "Notification"
    NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifTitle.TextSize = 16
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Notification Content
    local NotifContent = Instance.new("TextLabel")
    NotifContent.Parent = NotificationFrame
    NotifContent.BackgroundTransparency = 1
    NotifContent.Position = UDim2.new(0, 70, 0, 35)
    NotifContent.Size = UDim2.new(1, -90, 0, 35)
    NotifContent.Font = Enum.Font.Gotham
    NotifContent.Text = config.Content or "This is a notification"
    NotifContent.TextColor3 = Color3.fromRGB(156, 163, 175)
    NotifContent.TextSize = 14
    NotifContent.TextXAlignment = Enum.TextXAlignment.Left
    NotifContent.TextWrapped = true
    
    -- Progress Bar
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Parent = NotificationFrame
    ProgressBar.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Position = UDim2.new(0, 0, 1, -3)
    ProgressBar.Size = UDim2.new(1, 0, 0, 3)
    
    -- Slide in animation
    local TweenService = game:GetService("TweenService")
    local slideIn = TweenService:Create(
        NotificationFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -370, 0, 20)}
    )
    slideIn:Play()
    
    -- Progress animation
    local duration = config.Duration or 5
    local progressTween = TweenService:Create(
        ProgressBar,
        TweenInfo.new(duration, Enum.EasingStyle.Linear),
        {Size = UDim2.new(0, 0, 0, 3)}
    )
    progressTween:Play()
    
    -- Auto dismiss
    wait(duration)
    local slideOut = TweenService:Create(
        NotificationFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {Position = UDim2.new(1, 20, 0, 20)}
    )
    slideOut:Play()
    
    slideOut.Completed:Connect(function()
        NotificationGui:Destroy()
    end)
end
