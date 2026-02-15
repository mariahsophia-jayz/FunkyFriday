local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LunarScriptzUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 420, 0, 200)
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Parent = MainFrame
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = 0
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(99, 99, 99, 99)

local AccentBar = Instance.new("Frame")
AccentBar.Name = "AccentBar"
AccentBar.Parent = MainFrame
AccentBar.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
AccentBar.BorderSizePixel = 0
AccentBar.Size = UDim2.new(1, 0, 0, 3)

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Position = UDim2.new(0, 0, 0, 3)
TitleBar.Size = UDim2.new(1, 0, 0, 45)

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 12)
TitleBarCorner.Parent = TitleBar

local TitleBarFix = Instance.new("Frame")
TitleBarFix.Parent = TitleBar
TitleBarFix.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
TitleBarFix.BorderSizePixel = 0
TitleBarFix.Position = UDim2.new(0, 0, 1, -12)
TitleBarFix.Size = UDim2.new(1, 0, 0, 12)

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 20, 0, 0)
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "LunarScriptz | Funky Friday"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 16
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CloseButton.Position = UDim2.new(1, -15, 0.5, 0)
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.BorderSizePixel = 0

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TitleBar
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
MinimizeButton.Position = UDim2.new(1, -50, 0.5, 0)
MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 20
MinimizeButton.BorderSizePixel = 0

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeButton

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 53)
ContentFrame.Size = UDim2.new(1, 0, 1, -53)

local ToggleContainer = Instance.new("Frame")
ToggleContainer.Name = "ToggleContainer"
ToggleContainer.Parent = ContentFrame
ToggleContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
ToggleContainer.BorderSizePixel = 0
ToggleContainer.Position = UDim2.new(0, 20, 0, 20)
ToggleContainer.Size = UDim2.new(1, -40, 0, 70)

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 10)
ToggleCorner.Parent = ToggleContainer

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Parent = ToggleContainer
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 20, 0, 10)
ToggleLabel.Size = UDim2.new(1, -100, 0, 25)
ToggleLabel.Font = Enum.Font.GothamSemibold
ToggleLabel.Text = "Auto Player"
ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.TextSize = 15
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
ToggleLabel.TextYAlignment = Enum.TextYAlignment.Top

local ToggleStatus = Instance.new("TextLabel")
ToggleStatus.Name = "ToggleStatus"
ToggleStatus.Parent = ToggleContainer
ToggleStatus.BackgroundTransparency = 1
ToggleStatus.Position = UDim2.new(0, 20, 0, 40)
ToggleStatus.Size = UDim2.new(1, -100, 0, 20)
ToggleStatus.Font = Enum.Font.Gotham
ToggleStatus.Text = "Disabled"
ToggleStatus.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleStatus.TextSize = 12
ToggleStatus.TextXAlignment = Enum.TextXAlignment.Left
ToggleStatus.TextYAlignment = Enum.TextYAlignment.Top

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ToggleContainer
ToggleButton.AnchorPoint = Vector2.new(1, 0.5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
ToggleButton.Position = UDim2.new(1, -20, 0.5, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 26)
ToggleButton.BorderSizePixel = 0
ToggleButton.AutoButtonColor = false
ToggleButton.Text = ""

local ToggleBGCorner = Instance.new("UICorner")
ToggleBGCorner.CornerRadius = UDim.new(1, 0)
ToggleBGCorner.Parent = ToggleButton

local ToggleCircle = Instance.new("Frame")
ToggleCircle.Name = "ToggleCircle"
ToggleCircle.Parent = ToggleButton
ToggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ToggleCircle.Position = UDim2.new(0, 3, 0.5, -10)
ToggleCircle.Size = UDim2.new(0, 20, 0, 20)
ToggleCircle.BorderSizePixel = 0

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = ToggleCircle

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Name = "CreditsLabel"
CreditsLabel.Parent = ContentFrame
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Position = UDim2.new(0, 20, 1, -35)
CreditsLabel.Size = UDim2.new(1, -40, 0, 20)
CreditsLabel.Font = Enum.Font.Gotham
CreditsLabel.Text = "Made by LunarScriptz | 0ms Delay"
CreditsLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
CreditsLabel.TextSize = 11
CreditsLabel.TextXAlignment = Enum.TextXAlignment.Center

local NotificationFrame = Instance.new("Frame")
NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = ScreenGui
NotificationFrame.AnchorPoint = Vector2.new(0, 1)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Position = UDim2.new(0, -320, 1, -20)
NotificationFrame.Size = UDim2.new(0, 300, 0, 60)
NotificationFrame.ClipsDescendants = false

local NotifCorner = Instance.new("UICorner")
NotifCorner.CornerRadius = UDim.new(0, 10)
NotifCorner.Parent = NotificationFrame

local NotifAccent = Instance.new("Frame")
NotifAccent.Name = "NotifAccent"
NotifAccent.Parent = NotificationFrame
NotifAccent.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
NotifAccent.BorderSizePixel = 0
NotifAccent.Size = UDim2.new(1, 0, 0, 3)

local NotifText = Instance.new("TextLabel")
NotifText.Name = "NotifText"
NotifText.Parent = NotificationFrame
NotifText.BackgroundTransparency = 1
NotifText.Position = UDim2.new(0, 15, 0, 10)
NotifText.Size = UDim2.new(1, -30, 1, -20)
NotifText.Font = Enum.Font.GothamSemibold
NotifText.Text = ""
NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifText.TextSize = 14
NotifText.TextXAlignment = Enum.TextXAlignment.Center
NotifText.TextYAlignment = Enum.TextYAlignment.Center

local notificationActive = false

local function ShowNotification(text, duration)
    if notificationActive then return end
    notificationActive = true
    
    NotifText.Text = text
    local tweenIn = TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 20, 1, -20)})
    tweenIn:Play()
    
    task.wait(duration or 2)
    
    local tweenOut = TweenService:Create(NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0, -320, 1, -20)})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    notificationActive = false
