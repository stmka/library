-- Aurora GUI Library - Complete Version
-- Beautiful, modern GUI library for Lua
-- Contains: Main Library + Tab System + Elements + Notifications
-- Created with glass morphism effects and smooth animations

-- ========================================
-- MAIN AURORA LIBRARY
-- ========================================

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Aurora = {}
Aurora.__index = Aurora

-- Theme Configuration
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
    }
}

-- Create Window
function Aurora:CreateWindow(config)
    local window = {
        Title = config.Title or "Aurora GUI",
        Theme = config.Theme or "Dark",
        Size = config.Size or UDim2.new(0, 580, 0, 460),
        Position = config.Position or UDim2.new(0.5, -290, 0.5, -230),
        Draggable = config.Draggable ~= false,
        MinimizeButton = config.MinimizeButton ~= false,
        CloseButton = config.CloseButton ~= false
    }
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AuroraGUI"
    screenGui.Parent = game.CoreGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Parent = screenGui
    mainFrame.BackgroundColor3 = Themes[window.Theme].Surface
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.BorderSizePixel = 0
    mainFrame.Position = window.Position
    mainFrame.Size = window.Size
    mainFrame.ClipsDescendants = true
    
    -- Rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = mainFrame
    
    -- Glass effect
    local blur = Instance.new("Frame")
    blur.Name = "BlurEffect"
    blur.Parent = mainFrame
    blur.BackgroundColor3 = Themes[window.Theme].Background
    blur.BackgroundTransparency = 0.3
    blur.BorderSizePixel = 0
    blur.Size = UDim2.new(1, 0, 1, 0)
    
    local blurCorner = Instance.new("UICorner")
    blurCorner.CornerRadius = UDim.new(0, 16)
    blurCorner.Parent = blur
    
    -- Border stroke
    local borderStroke = Instance.new("UIStroke")
    borderStroke.Color = Themes[window.Theme].Primary
    borderStroke.Thickness = 1
    borderStroke.Transparency = 0.5
    borderStroke.Parent = mainFrame
    
    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Parent = mainFrame
    titleBar.BackgroundColor3 = Themes[window.Theme].Surface
    titleBar.BackgroundTransparency = 0.2
    titleBar.BorderSizePixel = 0
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 16)
    titleCorner.Parent = titleBar
    
    -- Title text
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = titleBar
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 20, 0, 0)
    titleLabel.Size = UDim2.new(1, -100, 1, 0)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = window.Title
    titleLabel.TextColor3 = Themes[window.Theme].Text
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Control buttons frame
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "ControlsFrame"
    controlsFrame.Parent = titleBar
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.Position = UDim2.new(1, -80, 0, 10)
    controlsFrame.Size = UDim2.new(0, 70, 0, 30)
    
    local controlsLayout = Instance.new("UIListLayout")
    controlsLayout.Parent = controlsFrame
    controlsLayout.FillDirection = Enum.FillDirection.Horizontal
    controlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    controlsLayout.Padding = UDim.new(0, 5)
    
    -- Minimize button
    if window.MinimizeButton then
        local minimizeBtn = Instance.new("TextButton")
        minimizeBtn.Name = "MinimizeButton"
        minimizeBtn.Parent = controlsFrame
        minimizeBtn.BackgroundColor3 = Themes[window.Theme].Warning
        minimizeBtn.BorderSizePixel = 0
        minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
        minimizeBtn.Text = "−"
        minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        minimizeBtn.TextSize = 18
        minimizeBtn.Font = Enum.Font.GothamBold
        
        local minCorner = Instance.new("UICorner")
        minCorner.CornerRadius = UDim.new(0, 8)
        minCorner.Parent = minimizeBtn
    end
    
    -- Close button
    if window.CloseButton then
        local closeBtn = Instance.new("TextButton")
        closeBtn.Name = "CloseButton"
        closeBtn.Parent = controlsFrame
        closeBtn.BackgroundColor3 = Themes[window.Theme].Error
        closeBtn.BorderSizePixel = 0
        closeBtn.Size = UDim2.new(0, 30, 0, 30)
        closeBtn.Text = "×"
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeBtn.TextSize = 18
        closeBtn.Font = Enum.Font.GothamBold
        
        local closeCorner = Instance.new("UICorner")
        closeCorner.CornerRadius = UDim.new(0, 8)
        closeCorner.Parent = closeBtn
        
        closeBtn.MouseButton1Click:Connect(function()
            screenGui:Destroy()
        end)
    end
    
    -- Content frame
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Parent = mainFrame
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.Position = UDim2.new(0, 0, 0, 50)
    contentFrame.Size = UDim2.new(1, 0, 1, -50)
    contentFrame.ScrollBarThickness = 6
    contentFrame.ScrollBarImageColor3 = Themes[window.Theme].Primary
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    -- Auto-resize canvas
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Parent = contentFrame
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        contentFrame.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Dragging functionality
    if window.Draggable then
        local dragging = false
        local dragInput, mousePos, framePos
        
        titleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                mousePos = input.Position
                framePos = mainFrame.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        titleBar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - mousePos
                mainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            end
        end)
    end
    
    window.ScreenGui = screenGui
    window.MainFrame = mainFrame
    window.ContentFrame = contentFrame
    window.Theme = Themes[window.Theme]
    
    return window
