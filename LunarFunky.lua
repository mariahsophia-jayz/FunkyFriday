local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer

if game.CoreGui:FindFirstChild("LunarScriptzUI") then
    game.CoreGui.LunarScriptzUI:Destroy()
end

local Theme = {
    Background  = Color3.fromRGB(15, 15, 20),
    TitleBar    = Color3.fromRGB(20, 20, 26),
    Card        = Color3.fromRGB(28, 28, 35),
    CardHover   = Color3.fromRGB(34, 34, 42),
    Accent      = Color3.fromRGB(138, 43, 226),
    AccentHover = Color3.fromRGB(160, 60, 255),
    AccentDim   = Color3.fromRGB(80, 20, 140),
    Button      = Color3.fromRGB(38, 38, 46),
    White       = Color3.fromRGB(255, 255, 255),
    SubText     = Color3.fromRGB(160, 160, 170),
    Muted       = Color3.fromRGB(100, 100, 110),
    Red         = Color3.fromRGB(231, 76, 60),
    Blue        = Color3.fromRGB(52, 152, 219),
    Green       = Color3.fromRGB(46, 204, 113),
}

local function Tween(obj, t, props, style, dir)
    style = style or Enum.EasingStyle.Quad
    dir   = dir   or Enum.EasingDirection.Out
    return TweenService:Create(obj, TweenInfo.new(t, style, dir), props)
end

local function MakeStroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color or Theme.Accent
    s.Thickness = thickness or 1
    s.Transparency = transparency or 0.7
    s.Parent = parent
    return s
end

local function MakeLabel(parent, text, size, font, color, xAlign)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Font = font or Enum.Font.GothamSemibold
    l.Text = text
    l.TextSize = size or 14
    l.TextColor3 = color or Theme.White
    l.TextXAlignment = xAlign or Enum.TextXAlignment.Left
    l.Parent = parent
    return l
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LunarScriptzUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

local FULL_HEIGHT = 280
local MINI_HEIGHT = 48
local GUI_WIDTH   = 480

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.ClipsDescendants = true
MakeStroke(MainFrame, Theme.Accent, 1.5, 0.6)

local Shadow = Instance.new("ImageLabel")
Shadow.Parent = MainFrame
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 8)
Shadow.Size = UDim2.new(1, 50, 1, 50)
Shadow.ZIndex = 0
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Theme.Accent
Shadow.ImageTransparency = 0.75
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(99, 99, 99, 99)

local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Theme.TitleBar
TitleBar.BorderSizePixel = 0
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.Size = UDim2.new(1, 0, 0, 48)

local TitleDot = Instance.new("Frame")
TitleDot.Parent = TitleBar
TitleDot.BackgroundColor3 = Theme.Accent
TitleDot.BorderSizePixel = 0
TitleDot.AnchorPoint = Vector2.new(0, 0.5)
TitleDot.Position = UDim2.new(0, 18, 0.5, 0)
TitleDot.Size = UDim2.new(0, 8, 0, 8)

local TitleText = MakeLabel(TitleBar, "LunarScriptz  ·  Funky Friday", 15, Enum.Font.GothamBold, Theme.White)
TitleText.Position = UDim2.new(0, 36, 0, 0)
TitleText.Size = UDim2.new(1, -100, 1, 0)

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TitleBar
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.BackgroundColor3 = Theme.Button
CloseButton.Position = UDim2.new(1, -14, 0.5, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Theme.White
CloseButton.TextSize = 22
CloseButton.BorderSizePixel = 0
CloseButton.AutoButtonColor = false

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TitleBar
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.BackgroundColor3 = Theme.Button
MinimizeButton.Position = UDim2.new(1, -52, 0.5, 0)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Theme.White
MinimizeButton.TextSize = 20
MinimizeButton.BorderSizePixel = 0
MinimizeButton.AutoButtonColor = false

local Divider = Instance.new("Frame")
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Theme.Button
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 0, 0, 48)
Divider.Size = UDim2.new(1, 0, 0, 1)

local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 49)
ContentFrame.Size = UDim2.new(1, 0, 1, -49)
ContentFrame.ClipsDescendants = true

