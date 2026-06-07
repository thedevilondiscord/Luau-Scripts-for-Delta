--// OXR / ORION LEAKS GUI
--// CUSTOM GUI VERSION
 
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
 
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
 
--// GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DIVINE_LEAKS_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui
 
--// MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 520, 0, 430)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -215)
MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
MainFrame.BorderSizePixel = 0
 
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0,12)
 
--// TITLE
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 1
Title.Text = "OXR / ORION LEAKS by DIVINE"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
 
--// SCROLLING FRAME
local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0,10,0,60)
Scroll.Size = UDim2.new(1,-20,1,-70)
Scroll.CanvasSize = UDim2.new(0,0,0,900)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
 
local Layout = Instance.new("UIListLayout")
Layout.Parent = Scroll
Layout.Padding = UDim.new(0,10)
 
--// COPY FUNCTION
local function CopyToClipboard(text)
	if setclipboard then
		setclipboard(text)
	elseif toclipboard then
		toclipboard(text)
	end
end
 
--// SECTION CREATOR
local function CreateSection(titleText, link, hasLoad)
 
	local Section = Instance.new("Frame")
	Section.Parent = Scroll
	Section.Size = UDim2.new(1,-10,0,120)
	Section.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Section.BorderSizePixel = 0
 
	Instance.new("UICorner", Section).CornerRadius = UDim.new(0,10)
 
	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Parent = Section
	TitleLabel.Size = UDim2.new(1,-20,0,40)
	TitleLabel.Position = UDim2.new(0,10,0,0)
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Text = titleText
	TitleLabel.TextColor3 = Color3.fromRGB(255,255,255)
	TitleLabel.TextWrapped = true
	TitleLabel.TextScaled = true
	TitleLabel.Font = Enum.Font.GothamBold
 
	-- LOAD BUTTON
	if hasLoad then
 
		local LoadButton = Instance.new("TextButton")
		LoadButton.Parent = Section
		LoadButton.Size = UDim2.new(0.45,0,0,40)
		LoadButton.Position = UDim2.new(0.03,0,0,65)
		LoadButton.BackgroundColor3 = Color3.fromRGB(170,0,0)
		LoadButton.Text = "LOAD"
		LoadButton.TextColor3 = Color3.fromRGB(255,255,255)
		LoadButton.TextScaled = true
		LoadButton.Font = Enum.Font.GothamBold
		LoadButton.BorderSizePixel = 0
 
		Instance.new("UICorner", LoadButton).CornerRadius = UDim.new(0,8)
 
		LoadButton.MouseButton1Click:Connect(function()
 
			local success, err = pcall(function()
				loadstring(game:HttpGet("https://github.com/thedevilondiscord/Luau-Scripts-for-Delta/blob/main/OxP_L.lua"))()
			end)
 
			if not success then
				warn(err)
			end
 
		end)
	end
 
	-- COPY BUTTON
	local CopyButton = Instance.new("TextButton")
	CopyButton.Parent = Section
	CopyButton.Size = UDim2.new(0.45,0,0,40)
 
	if hasLoad then
		CopyButton.Position = UDim2.new(0.52,0,0,65)
	else
		CopyButton.Position = UDim2.new(0.275,0,0,65)
	end
 
	CopyButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
	CopyButton.Text = "COPY LINK"
	CopyButton.TextColor3 = Color3.fromRGB(255,255,255)
	CopyButton.TextScaled = true
	CopyButton.Font = Enum.Font.GothamBold
	CopyButton.BorderSizePixel = 0
 
	Instance.new("UICorner", CopyButton).CornerRadius = UDim.new(0,8)
 
	CopyButton.MouseButton1Click:Connect(function()
		CopyToClipboard(link)
	end)
end
 
--// SECTIONS
CreateSection(
	"ORION X Piyush Leaked (fixed as well)",
	"https://pastebin.com/S3QE9ajq",
	true
)
 