end

-- ========================================
-- TAB SYSTEM
-- ========================================

function Window:CreateTab(config)
    local tab = {
        Name = config.Name or "Tab",
        Icon = config.Icon or "rbxasset://textures/ui/GuiImagePlaceholder.png"
    }
    
    -- Tab content frame
    local tabContent = Instance.new("ScrollingFrame")
    tabContent.Name = tab.Name .. "Content"
    tabContent.Parent = self.ContentFrame
    tabContent.BackgroundTransparency = 1
    tabContent.BorderSizePixel = 0
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.ScrollBarThickness = 6
    tabContent.ScrollBarImageColor3 = self.Theme.Primary
    tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Parent = tabContent
    tabLayout.Padding = UDim.new(0, 8)
    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    -- Auto-resize canvas
    tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabContent.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y + 20)
    end)
    
    tab.Content = tabContent
    tab.Layout = tabLayout
    
    return tab
end

-- ========================================
-- GUI ELEMENTS
-- ========================================

function Tab:CreateButton(config)
    local button = Instance.new("TextButton")
    button.Name = config.Name or "Button"
    button.Parent = self.Content
    button.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    button.BorderSizePixel = 0
    button.Size = UDim2.new(1, -40, 0, 45)
    button.Font = Enum.Font.GothamMedium
    button.Text = config.Text or "Button"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 12)
    buttonCorner.Parent = button
    
    -- Gradient effect
    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(99, 102, 241)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 92, 246))
    }
    buttonGradient.Rotation = 45
    buttonGradient.Parent = button
    
    -- Hover effect
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -35, 0, 45)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -40, 0, 45)
        }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        if config.Callback then
            config.Callback()
        end
    end)
    
    return button
end

function Tab:CreateToggle(config)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = config.Name or "Toggle"
    toggleFrame.Parent = self.Content
    toggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Size = UDim2.new(1, -40, 0, 50)
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 12)
    toggleCorner.Parent = toggleFrame
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Parent = toggleFrame
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Position = UDim2.new(0, 15, 0, 0)
    toggleLabel.Size = UDim2.new(1, -80, 1, 0)
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.Text = config.Text or "Toggle"
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.TextSize = 14
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Toggle switch
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = toggleFrame
    toggleButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.new(1, -60, 0.5, -12)
    toggleButton.Size = UDim2.new(0, 50, 0, 24)
    toggleButton.Text = ""
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(0, 12)
    switchCorner.Parent = toggleButton
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Parent = toggleButton
    toggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    toggleCircle.BorderSizePixel = 0
    toggleCircle.Position = UDim2.new(0, 2, 0, 2)
    toggleCircle.Size = UDim2.new(0, 20, 0, 20)
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(0, 10)
    circleCorner.Parent = toggleCircle
    
    local isToggled = config.Default or false
    
    local function updateToggle()
        if isToggled then
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(99, 102, 241)
            }):Play()
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 28, 0, 2),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        else
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(55, 55, 65)
            }):Play()
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 2, 0, 2),
                BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            }):Play()
        end
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        updateToggle()
        if config.Callback then
            config.Callback(isToggled)
        end
    end)
    
    updateToggle()
    
    return {
        Frame = toggleFrame,
        SetValue = function(value)
            isToggled = value
            updateToggle()
        end
    }
end

