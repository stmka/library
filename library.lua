-- stmkasslib (Rayfield-style UI)

local Library = {}
Library.__index = Library

function Library:CreateWindow(settings)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "StmkassHub"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")

	local dragFrame = Instance.new("Frame")
	dragFrame.Size = UDim2.new(0, 550, 0, 400)
	dragFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
	dragFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	dragFrame.BorderSizePixel = 0
	dragFrame.Name = "MainFrame"
	dragFrame.Parent = screenGui

	local corner = Instance.new("UICorner", dragFrame)
	corner.CornerRadius = UDim.new(0, 12)

	local topBar = Instance.new("Frame")
	topBar.Size = UDim2.new(1, 0, 0, 40)
	topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	topBar.Parent = dragFrame
	Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 12)

	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -40, 1, 0)
	titleLabel.Position = UDim2.new(0, 10, 0, 0)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = settings.Name or "Stmkass Hub"
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 18
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = topBar

	local closeButton = Instance.new("TextButton")
	closeButton.Text = "✕"
	closeButton.Font = Enum.Font.GothamBold
	closeButton.TextSize = 18
	closeButton.Size = UDim2.new(0, 30, 1, 0)
	closeButton.Position = UDim2.new(1, -35, 0, 0)
	closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	closeButton.TextColor3 = Color3.fromRGB(255, 95, 95)
	closeButton.Parent = topBar
	Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 8)

	closeButton.MouseButton1Click:Connect(function()
		screenGui:Destroy()
	end)

	-- Draggable
	local dragging, offset
	topBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			offset = input.Position - dragFrame.Position
		end
	end)
	topBar.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			dragFrame.Position = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
		end
	end)

	local tabHolder = Instance.new("Frame")
	tabHolder.Size = UDim2.new(0, 120, 1, -40)
	tabHolder.Position = UDim2.new(0, 0, 0, 40)
	tabHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	tabHolder.Parent = dragFrame

	local tabLayout = Instance.new("UIListLayout", tabHolder)
	tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabLayout.Padding = UDim.new(0, 6)

	local contentHolder = Instance.new("Frame")
	contentHolder.Size = UDim2.new(1, -120, 1, -40)
	contentHolder.Position = UDim2.new(0, 120, 0, 40)
	contentHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	contentHolder.Parent = dragFrame
	contentHolder.ClipsDescendants = true
	Instance.new("UICorner", contentHolder).CornerRadius = UDim.new(0, 8)

	local tabs = {}

	function Library:CreateTab(tabInfo)
		local tabButton = Instance.new("TextButton")
		tabButton.Size = UDim2.new(1, -10, 0, 40)
		tabButton.Position = UDim2.new(0, 5, 0, 0)
		tabButton.Text = (tabInfo.Icon and (tabInfo.Icon .. " ") or "") .. (tabInfo.Name or "Tab")
		tabButton.Font = Enum.Font.Gotham
		tabButton.TextSize = 14
		tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		tabButton.Parent = tabHolder
		Instance.new("UICorner", tabButton).CornerRadius = UDim.new(0, 8)

		local tabPage = Instance.new("ScrollingFrame")
		tabPage.Size = UDim2.new(1, 0, 1, 0)
		tabPage.BackgroundTransparency = 1
		tabPage.Visible = false
		tabPage.ScrollBarThickness = 6
		tabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
		tabPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
		tabPage.Parent = contentHolder

		local layout = Instance.new("UIListLayout", tabPage)
		layout.Padding = UDim.new(0, 6)
		layout.SortOrder = Enum.SortOrder.LayoutOrder

		table.insert(tabs, {Button = tabButton, Page = tabPage})

		tabButton.MouseButton1Click:Connect(function()
			for _, tab in pairs(tabs) do
				tab.Page.Visible = false
				tab.Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			end
			tabPage.Visible = true
			tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		end)

		if #tabs == 1 then
			tabPage.Visible = true
			tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		end

		return tabPage
	end

	return setmetatable({}, Library)
end

return setmetatable({}, Library)
