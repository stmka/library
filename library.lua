local Aurora = {}

-- Main window creation function
function Aurora:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AuroraGUI"
    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Main container
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0.35, 0, 0.45, 0)
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Gradient border
    local BorderFrame = Instance.new("Frame")
    BorderFrame.Name = "BorderFrame"
    BorderFrame.Parent = MainFrame
    BorderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    BorderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BorderFrame.BackgroundTransparency = 1
    BorderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    BorderFrame.Size = UDim2.new(1.01, 0, 1.01, 0)
    BorderFrame.ZIndex = -1
    
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(99, 102, 241)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(139, 92, 241)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 182, 212))
    }
    UIGradient.Rotation = 45
    UIGradient.Parent = BorderFrame
    
    -- Title bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0.1, 0)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    TitleLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Window controls
    local ControlsFrame = Instance.new("Frame")
    ControlsFrame.Name = "ControlsFrame"
    ControlsFrame.Parent = TitleBar
    ControlsFrame.BackgroundTransparency = 1
    ControlsFrame.Position = UDim2.new(0.85, 0, 0, 0)
    ControlsFrame.Size = UDim2.new(0.15, 0, 1, 0)
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = ControlsFrame
    MinimizeButton.AnchorPoint = Vector2.new(0.5, 0.5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(251, 191, 36)
    MinimizeButton.Position = UDim2.new(0.3, 0, 0.5, 0)
    MinimizeButton.Size = UDim2.new(0.4, 0, 0.6, 0)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 18
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = ControlsFrame
    CloseButton.AnchorPoint = Vector2.new(0.5, 0.5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseButton.Position = UDim2.new(0.7, 0, 0.5, 0)
    CloseButton.Size = UDim2.new(0.4, 0, 0.6, 0)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 18
    
    -- Tab container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundTransparency = 1
    TabContainer.Position = UDim2.new(0, 0, 0.1, 0)
    TabContainer.Size = UDim2.new(1, 0, 0.9, 0)
    
    local TabList = Instance.new("Frame")
    TabList.Name = "TabList"
    TabList.Parent = TabContainer
    TabList.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    TabList.Size = UDim2.new(0.25, 0, 1, 0)
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Parent = TabList
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)
    
    local ContentContainer = Instance.new("ScrollingFrame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = TabContainer
    ContentContainer.AnchorPoint = Vector2.new(1, 0)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(1, 0, 0, 0)
    ContentContainer.Size = UDim2.new(0.75, 0, 1, 0)
    ContentContainer.ScrollBarThickness = 4
    ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Parent = ContentContainer
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 10)
    
    -- Dragging functionality
    local dragging, dragInput, dragStart, startPos
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
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Minimize button functionality
    local minimized = false
    local originalSize = MainFrame.Size
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            MainFrame.Size = UDim2.new(originalSize.X.Scale, 0, 0.1, 0)
        else
            MainFrame.Size = originalSize
        end
    end)
    
    -- Window API
    local Window = {}
    Window.Tabs = {}
    
    function Window:CreateTab(name)
        local Tab = {}
        Tab.Name = name
        
        -- Tab button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name
        TabButton.Parent = TabList
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
        TabButton.BackgroundTransparency = 0.5
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0.9, 0, 0.1, 0)
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(180, 180, 220)
        TabButton.TextSize = 14
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = TabButton
        
        -- Tab content
        local TabContent = Instance.new("Frame")
        TabContent.Name = name
        TabContent.Parent = ContentContainer
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 0, ContentContainer.AbsoluteSize.Y)
        TabContent.Visible = false
        
        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.Parent = TabContent
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Padding = UDim.new(0, 8)
        
        -- Tab selection
        TabButton.MouseButton1Click:Connect(function()
            for _, content in ipairs(ContentContainer:GetChildren()) do
                if content:IsA("Frame") and content.Name ~= "UIListLayout" then
                    content.Visible = false
                end
            end
            TabContent.Visible = true
            
            -- Update button colors
            for _, btn in ipairs(TabList:GetChildren()) do
                if btn:IsA("TextButton") then
                    if btn == TabButton then
                        btn.BackgroundTransparency = 0.2
                        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        btn.BackgroundTransparency = 0.5
                        btn.TextColor3 = Color3.fromRGB(180, 180, 220)
                    end
                end
            end
        end)
        
        -- Activate first tab
        if #TabList:GetChildren() == 1 then
            TabButton.BackgroundTransparency = 0.2
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabContent.Visible = true
        end
        
        -- Tab API
        function Tab:AddButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Name = text
            Button.Parent = TabContent
            Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            Button.BackgroundTransparency = 0.3
            Button.Size = UDim2.new(0.95, 0, 0, 40)
            Button.Font = Enum.Font.Gotham
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(220, 220, 255)
            Button.TextSize = 14
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(callback)
            
            -- Hover effects
            Button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(
                    Button,
                    TweenInfo.new(0.2),
                    {BackgroundTransparency = 0.1}
                ):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(
                    Button,
                    TweenInfo.new(0.2),
                    {BackgroundTransparency = 0.3}
                ):Play()
            end)
            
            return Button
        end
        
        function Tab:AddLabel(text)
            local Label = Instance.new("TextLabel")
            Label.Name = text
            Label.Parent = TabContent
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(0.95, 0, 0, 30)
            Label.Font = Enum.Font.Gotham
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(180, 180, 220)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
            
            return Label
        end
        
        function Tab:AddToggle(text, default, callback)
            local Toggle = Instance.new("TextButton")
            Toggle.Name = text
            Toggle.Parent = TabContent
            Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            Toggle.BackgroundTransparency = 0.3
            Toggle.Size = UDim2.new(0.95, 0, 0, 35)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.Gotham
            Toggle.Text = ""
            Toggle.TextSize = 14
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = Toggle
            
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Toggle
            Label.AnchorPoint = Vector2.new(0, 0.5)
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0.05, 0, 0.5, 0)
            Label.Size = UDim2.new(0.7, 0, 0.8, 0)
            Label.Font = Enum.Font.Gotham
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(220, 220, 255)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = Toggle
            ToggleFrame.AnchorPoint = Vector2.new(1, 0.5)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            ToggleFrame.Position = UDim2.new(0.95, 0, 0.5, 0)
            ToggleFrame.Size = UDim2.new(0.2, 0, 0.6, 0)
            
            local ToggleFrameCorner = Instance.new("UICorner")
            ToggleFrameCorner.CornerRadius = UDim.new(1, 0)
            ToggleFrameCorner.Parent = ToggleFrame
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Name = "ToggleCircle"
            ToggleCircle.Parent = ToggleFrame
            ToggleCircle.AnchorPoint = Vector2.new(0.5, 0.5)
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(120, 120, 150)
            ToggleCircle.Position = UDim2.new(0.3, 0, 0.5, 0)
            ToggleCircle.Size = UDim2.new(0.5, 0, 0.9, 0)
            
            local ToggleCircleCorner = Instance.new("UICorner")
            ToggleCircleCorner.CornerRadius = UDim.new(1, 0)
            ToggleCircleCorner.Parent = ToggleCircle
            
            local state = default or false
            
            local function updateToggle()
                if state then
                    ToggleCircle.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
                    TweenService:Create(
                        ToggleCircle,
                        TweenInfo.new(0.2),
                        {Position = UDim2.new(0.7, 0, 0.5, 0)}
                    ):Play()
                else
                    ToggleCircle.BackgroundColor3 = Color3.fromRGB(120, 120, 150)
                    TweenService:Create(
                        ToggleCircle,
                        TweenInfo.new(0.2),
                        {Position = UDim2.new(0.3, 0, 0.5, 0)}
                    ):Play()
                end
            end
            
            updateToggle()
            
            Toggle.MouseButton1Click:Connect(function()
                state = not state
                updateToggle()
                callback(state)
            end)
            
            return Toggle
        end
        
        table.insert(Window.Tabs, Tab)
        return Tab
    end
    
    return Window
end

return Aurora
