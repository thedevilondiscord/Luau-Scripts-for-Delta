--// SERVICES
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
local plr = Players.LocalPlayer
 
--// EXECUTOR-SAFE INTERFACE LAYER
local pgui = nil
if gethui then
pgui = gethui()
elseif syn and syn.protect_gui then
local protectedScreen = Instance.new("ScreenGui")
syn.protect_gui(protectedScreen)
protectedScreen.Parent = game:GetService("CoreGui")
pgui = protectedScreen
else
pgui = plr:FindFirstChildOfClass("PlayerGui")
end
 
--// EXACT REMOTES FROM THE SOURCE SCRIPT
local RE = ReplicatedStorage:WaitForChild("RE", 5)
local NameRemote = RE and RE:WaitForChild("1RPNam1eTex1t", 5) or nil
local ColorRemote = RE and RE:WaitForChild("1RPNam1eColo1r", 5) or nil
 
--// FIXED PALETTES (PREMIUM PURPLE-PINK GLOW FROM PIYUSH UI)
local TranslucentBlack = Color3.fromRGB(12, 10, 20)
local PanelFillColor = Color3.fromRGB(26, 16, 38)
local NeonPinkAccent = Color3.fromRGB(255, 0, 180)
local NeonPurpleAccent = Color3.fromRGB(140, 0, 255)
local TextLight = Color3.fromRGB(250, 240, 255)
local OffText = Color3.fromRGB(160, 150, 180)
 
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
 
--// DESTROY PRIOR RENDERS
if pgui:FindFirstChild("PIYUSH_OXR_MATRIX") then
pgui["PIYUSH_OXR_MATRIX"]:Destroy()
end
 
local gui = Instance.new("ScreenGui")
gui.Name = "PIYUSH_OXR_MATRIX"
gui.Parent = pgui
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
 
--==================================================
-- GRADIENT ANIMATION ENGINE (PIYUSH STYLING)
--==================================================
local function applyPinkPurpleGradient(strokeInstance)
if not strokeInstance then return end
local gradient = Instance.new("UIGradient", strokeInstance)
gradient.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, NeonPurpleAccent),
ColorSequenceKeypoint.new(1, NeonPinkAccent)
})
task.spawn(function()
local rotation = 0
while strokeInstance and strokeInstance.Parent do
rotation = (rotation + 2) % 360
gradient.Rotation = rotation
task.wait(0.02)
end
end)
end
 
--==================================================
-- UI ELEMENT 1: PROGRESS BOOT STRAPPER
--==================================================
local bootFrame = Instance.new("Frame", gui)
bootFrame.Size = UDim2.new(0, 440, 0, 260)
bootFrame.Position = UDim2.new(0.5, -220, 0.5, -130)
bootFrame.BackgroundColor3 = TranslucentBlack
Instance.new("UICorner", bootFrame).CornerRadius = UDim.new(0, 14)
 
local bootStrk = Instance.new("UIStroke", bootFrame)
bootStrk.Thickness = 2
applyPinkPurpleGradient(bootStrk)
 
local bootTitle = Instance.new("TextLabel", bootFrame)
bootTitle.Size = UDim2.new(1, 0, 0, 40)
bootTitle.Position = UDim2.new(0, 0, 0, 30)
bootTitle.Text = "PIYUSH X OXR SPAMMER"
bootTitle.Font = Enum.Font.GothamBlack
bootTitle.TextColor3 = TextLight
bootTitle.TextSize = 22
bootTitle.BackgroundTransparency = 1
 
local barBg = Instance.new("Frame", bootFrame)
barBg.Size = UDim2.new(0.8, 0, 0, 6)
barBg.Position = UDim2.new(0.1, 0, 0, 130)
barBg.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 3)
 
local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = NeonPinkAccent
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 3)
 
local bootStatus = Instance.new("TextLabel", bootFrame)
bootStatus.Size = UDim2.new(1, 0, 0, 20)
bootStatus.Position = UDim2.new(0, 0, 0, 150)
bootStatus.Text = "Status: Authenticating Matrix Arrays..."
bootStatus.Font = Enum.Font.Code
bootStatus.TextColor3 = OffText
bootStatus.TextSize = 11
bootStatus.BackgroundTransparency = 1
 
