local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Detect screen size
local screenSize = workspace.CurrentCamera.ViewportSize
local defaultWidth, defaultHeight = 868, 650
local mobileWidth, mobileHeight = 650, 335

local adjustedWidth, adjustedHeight
if screenSize.X >= defaultWidth and screenSize.Y >= defaultHeight then
    adjustedWidth = defaultWidth
    adjustedHeight = defaultHeight
else
    adjustedWidth = mobileWidth
    adjustedHeight = mobileHeight
end

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnimationNoticeGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, adjustedWidth, 0, adjustedHeight)
mainFrame.Position = UDim2.new(0.5, -adjustedWidth/2, 0.5, -adjustedHeight/2)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- UI Corner for rounded edges
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Message Text
local message = Instance.new("TextLabel")
message.Size = UDim2.new(1, -20, 1, -60)
message.Position = UDim2.new(0, 10, 0, 10)
message.TextWrapped = true
message.TextScaled = true
message.TextColor3 = Color3.fromRGB(255, 255, 255)
message.BackgroundTransparency = 1
message.Text = "Roblox added an update which disabled animations if the animation ID doesn't exist in that game. (the netless STILL works though). I'll try to find other solutions to fix, Be sure to follow me on roblox (CRINGE_X3)"
message.Parent = mainFrame

-- OK Button
local okButton = Instance.new("TextButton")
okButton.Size = UDim2.new(0, 120, 0, 40)
okButton.Position = UDim2.new(0.5, -60, 1, -50)
okButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
okButton.TextColor3 = Color3.fromRGB(255, 255, 255)
okButton.TextScaled = true
okButton.Text = "Okay"
okButton.Parent = mainFrame

local okCorner = Instance.new("UICorner")
okCorner.CornerRadius = UDim.new(0, 8)
okCorner.Parent = okButton

-- Button click removes GUI
okButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