end

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if minimized then
        TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 420, 0, 48)}):Play()
        MinimizeButton.Text = "+"
    else
        TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 420, 0, 200)}):Play()
        MinimizeButton.Text = "_"
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
    tween:Play()
    tween.Completed:Wait()
    ScreenGui:Destroy()
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(231, 76, 60)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
end)

MinimizeButton.MouseEnter:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(52, 152, 219)}):Play()
end)

MinimizeButton.MouseLeave:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
end)

local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

_G.auto = false
_G.Delay = 0
local Side = nil
local keymap = {}
local autoplayRunning = false
local songFound = false

local function CheckSide()
    pcall(function()
        local character = player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local minDistToLeft = math.huge
        local minDistToRight = math.huge

        for _, stage in pairs(workspace.Map.Stages:GetChildren()) do
            if stage:FindFirstChild("Teams") then
                local pads = stage.Teams
                local leftPad = pads:FindFirstChild("Left")
                local rightPad = pads:FindFirstChild("Right")
                
                if leftPad then
                    local dist = (rootPart.Position - leftPad.Position).magnitude
                    if dist <= 10 and dist < minDistToLeft then
                        minDistToLeft = dist
                    end
                end

                if rightPad then
                    local dist = (rootPart.Position - rightPad.Position).magnitude
                    if dist <= 10 and dist < minDistToRight then
                        minDistToRight = dist
                    end
                end
            end
        end

        if minDistToLeft < minDistToRight then
            Side = "Left"
        elseif minDistToRight < minDistToLeft then
            Side = "Right"
        end
    end)
end

local function UpdateKeymap()
    pcall(function()
        if not Side then return end
        
        local success = pcall(function()
            local fields = player.PlayerGui:WaitForChild("Window", 5):WaitForChild("Game", 5):WaitForChild("Fields", 5)
            local sideField = fields:FindFirstChild(Side)
            if not sideField then return end
            
            local inner = sideField:FindFirstChild("Inner")
            if not inner then return end

            for i = 1, 9 do
                local lane = inner:FindFirstChild("Lane" .. i)
                if lane and lane:FindFirstChild("Labels") then
                    local label = lane.Labels:FindFirstChild("Label")
                    if label and label:FindFirstChild("Text") then
                        local keyText = label.Text.text
                        keymap[i] = Enum.KeyCode[keyText] or keyText
                    end
                end
            end
        end)
    end)
end