--==================================================
-- UI ELEMENT 2: MODERN PREMIUM KEY SYSTEM
--==================================================
local keyUI = Instance.new("Frame", gui)
keyUI.Size = UDim2.new(0, 360, 0, 240)
keyUI.Position = UDim2.new(0.5, -180, 0.5, -120)
keyUI.BackgroundColor3 = TranslucentBlack
keyUI.BackgroundTransparency = 1
keyUI.Visible = false
Instance.new("UICorner", keyUI).CornerRadius = UDim.new(0, 18)
 
local keyStrk = Instance.new("UIStroke", keyUI)
keyStrk.Thickness = 2.5
keyStrk.Transparency = 1
applyPinkPurpleGradient(keyStrk)
 
local keyHeader = Instance.new("TextLabel", keyUI)
keyHeader.Size = UDim2.new(1, 0, 0, 35)
keyHeader.Position = UDim2.new(0, 0, 0, 20)
keyHeader.Text = "SECURITY VERIFICATION"
keyHeader.Font = Enum.Font.GothamBlack
keyHeader.TextColor3 = TextLight
keyHeader.TextSize = 18
keyHeader.TextTransparency = 1
keyHeader.BackgroundTransparency = 1
 
local keySub = Instance.new("TextLabel", keyUI)
keySub.Size = UDim2.new(1, 0, 0, 20)
keySub.Position = UDim2.new(0, 0, 0, 50)
keySub.Text = "Enter your premium credential passport below"
keySub.Font = Enum.Font.GothamMedium
keySub.TextColor3 = OffText
keySub.TextSize = 11
keySub.TextTransparency = 1
keySub.BackgroundTransparency = 1
 
local keyBox = Instance.new("TextBox", keyUI)
keyBox.Size = UDim2.new(0.85, 0, 0, 45)
keyBox.Position = UDim2.new(0.075, 0, 0, 95)
keyBox.PlaceholderText = "ENTER ACCESS KEY..."
keyBox.PlaceholderColor3 = Color3.fromRGB(110, 100, 130)
keyBox.BackgroundColor3 = PanelFillColor
keyBox.BackgroundTransparency = 1
keyBox.TextColor3 = TextLight
keyBox.TextTransparency = 1
keyBox.Font = Enum.Font.Code
keyBox.TextSize = 12
keyBox.BorderSizePixel = 0
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 10)
 
local keyBoxStrk = Instance.new("UIStroke", keyBox)
keyBoxStrk.Thickness = 1
keyBoxStrk.Color = Color3.fromRGB(60, 45, 80)
keyBoxStrk.Transparency = 1
 
local checkKeyBtn = Instance.new("TextButton", keyUI)
checkKeyBtn.Size = UDim2.new(0.85, 0, 0, 45)
checkKeyBtn.Position = UDim2.new(0.075, 0, 0, 165)
checkKeyBtn.Text = "INITIALIZE TRINITY"
checkKeyBtn.BackgroundColor3 = PanelFillColor
checkKeyBtn.BackgroundTransparency = 1
checkKeyBtn.TextColor3 = TextLight
checkKeyBtn.TextTransparency = 1
checkKeyBtn.Font = Enum.Font.GothamBlack
checkKeyBtn.TextSize = 12
Instance.new("UICorner", checkKeyBtn).CornerRadius = UDim.new(0, 10)
 
local checkKeyStrk = Instance.new("UIStroke", checkKeyBtn)
checkKeyStrk.Thickness = 1.5
checkKeyStrk.Transparency = 1
applyPinkPurpleGradient(checkKeyStrk)
 
--==================================================
-- UI ELEMENT 3: WELCOME SCREEN MODULE
--==================================================
local welcomeUI = Instance.new("Frame", gui)
welcomeUI.Size = UDim2.new(0, 340, 0, 340)
welcomeUI.Position = UDim2.new(0.5, -170, 0.5, -170)
welcomeUI.BackgroundColor3 = TranslucentBlack
welcomeUI.BackgroundTransparency = 1
welcomeUI.Visible = false
Instance.new("UICorner", welcomeUI).CornerRadius = UDim.new(0, 18)
 
local welcStrk = Instance.new("UIStroke", welcomeUI)
welcStrk.Thickness = 2.5
welcStrk.Transparency = 1
applyPinkPurpleGradient(welcStrk)
 
local avatar = Instance.new("ImageLabel", welcomeUI)
avatar.Size = UDim2.new(0, 56, 0, 56)
avatar.Position = UDim2.new(0, 25, 0, 25)
avatar.BackgroundColor3 = PanelFillColor
avatar.BackgroundTransparency = 1
avatar.ImageTransparency = 1
avatar.BorderSizePixel = 0
Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 12)
 
