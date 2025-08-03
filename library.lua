local Aurora = {}

function Aurora:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local BlurEffect = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local BorderFrame = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local TitleBar = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local ControlsFrame = Instance.new("Frame")
    local MinimizeButton = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
    local CloseButton = Instance.new("TextButton")
    local UICorner_5 = Instance.new("UICorner")
    local UIListLayout = Instance.new("UIListLayout")
    local TabContainer = Instance.new("Frame")
    local TabList = Instance.new("Frame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local ContentContainer = Instance.new("Frame")
    
    -- Properties
    ScreenGui.Name = "AuroraGUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    MainFrame.BackgroundTransparency = 0.100
    MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0.365, 0, 0.466, 0)
    
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = MainFrame
    
    BlurEffect.Name = "BlurEffect"
    BlurEffect.Parent = MainFrame
    BlurEffect.AnchorPoint = Vector2.new(0.5, 0.5)
    BlurEffect.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    BlurEffect.BackgroundTransparency = 0.300
    BlurEffect.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BlurEffect.BorderSizePixel = 0
    BlurEffect.Position = UDim2.new(0.5, 0, 0.5, 0)
    BlurEffect.Size = UDim2.new(1, 0, 1, 0)
    
    UICorner_2.CornerRadius = UDim.new(0, 16)
    UICorner_2.Parent = BlurEffect
    
    BorderFrame.Name = "BorderFrame"
    BorderFrame.Parent = MainFrame
    BorderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    BorderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BorderFrame.BackgroundTransparency = 1.000
    BorderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BorderFrame.BorderSizePixel = 0
    BorderFrame.Position = UDim2.new(-0.00172413792, 0, -0.00217391294, 0)
    BorderFrame.Size = UDim2.new(-0.00172413792, 0, -0.00217391294, 0)
    
    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(99, 102, 241)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(139, 92, 241)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 182, 212))}
    UIGradient.Parent = BorderFrame
    
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.AnchorPoint = Vector2.new(0.5, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    TitleBar.BackgroundTransparency = 0.200
    TitleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleBar.BorderSizePixel = 0
    TitleBar.Position = UDim2.new(0.5, 0, 0, 0)
    TitleBar.Size = UDim2.new(1, 0, 0.108, 0)
    
    UICorner_3.CornerRadius = UDim.new(0, 16)
    UICorner_3.Parent = TitleBar
    
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1.000
    TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleLabel.BorderSizePixel = 0
    TitleLabel.Position = UDim2.new(0.451, 0, 0.5, 0)
    TitleLabel.Size = UDim2.new(0.714, 0, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 16.000
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    ControlsFrame.Name = "ControlsFrame"
    ControlsFrame.Parent = TitleBar
    ControlsFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    ControlsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ControlsFrame.BackgroundTransparency = 1.000
    ControlsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ControlsFrame.BorderSizePixel = 0
    ControlsFrame.Position = UDim2.new(0.897, 0, 0.54, 0)
    ControlsFrame.Size = UDim2.new(0.129, 0, 0.6, 0)
    
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = ControlsFrame
    MinimizeButton.AnchorPoint = Vector2.new(0.5, 0.5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(251, 191, 36)
    MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Size = UDim2.new(0.428, 0, 1, 0)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 18.000
    
    UICorner_4.Parent = MinimizeButton
    
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = ControlsFrame
    CloseButton.AnchorPoint = Vector2.new(0.5, 0.5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.BorderSizePixel = 0
    CloseButton.Size = UDim2.new(0.428, 0, 1, 0)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 18.000
    
    UICorner_5.Parent = CloseButton
    
    UIListLayout.Parent = ControlsFrame
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.AnchorPoint = Vector2.new(0, 1)
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 0, 1, 0)
    TabContainer.Size = UDim2.new(1, 0, 0.892, 0)
    
    TabList.Name = "TabList"
    TabList.Parent = TabContainer
    TabList.AnchorPoint = Vector2.new(0, 0.5)
    TabList.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    TabList.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabList.BorderSizePixel = 0
    TabList.Position = UDim2.new(0, 0, 0, 0)
    TabList.Size = UDim2.new(0.263, 0, 1, 0)
    
    UIListLayout_2.Parent = TabList
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = TabContainer
    ContentContainer.AnchorPoint = Vector2.new(1, 0)
    ContentContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ContentContainer.BackgroundTransparency = 1.000
    ContentContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Position = UDim2.new(1, 0, 0, 0)
    ContentContainer.Size = UDim2.new(0.736, 0, 1, 0)
    
    -- Scripts
    local TweenService = game:GetService("TweenService")
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 0, 0, 0)}
        )
        tween:Play()
        tween.Completed:Wait()
        ScreenGui:Destroy()
    end)
    
    -- Minimize button functionality
    local minimized = false
    local originalSize = MainFrame.Size
    
    MinimizeButton.MouseButton1Click:Connect(function()
        if minimized then
            TweenService:Create(
                MainFrame,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                {Size = originalSize}
            ):Play()
        else
            TweenService:Create(
                MainFrame,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                {Size = UDim2.new(originalSize.X.Scale, 0, 0, 40)}
            ):Play()
        end
        minimized = not minimized
    end)
    
    -- Dragging functionality
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
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
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Window API
    local Window = {}
    Window.Tabs = {}
    
    function Window:CreateTab(name)
        local Tab = {}
        Tab.Name = name
        
        -- Create tab button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name
        TabButton.Parent = TabList
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(1, 0, 0.122, 0)
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 16.000
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Create content frame
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = name
        TabContent.Parent = ContentContainer
        TabContent.Active = true
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = false
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.ScrollBarThickness = 3
        TabContent.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = TabContent
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)
        
        -- Tab selection logic
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(ContentContainer:GetChildren()) do
                if tab:IsA("ScrollingFrame") then
                    tab.Visible = false
                end
            end
            TabContent.Visible = true
            
            -- Update button colors
            for _, btn in pairs(TabList:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.TextColor3 = btn == TabButton and Color3.fromRGB(255, 255, 255) 
                                     or Color3.fromRGB(200, 200, 200)
                end
            end
        end)
        
        -- Set first tab as active
        if #TabList:GetChildren() == 1 then
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabContent.Visible = true
        end
        
        -- Tab methods
        function Tab:CreateButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Name = text
            Button.Parent = TabContent
            Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            Button.BackgroundTransparency = 0.2
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, -10, 0, 35)
            Button.Font = Enum.Font.Gotham
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14.000
            
            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 6)
            UICorner.Parent = Button
            
            Button.MouseButton1Click:Connect(callback)
            
            -- Update canvas size
            TabContent.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
            UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                TabContent.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
            end)
            
            return Button
        end
        
        table.insert(Window.Tabs, Tab)
        return Tab
    end
    
    return Window
end

return Aurora