CreateSection(
	"OXR X TD5 SPAMMER Leaked",
	"https://pastebin.com/raw/9bTrpA2F",
	false
)
 
CreateSection(
	"OXR ETERNXZ SPAM / ORION spam Leaked",
	"https://pastebin.com/raw/2kyHhSZA",
	false
)
 
CreateSection(
	"OxR BERSERK prop troll Leaked",
	"https://pastebin.com/raw/zk17xLyY",
	false
)
 
--// MESSAGE SECTION
local MessageFrame = Instance.new("Frame")
MessageFrame.Parent = Scroll
MessageFrame.Size = UDim2.new(1,-10,0,220)
MessageFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
MessageFrame.BorderSizePixel = 0
 
Instance.new("UICorner", MessageFrame).CornerRadius = UDim.new(0,10)
 
local MessageText = Instance.new("TextLabel")
MessageText.Parent = MessageFrame
MessageText.Size = UDim2.new(1,-20,1,-20)
MessageText.Position = UDim2.new(0,10,0,10)
MessageText.BackgroundTransparency = 1
MessageText.TextWrapped = true
MessageText.TextYAlignment = Enum.TextYAlignment.Top
MessageText.Font = Enum.Font.Gotham
MessageText.TextScaled = true
MessageText.TextColor3 = Color3.fromRGB(255,255,255)
 
MessageText.Text = [[
You started this when you leaked my script.
 
Now I’ve got your scripts deobfuscated too.
 
Difference is, I didn’t need attention to prove a point.
 
So think carefully before pulling anything again.
 
No matter what you leak, crack, or post — it always ends with me.
 
yours truly
~DIVINE
]]
 
--// RGB DIVINE
task.spawn(function()
 
	local hue = 0
 
	while true do
 
		hue += 0.01
 
		if hue > 1 then
			hue = 0
		end
 
		MessageText.TextColor3 = Color3.fromHSV(hue,1,1)
 
		task.wait()
	end
end)
 
--// MAIN GUI DRAGGING
local dragging
local dragInput
local dragStart
local startPos
 
local function update(input)
 
	local delta = input.Position - dragStart
 
	MainFrame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end
 
MainFrame.InputBegan:Connect(function(input)
 
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
 
MainFrame.InputChanged:Connect(function(input)
 
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)
 
UIS.InputChanged:Connect(function(input)
 
	if input == dragInput and dragging then
		update(input)
	end
end)
 
--// HIDE/SHOW BUTTON
 
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0, 200)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
ToggleButton.Text = "DL"
ToggleButton.TextColor3 = Color3.fromRGB(255,255,255)
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.BorderSizePixel = 0
 
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1,0)
 
local guiVisible = true
 
ToggleButton.MouseButton1Click:Connect(function()
 
	guiVisible = not guiVisible
	MainFrame.Visible = guiVisible
 
end)
 
--// BUTTON DRAGGING
 
local buttonDragging
local buttonDragInput
local buttonDragStart
local buttonStartPos
 
local function updateButton(input)
 
	local delta = input.Position - buttonDragStart
 
	ToggleButton.Position = UDim2.new(
		buttonStartPos.X.Scale,
		buttonStartPos.X.Offset + delta.X,
		buttonStartPos.Y.Scale,
		buttonStartPos.Y.Offset + delta.Y
	)
end
 
ToggleButton.InputBegan:Connect(function(input)
 
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
 
		buttonDragging = true
		buttonDragStart = input.Position
		buttonStartPos = ToggleButton.Position
 
		input.Changed:Connect(function()
 
			if input.UserInputState == Enum.UserInputState.End then
				buttonDragging = false
			end
 
		end)
	end
end)
 
ToggleButton.InputChanged:Connect(function(input)
 
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		buttonDragInput = input
	end
end)
 
UIS.InputChanged:Connect(function(input)
 
	if input == buttonDragInput and buttonDragging then
		updateButton(input)
	end
end)