pcall(function()
avatar.Image = Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
end)
 
local greetName = Instance.new("TextLabel", welcomeUI)
greetName.Size = UDim2.new(0, 220, 0, 56)
greetName.Position = UDim2.new(0, 93, 0, 25)
greetName.Text = "Welcome,\n" .. plr.DisplayName
greetName.Font = Enum.Font.GothamBold
greetName.TextColor3 = TextLight
greetName.TextSize = 16
greetName.TextTransparency = 1
greetName.TextXAlignment = Enum.TextXAlignment.Left
greetName.BackgroundTransparency = 1
 
local desc1 = Instance.new("TextLabel", welcomeUI)
desc1.Size = UDim2.new(1, -50, 0, 25)
desc1.Position = UDim2.new(0, 25, 0, 110)
desc1.Text = "The best spammer with combo version"
desc1.Font = Enum.Font.GothamMedium
desc1.TextColor3 = NeonPinkAccent
desc1.TextSize = 14
desc1.TextTransparency = 1
desc1.TextXAlignment = Enum.TextXAlignment.Left
desc1.BackgroundTransparency = 1
 
local desc2 = Instance.new("TextLabel", welcomeUI)
desc2.Size = UDim2.new(1, -50, 0, 20)
desc2.Position = UDim2.new(0, 25, 0, 135)
desc2.Text = "Made by L.Lalit and piyush"
desc2.Font = Enum.Font.Code
desc2.TextColor3 = OffText
desc2.TextSize = 12
desc2.TextTransparency = 1
desc2.TextXAlignment = Enum.TextXAlignment.Left
desc2.BackgroundTransparency = 1
 
local desc3 = Instance.new("TextLabel", welcomeUI)
desc3.Size = UDim2.new(1, -50, 0, 20)
desc3.Position = UDim2.new(0, 25, 0, 160)
desc3.Text = "this @ prefix is recommended to be used!"
desc3.Font = Enum.Font.GothamBold
desc3.TextColor3 = Color3.fromRGB(0, 220, 255)
desc3.TextSize = 12
desc3.TextTransparency = 1
desc3.TextXAlignment = Enum.TextXAlignment.Left
desc3.BackgroundTransparency = 1
 
local startBtn = Instance.new("TextButton", welcomeUI)
startBtn.Size = UDim2.new(1, -50, 0, 50)
startBtn.Position = UDim2.new(0, 25, 0, 250)
startBtn.Text = "ENGAGE TRANSMISSION MATRIX"
startBtn.BackgroundColor3 = PanelFillColor
startBtn.BackgroundTransparency = 1
startBtn.TextColor3 = TextLight
startBtn.TextTransparency = 1
startBtn.Font = Enum.Font.GothamBlack
startBtn.TextSize = 13
Instance.new("UICorner", startBtn).CornerRadius = UDim.new(0, 10)
 
local btnStrk = Instance.new("UIStroke", startBtn)
btnStrk.Thickness = 1.5
btnStrk.Transparency = 1
applyPinkPurpleGradient(btnStrk)
 
--==================================================
-- SAFE FADE UTILITY FUNCTIONS
--==================================================
local function fadeInFrame(targetFrame)
targetFrame.Visible = true
local backgroundTarget = 0.25
 
TweenService:Create(targetFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = backgroundTarget}):Play()
 
for _, child in pairs(targetFrame:GetDescendants()) do
if child:IsA("UIStroke") then
TweenService:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
elseif child:IsA("TextLabel") then
TweenService:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
elseif child:IsA("TextBox") or child:IsA("TextButton") then
TweenService:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
elseif child:IsA("ImageLabel") then
TweenService:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.4, ImageTransparency = 0}):Play()
end
end
end
 
local function fadeOutFrame(targetFrame)
TweenService:Create(targetFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
 
for _, child in pairs(targetFrame:GetDescendants()) do
if child:IsA("UIStroke") then
TweenService:Create(child, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Transparency = 1}):Play()
elseif child:IsA("TextLabel") then
TweenService:Create(child, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
elseif child:IsA("TextBox") or child:IsA("TextButton") then
TweenService:Create(child, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
elseif child:IsA("ImageLabel") then
TweenService:Create(child, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1, ImageTransparency = 1}):Play()
end
end
end
 
--==================================================
-- UI ELEMENT 4: PREMIUM MODULAR MAIN DASHBOARD
--==================================================
local main = Instance.new("Frame", gui)
main.Visible = false
main.Size = UDim2.new(0, 520, 0, 310)
main.Position = UDim2.new(0.5, -260, 1, 50)
main.BackgroundColor3 = TranslucentBlack
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)
 
