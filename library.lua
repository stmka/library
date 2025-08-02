-- stmkasslib

local Library = {}
Library.__index = Library

function Library:CreateWindow(settings)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "StmkassHub"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")

	local mainFrame = Instance.new("Frame")
	mainFrame.Size = UDim2.new(0, 500, 0, 300)
	mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
	mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	mainFrame.Name = "MainFrame"
	mainFrame.Parent = screenGui

	self._mainFrame = mainFrame
	return self
end

function Library:CreateTab(tabSettings)
	local tabButton = Instance.new("TextButton")
	tabButton.Size = UDim2.new(0, 100, 0, 40)
	tabButton.Text = tabSettings.Name or "Tab"
	tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.Parent = self._mainFrame
	return tabButton
end

return setmetatable({}, Library)