local function setupColumns(side)
    local columns = {}
    pcall(function()
        local fields = player.PlayerGui.Window.Game.Fields
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

local function releaseAllKeys()
    for i = 1, 9 do
        if keymap[i] then
            pcall(function()
                VirtualInputManager:SendKeyEvent(false, keymap[i], false, game)
            end)
        end
    end
end

local function autoplay()
    while _G.auto do
        pcall(function()
            if not Side then
                CheckSide()
                UpdateKeymap()
                task.wait(0.1)
                return
            end

            local columns = setupColumns(Side)
            if not next(columns) then
                task.wait(0.1)
                return
            end
            
            if not songFound then
                songFound = true
                ShowNotification("Song Found!", 2)
            end

            local trackedChildren = {}
            local activeHoldNotes = {}
            local keyPressed = {}
            
            for columnNum = 1, 9 do
                trackedChildren[columnNum] = {}
                activeHoldNotes[columnNum] = nil
                keyPressed[columnNum] = false
            end

            while _G.auto and Side do
                local shouldBreak = false
                
                pcall(function()
                    local activationThreshold = 0.39

                    for columnNum, column in pairs(columns) do
                        if not column or not column.Parent then
                            shouldBreak = true
                            break
                        end

                        pcall(function()
                            local children = column:GetChildren()
                            
                            if activeHoldNotes[columnNum] then
                                local holdNote = activeHoldNotes[columnNum]
                                if not holdNote:IsDescendantOf(column) or holdNote.Position.Y.Scale <= 0.1 then
                                    VirtualInputManager:SendKeyEvent(false, keymap[columnNum], false, game)
                                    keyPressed[columnNum] = false
                                    activeHoldNotes[columnNum] = nil
                                end
                            end
                            
                            for _, child in ipairs(children) do
                                pcall(function()
                                    if child:IsA("GuiObject") and not trackedChildren[columnNum][child] then
                                        local yPos = child.Position.Y.Scale
                                        
                                        if yPos >= activationThreshold then
                                            trackedChildren[columnNum][child] = true
                                            
                                            if keymap[columnNum] then
                                                local isLongNote = #child:GetChildren() >= 2
                                                
                                                if isLongNote then
                                                    if activeHoldNotes[columnNum] then
                                                        VirtualInputManager:SendKeyEvent(false, keymap[columnNum], false, game)
                                                        task.wait(0.001)
                                                    end
                                                    
                                                    activeHoldNotes[columnNum] = child
                                                    VirtualInputManager:SendKeyEvent(true, keymap[columnNum], false, game)
                                                    keyPressed[columnNum] = true
                                                    
                                                else
                                                    if activeHoldNotes[columnNum] then
                                                        VirtualInputManager:SendKeyEvent(false, keymap[columnNum], false, game)
                                                        task.wait(0.001)
                                                        VirtualInputManager:SendKeyEvent(true, keymap[columnNum], false, game)
                                                        task.wait(0.016)
                                                        VirtualInputManager:SendKeyEvent(false, keymap[columnNum], false, game)
                                                        task.wait(0.001)
                                                        if activeHoldNotes[columnNum] and activeHoldNotes[columnNum]:IsDescendantOf(column) then
                                                            VirtualInputManager:SendKeyEvent(true, keymap[columnNum], false, game)
                                                        end
                                                    else
                                                        VirtualInputManager:SendKeyEvent(true, keymap[columnNum], false, game)
                                                        task.delay(0.016, function()
                                                            VirtualInputManager:SendKeyEvent(false, keymap[columnNum], false, game)
                                                        end)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end)
                            end
                            
                            for child in pairs(trackedChildren[columnNum]) do
                                if not child:IsDescendantOf(column) then
                                    trackedChildren[columnNum][child] = nil
                                end
                            end
                        end)
                    end
                    
                    if shouldBreak then
                        releaseAllKeys()
                        task.wait(0.1)
                        return
                    end
                    
                    RunService.Heartbeat:Wait()
                end)
                
                if shouldBreak then
                    break
                end
            end
            
            releaseAllKeys()
        end)
        task.wait(0.05)
    end
    releaseAllKeys()
end

local toggled = false
ToggleButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    _G.auto = toggled
    
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if toggled then
        TweenService:Create(ToggleButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(138, 43, 226)}):Play()
        TweenService:Create(ToggleCircle, tweenInfo, {Position = UDim2.new(1, -23, 0.5, -10)}):Play()
        TweenService:Create(ToggleCircle, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        ToggleStatus.Text = "Enabled"
        ToggleStatus.TextColor3 = Color3.fromRGB(138, 43, 226)
        
        songFound = false
        ShowNotification("Waiting For Song...", 2)
        
        releaseAllKeys()
        CheckSide()
        UpdateKeymap()
        task.wait(0.1)
        
        if not autoplayRunning then
            autoplayRunning = true
            task.spawn(autoplay)
        end
    else
        TweenService:Create(ToggleButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(50, 50, 55)}):Play()
        TweenService:Create(ToggleCircle, tweenInfo, {Position = UDim2.new(0, 3, 0.5, -10)}):Play()
        TweenService:Create(ToggleCircle, tweenInfo, {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        ToggleStatus.Text = "Disabled"
        ToggleStatus.TextColor3 = Color3.fromRGB(180, 180, 180)
        
        songFound = false
        autoplayRunning = false
        releaseAllKeys()
    end
end)

ToggleContainer.MouseEnter:Connect(function()
    TweenService:Create(ToggleContainer, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 40)}):Play()
end)

ToggleContainer.MouseLeave:Connect(function()
    TweenService:Create(ToggleContainer, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play()
end)

local VirtualUser = game:GetService('VirtualUser')
player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

task.spawn(function()
    while true do
        pcall(function()
            if player.PlayerGui:FindFirstChild("GameGui") then
                local selector = player.PlayerGui.GameGui.Windows:FindFirstChild("SongSelector")
                if selector and selector.Visible == true then
                    CheckSide()
                    UpdateKeymap()
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
                local currentState = gameFrame and gameFrame.Visible or false
                
                if currentState ~= lastGameState then
                    lastGameState = currentState
                    
                    if currentState and _G.auto then
                        songFound = false
                        releaseAllKeys()
                        CheckSide()
                        UpdateKeymap()
                        task.wait(0.2)
                        
                        if not autoplayRunning then
                            autoplayRunning = true
                            task.spawn(autoplay)
                        end
                    elseif not currentState then
                        songFound = false
                        releaseAllKeys()
                    end
                end
            end
        end)
        task.wait(0.25)
    end
end)

MainFrame.Size = UDim2.new(0, 0, 0, 0)
local introTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 420, 0, 200)})
introTween:Play()