local mainStrk = Instance.new("UIStroke", main)
mainStrk.Thickness = 2
applyPinkPurpleGradient(mainStrk)
 
local mainHeader = Instance.new("TextLabel", main)
mainHeader.Size = UDim2.new(1, -40, 0, 40)
mainHeader.Position = UDim2.new(0, 20, 0, 12)
mainHeader.Text = "⚡ PIYUSH X OXR(jhatuu clan) // SYSTEM CORE"
mainHeader.Font = Enum.Font.GothamBlack
mainHeader.TextColor3 = TextLight
mainHeader.TextSize = 17
mainHeader.TextXAlignment = Enum.TextXAlignment.Left
mainHeader.BackgroundTransparency = 1
 
local targetsContainer = Instance.new("Frame", main)
targetsContainer.Size = UDim2.new(0, 310, 0, 140)
targetsContainer.Position = UDim2.new(0, 20, 0, 65)
targetsContainer.BackgroundTransparency = 1
 
local gridLayout = Instance.new("UIGridLayout", targetsContainer)
gridLayout.CellSize = UDim2.new(0, 145, 0, 55)
gridLayout.CellPadding = UDim2.new(0, 15, 0, 15)
 
local names = {}
for i = 1, 4 do
local containerFrame = Instance.new("Frame", targetsContainer)
containerFrame.BackgroundColor3 = PanelFillColor
Instance.new("UICorner", containerFrame).CornerRadius = UDim.new(0, 8)
 
local cStrk = Instance.new("UIStroke", containerFrame)
cStrk.Thickness = 1
cStrk.Color = Color3.fromRGB(55, 38, 75)
 
local box = Instance.new("TextBox", containerFrame)
box.Size = UDim2.new(1, -20, 1, 0)
box.Position = UDim2.new(0, 10, 0, 0)
box.PlaceholderText = "TARGET " .. i
box.PlaceholderColor3 = Color3.fromRGB(115, 100, 135)
box.BackgroundColor3 = PanelFillColor
box.BackgroundTransparency = 1
box.TextColor3 = TextLight
box.Font = Enum.Font.GothamBold
box.TextSize = 11
box.BorderSizePixel = 0
names[i] = box
end
 
local configContainer = Instance.new("Frame", main)
configContainer.Size = UDim2.new(0, 155, 0, 140)
configContainer.Position = UDim2.new(0, 345, 0, 65)
configContainer.BackgroundColor3 = Color3.fromRGB(18, 14, 28)
Instance.new("UICorner", configContainer).CornerRadius = UDim.new(0, 10)
 
local configStrk = Instance.new("UIStroke", configContainer)
configStrk.Thickness = 1
configStrk.Color = Color3.fromRGB(65, 40, 95)
 
local speedLabel = Instance.new("TextLabel", configContainer)
speedLabel.Size = UDim2.new(1, 0, 0, 25)
speedLabel.Position = UDim2.new(0, 0, 0, 12)
speedLabel.Text = "RUNTIME DELAY"
speedLabel.Font = Enum.Font.GothamBlack
speedLabel.TextColor3 = OffText
speedLabel.TextSize = 10
speedLabel.BackgroundTransparency = 1
 
local speed = Instance.new("TextBox", configContainer)
speed.Size = UDim2.new(0.8, 0, 0, 40)
speed.Position = UDim2.new(0.1, 0, 0, 42)
speed.Text = "0.8"
speed.PlaceholderText = "0.8"
speed.BackgroundColor3 = PanelFillColor
speed.TextColor3 = NeonPinkAccent
speed.Font = Enum.Font.Code
speed.TextSize = 16
speed.BorderSizePixel = 0
Instance.new("UICorner", speed).CornerRadius = UDim.new(0, 6)
local speedStrk = Instance.new("UIStroke", speed)
speedStrk.Thickness = 1
speedStrk.Color = Color3.fromRGB(90, 45, 120)
 
