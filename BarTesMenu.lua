-- BarTes | Developer - UI Menu Script
-- LocalScript untuk ditempatkan di StarterPlayerScripts / StarterGui

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local existing = playerGui:FindFirstChild("BarTesMenu")
if existing then existing:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BarTesMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local topFrame = Instance.new("Frame")
topFrame.Name = "TopBar"
topFrame.Size = UDim2.new(0.38, 0, 0, 44)
topFrame.Position = UDim2.new(0.5, 0, 0, 10)
topFrame.AnchorPoint = Vector2.new(0.5, 0)
topFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topFrame.BorderSizePixel = 0
topFrame.Parent = screenGui

local uic = Instance.new("UICorner")
uic.CornerRadius = UDim.new(0, 8)
uic.Parent = topFrame

local wmLabel = Instance.new("TextLabel")
wmLabel.Name = "Watermark"
wmLabel.Size = UDim2.new(1, -12, 1, 0)
wmLabel.Position = UDim2.new(0, 6, 0, 0)
wmLabel.BackgroundTransparency = 1
wmLabel.Text = "BarTes | Developer"
wmLabel.Font = Enum.Font.GothamSemibold
wmLabel.TextSize = 18
wmLabel.TextXAlignment = Enum.TextXAlignment.Left
wmLabel.TextColor3 = Color3.fromRGB(230,230,230)
wmLabel.Parent = topFrame

local toggleBtn = Instance.new("ImageButton")
toggleBtn.Name = "Toggle"
toggleBtn.Size = UDim2.new(0, 36, 0, 36)
toggleBtn.Position = UDim2.new(1, -44, 0.5, 0)
toggleBtn.AnchorPoint = Vector2.new(1, 0.5)
toggleBtn.BackgroundTransparency = 0.4
toggleBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = topFrame

local tbCorner = Instance.new("UICorner", toggleBtn)
tbCorner.CornerRadius = UDim.new(0,6)

local function makeLine(y)
	local l = Instance.new("Frame")
	l.Size = UDim2.new(0, 16, 0, 2)
	l.Position = UDim2.new(0.5, -8, 0, y)
	l.BackgroundColor3 = Color3.fromRGB(230,230,230)
	l.BorderSizePixel = 0
	l.Parent = toggleBtn
end
makeLine(10); makeLine(18); makeLine(26)

local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0.38, 0, 0, 140)
menuFrame.Position = UDim2.new(0.5, 0, 0, 56)
menuFrame.AnchorPoint = Vector2.new(0.5, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(22,22,22)
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Parent = screenGui

local mfCorner = Instance.new("UICorner", menuFrame)
mfCorner.CornerRadius = UDim.new(0,8)

local uiPadding = Instance.new("UIPadding", menuFrame)
uiPadding.PaddingTop = UDim.new(0,8)
uiPadding.PaddingBottom = UDim.new(0,8)
uiPadding.PaddingLeft = UDim.new(0,8)
uiPadding.PaddingRight = UDim.new(0,8)

local list = Instance.new("UIListLayout", menuFrame)
list.FillDirection = Enum.FillDirection.Vertical
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0,8)

local menuNames = {"Home", "Inventory", "Shop", "Leaderboards", "Settings"}
for i, name in ipairs(menuNames) do
	local btn = Instance.new("TextButton")
	btn.Name = name .. "Btn"
	btn.Size = UDim2.new(1, 0, 0, 28)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.BorderSizePixel = 0
	btn.AutoButtonColor = true
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 16
	btn.Text = name .. " — Coming Soon"
	btn.TextColor3 = Color3.fromRGB(210,210,210)
	btn.LayoutOrder = i
	btn.Parent = menuFrame

	local bcorner = Instance.new("UICorner", btn)
	bcorner.CornerRadius = UDim.new(0,6)

	btn.MouseButton1Click:Connect(function()
		local feedback = Instance.new("TextLabel")
		feedback.Size = UDim2.new(0, 220, 0, 36)
		feedback.Position = UDim2.new(0.5, 0, 0.5, 0)
		feedback.AnchorPoint = Vector2.new(0.5, 0.5)
		feedback.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		feedback.TextColor3 = Color3.fromRGB(240,240,240)
		feedback.Font = Enum.Font.GothamBold
		feedback.TextSize = 16
		feedback.Text = "Coming Soon"
		feedback.Parent = screenGui

		local fcorner = Instance.new("UICorner", feedback)
		fcorner.CornerRadius = UDim.new(0,6)

		feedback.BackgroundTransparency = 1
		feedback.TextTransparency = 1

		local tweenIn = TweenService:Create(feedback, TweenInfo.new(0.18), {BackgroundTransparency = 0, TextTransparency = 0})
		local tweenOut = TweenService:Create(feedback, TweenInfo.new(0.18), {BackgroundTransparency = 1, TextTransparency = 1})

		tweenIn:Play()
		delay(1.4, function()
			tweenOut:Play()
			tweenOut.Completed:Wait()
			feedback:Destroy()
		end)
	end)
end

local open = false
toggleBtn.MouseButton1Click:Connect(function()
	open = not open
	menuFrame.Visible = open
	TweenService:Create(toggleBtn, TweenInfo.new(0.18), {Rotation = open and 90 or 0}):Play()
end)

topFrame.Position = topFrame.Position - UDim2.new(0,0,0,6)
TweenService:Create(
	topFrame,
	TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{Position = topFrame.Position + UDim2.new(0,0,0,6)}
):Play()