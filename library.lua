-- stmkasslib (Rayfield-style UI, fixed dragging & close)

local UserInputService = game:GetService("UserInputService")
local Library = {}
Library.__index = Library

function Library:CreateWindow(settings)
    -- MAIN SCREENGUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "StmkassHub"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999
    screenGui.Parent = game:GetService("CoreGui")

    -- MAIN FRAME (DRAGGABLE)
    local dragFrame = Instance.new("Frame")
    dragFrame.Name = "MainFrame"
    dragFrame.Size = UDim2.new(0, 550, 0, 400)
    dragFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
    dragFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    dragFrame.BorderSizePixel = 0
    dragFrame.ZIndex = 1
    dragFrame.Parent = screenGui

    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 12)
    frameCorner.Parent = dragFrame

    -- TOP BAR
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.Position = UDim2.new(0, 0, 0, 0)
    topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    topBar.ZIndex = 2
    topBar.Parent = dragFrame

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 12)
    barCorner.Parent = topBar

    -- TITLE
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -60, 1, 0)
    titleLabel.Position = UDim2.new(0, 16, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = settings.Name or "Stmkass Hub"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 3
    titleLabel.Parent = topBar

    -- CLOSE BUTTON
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "Close"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -40, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    closeButton.Text = "✕"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.TextColor3 = Color3.fromRGB(255, 95, 95)
    closeButton.ZIndex = 3
    closeButton.Parent = topBar

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeButton

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- DRAGGING LOGIC
    local dragging, dragStart
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            -- record offset relative to screen
            dragStart = Vector2.new(
                input.Position.X - dragFrame.AbsolutePosition.X,
                input.Position.Y - dragFrame.AbsolutePosition.Y
            )
        end
    end)
    topBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            dragFrame.Position = UDim2.new(
                0, input.Position.X - dragStart.X,
                0, input.Position.Y - dragStart.Y
            )
        end
    end)

    -- TAB BAR
    local tabHolder = Instance.new("Frame")
    tabHolder.Name = "TabHolder"
    tabHolder.Size = UDim2.new(0, 120, 1, -40)
    tabHolder.Position = UDim2.new(0, 0, 0, 40)
    tabHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tabHolder.ZIndex = 1
    tabHolder.Parent = dragFrame

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.Parent = tabHolder

    -- CONTENT AREA
    local contentHolder = Instance.new("Frame")
    contentHolder.Name = "ContentHolder"
    contentHolder.Size = UDim2.new(1, -120, 1, -40)
    contentHolder.Position = UDim2.new(0, 120, 0, 40)
    contentHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    contentHolder.ZIndex = 1
    contentHolder.ClipsDescendants = true
    contentHolder.Parent = dragFrame

    local contentCorner = Instance.new("UICorner")
    contentCorner.CornerRadius = UDim.new(0, 8)
    contentCorner.Parent = contentHolder

    -- TAB CREATION
    local tabs = {}
    function Library:CreateTab(tabInfo)
        local btn = Instance.new("TextButton")
        btn.Name = tabInfo.Name or "Tab"
        btn.Size = UDim2.new(1, -10, 0, 40)
        btn.Position = UDim2.new(0, 5, 0, 0)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 14
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = (tabInfo.Icon or "").." "..(tabInfo.Name or "Tab")
        btn.Parent = tabHolder
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        btn.ZIndex = 2

        local page = Instance.new("ScrollingFrame")
        page.Name = tabInfo.Name.."_Page"
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.ScrollBarThickness = 6
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        page.Parent = contentHolder
        page.ZIndex = 1

        local layout = Instance.new("UIListLayout", page)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 6)

        table.insert(tabs, {Button = btn, Page = page})

        btn.MouseButton1Click:Connect(function()
            for _, t in ipairs(tabs) do
                t.Page.Visible = false
                t.Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end
            page.Visible = true
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end)

        -- auto-select first tab
        if #tabs == 1 then
            page.Visible = true
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end

        return page
    end

    return setmetatable({}, Library)
end

return setmetatable({}, Library)