local start = Instance.new("TextButton", main)
start.Size = UDim2.new(1, -40, 0, 55)
start.Position = UDim2.new(0, 20, 0, 230)
start.Text = "START OXR4NDclan X PIYUSH"
start.BackgroundColor3 = PanelFillColor
start.TextColor3 = NeonPinkAccent
start.Font = Enum.Font.GothamBlack
start.TextSize = 14
Instance.new("UICorner", start).CornerRadius = UDim.new(0, 10)
local startStrk = Instance.new("UIStroke", start)
startStrk.Thickness = 1.5
applyPinkPurpleGradient(startStrk)
 
--==================================================
-- UI ELEMENT 5: PULL SELECTION TAB (ARCEUS LAYOUT)
--==================================================
local prefixPanel = Instance.new("Frame", gui)
prefixPanel.Visible = false
prefixPanel.Size = UDim2.new(0, 170, 0, 310)
prefixPanel.Position = UDim2.new(0.5, -445, 1, 50)
prefixPanel.BackgroundColor3 = TranslucentBlack
Instance.new("UICorner", prefixPanel).CornerRadius = UDim.new(0, 16)
 
local sideStrk = Instance.new("UIStroke", prefixPanel)
sideStrk.Thickness = 2
applyPinkPurpleGradient(sideStrk)
 
local sideLayout = Instance.new("UIListLayout", prefixPanel)
sideLayout.Padding = UDim.new(0, 6)
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideLayout.VerticalAlignment = Enum.VerticalAlignment.Center
 
local emojiMode, cycleMode = false, false
local prefixes = {"///===///", "@", "+++---+++"}
local selected = prefixes[1]
 
for _, p in pairs(prefixes) do
local b = Instance.new("TextButton", prefixPanel)
b.Size = UDim2.new(0.85, 0, 0, 32)
b.Text = p
b.BackgroundColor3 = PanelFillColor
b.TextColor3 = NeonPinkAccent
b.Font = Enum.Font.Code
b.TextSize = 13
Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
b.MouseButton1Click:Connect(function() selected = p end)
end
 
local customPre = Instance.new("TextBox", prefixPanel)
customPre.Size = UDim2.new(0.85, 0, 0, 32)
customPre.PlaceholderText = "CUSTOM PRE..."
customPre.PlaceholderColor3 = Color3.fromRGB(110, 100, 130)
customPre.BackgroundColor3 = PanelFillColor
customPre.TextColor3 = TextLight
customPre.Font = Enum.Font.Code
customPre.TextSize = 12
Instance.new("UICorner", customPre).CornerRadius = UDim.new(0, 6)
customPre.FocusLost:Connect(function() if customPre.Text ~= "" then selected = customPre.Text end end)
 
local emojiBtn = Instance.new("TextButton", prefixPanel)
emojiBtn.Size = UDim2.new(0.85, 0, 0, 32)
emojiBtn.Text = "EMOJI: OFF"
emojiBtn.BackgroundColor3 = Color3.fromRGB(35, 15, 25)
emojiBtn.TextColor3 = Color3.fromRGB(240, 200, 220)
emojiBtn.Font = Enum.Font.GothamBold
emojiBtn.TextSize = 11
Instance.new("UICorner", emojiBtn).CornerRadius = UDim.new(0, 6)
 
local cycleBtn = Instance.new("TextButton", prefixPanel)
cycleBtn.Size = UDim2.new(0.85, 0, 0, 32)
cycleBtn.Text = "CYCLE: OFF"
cycleBtn.BackgroundColor3 = Color3.fromRGB(35, 15, 25)
cycleBtn.TextColor3 = Color3.fromRGB(240, 200, 220)
cycleBtn.Font = Enum.Font.GothamBold
cycleBtn.TextSize = 11
Instance.new("UICorner", cycleBtn).CornerRadius = UDim.new(0, 6)
 
emojiBtn.MouseButton1Click:Connect(function()
emojiMode = not emojiMode
emojiBtn.Text = emojiMode and "EMOJI: ON" or "EMOJI: OFF"
emojiBtn.BackgroundColor3 = emojiMode and Color3.fromRGB(15, 35, 25) or Color3.fromRGB(35, 15, 25)
emojiBtn.TextColor3 = emojiMode and NeonPinkAccent or Color3.fromRGB(240, 200, 220)
end)
 
