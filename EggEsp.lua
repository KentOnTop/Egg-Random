-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystemGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- UICorner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Key System"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

-- Key Input
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.65, -5, 0, 30)
keyBox.Position = UDim2.new(0.05, 0, 0.3, 0)
keyBox.PlaceholderText = "Enter Key"
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
keyBox.BorderSizePixel = 0
keyBox.Parent = frame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 6)
boxCorner.Parent = keyBox

-- Click Free Key Button
local freeKeyBtn = Instance.new("TextButton")
freeKeyBtn.Size = UDim2.new(0.45, -5, 0, 30)
freeKeyBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
freeKeyBtn.Text = "Click Free Key"
freeKeyBtn.Font = Enum.Font.GothamBold
freeKeyBtn.TextSize = 14
freeKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
freeKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 200)
freeKeyBtn.BorderSizePixel = 0
freeKeyBtn.Parent = frame

local btnCorner1 = Instance.new("UICorner")
btnCorner1.CornerRadius = UDim.new(0, 6)
btnCorner1.Parent = freeKeyBtn

-- Submit Button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.45, -5, 0, 30)
submitBtn.Position = UDim2.new(0.5, 5, 0.55, 0)
submitBtn.Text = "Submit"
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 14
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
submitBtn.BorderSizePixel = 0
submitBtn.Parent = frame

local btnCorner2 = Instance.new("UICorner")
btnCorner2.CornerRadius = UDim.new(0, 6)
btnCorner2.Parent = submitBtn

-- Progress Bar Frame (hidden until clicked)
local progressFrame = Instance.new("Frame")
progressFrame.Size = UDim2.new(0.9, 0, 0, 10)
progressFrame.Position = UDim2.new(0.05, 0, 0.9, 0)
progressFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
progressFrame.BorderSizePixel = 0
progressFrame.Visible = false
progressFrame.Parent = frame

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 5)
progressCorner.Parent = progressFrame

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(1, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = progressFrame

local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(0, 5)
progressBarCorner.Parent = progressBar

-- Countdown Label
local countdownLabel = Instance.new("TextLabel")
countdownLabel.Size = UDim2.new(1, 0, 0, 20)
countdownLabel.Position = UDim2.new(0, 0, 0.75, 0)
countdownLabel.BackgroundTransparency = 1
countdownLabel.Text = ""
countdownLabel.Font = Enum.Font.Gotham
countdownLabel.TextSize = 14
countdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
countdownLabel.Parent = frame

-- Functions
local function startCountdown()
	progressFrame.Visible = true
	for i = 100, 0, -1 do
		countdownLabel.Text = "Countdown: " .. i
		progressBar.Size = UDim2.new(i/100, 0, 1, 0)
		wait(0.1) -- slow countdown
	end
	keyBox.Text = "KentOnTop"
end

local function checkKey()
	if keyBox.Text == "KentOnTop" then
		screenGui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/KentOnTop/NewEggRandomizers/refs/heads/main/EggEsp.lua"))()
	else
		countdownLabel.Text = "Wrong Key!"
	end
end

-- Button Connections
freeKeyBtn.MouseButton1Click:Connect(startCountdown)
submitBtn.MouseButton1Click:Connect(checkKey)