local StatusBar = Instance.new("Frame")
StatusBar.Parent = ContentFrame
StatusBar.BackgroundColor3 = Theme.Card
StatusBar.BorderSizePixel = 0
StatusBar.Position = UDim2.new(0, 16, 0, 14)
StatusBar.Size = UDim2.new(1, -32, 0, 36)
MakeStroke(StatusBar, Theme.Accent, 1, 0.85)

local StatusDot = Instance.new("Frame")
StatusDot.Parent = StatusBar
StatusDot.BackgroundColor3 = Theme.Muted
StatusDot.BorderSizePixel = 0
StatusDot.AnchorPoint = Vector2.new(0, 0.5)
StatusDot.Position = UDim2.new(0, 14, 0.5, 0)
StatusDot.Size = UDim2.new(0, 9, 0, 9)

local StatusText = MakeLabel(StatusBar, "Idle — waiting for song", 13, Enum.Font.Gotham, Theme.SubText)
StatusText.Position = UDim2.new(0, 32, 0, 0)
StatusText.Size = UDim2.new(1, -44, 1, 0)

local ToggleContainer = Instance.new("Frame")
ToggleContainer.Parent = ContentFrame
ToggleContainer.BackgroundColor3 = Theme.Card
ToggleContainer.BorderSizePixel = 0
ToggleContainer.Position = UDim2.new(0, 16, 0, 62)
ToggleContainer.Size = UDim2.new(1, -32, 0, 68)
MakeStroke(ToggleContainer, Theme.Accent, 1, 0.85)

local ToggleIconBg = Instance.new("Frame")
ToggleIconBg.Parent = ToggleContainer
ToggleIconBg.BackgroundColor3 = Theme.AccentDim
ToggleIconBg.BorderSizePixel = 0
ToggleIconBg.AnchorPoint = Vector2.new(0, 0.5)
ToggleIconBg.Position = UDim2.new(0, 14, 0.5, 0)
ToggleIconBg.Size = UDim2.new(0, 38, 0, 38)

local ToggleIcon = MakeLabel(ToggleIconBg, "▶", 16, Enum.Font.GothamBold, Theme.AccentHover, Enum.TextXAlignment.Center)
ToggleIcon.Size = UDim2.new(1, 0, 1, 0)

local ToggleLabel = MakeLabel(ToggleContainer, "Auto Player", 15, Enum.Font.GothamBold, Theme.White)
ToggleLabel.Position = UDim2.new(0, 62, 0, 14)
ToggleLabel.Size = UDim2.new(1, -140, 0, 22)

local ToggleSubLabel = MakeLabel(ToggleContainer, "Automatically hits notes", 12, Enum.Font.Gotham, Theme.Muted)
ToggleSubLabel.Position = UDim2.new(0, 62, 0, 38)
ToggleSubLabel.Size = UDim2.new(1, -140, 0, 18)

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ToggleContainer
ToggleButton.AnchorPoint = Vector2.new(1, 0.5)
ToggleButton.BackgroundColor3 = Theme.Button
ToggleButton.Position = UDim2.new(1, -16, 0.5, 0)
ToggleButton.Size = UDim2.new(0, 52, 0, 28)
ToggleButton.BorderSizePixel = 0
ToggleButton.AutoButtonColor = false
ToggleButton.Text = ""

local ToggleCircle = Instance.new("Frame")
ToggleCircle.Parent = ToggleButton
ToggleCircle.BackgroundColor3 = Theme.SubText
ToggleCircle.Position = UDim2.new(0, 4, 0.5, -10)
ToggleCircle.Size = UDim2.new(0, 20, 0, 20)
ToggleCircle.BorderSizePixel = 0

local StatsRow = Instance.new("Frame")
StatsRow.Parent = ContentFrame
StatsRow.BackgroundTransparency = 1
StatsRow.Position = UDim2.new(0, 16, 0, 144)
StatsRow.Size = UDim2.new(1, -32, 0, 80)