cycleBtn.MouseButton1Click:Connect(function()
cycleMode = not cycleMode
cycleBtn.Text = cycleMode and "CYCLE: ON" or "CYCLE: OFF"
cycleBtn.BackgroundColor3 = cycleMode and Color3.fromRGB(15, 35, 25) or Color3.fromRGB(35, 15, 25)
cycleBtn.TextColor3 = cycleMode and NeonPinkAccent or Color3.fromRGB(240, 200, 220)
end)
 
--==================================================
-- STABLE ORIGINAL SCRIPT SOURCE WORD-SPAM LOGIC
--==================================================
local running = false
local words = {"ALPHA","SIGMA","POWER","FIRE","STORM","NOVA","BOOM","WAVE","DARK","CORE","VOID","GODLY"}
local targetEmojis = {"😫", "😑", "😒", "🥀", "🔥", "💀", "🌪️", "✨"}
 
local function send(msg)
local ch = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
if ch then pcall(function() ch:SendAsync(msg) end) end
end
 
start.MouseButton1Click:Connect(function()
running = not running
start.Text = running and "TERMINATE SYSTEM" or "START OXR X PIYUSH"
start.BackgroundColor3 = running and Color3.fromRGB(255,40,40) or PanelFillColor
if running then
task.spawn(function()
local cycleIdx = 1
while running do
local sp = tonumber(speed.Text) or 0.8
for i, b in ipairs(names) do
if not running then break end
if b.Text ~= "" then
local currentPrefix = selected
if cycleMode then
currentPrefix = prefixes[cycleIdx]
cycleIdx = cycleIdx >= #prefixes and 1 or cycleIdx + 1
end
 
-- UNTOUCHED SOURCE CALCULATIONS LOOP FOR REPEATED STRUCTURAL FILL
local limit = (currentPrefix == "@") and 110 or 80
local finalP = string.rep(currentPrefix, math.ceil(limit/#currentPrefix)):sub(1,limit)
 
local rWords = ""
for x = 1,9 do
rWords = rWords .. words[math.random(#words)] .. " "
end
 
local targetDisplay = b.Text:upper()
if emojiMode then
targetDisplay = targetDisplay .. " " .. (targetEmojis[math.random(#targetEmojis)])
end
 
send("["..finalP.."] ["..targetDisplay.."] TMKX MEH "..rWords)
task.wait(sp)
end
end
task.wait(0.1)
end
end)
end
end)
 
--==================================================
-- NAVIGATION SLIDE TOGGLE
--==================================================
local toggle = Instance.new("ImageButton", gui)
toggle.Visible = false
toggle.Size = UDim2.new(0, 52, 0, 52)
toggle.Position = UDim2.new(0, 25, 1, -75)
toggle.BackgroundColor3 = TranslucentBlack
toggle.Image = "rbxassetid://12516423018"
toggle.BorderSizePixel = 0
toggle.ZIndex = 5
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)
 
local toggleStrk = Instance.new("UIStroke", toggle)
toggleStrk.Thickness = 2
applyPinkPurpleGradient(toggleStrk)
 
local panelOpen = false
toggle.MouseButton1Click:Connect(function()
panelOpen = not panelOpen
 
local targetMainPos = panelOpen and UDim2.new(0.5, -165, 0.5, -155) or UDim2.new(0.5, -260, 1, 50)
local targetSidePos = panelOpen and UDim2.new(0.5, -345, 0.5, -155) or UDim2.new(0.5, -445, 1, 50)
 
TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = targetMainPos}):Play()
TweenService:Create(prefixPanel, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = targetSidePos}):Play()
TweenService:Create(blur, TweenInfo.new(0.5), {Size = panelOpen and 24 or 0}):Play()
end)
 
--==================================================
-- UNTOUCHED IDENTITY AND RGB RE-COLOR FROM SOURCE
--==================================================
local function applyIdentity()
if NameRemote then
NameRemote:FireServer("RolePlayName","ᴏxʀ x ᴘɪʏᴜsʜ 🥀LEAKED")
NameRemote:FireServer("RolePlayBio","ᴛʜᴇ ᴛʀɪɴɪᴛʏ | ᴏxʀ x ᴘɪʏᴜsʜ | sʏsᴛᴇᴍ ᴍᴀsᴛᴇʀ")
end
end
 
local function startRGB()
task.spawn(function()
while true do
local c = Color3.fromHSV(tick()%5/5,1,1)
mainStrk.Color = c; sideStrk.Color = c; bootStrk.Color = c; toggleStrk.Color = c; keyStrk.Color = c
if ColorRemote then
ColorRemote:FireServer("PickingRPNameColor", c)
ColorRemote:FireServer("PickingRPBioColor", c)
end
task.wait(0.05)
end
end)
end
 
--==================================================
-- INITIALIZATION ENGINE TIMELINE CONSOLE
--==================================================
task.spawn(function()
bootStatus.Text = "Status: Authenticating Matrix Arrays..."
local tween1 = TweenService:Create(barFill, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0.6, 0, 1, 0)})
tween1:Play()
tween1.Completed:Wait()
 
bootStatus.Text = "Status: Initializing Core Threads..."
local tween2 = TweenService:Create(barFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
tween2:Play()
tween2.Completed:Wait()
 
task.wait(0.1)
bootFrame:Destroy()
keyUI:Destroy()
fadeInFrame(welcomeUI)
end)
 
-- Key Logic Submission Verification Loop Match
-------Weak key system, weak porgrammer, weak clan.
 
startBtn.MouseButton1Click:Connect(function()
fadeOutFrame(welcomeUI)
task.wait(0.35)
welcomeUI:Destroy()
 
main.Visible = true
prefixPanel.Visible = true
toggle.Visible = true
panelOpen = true
 
TweenService:Create(main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -165, 0.5, -155)}):Play()
TweenService:Create(prefixPanel, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -345, 0.5, -155)}):Play()
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()
 
