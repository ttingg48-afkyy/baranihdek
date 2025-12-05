-- BarTes | Developer - UI Menu V2 (Hacker Edition)
-- By BarTes (Updated by ChatGPT)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local old = gui:FindFirstChild("BarTesUIV2")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "BarTesUIV2"
screen.ResetOnSpawn = false
screen.Parent = gui


-- WINDOW
local window = Instance.new("Frame")
window.Name = "Window"
window.Size = UDim2.new(0.65, 0, 0.55, 0)
window.Position = UDim2.new(0.5, 0, 0.5, 0)
window.AnchorPoint = Vector2.new(0.5, 0.5)
window.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
window.BorderSizePixel = 0
window.Parent = screen

Instance.new("UICorner", window).CornerRadius = UDim.new(0, 12)


-- TITLE BAR
local title = Instance.new("Frame")
title.Size = UDim2.new(1, 0, 0, 36)
title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
title.BorderSizePixel = 0
title.Parent = window
Instance.new("UICorner", title).CornerRadius = UDim.new(0, 12)

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -80, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Font = Enum.Font.Code
titleText.TextSize = 18
titleText.TextColor3 = Color3.fromRGB(0,255,0)
titleText.Text = "[ Bara >> Talon | Developer ]"
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = title


-- MINIMIZE BUTTON
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 30, 0, 26)
minimize.Position = UDim2.new(1, -70, 0.5, 0)
minimize.AnchorPoint = Vector2.new(1, 0.5)
minimize.BackgroundColor3 = Color3.fromRGB(40,40,40)
minimize.Text = "-"
minimize.Font = Enum.Font.Code
minimize.TextSize = 24
minimize.TextColor3 = Color3.fromRGB(0,255,0)
minimize.Parent = title
Instance.new("UICorner", minimize)


-- CLOSE BUTTON
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 26)
close.Position = UDim2.new(1, -30, 0.5, 0)
close.AnchorPoint = Vector2.new(1, 0.5)
close.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
close.Text = "X"
close.Font = Enum.Font.Code
close.TextSize = 20
close.TextColor3 = Color3.fromRGB(255,255,255)
close.Parent = title
Instance.new("UICorner", close)



-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, -36)
sidebar.Position = UDim2.new(0, 0, 0, 36)
sidebar.BackgroundColor3 = Color3.fromRGB(20,20,20)
sidebar.BorderSizePixel = 0
sidebar.Parent = window

Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

local list = Instance.new("UIListLayout", sidebar)
list.Padding = UDim.new(0, 4)
list.FillDirection = Enum.FillDirection.Vertical
list.SortOrder = Enum.SortOrder.LayoutOrder



-- DEVELOPER INFO
local devInfo = Instance.new("TextLabel")
devInfo.Size = UDim2.new(1, -14, 0, 28)
devInfo.Position = UDim2.new(0, 7, 0, 5)
devInfo.BackgroundTransparency = 1
devInfo.Font = Enum.Font.Code
devInfo.TextSize = 14
devInfo.TextColor3 = Color3.fromRGB(255, 0, 0)
devInfo.Text = "Developer: Bara Setiawan"
devInfo.Parent = sidebar

local studioInfo = Instance.new("TextLabel")
studioInfo.Size = UDim2.new(1, -14, 0, 22)
studioInfo.Position = UDim2.new(0, 7, 0, 28)
studioInfo.BackgroundTransparency = 1
studioInfo.Font = Enum.Font.Code
studioInfo.TextSize = 14
studioInfo.TextColor3 = Color3.fromRGB(0, 255, 0)
studioInfo.Text = "TEAM: Barlens Studio"
studioInfo.Parent = sidebar



-- PANEL KONTEN
local panel = Instance.new("Frame")
panel.Size = UDim2.new(1, -150, 1, -36)
panel.Position = UDim2.new(0, 150, 0, 36)
panel.BackgroundColor3 = Color3.fromRGB(25,25,25)
panel.BorderSizePixel = 0
panel.Parent = window
Instance.new("UICorner", panel).CornerRadius = UDim.new(0,12)

local panelText = Instance.new("TextLabel")
panelText.Size = UDim2.new(1, -20, 1, -20)
panelText.Position = UDim2.new(0, 10, 0, 10)
panelText.BackgroundTransparency = 1
panelText.Font = Enum.Font.Code
panelText.TextSize = 22
panelText.TextColor3 = Color3.fromRGB(0,255,0)
panelText.TextWrapped = true
panelText.Text = ">> SYSTEM ONLINE...\n>> Choose module on left panel."
panelText.Parent = panel



-- GLITCH EFFECT
local function glitch(t)
	local chars = {"█","▓","▒","░","Ξ","Ø","≡","≣","+","/","#"}
	local out = ""
	for i = 1, #t do
		if math.random(1,10) <= 2 then
			out = out .. chars[math.random(#chars)]
		else
			out = out .. t:sub(i,i)
		end
	end
	return out
end


-- MENU LIST
local menus = {"Home","Inventory","Shop","Leaderboards","Settings"}


-- BUTTON ADDER
local function addButton(name)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -14, 0, 32)
	btn.Position = UDim2.new(0, 7, 0, 0)
	btn.Text = name
	btn.Font = Enum.Font.Code
	btn.TextSize = 16
	btn.TextColor3 = Color3.fromRGB(0,255,0)
	btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	btn.Parent = sidebar
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

	btn.MouseButton1Click:Connect(function()
		panelText.Text = glitch(name .. " — Coming Soon")
		wait(0.05)
		panelText.Text = name .. " — Coming Soon"
	end)
end

for _, name in ipairs(menus) do
	addButton(name)
end



-- MINIMIZE
local minimized = false
local icon = nil

minimize.MouseButton1Click:Connect(function()
	if minimized then return end
	minimized = true

	window.Visible = false

	icon = Instance.new("TextButton")
	icon.Text = "BarTes"
	icon.Font = Enum.Font.Code
	icon.TextSize = 18
	icon.BackgroundColor3 = Color3.fromRGB(20,20,20)
	icon.TextColor3 = Color3.fromRGB(0,255,0)
	icon.Size = UDim2.new(0, 100, 0, 40)
	icon.Position = UDim2.new(0, 20, 1, -60)
	icon.Parent = screen
	Instance.new("UICorner", icon)

	icon.MouseButton1Click:Connect(function()
		window.Visible = true
		icon:Destroy()
		minimized = false
	end)
end)



-- CLOSE
close.MouseButton1Click:Connect(function()
	window.Visible = false
	if icon then icon:Destroy() end
end)
