local Aurora = {}

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Build Aurora UI
function Aurora:CreateWindow(config)
	local gui = Instance.new("ScreenGui")
	gui.Name = "AuroraGUI"
	gui.ResetOnSpawn = false
	gui.Parent = PlayerGui

	-- Main frame
	local main = Instance.new("Frame")
	main.Size = UDim2.new(0.36, 0, 0.45, 0)
	main.Position = UDim2.new(0.5, 0, 0.5, 0)
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
	main.BackgroundTransparency = 0.1
	main.Parent = gui

	local corner = Instance.new("UICorner", main)
	corner.CornerRadius = UDim.new(0, 16)

	-- TitleBar
	local titleBar = Instance.new("Frame")
	titleBar.Size = UDim2.new(1, 0, 0.1, 0)
	titleBar.BackgroundTransparency = 0.2
	titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
	titleBar.Parent = main
	Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 16)

	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(0.85, 0, 1, 0)
	titleLabel.Position = UDim2.new(0.03, 0, 0, 0)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 16
	titleLabel.TextColor3 = Color3.new(1, 1, 1)
	titleLabel.Text = config.Title or "Aurora Hub"
	titleLabel.Parent = titleBar

	-- Controls (Minimize/Close)
	local controls = Instance.new("Frame")
	controls.Size = UDim2.new(0.12, 0, 0.6, 0)
	controls.Position = UDim2.new(0.88, 0, 0.2, 0)
	controls.BackgroundTransparency = 1
	controls.Parent = titleBar

	local layout = Instance.new("UIListLayout", controls)
	layout.FillDirection = Enum.FillDirection.Horizontal
	layout.Padding = UDim.new(0, 5)

	local function makeBtn(text, color)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(0.5, 0, 1, 0)
		btn.BackgroundColor3 = color
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.Font = Enum.Font.GothamBold
		btn.Text = text
		btn.TextSize = 16
		Instance.new("UICorner", btn)
		btn.Parent = controls
		return btn
	end

	local minBtn = makeBtn("−", Color3.fromRGB(251, 191, 36))
	local closeBtn = makeBtn("×", Color3.fromRGB(239, 68, 68))

	closeBtn.MouseButton1Click:Connect(function()
		local tween = TweenService:Create(main, TweenInfo.new(0.4), {
			Size = UDim2.new(0, 0, 0, 0)
		})
		tween:Play()
		wait(0.45)
		gui:Destroy()
	end)

	-- Left tab list (starts hidden)
	local tabList = Instance.new("Frame")
	tabList.Size = UDim2.new(0.25, 0, 0.9, 0)
	tabList.Position = UDim2.new(0, 0, 0.1, 0)
	tabList.BackgroundTransparency = 1
	tabList.Visible = false -- 🔒 HIDDEN INITIALLY
	tabList.Parent = main

	local tabLayout = Instance.new("UIListLayout", tabList)
	tabLayout.Padding = UDim.new(0, 6)
	tabLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local contentFrame = Instance.new("Frame")
	contentFrame.Size = UDim2.new(0.75, 0, 0.9, 0)
	contentFrame.Position = UDim2.new(0.25, 0, 0.1, 0)
	contentFrame.BackgroundTransparency = 1
	contentFrame.Parent = main

	-- Show tabs after short delay
	task.delay(0.25, function()
		tabList.Visible = true
	end)

	local window = {}

	function window:CreateTab(tabName, callback)
		local tabBtn = Instance.new("TextButton")
		tabBtn.Size = UDim2.new(1, 0, 0, 30)
		tabBtn.Text = tabName
		tabBtn.Font = Enum.Font.GothamBold
		tabBtn.TextColor3 = Color3.new(1, 1, 1)
		tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
		tabBtn.TextSize = 14
		Instance.new("UICorner", tabBtn)
		tabBtn.Parent = tabList

		tabBtn.MouseButton1Click:Connect(function()
			-- Clear old
			for _, v in pairs(contentFrame:GetChildren()) do
				if v:IsA("GuiObject") then
					v:Destroy()
				end
			end

			local tabContent = Instance.new("Frame")
			tabContent.Size = UDim2.new(1, 0, 1, 0)
			tabContent.BackgroundTransparency = 1
			tabContent.Parent = contentFrame

			local layout = Instance.new("UIListLayout", tabContent)
			layout.Padding = UDim.new(0, 6)

			local tab = {}

			function tab:AddButton(text, func)
				local btn = Instance.new("TextButton")
				btn.Size = UDim2.new(1, 0, 0, 32)
				btn.Text = text
				btn.Font = Enum.Font.GothamBold
				btn.TextColor3 = Color3.new(1, 1, 1)
				btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
				btn.TextSize = 14
				Instance.new("UICorner", btn)
				btn.Parent = tabContent

				btn.MouseButton1Click:Connect(function()
					pcall(func)
				end)
			end

			-- Pass tab to callback
			callback(tab)
		end)
	end

	return window
end

return Aurora