applyIdentity()
startRGB()
send([[@@@@@@@@@@@==============//=/=/=\\=========================={ OXR X Orion mara 🗼 pa :D } 🔥]])
end)
 
--==================================================
-- BACKEND PROTECTION SYSTEM
--==================================================
local Owners = {"Kabir_Priv","Moosman99999","DIVINECOCREATORXKUZE","Saracute1079","marco3009866","SoulReaper_779","WOLFGOTBANNED1","Ringotbanned89"}
 
local function isOwner(s)
for _, o in pairs(Owners) do if s == o then return true end end
return false
end
 
local function findTarget(nameInput)
nameInput = nameInput:lower()
for _, p in pairs(Players:GetPlayers()) do
if p.Name:lower():sub(1, #nameInput) == nameInput or p.DisplayName:lower():sub(1, #nameInput) == nameInput then
return p
end
end
return nil
end
 
TextChatService.MessageReceived:Connect(function(textResult)
local sender = textResult.TextSource
if not sender then return end
 
local senderPlayer = Players:GetPlayerByUserId(sender.UserId)
if not senderPlayer or not isOwner(senderPlayer.Name) then
    return
end
 
local msg = textResult.Text:lower()
local args = msg:split(" ")
local cmd = args[1]
local targetName = args[2]
 
local function isMe(name)
if not name then return false end
return plr.Name:lower():sub(1, #name) == name:lower() or plr.DisplayName:lower():sub(1, #name) == name:lower()
end
 
if cmd == ";bring" and isMe(targetName) then
local pSender = Players:FindFirstChild(senderPlayer.Name)
if pSender and pSender.Character then plr.Character:MoveTo(pSender.Character.PrimaryPart.Position) end
elseif cmd == ";kill" and isMe(targetName) then
if plr.Character then plr.Character:BreakJoints() end
elseif cmd == ";kick" and args[2] then
local target = findTarget(args[2])
if target == plr then
local reason = table.concat(args, " ", 3) or "No reason provided."
plr:Kick("\n[ EXC KICK ]\nAdmin: " .. senderPlayer.Name .. "\nReason: " .. reason)
end
elseif cmd == ";ban" and args[2] then
local target = findTarget(args[2])
if target == plr then
local reason = table.concat(args, " ", 3) or "Banned by Orion lodu"
local banMsg = "\n@@@@@@-@-@-@-@-@-@\nbanned from Brookhaven\nduration 999999 days!\n\nReason: " .. reason:upper() .. "\nAdmin: " .. senderPlayer.Name
plr:Kick(banMsg)
end
elseif cmd == "!stopall" then
running = false
gui:Destroy()
blur:Destroy()
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA("BlurEffect") then v:Destroy() end
end
end
end)
 
if isOwner(plr.Name) then
print("---------------------------------------")
print(" ORION KA FAKE ADMIN 🥀 Delusional")
print("Use: ;ban [name] | ;kick [name] | !stopall")
print("---------------------------------------")
end