local function MakeStatCard(parent, xOffset, width, label, value, color)
    local card = Instance.new("Frame")
    card.Parent = parent
    card.BackgroundColor3 = Theme.Card
    card.BorderSizePixel = 0
    card.Position = UDim2.new(0, xOffset, 0, 0)
    card.Size = UDim2.new(0, width, 1, 0)
    MakeStroke(card, color or Theme.Accent, 1, 0.85)

    local valLabel = MakeLabel(card, value, 20, Enum.Font.GothamBold, color or Theme.Accent, Enum.TextXAlignment.Center)
    valLabel.AnchorPoint = Vector2.new(0.5, 0)
    valLabel.Position = UDim2.new(0.5, 0, 0, 12)
    valLabel.Size = UDim2.new(1, 0, 0, 26)
    valLabel.Name = "Value"

    local lblLabel = MakeLabel(card, label, 11, Enum.Font.GothamBold, Theme.Muted, Enum.TextXAlignment.Center)
    lblLabel.AnchorPoint = Vector2.new(0.5, 0)
    lblLabel.Position = UDim2.new(0.5, 0, 0, 44)
    lblLabel.Size = UDim2.new(1, -4, 0, 16)

    return card
end

local totalW = GUI_WIDTH - 32
local cardW  = math.floor((totalW - 8) / 3)
local SideCard  = MakeStatCard(StatsRow, 0,               cardW, "SIDE",  "—",   Theme.Blue)
local DelayCard = MakeStatCard(StatsRow, cardW + 4,       cardW, "DELAY", "0ms", Theme.Green)
local StateCard = MakeStatCard(StatsRow, (cardW + 4) * 2, cardW, "STATE", "OFF", Theme.Muted)

local NotificationFrame = Instance.new("Frame")
NotificationFrame.Parent = ScreenGui
NotificationFrame.AnchorPoint = Vector2.new(0, 1)
NotificationFrame.BackgroundColor3 = Theme.TitleBar
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Position = UDim2.new(0, -340, 1, -20)
NotificationFrame.Size = UDim2.new(0, 300, 0, 52)
MakeStroke(NotificationFrame, Theme.Accent, 1.5, 0.5)

local NotifIcon = MakeLabel(NotificationFrame, "◆", 13, Enum.Font.GothamBold, Theme.Accent, Enum.TextXAlignment.Left)
NotifIcon.Position = UDim2.new(0, 14, 0.5, -8)
NotifIcon.Size = UDim2.new(0, 16, 0, 16)

local NotifText = MakeLabel(NotificationFrame, "", 13, Enum.Font.GothamSemibold, Theme.White, Enum.TextXAlignment.Left)
NotifText.Position = UDim2.new(0, 34, 0.5, -9)
NotifText.Size = UDim2.new(1, -48, 0, 18)

local NotifSub = MakeLabel(NotificationFrame, "LunarScriptz", 10, Enum.Font.Gotham, Theme.Muted, Enum.TextXAlignment.Left)
NotifSub.Position = UDim2.new(0, 34, 0.5, 6)
NotifSub.Size = UDim2.new(1, -48, 0, 13)

local NotifProgress = Instance.new("Frame")
NotifProgress.Parent = NotificationFrame
NotifProgress.BackgroundColor3 = Theme.Accent
NotifProgress.BorderSizePixel = 0
NotifProgress.AnchorPoint = Vector2.new(0, 1)
NotifProgress.Position = UDim2.new(0, 0, 1, 0)
NotifProgress.Size = UDim2.new(1, 0, 0, 3)

local notificationActive = false