function Tab:CreateSlider(config)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = config.Name or "Slider"
    sliderFrame.Parent = self.Content
    sliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Size = UDim2.new(1, -40, 0, 70)
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 12)
    sliderCorner.Parent = sliderFrame
    
    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Parent = sliderFrame
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Position = UDim2.new(0, 15, 0, 5)
    sliderLabel.Size = UDim2.new(1, -30, 0, 25)
    sliderLabel.Font = Enum.Font.Gotham
    sliderLabel.Text = config.Text or "Slider"
    sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderLabel.TextSize = 14
    sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = sliderFrame
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(1, -80, 0, 5)
    valueLabel.Size = UDim2.new(0, 65, 0, 25)
    valueLabel.Font = Enum.Font.GothamMedium
    valueLabel.Text = tostring(config.Default or config.Min or 0)
    valueLabel.TextColor3 = Color3.fromRGB(99, 102, 241)
    valueLabel.TextSize = 14
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    -- Slider track
    local sliderTrack = Instance.new("Frame")
    sliderTrack.Parent = sliderFrame
    sliderTrack.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    sliderTrack.BorderSizePixel = 0
    sliderTrack.Position = UDim2.new(0, 15, 0, 40)
    sliderTrack.Size = UDim2.new(1, -30, 0, 6)
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 3)
    trackCorner.Parent = sliderTrack
    
    -- Slider fill
    local sliderFill = Instance.new("Frame")
    sliderFill.Parent = sliderTrack
    sliderFill.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    sliderFill.BorderSizePixel = 0
    sliderFill.Size = UDim2.new(0, 0, 1, 0)
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3)
    fillCorner.Parent = sliderFill
    
    -- Slider handle
    local sliderHandle = Instance.new("Frame")
    sliderHandle.Parent = sliderFrame
    sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderHandle.BorderSizePixel = 0
    sliderHandle.Position = UDim2.new(0, 12, 0, 37)
    sliderHandle.Size = UDim2.new(0, 12, 0, 12)
    
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(0, 6)
    handleCorner.Parent = sliderHandle
    
    local min = config.Min or 0
    local max = config.Max or 100
    local default = config.Default or min
    local currentValue = default
    
    local function updateSlider(value)
        currentValue = math.clamp(value, min, max)
        local percentage = (currentValue - min) / (max - min)
        
        sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
        sliderHandle.Position = UDim2.new(percentage, 9, 0, 37)
        valueLabel.Text = tostring(math.floor(currentValue))
        
        if config.Callback then
            config.Callback(currentValue)
        end
    end
    
    local dragging = false
    
    sliderHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mouse = Players.LocalPlayer:GetMouse()
            local trackPosition = sliderTrack.AbsolutePosition.X
            local trackSize = sliderTrack.AbsoluteSize.X
            local mouseX = mouse.X
            
            local percentage = math.clamp((mouseX - trackPosition) / trackSize, 0, 1)
            local value = min + (percentage * (max - min))
            updateSlider(value)
        end
    end)
    
    updateSlider(default)
    
    local slider = {
        Frame = sliderFrame,
        SetValue = updateSlider
    }
    
    return slider
end

-- ========================================
-- NOTIFICATION SYSTEM
-- ========================================

function Aurora:Notify(config)
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Parent = game.CoreGui
    notification.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    notification.BorderSizePixel = 0
    notification.Position = UDim2.new(1, 20, 0, 20)
    notification.Size = UDim2.new(0, 350, 0, 80)
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 12)
    notifCorner.Parent = notification
    
    -- Notification content
    local title = Instance.new("TextLabel")
    title.Parent = notification
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 15, 0, 10)
    title.Size = UDim2.new(1, -30, 0, 25)
    title.Font = Enum.Font.GothamBold
    title.Text = config.Title or "Notification"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local content = Instance.new("TextLabel")
    content.Parent = notification
    content.BackgroundTransparency = 1
    content.Position = UDim2.new(0, 15, 0, 35)
    content.Size = UDim2.new(1, -30, 0, 35)
    content.Font = Enum.Font.Gotham
    content.Text = config.Content or "This is a notification"
    content.TextColor3 = Color3.fromRGB(156, 163, 175)
    content.TextSize = 14
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextWrapped = true
    
    -- Slide in animation
    local slideIn = TweenService:Create(
        notification,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -370, 0, 20)}
    )
    slideIn:Play()
    
    -- Auto dismiss
    spawn(function()
        wait(config.Duration or 5)
        local slideOut = TweenService:Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Position = UDim2.new(1, 20, 0, 20)}
        )
        slideOut:Play()
        
        slideOut.Completed:Connect(function()
            notification:Destroy()
        end)
    end)
end