local function ShowNotification(text, duration)
    if notificationActive then return end
    notificationActive = true
    duration = duration or 2.5
    NotifText.Text = text
    NotifProgress.Size = UDim2.new(1, 0, 0, 3)
    Tween(NotificationFrame, 0.45, {Position = UDim2.new(0, 14, 1, -20)}, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
    Tween(NotifProgress, duration, {Size = UDim2.new(0, 0, 0, 3)}, Enum.EasingStyle.Linear):Play()
    task.wait(duration)
    local tweenOut = Tween(NotificationFrame, 0.35, {Position = UDim2.new(0, -340, 1, -20)}, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    tweenOut:Play()
    tweenOut.Completed:Wait()
    notificationActive = false
end

local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging  = true
        dragStart = input.Position
        startPos  = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

local minimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame.ClipsDescendants = true
        Tween(MainFrame, 0.3, {Size = UDim2.new(0, GUI_WIDTH, 0, MINI_HEIGHT)}):Play()
        MinimizeButton.Text = "+"
    else
        Tween(MainFrame, 0.35, {Size = UDim2.new(0, GUI_WIDTH, 0, FULL_HEIGHT)}, Enum.EasingStyle.Back):Play()
        MinimizeButton.Text = "−"
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    local t = Tween(MainFrame, 0.3, {Size = UDim2.new(0, 0, 0, 0)})
    t:Play()
    t.Completed:Wait()
    ScreenGui:Destroy()
end)

CloseButton.MouseEnter:Connect(function()     Tween(CloseButton,     0.18, {BackgroundColor3 = Theme.Red}):Play() end)
CloseButton.MouseLeave:Connect(function()    Tween(CloseButton,     0.18, {BackgroundColor3 = Theme.Button}):Play() end)
MinimizeButton.MouseEnter:Connect(function()  Tween(MinimizeButton,  0.18, {BackgroundColor3 = Theme.Blue}):Play() end)
MinimizeButton.MouseLeave:Connect(function() Tween(MinimizeButton,  0.18, {BackgroundColor3 = Theme.Button}):Play() end)
ToggleContainer.MouseEnter:Connect(function() Tween(ToggleContainer, 0.18, {BackgroundColor3 = Theme.CardHover}):Play() end)
ToggleContainer.MouseLeave:Connect(function() Tween(ToggleContainer, 0.18, {BackgroundColor3 = Theme.Card}):Play() end)

_G.auto  = false
_G.Delay = 0

local Side            = nil
local keymap          = {}
local autoplayRunning = false
local songFound       = false

local laneState = {}
for i = 1, 9 do
    laneState[i] = {
        held        = false,
        holdNote    = nil,
        holdEnd     = nil,
        lastTap     = 0,
        missedFrames = 0,
    }
end

local function SetStatus(text, dotColor)
    StatusText.Text = text
    Tween(StatusDot, 0.2, {BackgroundColor3 = dotColor or Theme.Muted}):Play()
end

local function UpdateStatCards()
    SideCard.Value.Text  = Side or "—"
    DelayCard.Value.Text = _G.Delay .. "ms"
    StateCard.Value.Text = _G.auto and "ON" or "OFF"
    local stroke = StateCard:FindFirstChildWhichIsA("UIStroke")
    if stroke then
        Tween(stroke, 0.2, {Color = _G.auto and Theme.Green or Theme.Muted}):Play()
    end
    StateCard.Value.TextColor3 = _G.auto and Theme.Green or Theme.Muted
end

local function resetLaneState()
    for i = 1, 9 do
        laneState[i] = {
            held         = false,
            holdNote     = nil,
            holdEnd      = nil,
            lastTap      = 0,
            missedFrames = 0,
        }
    end
end

local function pressKey(lane)
    if keymap[lane] then
        pcall(function() VirtualInputManager:SendKeyEvent(true, keymap[lane], false, game) end)
        laneState[lane].held = true
    end
end

local function releaseKey(lane)
    if keymap[lane] then
        pcall(function() VirtualInputManager:SendKeyEvent(false, keymap[lane], false, game) end)
        laneState[lane].held = false
    end
end

local function releaseAllKeys()
    for i = 1, 9 do
        releaseKey(i)
        laneState[i].held        = false
        laneState[i].holdNote    = nil
        laneState[i].holdEnd     = nil
        laneState[i].missedFrames = 0
    end
end

local function tapKey(lane)
    local state = laneState[lane]
    local now   = tick()

    if state.held then
        releaseKey(lane)
        pressKey(lane)
        task.delay(0.015, function()
            if not laneState[lane].holdNote then releaseKey(lane) end
        end)
        return
    end

    if (now - state.lastTap) < 0.05 then
        releaseKey(lane)
    end

    pressKey(lane)
    state.lastTap = tick()
    task.delay(0.015, function()
        if not laneState[lane].holdNote then releaseKey(lane) end
    end)
end

local function CheckSide()
    pcall(function()
        local character = player.Character
        local rootPart  = character and character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        local minLeft, minRight = math.huge, math.huge
        for _, stage in pairs(workspace.Map.Stages:GetChildren()) do
            if stage:FindFirstChild("Teams") then
                local lp = stage.Teams:FindFirstChild("Left")
                local rp = stage.Teams:FindFirstChild("Right")
                if lp then
                    local d = (rootPart.Position - lp.Position).Magnitude
                    if d <= 10 and d < minLeft then minLeft = d end
                end
                if rp then
                    local d = (rootPart.Position - rp.Position).Magnitude
                    if d <= 10 and d < minRight then minRight = d end
                end
            end
        end
        if     minLeft < minRight then Side = "Left"
        elseif minRight < minLeft then Side = "Right"
        end
    end)
end

local function UpdateKeymap()
    pcall(function()
        if not Side then return end
        local fields = player.PlayerGui
            :WaitForChild("Window", 5)
            :WaitForChild("Game",   5)
            :WaitForChild("Fields", 5)
        local sideField = fields:FindFirstChild(Side)
        if not sideField then return end
        local inner = sideField:FindFirstChild("Inner")
        if not inner then return end
        for i = 1, 9 do
            local lane = inner:FindFirstChild("Lane" .. i)
            if lane and lane:FindFirstChild("Labels") then
                local lbl = lane.Labels:FindFirstChild("Label")
                if lbl and lbl:FindFirstChild("Text") then
                    keymap[i] = Enum.KeyCode[lbl.Text.text] or lbl.Text.text
                end
            end
        end
    end)
end

local function setupColumns(side)
    local columns = {}
    pcall(function()
        local fields    = player.PlayerGui.Window.Game.Fields
        local sideField = fields:FindFirstChild(side)
        if not sideField then return end
        local inner = sideField:FindFirstChild("Inner")
        if not inner then return end
        for i = 1, 9 do
            local lane = inner:FindFirstChild("Lane" .. i)
            if lane and lane:FindFirstChild("Notes") then
                columns[i] = lane.Notes
            end
        end
    end)
    return columns
end

local function findHoldTail(note)
    for _, child in ipairs(note:GetChildren()) do
        local n = child.Name:lower()
        if n == "end" or n == "tail" or n == "long" or n == "body" then
            return child
        end
    end
    local best, bestY = nil, -math.huge
    for _, child in ipairs(note:GetChildren()) do
        if child:IsA("GuiObject") then
            local y = child.AbsolutePosition.Y + child.AbsoluteSize.Y
            if y > bestY then bestY = y; best = child end
        end
    end
    return best
end

local RELEASE_THRESHOLD = 0.10
local HIT_THRESHOLD     = 0.38
local LAG_BUFFER        = 3

local function autoplay()
    while _G.auto do
        pcall(function()
            if not Side then
                CheckSide()
                UpdateKeymap()
                task.wait(0.05)
                return
            end

            local columns = setupColumns(Side)
            if not next(columns) then
                task.wait(0.05)
                return
            end

            if not songFound then
                songFound = true
                SetStatus("Song detected — playing!", Theme.Green)
                UpdateStatCards()
                ShowNotification("Song Detected!", 2.5)
            end

            resetLaneState()

            local seen = {}
            for i = 1, 9 do seen[i] = {} end

            while _G.auto and Side do
                local broken = false

                for colNum, column in pairs(columns) do
                    if not column or not column.Parent then
                        broken = true
                        break
                    end

                    local state = laneState[colNum]

                    -- handle active hold release in main loop
                    if state.holdNote then
                        local note = state.holdNote
                        if not note:IsDescendantOf(column) then
                            releaseKey(colNum)
                            state.holdNote    = nil
                            state.holdEnd     = nil
                            state.missedFrames = 0
                        else
                            local tail = state.holdEnd
                            local past = false
                            if tail then
                                if (tail.Position.Y.Scale + tail.Size.Y.Scale) < RELEASE_THRESHOLD then
                                    past = true
                                end
                            else
                                if note.Position.Y.Scale < RELEASE_THRESHOLD then
                                    past = true
                                end
                            end
                            if past then
                                state.missedFrames += 1
                                if state.missedFrames >= LAG_BUFFER then
                                    releaseKey(colNum)
                                    state.holdNote    = nil
                                    state.holdEnd     = nil
                                    state.missedFrames = 0
                                end
                            else
                                state.missedFrames = 0
                            end
                        end
                    end

                    -- detect new notes
                    for _, note in ipairs(column:GetChildren()) do
                        if note:IsA("GuiObject") and not seen[colNum][note] then
                            if note.Position.Y.Scale >= HIT_THRESHOLD then
                                seen[colNum][note] = true
                                local isHold = #note:GetChildren() >= 2
                                if isHold then
                                    if state.holdNote and state.holdNote ~= note then
                                        releaseKey(colNum)
                                    end
                                    state.holdNote    = note
                                    state.holdEnd     = findHoldTail(note)
                                    state.missedFrames = 0
                                    pressKey(colNum)
                                else
                                    tapKey(colNum)
                                end
                            end
                        end
                    end

                    for note in pairs(seen[colNum]) do
                        if not note:IsDescendantOf(column) then
                            seen[colNum][note] = nil
                        end
                    end
                end

                if broken then
                    releaseAllKeys()
                    task.wait(0.05)
                    break
                end

                RunService.Heartbeat:Wait()
            end

            releaseAllKeys()
            resetLaneState()
        end)

        task.wait(0.02)
    end

    releaseAllKeys()
    resetLaneState()
    SetStatus("Idle — waiting for song")
    UpdateStatCards()
end

local toggled = false

ToggleButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    _G.auto = toggled

    if toggled then
        Tween(ToggleButton, 0.3, {BackgroundColor3 = Theme.Accent}):Play()
        Tween(ToggleCircle, 0.3, {Position = UDim2.new(1, -24, 0.5, -10), BackgroundColor3 = Theme.White}):Play()
        Tween(ToggleIconBg, 0.2, {BackgroundColor3 = Theme.Accent}):Play()
        SetStatus("Enabled — searching for song...", Theme.Accent)
        UpdateStatCards()
        ShowNotification("Auto Player Enabled", 2)
        songFound = false
        releaseAllKeys()
        resetLaneState()
        CheckSide()
        UpdateKeymap()
        UpdateStatCards()
        if not autoplayRunning then
            autoplayRunning = true
            task.spawn(function()
                autoplay()
                autoplayRunning = false
            end)
        end
    else
        Tween(ToggleButton, 0.3, {BackgroundColor3 = Theme.Button}):Play()
        Tween(ToggleCircle, 0.3, {Position = UDim2.new(0, 4, 0.5, -10), BackgroundColor3 = Theme.SubText}):Play()
        Tween(ToggleIconBg, 0.2, {BackgroundColor3 = Theme.AccentDim}):Play()
        SetStatus("Disabled")
        UpdateStatCards()
        ShowNotification("Auto Player Disabled", 2)
        songFound       = false
        autoplayRunning = false
        releaseAllKeys()
        resetLaneState()
    end
end)

player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

task.spawn(function()
    while true do
        pcall(function()
            if player.PlayerGui:FindFirstChild("GameGui") then
                local sel = player.PlayerGui.GameGui.Windows
                    and player.PlayerGui.GameGui.Windows:FindFirstChild("SongSelector")
                if sel and sel.Visible then
                    CheckSide()
                    UpdateKeymap()
                    UpdateStatCards()
                end
            end
        end)
        task.wait(0.5)
    end
end)

local lastGameState = nil
task.spawn(function()
    while true do
        pcall(function()
            local gameGui = player.PlayerGui:FindFirstChild("Window")
            if gameGui then
                local gameFrame = gameGui:FindFirstChild("Game")
                local current   = gameFrame and gameFrame.Visible or false
                if current ~= lastGameState then
                    lastGameState = current
                    if current and _G.auto then
                        songFound = false
                        releaseAllKeys()
                        resetLaneState()
                        CheckSide()
                        UpdateKeymap()
                        UpdateStatCards()
                        if not autoplayRunning then
                            autoplayRunning = true
                            task.spawn(function()
                                autoplay()
                                autoplayRunning = false
                            end)
                        end
                    elseif not current then
                        songFound = false
                        releaseAllKeys()
                        resetLaneState()
                        SetStatus("Idle — waiting for song")
                        UpdateStatCards()
                    end
                end
            end
        end)
        task.wait(0.25)
    end
end)

Tween(MainFrame, 0.55, {Size = UDim2.new(0, GUI_WIDTH, 0, FULL_HEIGHT)}, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
task.spawn(function()
    task.wait(0.6)
    ShowNotification("LunarScriptz loaded!", 2.5)
end)