local star = ({...})[1] or {}

if getgenv().library ~= nil then
    game.Players.LocalPlayer:Kick("Detection -1");
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local inputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local mouse = localPlayer:GetMouse()
local exec = identifyexecutor()

local library = {
    cheatname = star.cheatname;
    gamename = star.gamename;
    colorpicking = false;
    tabbuttons = {};
    tabs = {};
    options = {};
    flags = {};
    scrolling = false;
    multiZindex = 200;
    toInvis = {};
    libColor = Color3.fromRGB(255, 255, 255);
    disabledcolor = Color3.fromRGB(233, 0, 0);
    blacklisted = {
        Enum.KeyCode.W,
        Enum.KeyCode.A,
        Enum.KeyCode.S,
        Enum.KeyCode.D,
        Enum.UserInputType.MouseMovement
    };
    libColorElements = {};
    keybindActiveColor = Color3.new(1,1,1);
    keybindActiveElements = {};
    keybindsList = {};
    keybindsTextColor = Color3.new(1,1,1);
    keybindsBgList = nil;
    keybindsHeaderPre = nil;
    keybindsWindow = nil;
    configBoxSelectedText = nil;
}

local menu = Instance.new("ScreenGui")
menu.Name = "HkbLbWscRa7b7jogdSlb"
menu.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
menu.Parent = gethui()

local bg = Instance.new("Frame")
bg.Name = "bg"
bg.Size = UDim2.new(0, 721, 0, 631)
bg.Position = UDim2.new(0.0762, 0, 0.11981, 0)
bg.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
bg.BorderColor3 = Color3.fromRGB(11, 11, 11)
bg.BorderSizePixel = 2
bg.Parent = menu

local bg2 = Instance.new("Frame")
bg2.Name = "bg"
bg2.Size = UDim2.new(1, 0, 1, 0)
bg2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
bg2.BorderColor3 = Color3.fromRGB(36, 36, 36)
bg2.Parent = bg

local bg3 = Instance.new("Frame")
bg3.Name = "bg"
bg3.Size = UDim2.new(0, 707, 0, 602)
bg3.Position = UDim2.new(0, 7, 0.002, 21)
bg3.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
bg3.BorderColor3 = Color3.fromRGB(36, 36, 36)
bg3.BorderSizePixel = 2
bg3.Parent = bg2

local bg4 = Instance.new("Frame")
bg4.Name = "bg"
bg4.Size = UDim2.new(1, 0, 1, 0)
bg4.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
bg4.BorderColor3 = Color3.fromRGB(11, 11, 11)
bg4.Parent = bg3

local mainFrame = Instance.new("Frame")
mainFrame.Name = "main"
mainFrame.Size = UDim2.new(0, 693, 0, 566)
mainFrame.Position = UDim2.new(0, 7, 0.023, 15)
mainFrame.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
mainFrame.BorderColor3 = Color3.fromRGB(11, 11, 11)
mainFrame.BorderSizePixel = 2
mainFrame.Parent = bg4

local group = Instance.new("Frame")
group.Name = "group"
group.Size = UDim2.new(1, 0, 1, 0)
group.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
group.BorderColor3 = Color3.fromRGB(36, 36, 36)
group.Parent = mainFrame

local tab = Instance.new("Frame")
tab.Name = "tab"
tab.Size = UDim2.new(1, 0, 1, 0)
tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tab.BackgroundTransparency = 1
tab.BorderColor3 = Color3.fromRGB(28, 43, 54)
tab.Parent = group

local left = Instance.new("ScrollingFrame")
left.Name = "left"
left.Size = UDim2.new(0, 231, 1, 0)
left.Position = UDim2.new(0, 0, 0, 0)
left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
left.BackgroundTransparency = 1
left.BorderColor3 = Color3.fromRGB(28, 43, 54)
left.BorderSizePixel = 0
left.Active = true
left.ScrollingDirection = Enum.ScrollingDirection.Y
left.CanvasSize = UDim2.new(0, 0, 0, 0)
left.AutomaticCanvasSize = Enum.AutomaticSize.XY
left.ScrollBarThickness = 0
left.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
left.Parent = tab

local leftLayout = Instance.new("UIListLayout")
leftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
leftLayout.Padding = UDim.new(0, 11)
leftLayout.SortOrder = Enum.SortOrder.LayoutOrder
leftLayout.Parent = left

local leftPadding = Instance.new("UIPadding")
leftPadding.PaddingTop = UDim.new(0, 13)
leftPadding.PaddingBottom = UDim.new(0, 9)
leftPadding.Parent = left

local center = Instance.new("ScrollingFrame")
center.Name = "center"
center.Size = UDim2.new(0, 231, 1, 0)
center.Position = UDim2.new(0, 231, 0, 0)
center.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
center.BackgroundTransparency = 1
center.BorderColor3 = Color3.fromRGB(28, 43, 54)
center.BorderSizePixel = 0
center.Active = true
center.CanvasSize = UDim2.new(0, 0, 0, 0)
center.AutomaticCanvasSize = Enum.AutomaticSize.Y
center.ScrollBarThickness = 0
center.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
center.Parent = tab

local centerLayout = Instance.new("UIListLayout")
centerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
centerLayout.Padding = UDim.new(0, 11)
centerLayout.SortOrder = Enum.SortOrder.LayoutOrder
centerLayout.Parent = center

local centerPadding = Instance.new("UIPadding")
centerPadding.PaddingTop = UDim.new(0, 13)
centerPadding.PaddingBottom = UDim.new(0, 9)
centerPadding.Parent = center

local right = Instance.new("ScrollingFrame")
right.Name = "right"
right.Size = UDim2.new(0, 231, 1, 0)
right.Position = UDim2.new(0, 462, 0, 0)
right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
right.BackgroundTransparency = 1
right.BorderColor3 = Color3.fromRGB(28, 43, 54)
right.BorderSizePixel = 0
right.Active = true
right.CanvasSize = UDim2.new(0, 0, 0, 0)
right.AutomaticCanvasSize = Enum.AutomaticSize.Y
right.ScrollBarThickness = 0
right.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
right.Parent = tab

local rightLayout = Instance.new("UIListLayout")
rightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
rightLayout.Padding = UDim.new(0, 11)
rightLayout.SortOrder = Enum.SortOrder.LayoutOrder
rightLayout.Parent = right

local rightPadding = Instance.new("UIPadding")
rightPadding.PaddingTop = UDim.new(0, 13)
rightPadding.PaddingBottom = UDim.new(0, 9)
rightPadding.Parent = right

local topGradient = Instance.new("ImageLabel")
topGradient.Name = "top_gradient"
topGradient.Size = UDim2.new(1, 0, 0, 11)
topGradient.Position = UDim2.new(0, 0, 0, 0)
topGradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
topGradient.BackgroundTransparency = 1
topGradient.ImageColor3 = Color3.fromRGB(18, 18, 18)
topGradient.Image = "http://www.roblox.com/asset/?id=4507849253"
topGradient.BorderColor3 = Color3.fromRGB(28, 43, 54)
topGradient.Parent = mainFrame

local bottomGradient = Instance.new("ImageLabel")
bottomGradient.Name = "bottom_gradient"
bottomGradient.Size = UDim2.new(1, 0, 0, 12)
bottomGradient.Position = UDim2.new(0, 1, 1, -12)
bottomGradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bottomGradient.BackgroundTransparency = 1
bottomGradient.ImageColor3 = Color3.fromRGB(18, 18, 18)
bottomGradient.Image = "http://www.roblox.com/asset/?id=4507849253"
bottomGradient.Rotation = 180
bottomGradient.BorderColor3 = Color3.fromRGB(28, 43, 54)
bottomGradient.Parent = mainFrame

local tabbuttons = Instance.new("Frame")
tabbuttons.Name = "tabbuttons"
tabbuttons.Size = UDim2.new(0, 693, 0, 22)
tabbuttons.Position = UDim2.new(0, 7, 0, 5)
tabbuttons.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tabbuttons.BackgroundTransparency = 1
tabbuttons.BorderColor3 = Color3.fromRGB(28, 43, 54)
tabbuttons.BorderSizePixel = 0
tabbuttons.ZIndex = 0
tabbuttons.Parent = bg4

local tabbuttonsLayout = Instance.new("UIListLayout")
tabbuttonsLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabbuttonsLayout.FillDirection = Enum.FillDirection.Horizontal
tabbuttonsLayout.Parent = tabbuttons

local buttonTemplate = Instance.new("TextButton")
buttonTemplate.Name = "button"
buttonTemplate.Size = UDim2.new(0.14318, 0, 0, 22)
buttonTemplate.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
buttonTemplate.BackgroundTransparency = 1
buttonTemplate.BorderColor3 = Color3.fromRGB(28, 43, 54)
buttonTemplate.BorderSizePixel = 0
buttonTemplate.Active = false
buttonTemplate.Modal = true
buttonTemplate.Text = ""
buttonTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonTemplate.TextSize = 13
buttonTemplate.TextXAlignment = Enum.TextXAlignment.Left
buttonTemplate.TextStrokeTransparency = 0
buttonTemplate.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
buttonTemplate.ZIndex = 0
buttonTemplate.Visible = false
buttonTemplate.Parent = tabbuttons

local buttonText = Instance.new("TextLabel")
buttonText.Name = "text"
buttonText.Size = UDim2.new(1.01893, 0, 1, 0)
buttonText.Position = UDim2.new(-0.01991, 0, 0, 0)
buttonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonText.BackgroundTransparency = 1
buttonText.BorderColor3 = Color3.fromRGB(28, 43, 54)
buttonText.Text = "Main"
buttonText.TextColor3 = Color3.fromRGB(145, 145, 145)
buttonText.TextSize = 14
buttonText.TextStrokeTransparency = 0
buttonText.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
buttonText.ZIndex = 2
buttonText.Parent = buttonTemplate

local buttonElement = Instance.new("Frame")
buttonElement.Name = "element"
buttonElement.Size = UDim2.new(1.01893, 0, 0, 1)
buttonElement.Position = UDim2.new(0, 0, 1, -2)
buttonElement.BackgroundColor3 = Color3.fromRGB(241, 143, 215)
buttonElement.BackgroundTransparency = 1
buttonElement.BorderColor3 = Color3.fromRGB(28, 43, 54)
buttonElement.BorderSizePixel = 0
buttonElement.ZIndex = 0
buttonElement.Parent = buttonTemplate

local pre = Instance.new("TextLabel")
pre.Name = "pre"
pre.Size = UDim2.new(0, 717, 0, 11)
pre.Position = UDim2.new(0, 7, 0, 5)
pre.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pre.BackgroundTransparency = 1
pre.BorderColor3 = Color3.fromRGB(28, 43, 54)
pre.Text = ""
pre.TextColor3 = Color3.fromRGB(255, 255, 255)
pre.TextSize = 13
pre.TextXAlignment = Enum.TextXAlignment.Left
pre.TextStrokeTransparency = 0
pre.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
pre.BorderMode = Enum.BorderMode.Middle
pre.RichText = true
pre.Parent = bg

bg.Position = UDim2.new(0.5, -bg.Size.X.Offset/2, 0.5, -bg.Size.Y.Offset/2)
pre.Text = library.cheatname

function draggable(a)
    local b = inputService
    local c
    local d
    local e
    local f
    local function g(h)
        if not library.colorpicking then 
            local i = h.Position - e
            a.Position = UDim2.new(f.X.Scale, f.X.Offset + i.X, f.Y.Scale, f.Y.Offset + i.Y)
        end
    end
    a.InputBegan:Connect(function(h)
        if h.UserInputType == Enum.UserInputType.MouseButton1 or h.UserInputType == Enum.UserInputType.Touch then
            c = true
            e = h.Position
            f = a.Position
            h.Changed:Connect(function()
                if h.UserInputState == Enum.UserInputState.End then
                    c = false
                end
            end)
        end
    end)
    a.InputChanged:Connect(function(h)
        if h.UserInputType == Enum.UserInputType.MouseMovement or h.UserInputType == Enum.UserInputType.Touch then
            d = h
        end
    end)
    b.InputChanged:Connect(function(h)
        if h == d and c then
            g(h)
        end
    end)
end

draggable(bg)

local tabholder = group
local tabviewer = tabbuttons

inputService.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.RightShift then
        menu.Enabled = not menu.Enabled
        library.scrolling = false
        library.colorpicking = false
        for i, v in next, library.toInvis do
            v.Visible = false
        end
    end
end)

local keyNames = {
    [Enum.KeyCode.LeftAlt] = 'LALT';
    [Enum.KeyCode.RightAlt] = 'RALT';
    [Enum.KeyCode.LeftControl] = 'LCTRL';
    [Enum.KeyCode.RightControl] = 'RCTRL';
    [Enum.KeyCode.LeftShift] = 'LSHIFT';
    [Enum.KeyCode.RightShift] = 'RSHIFT';
    [Enum.KeyCode.Underscore] = '_';
    [Enum.KeyCode.Minus] = '-';
    [Enum.KeyCode.Plus] = '+';
    [Enum.KeyCode.Period] = '.';
    [Enum.KeyCode.Slash] = '/';
    [Enum.KeyCode.BackSlash] = '\\';
    [Enum.KeyCode.Question] = '?';
    [Enum.UserInputType.MouseButton1] = 'MB1';
    [Enum.UserInputType.MouseButton2] = 'MB2';
    [Enum.UserInputType.MouseButton3] = 'MB3';
}

function library:Tween(...)
    local tween = tweenService:Create(...)
    tween:Play()
    return tween
end

local notifyScreenGui = Instance.new("ScreenGui")
notifyScreenGui.Name = "NotifyGui"
notifyScreenGui.Parent = gethui()
notifyScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local notifyContainer = Instance.new("Frame")
notifyContainer.Name = "Container"
notifyContainer.Parent = notifyScreenGui
notifyContainer.BackgroundTransparency = 1
notifyContainer.Size = UDim2.new(0, 300, 0, 0)
notifyContainer.Position = UDim2.new(0, 0, 0, 30)
notifyContainer.ClipsDescendants = false

local notifyList = {}
local textService = game:GetService("TextService")

local function reflow()
    local y = 0
    for _, frame in ipairs(notifyList) do
        if frame and frame.Parent then
            local targetY = y
            local currentY = frame.Position.Y.Offset
            if currentY ~= targetY then
                library:Tween(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0, 0, 0, targetY)
                })
            end
            y = y + frame.AbsoluteSize.Y + 5
        end
    end
end

function library:notify(text)
    local notifyFrame = Instance.new("Frame")
    notifyFrame.Name = "Notify"
    notifyFrame.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
    notifyFrame.BorderColor3 = Color3.fromRGB(11, 11, 11)
    notifyFrame.BorderSizePixel = 2
    notifyFrame.BackgroundTransparency = 0
    notifyFrame.ClipsDescendants = true
    notifyFrame.Parent = notifyContainer

    local innerBg = Instance.new("Frame")
    innerBg.Name = "Bg"
    innerBg.Parent = notifyFrame
    innerBg.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    innerBg.BorderColor3 = Color3.fromRGB(36, 36, 36)
    innerBg.Size = UDim2.new(1, 0, 1, 0)

    local label = Instance.new("TextLabel")
    label.Name = "Text"
    label.Parent = innerBg
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 13
    label.TextStrokeTransparency = 0
    label.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    label.RichText = true
    label.Size = UDim2.new(1, -8, 1, 0)
    label.Position = UDim2.new(0, 4, 0, 0)
    label.TextXAlignment = Enum.TextXAlignment.Left

    local textBounds = textService:GetTextSize(text, 13, Enum.Font.Code, Vector2.new(1000, 20))
    local padding = 16
    local textWidth = math.max(textBounds.X + padding, 50)

    local yOffset = 0
    for _, frame in ipairs(notifyList) do
        if frame and frame.Parent then
            yOffset = yOffset + frame.AbsoluteSize.Y + 5
        end
    end
    notifyFrame.Position = UDim2.new(0, 0, 0, yOffset)
    notifyFrame.Size = UDim2.new(0, 0, 0, 20)
    notifyFrame.Visible = true

    library:Tween(notifyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, textWidth, 0, 20)
    })

    table.insert(notifyList, notifyFrame)
    reflow()

    local isAlive = true
    task.delay(3, function()
        if not isAlive then return end
        local index
        for i, f in ipairs(notifyList) do
            if f == notifyFrame then
                index = i
                break
            end
        end
        if not index then return end

        local tween = library:Tween(notifyFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 20)
        })
        tween.Completed:Connect(function()
            if not isAlive then return end
            isAlive = false
            local currentIndex
            for i, f in ipairs(notifyList) do
                if f == notifyFrame then
                    currentIndex = i
                    break
                end
            end
            if currentIndex then
                table.remove(notifyList, currentIndex)
            end
            notifyFrame:Destroy()
            reflow()
        end)
    end)
end

function library:updateLibColor(newColor)
    library.libColor = newColor
    for _, element in ipairs(library.libColorElements) do
        if element and element.Parent then
            if element:IsA("Frame") and element.Name == "fill" then
                element.BackgroundColor3 = newColor
            elseif element:IsA("Frame") and element.Name == "front" then
                if element:GetAttribute("ToggleState") then
                    element.BackgroundColor3 = newColor
                end
            elseif element:IsA("Frame") and element.Name == "element" then
                element.BackgroundColor3 = newColor
            end
        end
    end
    if library.configBoxSelectedText and library.configBoxSelectedText.Parent then
        library.configBoxSelectedText.TextColor3 = newColor
    end
end

function library:updateKeybindActiveColor(newColor)
    library.keybindActiveColor = newColor
    for _, elem in ipairs(library.keybindActiveElements) do
        if elem and elem.Parent then
            local state = elem:GetAttribute("KeybindState")
            if state ~= nil then
                elem.TextColor3 = state and newColor or Color3.fromRGB(155,155,155)
            end
        end
    end
    library:refreshKeybindsWindow()
end

function library:updateKeybindsTextColor(newColor)
    library.keybindsTextColor = newColor
    if library.keybindsHeaderPre then
        library.keybindsHeaderPre.TextColor3 = newColor
    end
    if library.keybindsBgList then
        for _, child in ipairs(library.keybindsBgList:GetChildren()) do
            if child:IsA("TextLabel") and child.Name ~= "pre" then
                child.TextColor3 = newColor
            end
        end
    end
end

function library:addTab(name)
    if not tabholder or not tabviewer then return {} end
    
    local newTab = tabholder.tab and tabholder.tab:Clone() or nil
    local newButton = tabviewer.button and tabviewer.button:Clone() or nil
    
    if not newTab or not newButton then return {} end
    
    table.insert(library.tabs, newTab)
    newTab.Parent = tabholder
    newTab.Visible = false
    
    table.insert(library.tabbuttons, newButton)
    newButton.Parent = tabviewer
    newButton.Modal = false
    newButton.Visible = true
    if newButton.text then
        newButton.text.Text = name
    end

    local element = newButton:FindFirstChild("element")
    if element then
        table.insert(library.libColorElements, element)
    end

    newButton.MouseButton1Click:Connect(function()
        for i, v in next, library.tabs do
            v.Visible = v == newTab
        end
        for i, v in next, library.toInvis do
            v.Visible = false
        end
        for i, v in next, library.tabbuttons do
            local state = v == newButton
            if state then
                if v.element then
                    v.element.Visible = true
                    library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})
                end
                if v.text then
                    v.text.TextColor3 = Color3.fromRGB(244, 244, 244)
                end
            else
                if v.element then
                    library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})
                end
                if v.text then
                    v.text.TextColor3 = Color3.fromRGB(144, 144, 144)
                end
            end
        end
    end)
    
    local tab = {}
    local groupCount = 0
    local jigCount = 0
    local topStuff = 2000
  
    function tab:createGroup(pos, groupname)
        if not newTab or not newTab[pos] then return {} end
        
        local groupbox = Instance.new("Frame")
        local grouper = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local element = Instance.new("Frame")
        local title = Instance.new("TextLabel")
        local backframe = Instance.new("Frame")

        groupCount = groupCount - 1

        groupbox.Parent = newTab[pos]
        groupbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        groupbox.BorderColor3 = Color3.fromRGB(30, 30, 30)
        groupbox.BorderSizePixel = 2
        groupbox.Size = UDim2.new(0, 211, 0, 8)
        groupbox.ZIndex = groupCount

        grouper.Parent = groupbox
        grouper.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        grouper.BorderColor3 = Color3.fromRGB(0, 0, 0)
        grouper.Size = UDim2.new(1, 0, 1, 0)

        UIListLayout.Parent = grouper
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        UIPadding.Parent = grouper
        UIPadding.PaddingBottom = UDim.new(0, 4)
        UIPadding.PaddingTop = UDim.new(0, 7)

        element.Name = "element"
        element.Parent = groupbox
        element.BackgroundColor3 = library.libColor
        element.BorderSizePixel = 0
        element.Size = UDim2.new(1, 0, 0, 1)

        table.insert(library.libColorElements, element)

        title.Parent = groupbox
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1.000
        title.BorderSizePixel = 0
        title.Position = UDim2.new(0, 17, 0, 0)
        title.ZIndex = 2
        title.Font = Enum.Font.Code
        title.Text = groupname or ""
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 13.000
        title.TextStrokeTransparency = 0.000
        title.TextXAlignment = Enum.TextXAlignment.Left

        backframe.Parent = groupbox
        backframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        backframe.BorderSizePixel = 0
        backframe.Position = UDim2.new(0, 10, 0, -2)
        backframe.Size = UDim2.new(0, 13 + title.TextBounds.X, 0, 3)

        local group = {}
        function group:addToggle(args)
            if not args.flag and args.text then args.flag = args.text end
            if not args.flag then return warn("incorrect arguments - missing args on recent toggle") end
            groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 20)

            local toggleframe = Instance.new("Frame")
            local tobble = Instance.new("Frame")
            local mid = Instance.new("Frame")
            local front = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local button = Instance.new("TextButton")

            jigCount = jigCount - 1
            library.multiZindex = library.multiZindex - 1

            toggleframe.Name = "toggleframe"
            toggleframe.Parent = grouper
            toggleframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleframe.BackgroundTransparency = 1.000
            toggleframe.BorderSizePixel = 0
            toggleframe.Size = UDim2.new(1, 0, 0, 20)
            toggleframe.ZIndex = library.multiZindex
            
            tobble.Name = "tobble"
            tobble.Parent = toggleframe
            tobble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            tobble.BorderColor3 = Color3.fromRGB(0, 0, 0)
            tobble.BorderSizePixel = 3
            tobble.Position = UDim2.new(0.0299999993, 0, 0.272000015, 0)
            tobble.Size = UDim2.new(0, 10, 0, 10)
            
            mid.Name = "mid"
            mid.Parent = tobble
            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
            mid.BorderColor3 = Color3.fromRGB(30,30,30)
            mid.BorderSizePixel = 2
            mid.Size = UDim2.new(0, 10, 0, 10)
            
            front.Name = "front"
            front.Parent = mid
            front.BackgroundColor3 = Color3.fromRGB(15,15,15)
            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
            front.Size = UDim2.new(0, 10, 0, 10)
            
            text.Name = "text"
            text.Parent = toggleframe
            text.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0, 22, 0, 0)
            text.Size = UDim2.new(0, 0, 1, 2)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(155, 155, 155)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left
            
            button.Name = "button"
            button.Parent = toggleframe
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(0, 101, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            if args.disabled then
                button.Visible = false
                text.TextColor3 = library.disabledcolor
                text.Text = args.text
                return
            end

            local state = args.state or false
            front:SetAttribute("ToggleState", state)
            table.insert(library.libColorElements, front)
            
            local keybindButtons = {}

            local function toggleFunc(newState)
                state = newState
                front:SetAttribute("ToggleState", state)
                library.flags[args.flag] = state
                front.BackgroundColor3 = state and library.libColor or Color3.fromRGB(15,15,15)
                front.Visible = false
                front.Visible = true
                text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
                
                for _, kb in ipairs(keybindButtons) do
                    if kb.mode == "toggle" then
                        kb.button.TextColor3 = state and library.keybindActiveColor or Color3.fromRGB(155,155,155)
                        kb.button:SetAttribute("KeybindState", state)
                        if state then
                            table.insert(library.keybindActiveElements, kb.button)
                        end
                    end
                    for _, kbrec in ipairs(library.keybindsList) do
                        if kbrec.flag == kb.flag then
                            kbrec.state = state
                            break
                        end
                    end
                end
                if #keybindButtons > 0 then
                    library:refreshKeybindsWindow()
                end
                
                if type(args.callback) == "function" then
                    args.callback(state)
                end
            end

            button.MouseButton1Click:Connect(function()
                toggleFunc(not state)
            end)
            button.MouseEnter:connect(function()
                mid.BorderColor3 = library.libColor
            end)
            button.MouseLeave:connect(function()
                mid.BorderColor3 = Color3.fromRGB(30,30,30)
            end)

            library.flags[args.flag] = state
            library.options[args.flag] = {type = "toggle", changeState = toggleFunc, skipflag = args.skipflag, oldargs = args}
            
            toggleFunc(state)
            
            local toggleObj = {}
            function toggleObj:addKeybind(args)
    if not args.flag then return warn("incorrect arguments - missing args on toggle:keybind") end
    local next = false
    local mode = args.mode or "hold"
    local lastPress = 0
    local debounceTime = 0.2

    local keybind = Instance.new("Frame")
    local button = Instance.new("TextButton")
    local modeButton = Instance.new("TextButton")
    local pressedConnection = nil

    keybind.Parent = toggleframe
    keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    keybind.BackgroundTransparency = 1.000
    keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
    keybind.BorderSizePixel = 0
    keybind.Position = UDim2.new(0.620000029, 4, 0.272000015, 0)
    keybind.Size = UDim2.new(0, 70, 0, 10)

    button.Parent = keybind
    button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
    button.BackgroundTransparency = 1.000
    button.BorderSizePixel = 0
    button.Position = UDim2.new(0, 0, 0, 0)
    button.Size = UDim2.new(0.7, 0, 1, 0)
    button.Font = Enum.Font.Code
    button.Text = args.key == Enum.KeyCode.Unknown and "none" or (keyNames[args.key] or args.key.Name)
    button.TextColor3 = Color3.fromRGB(155, 155, 155)
    button.TextSize = 13.000
    button.TextStrokeTransparency = 0.000
    button.TextXAlignment = Enum.TextXAlignment.Right

    modeButton.Parent = keybind
    modeButton.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
    modeButton.BackgroundTransparency = 1.000
    modeButton.BorderSizePixel = 0
    modeButton.Position = UDim2.new(0.7, 2, 0, 0)
    modeButton.Size = UDim2.new(0.25, 0, 1, 0)
    modeButton.Font = Enum.Font.Code
    modeButton.Text = mode == "hold" and "[H]" or "[T]"
    modeButton.TextColor3 = Color3.fromRGB(155, 155, 155)
    modeButton.TextSize = 13.000
    modeButton.TextStrokeTransparency = 0.000
    modeButton.TextXAlignment = Enum.TextXAlignment.Center

    local function updateMode(newMode)
        if newMode == "hold" and mode == "toggle" and state then
            toggleFunc(false)
        end
        mode = newMode
        modeButton.Text = mode == "hold" and "[H]" or "[T]"
        library.flags[args.flag .. "_mode"] = mode
        if mode == "hold" then
            button.TextColor3 = Color3.fromRGB(155,155,155)
            button:SetAttribute("KeybindState", false)
            for _, kb in ipairs(library.keybindsList) do
                if kb.flag == args.flag then
                    kb.state = false
                    break
                end
            end
            library:refreshKeybindsWindow()
        else
            button.TextColor3 = state and library.keybindActiveColor or Color3.fromRGB(155,155,155)
            button:SetAttribute("KeybindState", state)
            if state then
                table.insert(library.keybindActiveElements, button)
            end
            for _, kb in ipairs(library.keybindsList) do
                if kb.flag == args.flag then
                    kb.state = state
                    break
                end
            end
            library:refreshKeybindsWindow()
        end
    end

    modeButton.MouseButton1Click:Connect(function()
        if library.colorpicking then return end
        if mode == "hold" then
            updateMode("toggle")
        else
            updateMode("hold")
        end
    end)

    function updateValue(v)
        if library.colorpicking then return end
        library.flags[args.flag] = v
        button.Text = v == Enum.KeyCode.Unknown and "none" or (keyNames[v] or v.Name)
        library:updateKeybindInWindow(args.text or args.flag, v)
        if mode == "hold" then
            if type(args.callback) == "function" then args.callback(v) end
        else
            if type(args.callback) == "function" then args.callback(state) end
        end
        for _, kb in ipairs(library.keybindsList) do
            if kb.flag == args.flag then
                kb.key = v
                kb.state = state
                break
            end
        end
        library:refreshKeybindsWindow()
    end

    local connection
    connection = inputService.InputBegan:Connect(function(input)
        local key = input.KeyCode == Enum.KeyCode.Unknown and input.UserInputType or input.KeyCode
        local now = tick()
        if now - lastPress < debounceTime then return end

        if next then
            if not table.find(library.blacklisted, key) then
                next = false
                library.flags[args.flag] = key
                button.Text = keyNames[key] or key.Name
                button.TextColor3 = Color3.fromRGB(155, 155, 155)
                library:updateKeybindInWindow(args.text or args.flag, key)
                if mode == "hold" and type(args.callback) == "function" then
                    args.callback(key)
                end
                for _, kb in ipairs(library.keybindsList) do
                    if kb.flag == args.flag then
                        kb.key = key
                        break
                    end
                end
                library:refreshKeybindsWindow()
            end
        elseif key == library.flags[args.flag] then
            lastPress = now
            if mode == "hold" then
                toggleFunc(true)
                button.TextColor3 = library.keybindActiveColor
                button:SetAttribute("KeybindState", true)
                table.insert(library.keybindActiveElements, button)
                for _, kb in ipairs(library.keybindsList) do
                    if kb.flag == args.flag then
                        kb.state = true
                        break
                    end
                end
                library:refreshKeybindsWindow()

                if pressedConnection then pressedConnection:Disconnect() end
                pressedConnection = inputService.InputEnded:Connect(function(input2)
                    local key2 = input2.KeyCode == Enum.KeyCode.Unknown and input2.UserInputType or input2.KeyCode
                    if key2 == library.flags[args.flag] then
                        toggleFunc(false)
                        button.TextColor3 = Color3.fromRGB(155,155,155)
                        button:SetAttribute("KeybindState", false)
                        for _, kb in ipairs(library.keybindsList) do
                            if kb.flag == args.flag then
                                kb.state = false
                                break
                            end
                        end
                        library:refreshKeybindsWindow()
                        pressedConnection:Disconnect()
                        pressedConnection = nil
                    end
                end)
                if type(args.presscallback) == "function" then
                    args.presscallback(key)
                end
            else
                local newState = not state
                toggleFunc(newState)
                if type(args.presscallback) == "function" then
                    args.presscallback(newState)
                end
                if type(args.callback) == "function" then
                    args.callback(newState)
                end
            end
        end
    end)

    button.MouseButton1Click:Connect(function()
        if library.colorpicking then return end
        library.flags[args.flag] = Enum.KeyCode.Unknown
        button.Text = "none"
        button.TextColor3 = library.libColor
        button:SetAttribute("KeybindState", false)
        next = true
        for _, kb in ipairs(library.keybindsList) do
            if kb.flag == args.flag then
                kb.key = Enum.KeyCode.Unknown
                kb.state = false
                break
            end
        end
        library:refreshKeybindsWindow()
    end)

    library.flags[args.flag] = Enum.KeyCode.Unknown
    library.flags[args.flag .. "_mode"] = mode
    library.options[args.flag] = {type = "keybind", changeState = updateValue, skipflag = args.skipflag, oldargs = args}

    table.insert(library.keybindsList, {
        flag = args.flag,
        text = args.text or args.flag,
        key = args.key or Enum.KeyCode.Unknown,
        mode = mode,
        state = false
    })

    table.insert(keybindButtons, {button = button, mode = mode, flag = args.flag})

    updateValue(args.key or Enum.KeyCode.Unknown)
    return self
end

            if args.keybind then
                local kbArgs = {
                    flag = args.flag .. "_key",
                    text = args.text,
                    key = Enum.KeyCode.Unknown,
                    mode = "toggle"
                }
                if type(args.keybind) == "table" then
                    for k, v in pairs(args.keybind) do
                        kbArgs[k] = v
                    end
                end
                toggleObj:addKeybind(kbArgs)
            end

            function toggleObj:addColorpicker(args)
                if not args.flag and args.text then args.flag = args.text end
                if not args.flag then return warn("incorrect arguments") end
                local colorpicker = Instance.new("Frame")
                local mid = Instance.new("Frame")
                local front = Instance.new("Frame")
                local button2 = Instance.new("TextButton")
                local colorFrame = Instance.new("Frame")
                local colorFrame_2 = Instance.new("Frame")
                local hueframe = Instance.new("Frame")
                local main = Instance.new("Frame")
                local hue = Instance.new("ImageLabel")
                local pickerframe = Instance.new("Frame")
                local main_2 = Instance.new("Frame")
                local picker = Instance.new("ImageLabel")
                local clr = Instance.new("Frame")
                local copy = Instance.new("TextButton")

                library.multiZindex = library.multiZindex - 1
                jigCount = jigCount - 1
                topStuff = topStuff - 1

                colorpicker.Parent = toggleframe
                colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                colorpicker.BorderSizePixel = 3
                colorpicker.Position = args.second and UDim2.new(0.720000029, 4, 0.272000015, 0) or UDim2.new(0.860000014, 4, 0.272000015, 0)
                colorpicker.Size = UDim2.new(0, 20, 0, 10)
                
                mid.Name = "mid"
                mid.Parent = colorpicker
                mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                mid.BorderColor3 = Color3.fromRGB(30,30,30)
                mid.BorderSizePixel = 2
                mid.Size = UDim2.new(1, 0, 1, 0)
                
                front.Name = "front"
                front.Parent = mid
                front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)
                front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                front.Size = UDim2.new(1, 0, 1, 0)
                
                button2.Name = "button2"
                button2.Parent = front
                button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                button2.BackgroundTransparency = 1.000
                button2.Size = UDim2.new(1, 0, 1, 0)
                button2.Text = ""
                button2.Font = Enum.Font.SourceSans
                button2.TextColor3 = Color3.fromRGB(0, 0, 0)
                button2.TextSize = 14.000

                colorFrame.Name = "colorFrame"
                colorFrame.Parent = toggleframe
                colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                colorFrame.BorderSizePixel = 2
                colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
                colorFrame.Size = UDim2.new(0, 137, 0, 128)

                colorFrame_2.Name = "colorFrame"
                colorFrame_2.Parent = colorFrame
                colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
                colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

                hueframe.Name = "hueframe"
                hueframe.Parent = colorFrame_2
                hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                hueframe.BorderSizePixel = 2
                hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
                hueframe.Size = UDim2.new(0, 100, 0, 100)
    
                main.Name = "main"
                main.Parent = hueframe
                main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main.Size = UDim2.new(0, 100, 0, 100)
                main.ZIndex = 6
    
                picker.Name = "picker"
                picker.Parent = main
                picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                picker.BorderSizePixel = 0
                picker.Size = UDim2.new(0, 100, 0, 100)
                picker.ZIndex = 104
                picker.Image = "rbxassetid://2615689005"
    
                pickerframe.Name = "pickerframe"
                pickerframe.Parent = colorFrame
                pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                pickerframe.BorderSizePixel = 2
                pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
                pickerframe.Size = UDim2.new(0, 20, 0, 100)
    
                main_2.Name = "main"
                main_2.Parent = pickerframe
                main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main_2.Size = UDim2.new(0, 20, 0, 100)
                main_2.ZIndex = 6
    
                hue.Name = "hue"
                hue.Parent = main_2
                hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                hue.BorderSizePixel = 0
                hue.Size = UDim2.new(0, 20, 0, 100)
                hue.ZIndex = 104
                hue.Image = "rbxassetid://2615692420"
    
                clr.Name = "clr"
                clr.Parent = colorFrame
                clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                clr.BackgroundTransparency = 1.000
                clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                clr.BorderSizePixel = 2
                clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                clr.Size = UDim2.new(0, 129, 0, 14)
                clr.ZIndex = 5
    
                copy.Name = "copy"
                copy.Parent = clr
                copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                copy.BackgroundTransparency = 1.000
                copy.BorderSizePixel = 0
                copy.Size = UDim2.new(0, 129, 0, 14)
                copy.ZIndex = 5
                copy.Font = Enum.Font.SourceSans
                copy.Text = args.text or args.flag
                copy.TextColor3 = Color3.fromRGB(100, 100, 100)
                copy.TextSize = 14.000
                copy.TextStrokeTransparency = 0.000

                copy.MouseButton1Click:Connect(function()
                    colorFrame.Visible = false
                end)

                button2.MouseButton1Click:Connect(function()
                    colorFrame.Visible = not colorFrame.Visible
                    mid.BorderColor3 = Color3.fromRGB(30,30,30)
                end)

                button2.MouseEnter:connect(function()
                    mid.BorderColor3 = library.libColor
                end)
                button2.MouseLeave:connect(function()
                    mid.BorderColor3 = Color3.fromRGB(30,30,30)
                end)

                local function updateValue(value,fakevalue)
                    if typeof(value) == "table" then value = fakevalue end
                    library.flags[args.flag] = value
                    front.BackgroundColor3 = value
                    if args.callback then
                        args.callback(value)
                    end
                end

                local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                local heartbeat = game:GetService("RunService").Heartbeat

                local pickerX,pickerY,hueY = 0,0,0
                local oldpercentX,oldpercentY = 0,0

                hue.MouseEnter:Connect(function()
                    local input = hue.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                local startC = colors[math.floor(num)]
                                local endC = colors[math.ceil(num)]
                                local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                updateValue(color)
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = hue.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)

                picker.MouseEnter:Connect(function()
                    local input = picker.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                updateValue(color)
                                oldpercentX,oldpercentY = xPercent,yPercent
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = picker.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)

                hue.MouseMoved:connect(function(_, y)
                    hueY = y
                end)

                picker.MouseMoved:connect(function(x, y)
                    pickerX,pickerY = x,y
                end)

                table.insert(library.toInvis,colorFrame)
                library.flags[args.flag] = Color3.new(1,1,1)
                library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

                updateValue(args.color or Color3.new(1,1,1))
            end

            function toggleObj:addDoubleColorpicker(args)
                if not args.flag1 or not args.flag2 then return warn("missing flags for double colorpicker") end
                
                local offset = 0.86
                local spacing = 0.14
                
                local function createPicker(idx, flag, text, initialColor, callback)
                    local pickerFrame = Instance.new("Frame")
                    pickerFrame.Name = "colorpicker_" .. flag
                    pickerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    pickerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    pickerFrame.BorderSizePixel = 3
                    pickerFrame.Position = UDim2.new(offset - (idx * spacing), 4, 0.272000015, 0)
                    pickerFrame.Size = UDim2.new(0, 20, 0, 10)
                    pickerFrame.Parent = toggleframe
                    
                    local mid = Instance.new("Frame")
                    mid.Name = "mid"
                    mid.Parent = pickerFrame
                    mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                    mid.BorderColor3 = Color3.fromRGB(30,30,30)
                    mid.BorderSizePixel = 2
                    mid.Size = UDim2.new(1, 0, 1, 0)
                    
                    local front = Instance.new("Frame")
                    front.Name = "front"
                    front.Parent = mid
                    front.BackgroundColor3 = initialColor or Color3.new(1,1,1)
                    front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    front.Size = UDim2.new(1, 0, 1, 0)
                    
                    local button = Instance.new("TextButton")
                    button.Name = "button"
                    button.Parent = front
                    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    button.BackgroundTransparency = 1.000
                    button.Size = UDim2.new(1, 0, 1, 0)
                    button.Text = ""
                    button.Font = Enum.Font.SourceSans
                    button.TextColor3 = Color3.fromRGB(0, 0, 0)
                    button.TextSize = 14.000
                    
                    local colorFrame = Instance.new("Frame")
                    colorFrame.Name = "colorFrame_" .. flag
                    colorFrame.Parent = toggleframe
                    colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    colorFrame.BorderSizePixel = 2
                    colorFrame.Position = UDim2.new(0.101092957 + (idx * 0.1), 0, 0.75, 0)
                    colorFrame.Size = UDim2.new(0, 137, 0, 128)
                    colorFrame.Visible = false
                    table.insert(library.toInvis, colorFrame)
                    
                    local colorFrame_2 = Instance.new("Frame")
                    colorFrame_2.Name = "colorFrame"
                    colorFrame_2.Parent = colorFrame
                    colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
                    colorFrame_2.Size = UDim2.new(1, 0, 1, 0)
                    
                    local hueframe = Instance.new("Frame")
                    hueframe.Name = "hueframe"
                    hueframe.Parent = colorFrame_2
                    hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                    hueframe.BorderSizePixel = 2
                    hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
                    hueframe.Size = UDim2.new(0, 100, 0, 100)
                    
                    local main = Instance.new("Frame")
                    main.Name = "main"
                    main.Parent = hueframe
                    main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                    main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    main.Size = UDim2.new(0, 100, 0, 100)
                    main.ZIndex = 6
                    
                    local picker = Instance.new("ImageLabel")
                    picker.Name = "picker"
                    picker.Parent = main
                    picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                    picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    picker.BorderSizePixel = 0
                    picker.Size = UDim2.new(0, 100, 0, 100)
                    picker.ZIndex = 104
                    picker.Image = "rbxassetid://2615689005"
                    
                    local pickerframe = Instance.new("Frame")
                    pickerframe.Name = "pickerframe"
                    pickerframe.Parent = colorFrame
                    pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                    pickerframe.BorderSizePixel = 2
                    pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
                    pickerframe.Size = UDim2.new(0, 20, 0, 100)
                    
                    local main_2 = Instance.new("Frame")
                    main_2.Name = "main"
                    main_2.Parent = pickerframe
                    main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                    main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    main_2.Size = UDim2.new(0, 20, 0, 100)
                    main_2.ZIndex = 6
                    
                    local hue = Instance.new("ImageLabel")
                    hue.Name = "hue"
                    hue.Parent = main_2
                    hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                    hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    hue.BorderSizePixel = 0
                    hue.Size = UDim2.new(0, 20, 0, 100)
                    hue.ZIndex = 104
                    hue.Image = "rbxassetid://2615692420"
                    
                    local clr = Instance.new("Frame")
                    clr.Name = "clr"
                    clr.Parent = colorFrame
                    clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    clr.BackgroundTransparency = 1.000
                    clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                    clr.BorderSizePixel = 2
                    clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                    clr.Size = UDim2.new(0, 129, 0, 14)
                    clr.ZIndex = 5
                    
                    local copy = Instance.new("TextButton")
                    copy.Name = "copy"
                    copy.Parent = clr
                    copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                    copy.BackgroundTransparency = 1.000
                    copy.BorderSizePixel = 0
                    copy.Size = UDim2.new(0, 129, 0, 14)
                    copy.ZIndex = 5
                    copy.Font = Enum.Font.SourceSans
                    copy.Text = text or flag
                    copy.TextColor3 = Color3.fromRGB(100, 100, 100)
                    copy.TextSize = 14.000
                    copy.TextStrokeTransparency = 0.000
                    copy.MouseButton1Click:Connect(function()
                        colorFrame.Visible = false
                    end)
                    
                    button.MouseButton1Click:Connect(function()
                        for _, inv in ipairs(library.toInvis) do
                            if inv ~= colorFrame and inv:IsA("Frame") and inv.Name:find("colorFrame_") then
                                inv.Visible = false
                            end
                        end
                        colorFrame.Visible = not colorFrame.Visible
                        mid.BorderColor3 = Color3.fromRGB(30,30,30)
                    end)
                    
                    button.MouseEnter:connect(function()
                        mid.BorderColor3 = library.libColor
                    end)
                    button.MouseLeave:connect(function()
                        mid.BorderColor3 = Color3.fromRGB(30,30,30)
                    end)
                    
                    local function updateValue(value)
                        library.flags[flag] = value
                        front.BackgroundColor3 = value
                        if callback then callback(value) end
                    end
                    
                    local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                    local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                    local heartbeat = game:GetService("RunService").Heartbeat
                    
                    local pickerX,pickerY,hueY = 0,0,0
                    local oldpercentX,oldpercentY = 0,0
                    
                    hue.MouseEnter:Connect(function()
                        local input = hue.InputBegan:connect(function(key)
                            if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                    local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                    local startC = colors[math.floor(num)]
                                    local endC = colors[math.ceil(num)]
                                    local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                    picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                    updateValue(color)
                                end
                                library.colorpicking = false
                            end
                        end)
                        local leave
                        leave = hue.MouseLeave:connect(function()
                            input:disconnect()
                            leave:disconnect()
                        end)
                    end)
                    
                    picker.MouseEnter:Connect(function()
                        local input = picker.InputBegan:connect(function(key)
                            if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                    local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                    local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                    updateValue(color)
                                    oldpercentX,oldpercentY = xPercent,yPercent
                                end
                                library.colorpicking = false
                            end
                        end)
                        local leave
                        leave = picker.MouseLeave:connect(function()
                            input:disconnect()
                            leave:disconnect()
                        end)
                    end)
                    
                    hue.MouseMoved:connect(function(_, y)
                        hueY = y
                    end)
                    picker.MouseMoved:connect(function(x, y)
                        pickerX,pickerY = x,y
                    end)
                    
                    library.options[flag] = {type = "colorpicker", changeState = updateValue, skipflag = args.skipflag, oldargs = args}
                    updateValue(initialColor or Color3.new(1,1,1))
                    
                    return {colorFrame = colorFrame}
                end
                
                local picker1 = createPicker(0, args.flag1, args.text1, args.color1, args.callback1)
                local picker2 = createPicker(1, args.flag2, args.text2, args.color2, args.callback2)
                
                return self
            end

            return toggleObj
        end
        
        function group:addButton(args)
            if not args.callback or not args.text then return warn("incorrect arguments") end
            groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 22)

            local buttonframe = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")
            local button = Instance.new("TextButton")
            local gradient = Instance.new("UIGradient")

            buttonframe.Name = "buttonframe"
            buttonframe.Parent = grouper
            buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            buttonframe.BackgroundTransparency = 1.000
            buttonframe.BorderSizePixel = 0
            buttonframe.Size = UDim2.new(1, 0, 0, 21)
            
            bg.Name = "bg"
            bg.Parent = buttonframe
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.02, -1, 0, 0)
            bg.Size = UDim2.new(0, 205, 0, 15)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 1, 0)
            button.Font = Enum.Font.Code
            button.Text = args.text or args.flag
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 13.000
            button.TextStrokeTransparency = 0.000
            
            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    if type(args.callback) == "function" then
                        args.callback()
                    end
                end
            end)
            button.MouseEnter:connect(function()
                main.BorderColor3 = library.libColor
            end)
            button.MouseLeave:connect(function()
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            end)
        end
  
function group:addSlider(args, sub)
    if not args.flag or not args.max then return warn("incorrect arguments") end
    groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 30)

    local slider = Instance.new("Frame")
    local bg = Instance.new("Frame")
    local main = Instance.new("Frame")
    local fill = Instance.new("Frame")
    local button = Instance.new("TextButton")
    local valuetext = Instance.new("TextLabel")
    local UIGradient = Instance.new("UIGradient")
    local text = Instance.new("TextLabel")

    slider.Name = "slider"
    slider.Parent = grouper
    slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    slider.BackgroundTransparency = 1.000
    slider.BorderSizePixel = 0
    slider.Size = UDim2.new(1, 0, 0, 30)
    
    bg.Name = "bg"
    bg.Parent = slider
    bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
    bg.BorderSizePixel = 2
    bg.Position = UDim2.new(0.02, -1, 0, 16)
    bg.Size = UDim2.new(0, 205, 0, 10)
    
    main.Name = "main"
    main.Parent = bg
    main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    main.BorderColor3 = Color3.fromRGB(50, 50, 50)
    main.Size = UDim2.new(1, 0, 1, 0)
    
    fill.Name = "fill"
    fill.Parent = main
    fill.BackgroundColor3 = library.libColor
    fill.BackgroundTransparency = 0.200
    fill.BorderColor3 = Color3.fromRGB(60, 60, 60)
    fill.BorderSizePixel = 0
    fill.Size = UDim2.new(0.617238641, 13, 1, 0)
    
    table.insert(library.libColorElements, fill)
    
    button.Name = "button"
    button.Parent = main
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundTransparency = 1.000
    button.Size = UDim2.new(0, 191, 1, 0)
    button.Font = Enum.Font.SourceSans
    button.Text = ""
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.TextSize = 14.000
    
    valuetext.Parent = main
    valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    valuetext.BackgroundTransparency = 1.000
    valuetext.Position = UDim2.new(0.5, 0, 0.5, 0)
    valuetext.Font = Enum.Font.Code
    valuetext.Text = "0.9172/10"
    valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
    valuetext.TextSize = 14.000
    valuetext.TextStrokeTransparency = 0.000
    
    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
    UIGradient.Rotation = 90
    UIGradient.Parent = main
    
    text.Name = "text"
    text.Parent = slider
    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    text.BackgroundTransparency = 1.000
    text.Position = UDim2.new(0.0299999993, -1, 0, 7)
    text.ZIndex = 2
    text.Font = Enum.Font.Code
    text.Text = args.text or args.flag
    text.TextColor3 = Color3.fromRGB(244, 244, 244)
    text.TextSize = 13.000
    text.TextStrokeTransparency = 0.000
    text.TextXAlignment = Enum.TextXAlignment.Left

    local entered = false
    local scrolling = false
    local amount = 0
    local increment = args.increment or 1

    local function getPrecision(inc)
        local str = tostring(inc)
        local _, _, dec = str:find("%.(%d+)")
        return dec and #dec or 0
    end
    local precision = getPrecision(increment)

    local function updateValue(v)
        if library.colorpicking then return end
        
        if increment then
            v = math.floor((v - args.min) / increment + 0.5) * increment + args.min
            v = math.max(args.min, math.min(args.max, v))
        end
        
        if precision > 0 then
            local mult = 10^precision
            v = math.floor(v * mult + 0.5) / mult
        end
        
        if v ~= 0 then
            fill:TweenSize(UDim2.new(v/args.max, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.01)
        else
            fill:TweenSize(UDim2.new(0, 1, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.01)
        end
        
        if precision > 0 then
            valuetext.Text = string.format("%." .. precision .. "f", v) .. (sub or "")
        else
            valuetext.Text = tostring(math.floor(v)) .. (sub or "")
        end
        
        library.flags[args.flag] = v
        
        if type(args.callback) == "function" then
            args.callback(v)
        end
    end

    local function updateScroll()
        if scrolling or library.scrolling or not newTab.Visible or library.colorpicking then return end
        
        while inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and menu.Enabled do 
            runService.RenderStepped:Wait()
            library.scrolling = true
            valuetext.TextColor3 = Color3.fromRGB(255,255,255)
            scrolling = true
            
            local rawValue = args.min + ((mouse.X - button.AbsolutePosition.X) / button.AbsoluteSize.X) * (args.max - args.min)
            
            local stepped = math.floor((rawValue - args.min) / increment + 0.5) * increment + args.min
            local value = math.max(args.min, math.min(args.max, stepped))
            
            updateValue(value)
        end
        
        if scrolling and not entered then
            valuetext.TextColor3 = Color3.fromRGB(255,255,255)
        end
        
        if not menu.Enabled then
            entered = false
        end
        
        scrolling = false
        library.scrolling = false
    end

    button.MouseEnter:connect(function()
        if library.colorpicking then return end
        if scrolling or entered then return end
        entered = true
        main.BorderColor3 = library.libColor
        while entered do 
            wait()
            updateScroll()
        end
    end)

    button.MouseLeave:connect(function()
        entered = false
        main.BorderColor3 = Color3.fromRGB(60, 60, 60)
    end)

    library.options[args.flag] = {type = "slider", changeState = updateValue, skipflag = args.skipflag, oldargs = args}
    updateValue(args.value or 0)
end

        function group:addTextbox(args)
            if not args.flag then return warn("incorrect arguments") end
            groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 35)

            local textbox = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("ScrollingFrame")
            local box = Instance.new("TextBox")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            box:GetPropertyChangedSignal('Text'):Connect(function(val)
                if library.colorpicking then return end
                library.flags[args.flag] = box.Text
                args.value = box.Text
                if type(args.callback) == "function" then
                    args.callback(box.Text)
                end
            end)
            textbox.Name = "textbox"
            textbox.Parent = grouper
            textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textbox.BackgroundTransparency = 1.000
            textbox.BorderSizePixel = 0
            textbox.Size = UDim2.new(1, 0, 0, 35)
            textbox.ZIndex = 10

            bg.Name = "bg"
            bg.Parent = textbox
            bg.BackgroundColor3 = Color3.fromRGB(15,15,15)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.02, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)

            main.Name = "main"
            main.Parent = bg
            main.Active = true
            main.BackgroundColor3 = Color3.fromRGB(15,15,15)
            main.BorderColor3 = Color3.fromRGB(30, 30, 30)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0

            box.Name = "box"
            box.Parent = main
            box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            box.BackgroundTransparency = 1.000
            box.Selectable = false
            box.Size = UDim2.new(1, 0, 1, 0)
            box.Font = Enum.Font.Code
            box.Text = args.value or ""
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.TextSize = 13.000
            box.TextStrokeTransparency = 0.000
            box.TextXAlignment = Enum.TextXAlignment.Left

            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            text.Name = "text"
            text.Parent = textbox
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            library.flags[args.flag] = args.value or ""
            library.options[args.flag] = {type = "textbox", changeState = function(v) box.Text = v end, skipflag = args.skipflag, oldargs = args}
        end
        function group:addDivider(args)
            groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 10)
            
            local div = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")

            div.Name = "div"
            div.Parent = grouper
            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            div.BackgroundTransparency = 1.000
            div.BorderSizePixel = 0
            div.Position = UDim2.new(0, 0, 0.743662, 0)
            div.Size = UDim2.new(0, 202, 0, 10)
            
            bg.Name = "bg"
            bg.Parent = div
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.02, 0, 0, 4)
            bg.Size = UDim2.new(0, 191, 0, 1)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(0, 191, 0, 1)
            
            if type(args.callback) == "function" then
                args.callback()
            end
        end
        function group:addList(args)
            if not args.flag or not args.values then return warn("incorrect arguments") end
            groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 35)
            
            library.multiZindex = library.multiZindex - 1

            local list = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("ScrollingFrame")
            local button = Instance.new("TextButton")
            local dumbtriangle = Instance.new("ImageLabel")
            local valuetext = Instance.new("TextLabel")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            local frame = Instance.new("Frame")
            local holder = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            
            list.Name = "list"
            list.Parent = grouper
            list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            list.BackgroundTransparency = 1.000
            list.BorderSizePixel = 0
            list.Size = UDim2.new(1, 0, 0, 35)
            list.ZIndex = library.multiZindex

            bg.Name = "bg"
            bg.Parent = list
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.02, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)

            main.Name = "main"
            main.Parent = bg
            main.Active = true
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0

            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 191, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            dumbtriangle.Name = "dumbtriangle"
            dumbtriangle.Parent = main
            dumbtriangle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BackgroundTransparency = 1.000
            dumbtriangle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BorderSizePixel = 0
            dumbtriangle.Position = UDim2.new(1, -11, 0.5, -3)
            dumbtriangle.Size = UDim2.new(0, 7, 0, 6)
            dumbtriangle.ZIndex = 3
            dumbtriangle.Image = "rbxassetid://8532000591"

            valuetext.Name = "valuetext"
            valuetext.Parent = main
            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000
            valuetext.Position = UDim2.new(0.00200000009, 2, 0, 7)
            valuetext.ZIndex = 2
            valuetext.Font = Enum.Font.Code
            valuetext.Text = ""
            valuetext.TextColor3 = Color3.fromRGB(244, 244, 244)
            valuetext.TextSize = 13.000
            valuetext.TextStrokeTransparency = 0.000
            valuetext.TextXAlignment = Enum.TextXAlignment.Left

            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            text.Name = "text"
            text.Parent = list
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            frame.Name = "frame"
            frame.Parent = list
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            frame.BorderSizePixel = 2
            frame.Position = UDim2.new(0.0299999993, -1, 0.605000019, 15)
            frame.Size = UDim2.new(0, 203, 0, 0)
            frame.Visible = false
            frame.ZIndex = library.multiZindex
            
            holder.Name = "holder"
            holder.Parent = frame
            holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            holder.BorderColor3 = Color3.fromRGB(60, 60, 60)
            holder.Size = UDim2.new(1, 0, 1, 0)
            
            UIListLayout.Parent = holder
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

            local function updateValue(v)
                if v == nil then 
                    valuetext.Text = "nil" 
                    return 
                end
                if args.multiselect then
                    if type(v) == "string" then
                        if not table.find(library.options[args.flag].values, v) then 
                            return 
                        end
                        if table.find(library.flags[args.flag], v) then
                            for i, val in pairs(library.flags[args.flag]) do
                                if val == v then
                                    table.remove(library.flags[args.flag], i)
                                end
                            end
                        else
                            table.insert(library.flags[args.flag], v)
                        end
                    else
                        library.flags[args.flag] = v
                    end
                    local buttonText = ""
                    for i, val in pairs(library.flags[args.flag]) do
                        local jig = i ~= #library.flags[args.flag] and "," or ""
                        buttonText = buttonText .. val .. jig
                    end
                    if buttonText == "" then 
                        buttonText = "..." 
                    end
                    for i, child in next, holder:GetChildren() do
                        if child.ClassName ~= "Frame" then
                        else
                            child.off.TextColor3 = Color3.new(0.65, 0.65, 0.65)
                            for _i, _v in next, library.flags[args.flag] do
                                if child.Name == _v then
                                    child.off.TextColor3 = Color3.new(1,1,1)
                                end
                            end
                        end
                    end
                    valuetext.Text = buttonText
                    if type(args.callback) == "function" then
                        args.callback(library.flags[args.flag])
                    end
                else
                    if not table.find(library.options[args.flag].values, v) then 
                        v = library.options[args.flag].values[1] 
                    end
                    library.flags[args.flag] = v
                    for i, child in next, holder:GetChildren() do
                        if child.ClassName ~= "Frame" then
                        else
                            child.off.TextColor3 = Color3.new(0.65, 0.65, 0.65)
                            if child.Name == library.flags[args.flag] then
                                child.off.TextColor3 = Color3.new(1,1,1)
                            end
                        end
                    end
                    frame.Visible = false
                    if library.flags[args.flag] then
                        valuetext.Text = library.flags[args.flag]
                        if type(args.callback) == "function" then
                            args.callback(library.flags[args.flag])
                        end
                    end
                end
            end

            function refresh(tbl)
                for i, child in next, holder:GetChildren() do
                    if child.ClassName == "Frame" then
                        child:Destroy()
                    end
                end
                frame.Size = UDim2.new(0, 203, 0, 0)
                for i, v in pairs(tbl) do
                    frame.Size = frame.Size + UDim2.new(0, 0, 0, 20)

                    local option = Instance.new("Frame")
                    local button_2 = Instance.new("TextButton")
                    local text_2 = Instance.new("TextLabel")

                    option.Name = v
                    option.Parent = holder
                    option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    option.BackgroundTransparency = 1.000
                    option.Size = UDim2.new(1, 0, 0, 20)

                    button_2.Name = "button"
                    button_2.Parent = option
                    button_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    button_2.BackgroundTransparency = 0.850
                    button_2.BorderSizePixel = 0
                    button_2.Size = UDim2.new(1, 0, 1, 0)
                    button_2.Font = Enum.Font.SourceSans
                    button_2.Text = ""
                    button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
                    button_2.TextSize = 14.000

                    text_2.Name = "off"
                    text_2.Parent = option
                    text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    text_2.BackgroundTransparency = 1.000
                    text_2.Position = UDim2.new(0, 4, 0, 0)
                    text_2.Size = UDim2.new(0, 0, 1, 0)
                    text_2.Font = Enum.Font.Code
                    text_2.Text = v
                    text_2.TextColor3 = args.multiselect and Color3.new(0.65, 0.65, 0.65) or Color3.new(1, 1, 1)
                    text_2.TextSize = 14.000
                    text_2.TextStrokeTransparency = 0.000
                    text_2.TextXAlignment = Enum.TextXAlignment.Left

                    button_2.MouseButton1Click:Connect(function()
                        updateValue(v)
                    end)
                end
                library.options[args.flag].values = tbl
            end

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    frame.Visible = not frame.Visible
                end
            end)
            button.MouseEnter:connect(function()
                main.BorderColor3 = library.libColor
            end)
            button.MouseLeave:connect(function()
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            end)
            
            table.insert(library.toInvis, frame)
            library.flags[args.flag] = args.multiselect and {} or ""
            library.options[args.flag] = {type = "list", changeState = updateValue, values = args.values, refresh = refresh, skipflag = args.skipflag, oldargs = args}

            refresh(args.values)
            if args.multiselect then
                updateValue(args.value or {})
            else
                updateValue(args.value or args.values[1])
            end
        end
        function group:addConfigbox(args)
            if not args.flag or not args.values then 
                args.values = {}
            end
            groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 138)
            library.multiZindex = library.multiZindex - 1
            
            local list2 = Instance.new("Frame")
            local frame = Instance.new("Frame")
            local main = Instance.new("Frame")
            local holder = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local dwn = Instance.new("ImageLabel")
            local up = Instance.new("ImageLabel")
        
            list2.Name = "list2"
            list2.Parent = grouper
            list2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            list2.BackgroundTransparency = 1.000
            list2.BorderSizePixel = 0
            list2.Position = UDim2.new(0, 0, 0.108108111, 0)
            list2.Size = UDim2.new(1, 0, 0, 138)
            
            frame.Name = "frame"
            frame.Parent = list2
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            frame.BorderSizePixel = 2
            frame.Position = UDim2.new(0.02, -1, 0.0439999998, 0)
            frame.Size = UDim2.new(0, 205, 0, 128)
            
            main.Name = "main"
            main.Parent = frame
            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main.BorderColor3 = Color3.fromRGB(30,30,30)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            holder.Name = "holder"
            holder.Parent = main
            holder.Active = true
            holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            holder.BackgroundTransparency = 1.000
            holder.BorderSizePixel = 0
            holder.Position = UDim2.new(0, 0, 0.00571428565, 0)
            holder.Size = UDim2.new(1, 0, 1, 0)
            holder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            holder.CanvasSize = UDim2.new(0, 0, 0, 0)
            holder.ScrollBarThickness = 0
            holder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            holder.ScrollingEnabled = true
            holder.ScrollBarImageTransparency = 0
            
            UIListLayout.Parent = holder
            
            dwn.Name = "dwn"
            dwn.Parent = frame
            dwn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dwn.BackgroundTransparency = 1.000
            dwn.BorderColor3 = Color3.fromRGB(0, 0, 0)
            dwn.BorderSizePixel = 0
            dwn.Position = UDim2.new(0.930000007, 4, 1, -9)
            dwn.Size = UDim2.new(0, 7, 0, 6)
            dwn.ZIndex = 3
            dwn.Image = "rbxassetid://8548723563"
            dwn.Visible = false
            
            up.Name = "up"
            up.Parent = frame
            up.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            up.BackgroundTransparency = 1.000
            up.BorderColor3 = Color3.fromRGB(0, 0, 0)
            up.BorderSizePixel = 0
            up.Position = UDim2.new(0, 3, 0, 3)
            up.Size = UDim2.new(0, 7, 0, 6)
            up.ZIndex = 3
            up.Image = "rbxassetid://8548757311"
            up.Visible = false

            local function updateValue(v)
                if v == nil then 
                    return 
                end
                if not library.options[args.flag] or not library.options[args.flag].values then 
                    return 
                end
                if not table.find(library.options[args.flag].values, v) then 
                    v = library.options[args.flag].values[1] 
                end
                library.flags[args.flag] = v
        
                for _, child in ipairs(holder:GetChildren()) do
                    if child:IsA("Frame") and child.text then
                        if child.text.Text == v then
                            child.text.TextColor3 = library.libColor
                            library.configBoxSelectedText = child.text
                        else
                            child.text.TextColor3 = Color3.fromRGB(180, 180, 180)
                        end
                    end
                end
                if library.flags[args.flag] then
                    if type(args.callback) == "function" then
                        args.callback(library.flags[args.flag])
                    end
                end
                holder.Visible = true
            end
            holder:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                up.Visible = (holder.CanvasPosition.Y > 1)
                dwn.Visible = (holder.CanvasPosition.Y + 1 < (holder.AbsoluteCanvasSize.Y - holder.AbsoluteSize.Y))
            end)
        
            function refresh(tbl)
                for _, child in ipairs(holder:GetChildren()) do
                    if child:IsA("Frame") then
                        child:Destroy()
                    end
                end
                library.configBoxSelectedText = nil
                for _, v in ipairs(tbl) do
                    local item = Instance.new("Frame")
                    local button = Instance.new("TextButton")
                    local text = Instance.new("TextLabel")
        
                    item.Name = v
                    item.Parent = holder
                    item.Active = true
                    item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    item.BackgroundTransparency = 1.000
                    item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    item.BorderSizePixel = 0
                    item.Size = UDim2.new(1, 0, 0, 18)
                    
                    button.Parent = item
                    button.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                    button.BackgroundTransparency = 1
                    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    button.BorderSizePixel = 0
                    button.Size = UDim2.new(1, 0, 1, 0)
                    button.Text = ""
                    button.TextTransparency = 1.000
                    
                    text.Name = 'text'
                    text.Parent = item
                    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    text.BackgroundTransparency = 1.000
                    text.Size = UDim2.new(1, 0, 0, 18)
                    text.Font = Enum.Font.Code
                    text.Text = v
                    text.TextColor3 = Color3.fromRGB(180, 180, 180)
                    text.TextSize = 14.000
                    text.TextStrokeTransparency = 0.000
        
                    button.MouseButton1Click:Connect(function()
                        updateValue(v)
                    end)
                end
        
                holder.Visible = true
                if library.options[args.flag] then
                    library.options[args.flag].values = tbl
                    if library.flags[args.flag] and contains(tbl, library.flags[args.flag]) then
                        updateValue(library.flags[args.flag])
                    else
                        updateValue(tbl[1])
                    end
                end
            end
        
            library.flags[args.flag] = ""
            library.options[args.flag] = {type = "cfg", changeState = updateValue, values = args.values, refresh = refresh, skipflag = args.skipflag, oldargs = args}
            
            refresh(args.values)
        end
        function group:addColorpicker(args)
            if not args.flag then 
                if args.text then args.flag = args.text end
                if not args.flag then return warn("incorrect arguments") end
            end
            groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 20)
        
            library.multiZindex = library.multiZindex - 1
            jigCount = jigCount - 1
            topStuff = topStuff - 1

            local colorpicker = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local colorpicker_2 = Instance.new("Frame")
            local button = Instance.new("TextButton")

            local colorFrame = Instance.new("Frame")
            local colorFrame_2 = Instance.new("Frame")
            local hueframe = Instance.new("Frame")
            local main = Instance.new("Frame")
            local hue = Instance.new("ImageLabel")
            local pickerframe = Instance.new("Frame")
            local main_2 = Instance.new("Frame")
            local picker = Instance.new("ImageLabel")
            local clr = Instance.new("Frame")
            local copy = Instance.new("TextButton")

            colorpicker.Name = "colorpicker"
            colorpicker.Parent = grouper
            colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            colorpicker.BackgroundTransparency = 1.000
            colorpicker.BorderSizePixel = 0
            colorpicker.Size = UDim2.new(1, 0, 0, 20)
            colorpicker.ZIndex = topStuff

            text.Name = "text"
            text.Parent = colorpicker
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.02, -1, 0, 10)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            colorpicker_2.Name = "colorpicker"
            colorpicker_2.Parent = colorpicker
            colorpicker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            colorpicker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            colorpicker_2.BorderSizePixel = 3
            colorpicker_2.Position = UDim2.new(0.860000014, 4, 0.272000015, 0)
            colorpicker_2.Size = UDim2.new(0, 20, 0, 10)

            local mid = Instance.new("Frame")
            mid.Name = "mid"
            mid.Parent = colorpicker_2
            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
            mid.BorderColor3 = Color3.fromRGB(30,30,30)
            mid.BorderSizePixel = 2
            mid.Size = UDim2.new(1, 0, 1, 0)

            local front = Instance.new("Frame")
            front.Name = "front"
            front.Parent = mid
            front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)
            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
            front.Size = UDim2.new(1, 0, 1, 0)

            button.Name = "button"
            button.Parent = colorpicker
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000
            button.ZIndex = args.ontop and topStuff or jigCount

            colorFrame.Name = "colorFrame"
            colorFrame.Parent = colorpicker
            colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            colorFrame.BorderSizePixel = 2
            colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
            colorFrame.Size = UDim2.new(0, 137, 0, 128)

            colorFrame_2.Name = "colorFrame"
            colorFrame_2.Parent = colorFrame
            colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
            colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

            hueframe.Name = "hueframe"
            hueframe.Parent = colorFrame_2
            hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
            hueframe.BorderSizePixel = 2
            hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
            hueframe.Size = UDim2.new(0, 100, 0, 100)

            main.Name = "main"
            main.Parent = hueframe
            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main.BorderColor3 = Color3.fromRGB(0, 0, 0)
            main.Size = UDim2.new(0, 100, 0, 100)
            main.ZIndex = 6

            picker.Name = "picker"
            picker.Parent = main
            picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
            picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
            picker.BorderSizePixel = 0
            picker.Size = UDim2.new(0, 100, 0, 100)
            picker.ZIndex = 104
            picker.Image = "rbxassetid://2615689005"

            pickerframe.Name = "pickerframe"
            pickerframe.Parent = colorFrame
            pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
            pickerframe.BorderSizePixel = 2
            pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
            pickerframe.Size = UDim2.new(0, 20, 0, 100)

            main_2.Name = "main"
            main_2.Parent = pickerframe
            main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            main_2.Size = UDim2.new(0, 20, 0, 100)
            main_2.ZIndex = 6

            hue.Name = "hue"
            hue.Parent = main_2
            hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
            hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
            hue.BorderSizePixel = 0
            hue.Size = UDim2.new(0, 20, 0, 100)
            hue.ZIndex = 104
            hue.Image = "rbxassetid://2615692420"

            clr.Name = "clr"
            clr.Parent = colorFrame
            clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            clr.BackgroundTransparency = 1.000
            clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
            clr.BorderSizePixel = 2
            clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
            clr.Size = UDim2.new(0, 129, 0, 14)
            clr.ZIndex = 5

            copy.Name = "copy"
            copy.Parent = clr
            copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            copy.BackgroundTransparency = 1.000
            copy.BorderSizePixel = 0
            copy.Size = UDim2.new(0, 129, 0, 14)
            copy.ZIndex = 5
            copy.Font = Enum.Font.Code
            copy.Text = args.text or args.flag
            copy.TextColor3 = Color3.fromRGB(100, 100, 100)
            copy.TextSize = 14.000
            copy.TextStrokeTransparency = 0.000
            
            copy.MouseButton1Click:Connect(function()
                colorFrame.Visible = false
            end)

            button.MouseButton1Click:Connect(function()
                for _, inv in ipairs(library.toInvis) do
                    if inv ~= colorFrame and inv:IsA("Frame") and inv.Name == "colorFrame" then
                        inv.Visible = false
                    end
                end
                colorFrame.Visible = not colorFrame.Visible
                mid.BorderColor3 = Color3.fromRGB(30,30,30)
            end)

            button.MouseEnter:connect(function()
                mid.BorderColor3 = library.libColor
            end)
            button.MouseLeave:connect(function()
                mid.BorderColor3 = Color3.fromRGB(30,30,30)
            end)

            local function updateValue(v, fakevalue)
                if typeof(v) == "table" then 
                    v = fakevalue 
                end
                library.flags[args.flag] = v
                front.BackgroundColor3 = v
                if type(args.callback) == "function" then
                    args.callback(v)
                end
            end

            local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
            local colors = {Color3.new(1,0,0), Color3.new(1,1,0), Color3.new(0,1,0), Color3.new(0,1,1), Color3.new(0,0,1), Color3.new(1,0,1), Color3.new(1,0,0)}
            local heartbeat = game:GetService("RunService").Heartbeat

            local pickerX, pickerY, hueY = 0, 0, 0
            local oldpercentX, oldpercentY = 0, 0

            hue.MouseEnter:Connect(function()
                local input = hue.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local percent = (hueY - hue.AbsolutePosition.Y - 36) / hue.AbsoluteSize.Y
                            local num = math.max(1, math.min(7, math.floor(((percent * 7 + 0.5) * 100)) / 100))
                            local startC = colors[math.floor(num)]
                            local endC = colors[math.ceil(num)]
                            local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                            picker.BackgroundColor3 = startC:lerp(endC, num - math.floor(num)) or Color3.new(0, 0, 0)
                            updateValue(color)
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = hue.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            picker.MouseEnter:Connect(function()
                local input = picker.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local xPercent = (pickerX - picker.AbsolutePosition.X) / picker.AbsoluteSize.X
                            local yPercent = (pickerY - picker.AbsolutePosition.Y - 36) / picker.AbsoluteSize.Y
                            local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                            updateValue(color)
                            oldpercentX, oldpercentY = xPercent, yPercent
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = picker.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            hue.MouseMoved:connect(function(_, y)
                hueY = y
            end)

            picker.MouseMoved:connect(function(x, y)
                pickerX, pickerY = x, y
            end)

            table.insert(library.toInvis, colorFrame)
            library.flags[args.flag] = Color3.new(1,1,1)
            library.options[args.flag] = {type = "colorpicker", changeState = updateValue, skipflag = args.skipflag, oldargs = args}

            updateValue(args.color or Color3.new(1,1,1))
        end
        
        function group:addDoubleColorpicker(args)
            if not args.flag1 or not args.flag2 then return warn("missing flags for double colorpicker") end
            
            local offset = 0.86
            local spacing = 0.08
            
            local function createPicker(idx, flag, text, initialColor, callback)
                local pickerFrame = Instance.new("Frame")
                pickerFrame.Name = "colorpicker_" .. flag
                pickerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                pickerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                pickerFrame.BorderSizePixel = 3
                pickerFrame.Position = UDim2.new(offset - (idx * spacing), 4, 0.272000015, 0)
                pickerFrame.Size = UDim2.new(0, 20, 0, 10)
                pickerFrame.Parent = grouper
                
                local mid = Instance.new("Frame")
                mid.Name = "mid"
                mid.Parent = pickerFrame
                mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                mid.BorderColor3 = Color3.fromRGB(30,30,30)
                mid.BorderSizePixel = 2
                mid.Size = UDim2.new(1, 0, 1, 0)
                
                local front = Instance.new("Frame")
                front.Name = "front"
                front.Parent = mid
                front.BackgroundColor3 = initialColor or Color3.new(1,1,1)
                front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                front.Size = UDim2.new(1, 0, 1, 0)
                
                local button = Instance.new("TextButton")
                button.Name = "button"
                button.Parent = front
                button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                button.BackgroundTransparency = 1.000
                button.Size = UDim2.new(1, 0, 1, 0)
                button.Text = ""
                button.Font = Enum.Font.SourceSans
                button.TextColor3 = Color3.fromRGB(0, 0, 0)
                button.TextSize = 14.000
                
                local label = Instance.new("TextLabel")
                label.Name = "label"
                label.Parent = grouper
                label.BackgroundTransparency = 1
                label.Position = UDim2.new(offset - (idx * spacing) - 0.05, 0, 0.1, 0)
                label.Size = UDim2.new(0, 60, 0, 14)
                label.Font = Enum.Font.Code
                label.Text = text or flag
                label.TextColor3 = Color3.fromRGB(244, 244, 244)
                label.TextSize = 12
                label.TextXAlignment = Enum.TextXAlignment.Right
                label.ZIndex = library.multiZindex
                
                local colorFrame = Instance.new("Frame")
                colorFrame.Name = "colorFrame_" .. flag
                colorFrame.Parent = grouper
                colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                colorFrame.BorderSizePixel = 2
                colorFrame.Position = UDim2.new(0.101092957 + (idx * 0.1), 0, 0.75, 0)
                colorFrame.Size = UDim2.new(0, 137, 0, 128)
                colorFrame.Visible = false
                table.insert(library.toInvis, colorFrame)
                
                local colorFrame_2 = Instance.new("Frame")
                colorFrame_2.Name = "colorFrame"
                colorFrame_2.Parent = colorFrame
                colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
                colorFrame_2.Size = UDim2.new(1, 0, 1, 0)
                
                local hueframe = Instance.new("Frame")
                hueframe.Name = "hueframe"
                hueframe.Parent = colorFrame_2
                hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                hueframe.BorderSizePixel = 2
                hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
                hueframe.Size = UDim2.new(0, 100, 0, 100)
                
                local main = Instance.new("Frame")
                main.Name = "main"
                main.Parent = hueframe
                main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main.Size = UDim2.new(0, 100, 0, 100)
                main.ZIndex = 6
                
                local picker = Instance.new("ImageLabel")
                picker.Name = "picker"
                picker.Parent = main
                picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                picker.BorderSizePixel = 0
                picker.Size = UDim2.new(0, 100, 0, 100)
                picker.ZIndex = 104
                picker.Image = "rbxassetid://2615689005"
                
                local pickerframe = Instance.new("Frame")
                pickerframe.Name = "pickerframe"
                pickerframe.Parent = colorFrame
                pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                pickerframe.BorderSizePixel = 2
                pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
                pickerframe.Size = UDim2.new(0, 20, 0, 100)
                
                local main_2 = Instance.new("Frame")
                main_2.Name = "main"
                main_2.Parent = pickerframe
                main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main_2.Size = UDim2.new(0, 20, 0, 100)
                main_2.ZIndex = 6
                
                local hue = Instance.new("ImageLabel")
                hue.Name = "hue"
                hue.Parent = main_2
                hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                hue.BorderSizePixel = 0
                hue.Size = UDim2.new(0, 20, 0, 100)
                hue.ZIndex = 104
                hue.Image = "rbxassetid://2615692420"
                
                local clr = Instance.new("Frame")
                clr.Name = "clr"
                clr.Parent = colorFrame
                clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                clr.BackgroundTransparency = 1.000
                clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                clr.BorderSizePixel = 2
                clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                clr.Size = UDim2.new(0, 129, 0, 14)
                clr.ZIndex = 5
                
                local copy = Instance.new("TextButton")
                copy.Name = "copy"
                copy.Parent = clr
                copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                copy.BackgroundTransparency = 1.000
                copy.BorderSizePixel = 0
                copy.Size = UDim2.new(0, 129, 0, 14)
                copy.ZIndex = 5
                copy.Font = Enum.Font.SourceSans
                copy.Text = text or flag
                copy.TextColor3 = Color3.fromRGB(100, 100, 100)
                copy.TextSize = 14.000
                copy.TextStrokeTransparency = 0.000
                copy.MouseButton1Click:Connect(function()
                    colorFrame.Visible = false
                end)
                
                button.MouseButton1Click:Connect(function()
                    for _, inv in ipairs(library.toInvis) do
                        if inv ~= colorFrame and inv:IsA("Frame") and inv.Name:find("colorFrame_") then
                            inv.Visible = false
                        end
                    end
                    colorFrame.Visible = not colorFrame.Visible
                    mid.BorderColor3 = Color3.fromRGB(30,30,30)
                end)
                
                button.MouseEnter:connect(function()
                    mid.BorderColor3 = library.libColor
                end)
                button.MouseLeave:connect(function()
                    mid.BorderColor3 = Color3.fromRGB(30,30,30)
                end)
                
                local function updateValue(value)
                    library.flags[flag] = value
                    front.BackgroundColor3 = value
                    if callback then callback(value) end
                end
                
                local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                local heartbeat = game:GetService("RunService").Heartbeat
                
                local pickerX,pickerY,hueY = 0,0,0
                local oldpercentX,oldpercentY = 0,0
                
                hue.MouseEnter:Connect(function()
                    local input = hue.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                local startC = colors[math.floor(num)]
                                local endC = colors[math.ceil(num)]
                                local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                updateValue(color)
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = hue.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)
                
                picker.MouseEnter:Connect(function()
                    local input = picker.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                updateValue(color)
                                oldpercentX,oldpercentY = xPercent,yPercent
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = picker.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)
                
                hue.MouseMoved:connect(function(_, y)
                    hueY = y
                end)
                picker.MouseMoved:connect(function(x, y)
                    pickerX,pickerY = x,y
                end)
                
                library.options[flag] = {type = "colorpicker", changeState = updateValue, skipflag = args.skipflag, oldargs = args}
                updateValue(initialColor or Color3.new(1,1,1))
                
                return {colorFrame = colorFrame}
            end
            
            createPicker(0, args.flag1, args.text1, args.color1, args.callback1)
            createPicker(1, args.flag2, args.text2, args.color2, args.callback2)
        end

 function group:addKeybind(args)
    if not args.flag then 
        if args.text then args.flag = args.text end
        if not args.flag then return warn("incorrect arguments - missing args on keybind") end
    end
    groupbox.Size = groupbox.Size + UDim2.new(0, 0, 0, 20)
    local next = false
    local mode = args.mode or "hold"
    local lastPress = 0
    local debounceTime = 0.2
    
    local keybind = Instance.new("Frame")
    local text = Instance.new("TextLabel")
    local button = Instance.new("TextButton")
    local modeButton = Instance.new("TextButton")
    local pressedConnection = nil
    local originalColor

    keybind.Parent = grouper
    keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    keybind.BackgroundTransparency = 1.000
    keybind.BorderSizePixel = 0
    keybind.Size = UDim2.new(1, 0, 0, 20)
    
    text.Parent = keybind
    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    text.BackgroundTransparency = 1.000
    text.Position = UDim2.new(0.02, -1, 0, 10)
    text.Font = Enum.Font.Code
    text.Text = args.text or args.flag
    text.TextColor3 = Color3.fromRGB(244, 244, 244)
    text.TextSize = 13.000
    text.TextStrokeTransparency = 0.000
    text.TextXAlignment = Enum.TextXAlignment.Left
    
    button.Parent = keybind
    button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
    button.BackgroundTransparency = 1.000
    button.BorderSizePixel = 0
    button.Position = UDim2.new(0.7, 0, 0, 0)
    button.Size = UDim2.new(0.18, 0, 1, 0)
    button.Font = Enum.Font.Code
    button.Text = args.key == Enum.KeyCode.Unknown and "none" or (keyNames[args.key] or tostring(args.key):gsub("Enum.KeyCode.", ""):gsub("Enum.UserInputType.", ""))
    button.TextColor3 = Color3.fromRGB(155, 155, 155)
    button.TextSize = 13.000
    button.TextStrokeTransparency = 0.000
    button.TextXAlignment = Enum.TextXAlignment.Right

    modeButton.Parent = keybind
    modeButton.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
    modeButton.BackgroundTransparency = 1.000
    modeButton.BorderSizePixel = 0
    modeButton.Position = UDim2.new(0.88, 0, 0, 0)
    modeButton.Size = UDim2.new(0.1, 0, 1, 0)
    modeButton.Font = Enum.Font.Code
    modeButton.Text = mode == "hold" and "[H]" or "[T]"
    modeButton.TextColor3 = Color3.fromRGB(155, 155, 155)
    modeButton.TextSize = 13.000
    modeButton.TextStrokeTransparency = 0.000
    modeButton.TextXAlignment = Enum.TextXAlignment.Center

    local function updateMode(newMode)
        if newMode == "hold" and mode == "toggle" and toggleState then
            toggleState = false
            button.TextColor3 = Color3.fromRGB(155,155,155)
            button:SetAttribute("KeybindState", false)
            for _, kb in ipairs(library.keybindsList) do
                if kb.flag == args.flag then
                    kb.state = false
                    break
                end
            end
            library:refreshKeybindsWindow()
        end
        mode = newMode
        modeButton.Text = mode == "hold" and "[H]" or "[T]"
        library.flags[args.flag .. "_mode"] = mode
    end

    modeButton.MouseButton1Click:Connect(function()
        if library.colorpicking then return end
        if mode == "hold" then
            updateMode("toggle")
        else
            updateMode("hold")
        end
    end)

    local toggleState = false

    function updateValue(v)
        if library.colorpicking then return end
        library.flags[args.flag] = v
        button.Text = v == Enum.KeyCode.Unknown and "none" or (keyNames[v] or tostring(v):gsub("Enum.KeyCode.", ""):gsub("Enum.UserInputType.", ""))
        if mode == "hold" then
            if type(args.callback) == "function" then args.callback(v) end
        else
            if type(args.callback) == "function" then args.callback(toggleState) end
        end
        for _, kb in ipairs(library.keybindsList) do
            if kb.flag == args.flag then
                kb.key = v
                kb.state = toggleState
                break
            end
        end
        library:refreshKeybindsWindow()
    end

    local connection
    connection = inputService.InputBegan:Connect(function(input)
        local key = input.KeyCode == Enum.KeyCode.Unknown and input.UserInputType or input.KeyCode
        local now = tick()
        if now - lastPress < debounceTime then return end

        if next then
            if not table.find(library.blacklisted, key) then
                next = false
                library.flags[args.flag] = key
                button.Text = keyNames[key] or tostring(key):gsub("Enum.KeyCode.", ""):gsub("Enum.UserInputType.", "")
                button.TextColor3 = Color3.fromRGB(155, 155, 155)
                if mode == "hold" and type(args.callback) == "function" then
                    args.callback(key)
                end
                for _, kb in ipairs(library.keybindsList) do
                    if kb.flag == args.flag then
                        kb.key = key
                        break
                    end
                end
                library:refreshKeybindsWindow()
            end
        elseif key == library.flags[args.flag] then
            lastPress = now
            if mode == "hold" then
                originalColor = button.TextColor3
                button.TextColor3 = library.keybindActiveColor
                button:SetAttribute("KeybindState", true)
                table.insert(library.keybindActiveElements, button)
                if pressedConnection then pressedConnection:Disconnect() end
                pressedConnection = inputService.InputEnded:Connect(function(input2)
                    local key2 = input2.KeyCode == Enum.KeyCode.Unknown and input2.UserInputType or input2.KeyCode
                    if key2 == library.flags[args.flag] then
                        button.TextColor3 = originalColor
                        button:SetAttribute("KeybindState", false)
                        for i, elem in ipairs(library.keybindActiveElements) do
                            if elem == button then
                                table.remove(library.keybindActiveElements, i)
                                break
                            end
                        end
                        pressedConnection:Disconnect()
                        pressedConnection = nil
                    end
                end)
                if type(args.presscallback) == "function" then
                    args.presscallback(key)
                end
            else
                toggleState = not toggleState
                if type(args.presscallback) == "function" then
                    args.presscallback(toggleState)
                end
                if type(args.callback) == "function" then
                    args.callback(toggleState)
                end
                button.TextColor3 = toggleState and library.keybindActiveColor or Color3.fromRGB(155,155,155)
                button:SetAttribute("KeybindState", toggleState)
                if toggleState then
                    table.insert(library.keybindActiveElements, button)
                else
                    for i, elem in ipairs(library.keybindActiveElements) do
                        if elem == button then
                            table.remove(library.keybindActiveElements, i)
                            break
                        end
                    end
                end
                for _, kb in ipairs(library.keybindsList) do
                    if kb.flag == args.flag then
                        kb.state = toggleState
                        break
                    end
                end
                library:refreshKeybindsWindow()
            end
        end
    end)

    button.MouseButton1Click:Connect(function()
        if library.colorpicking then return end
        library.flags[args.flag] = Enum.KeyCode.Unknown
        button.Text = "none"
        button.TextColor3 = library.libColor
        button:SetAttribute("KeybindState", false)
        next = true
        for _, kb in ipairs(library.keybindsList) do
            if kb.flag == args.flag then
                kb.key = Enum.KeyCode.Unknown
                kb.state = false
                break
            end
        end
        library:refreshKeybindsWindow()
    end)

    library.flags[args.flag] = args.key or Enum.KeyCode.Unknown
    library.flags[args.flag .. "_mode"] = mode
    library.options[args.flag] = {type = "keybind", changeState = updateValue, skipflag = args.skipflag, oldargs = args}

    table.insert(library.keybindsList, {
        flag = args.flag,
        text = args.text or args.flag,
        key = args.key or Enum.KeyCode.Unknown,
        mode = mode,
        state = false
    })

    updateValue(args.key or Enum.KeyCode.Unknown)
end
        return group, groupbox
    end
    return tab
end

function contains(list, x)
    for _, v in pairs(list) do
        if v == x then 
            return true 
        end
    end
    return false
end

function library:saveConfig()
    local name = library.flags["selected_config"]
    
    if not name or name == "" or name == nil then
        library:notify("Please select a config first!")
        return
    end
    
    if not library.options["selected_config"] or not library.options["selected_config"].values then
        library:notify("No configs available!")
        return
    end
    
    local configExists = false
    for _, configName in ipairs(library.options["selected_config"].values) do
        if tostring(configName) == tostring(name) then
            configExists = true
            break
        end
    end
    
    if not configExists then
        library:notify("Selected config doesn't exist!")
        return
    end
    
    local jig = {}
    for i, v in next, library.flags do
        if library.options[i] and library.options[i].skipflag then 
            continue 
        end
        if typeof(v) == "Color3" then
            jig[i] = {v.R, v.G, v.B}
        elseif typeof(v) == "EnumItem" then
            jig[i] = {string.split(tostring(v), ".")[2], string.split(tostring(v), ".")[3]}
        else
            jig[i] = v
        end
    end
    
    if not isfolder(library.cheatname) then
        makefolder(library.cheatname)
    end
    
    local filePath = library.cheatname .. "/" .. name .. ".cfg"
    writefile(filePath, game:GetService("HttpService"):JSONEncode(jig))
    library:notify("Successfully updated config " .. name .. ".cfg!")
    library:refreshConfigs()
end

function library:loadConfig()
    local name = library.flags["selected_config"]
    
    if not name or name == "" then
        library:notify("Please select a config first!")
        return
    end
    
    local filePath = library.cheatname .. "/" .. name .. ".cfg"
    if not isfile(filePath) then
        library:notify("Config file " .. name .. ".cfg not found!")
        return
    end
    
    local config = game:GetService("HttpService"):JSONDecode(readfile(filePath))
    for i, v in next, library.options do
        spawn(function()
            pcall(function()
                if config[i] then
                    if v.type == "colorpicker" then
                        v.changeState(Color3.new(config[i][1], config[i][2], config[i][3]))
                    elseif v.type == "keybind" then
                        v.changeState(Enum[config[i][1]][config[i][2]])
                    else
                        if config[i] ~= library.flags[i] then
                            v.changeState(config[i])
                        end
                    end
                end
            end)
        end)
    end
    library:notify("Successfully loaded config " .. name .. ".cfg!")
end

function library:deleteConfig()
    local name = library.flags["selected_config"]
    
    if not name or name == "" then
        library:notify("Please select a config first!")
        return
    end
    
    local filePath = library.cheatname .. "/" .. name .. ".cfg"
    if isfile(filePath) then
        delfile(filePath)
        library:refreshConfigs()
        library:notify("Successfully deleted config " .. name .. ".cfg!")
    else
        library:notify("Config file " .. name .. ".cfg not found!")
    end
end

function library:refreshConfigs()
    local tbl = {}
    
    if isfolder(library.cheatname) then
        for i, v in next, listfiles(library.cheatname) do
            local fileName = string.match(v, "([^/\\]+)%.cfg$")
            if fileName then
                table.insert(tbl, fileName)
            end
        end
    end
    
    if library.options["selected_config"] and library.options["selected_config"].refresh then
        library.options["selected_config"].refresh(tbl)
    else
        library.configsList = tbl
    end
end

function library:createConfig()
    local name = library.flags["config_name"]
    
    if not name or name == "" then 
        return library:notify("Put a name") 
    end
    
    if library.options["selected_config"] and library.options["selected_config"].values then
        if contains(library.options["selected_config"].values, name) then 
            return library:notify(name .. ".cfg already exists!") 
        end
    end
    
    local jig = {}
    for i, v in next, library.flags do
        if library.options[i] and library.options[i].skipflag then 
            continue 
        end
        if typeof(v) == "Color3" then
            jig[i] = {v.R, v.G, v.B}
        elseif typeof(v) == "EnumItem" then
            jig[i] = {string.split(tostring(v), ".")[2], string.split(tostring(v), ".")[3]}
        else
            jig[i] = v
        end
    end
    
    if not isfolder(library.cheatname) then
        makefolder(library.cheatname)
    end
    
    writefile(library.cheatname .. "/" .. name .. ".cfg", game:GetService("HttpService"):JSONEncode(jig))
    library:notify("Successfully created config " .. name .. ".cfg!")
    library:refreshConfigs()
end

local watermarkGui = Instance.new("ScreenGui")
watermarkGui.Name = "Watermark"
watermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
watermarkGui.Parent = gethui()

local bg = Instance.new("Frame")
bg.Name = "bg"
bg.BorderSizePixel = 3
bg.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
bg.Size = UDim2.new(0, 421, 0, 14)
bg.Position = UDim2.new(0.0762, 0, 0.11981, 0)
bg.BorderColor3 = Color3.fromRGB(11, 11, 11)
bg.Parent = watermarkGui

local innerBg = Instance.new("Frame")
innerBg.Name = "bg"
innerBg.BorderSizePixel = 2
innerBg.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
innerBg.Size = UDim2.new(1, 0, 1, 0)
innerBg.BorderColor3 = Color3.fromRGB(36, 36, 36)
innerBg.Parent = bg

local innerBg2 = Instance.new("Frame")
innerBg2.Name = "bg"
innerBg2.BorderSizePixel = 2
innerBg2.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
innerBg2.Size = UDim2.new(0, 707, 0, 602)
innerBg2.Position = UDim2.new(0, 7, 0.002, 21)
innerBg2.BorderColor3 = Color3.fromRGB(36, 36, 36)
innerBg2.BackgroundTransparency = 1
innerBg2.Parent = innerBg

local pre = Instance.new("TextLabel")
pre.Name = "pre"
pre.TextStrokeTransparency = 0
pre.TextSize = 13
pre.TextXAlignment = Enum.TextXAlignment.Left
pre.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pre.Font = Enum.Font.Code
pre.TextColor3 = Color3.fromRGB(255, 255, 255)
pre.BorderMode = Enum.BorderMode.Middle
pre.BackgroundTransparency = 1
pre.RichText = true
pre.Size = UDim2.new(0, 421, 0, 14)
pre.BorderColor3 = Color3.fromRGB(28, 43, 54)
pre.Text = library.cheatname .. "   " .. library.gamename .. "    fps 0    ".. exec
pre.Parent = bg

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    bg.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

bg.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = bg.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

bg.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

inputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

watermarkGui.Enabled = false

local frameCount = 0
local lastTime = tick()

runService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
end)

spawn(function()
    while true do
        wait(1)
        if watermarkGui.Enabled then
            local currentTime = tick()
            local delta = currentTime - lastTime
            lastTime = currentTime
            local fps = math.floor(frameCount / delta)
            frameCount = 0
            pre.Text = library.cheatname .. "   " .. library.gamename .. "    fps " .. fps .."   Exec: "..exec
        end
    end
end)

local keybindsWindow = Instance.new("ScreenGui")
keybindsWindow.Name = "KeybindsWindow"
keybindsWindow.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
keybindsWindow.Parent = gethui()
keybindsWindow.Enabled = false

local bg2 = Instance.new("Frame")
bg2.Name = "bg2"
bg2.BorderSizePixel = 2
bg2.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
bg2.Size = UDim2.new(0, 190, 0, 55)
bg2.Position = UDim2.new(0.15119, 0, 0.37981, 0)
bg2.BorderColor3 = Color3.fromRGB(11, 11, 11)
bg2.Parent = keybindsWindow

local bg = Instance.new("Frame")
bg.Name = "bg"
bg.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BorderColor3 = Color3.fromRGB(36, 36, 36)
bg.Parent = bg2

local bgg = Instance.new("Frame")
bgg.Name = "bgg"
bgg.BorderSizePixel = 2
bgg.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
bgg.Size = UDim2.new(0, 176, 0, 23)
bgg.Position = UDim2.new(0, 7, 0.002, 21)
bgg.BorderColor3 = Color3.fromRGB(36, 36, 36)
bgg.Parent = bg

local bgList = Instance.new("Frame")
bgList.Name = "bg"
bgList.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
bgList.Size = UDim2.new(1, 0, 1, 0)
bgList.BorderColor3 = Color3.fromRGB(11, 11, 11)
bgList.Parent = bgg

library.keybindsBgList = bgList
library.keybindsHeaderPre = pre
library.keybindsWindow = keybindsWindow

local keyList = Instance.new("UIListLayout")
keyList.Parent = bgList
keyList.Padding = UDim.new(0, 2)

local pre = Instance.new("TextLabel")
pre.Name = "pre"
pre.TextStrokeTransparency = 0
pre.TextSize = 13
pre.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pre.Font = Enum.Font.Code
pre.TextColor3 = library.keybindsTextColor
pre.BorderMode = Enum.BorderMode.Middle
pre.BackgroundTransparency = 1
pre.RichText = true
pre.Size = UDim2.new(0, 190, 0, 11)
pre.BorderColor3 = Color3.fromRGB(28, 43, 54)
pre.Text = "KeyBinds"
pre.Position = UDim2.new(0, 0, 0, 5)
pre.Parent = bg2

library.keybindsHeaderPre = pre

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    bg2.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

bg2.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = bg2.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

bg2.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

function library:refreshKeybindsWindow()
    for _, child in ipairs(bgList:GetChildren()) do
        if child:IsA("TextLabel") and child.Name ~= "pre" then
            child:Destroy()
        end
    end
    local count = 0
    for _, kb in ipairs(library.keybindsList) do
        if kb.state == true and kb.key ~= Enum.KeyCode.Unknown then
            local ke = Instance.new("TextLabel")
            ke.Name = "ke_" .. kb.flag
            ke.BorderSizePixel = 0
            ke.TextSize = 14
            ke.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
            ke.BackgroundTransparency = 1
            ke.Font = Enum.Font.Code
            ke.TextColor3 = library.keybindsTextColor
            ke.Size = UDim2.new(0, 176, 0, 20)
            ke.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ke.Text = kb.text
            ke.TextXAlignment = Enum.TextXAlignment.Center
            ke.TextTransparency = 1
            ke.Parent = bgList
            library:Tween(ke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0
            })
            count = count + 1
        end
    end
    local bottomPadding = 10
    local bggTopOffset = 21
    local bggHeight = math.max(23, count * 20) + bottomPadding
    local bg2Height = bggTopOffset + bggHeight + bottomPadding

    library:Tween(bg2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 190, 0, bg2Height)})
    library:Tween(bgg, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 176, 0, bggHeight)})
end

function library:addKeybindToWindow(name, key)
    for _, kb in ipairs(library.keybindsList) do
        if kb.text == name or kb.flag == name then
            kb.key = key
            break
        end
    end
    library:refreshKeybindsWindow()
end

function library:updateKeybindInWindow(name, newKey)
    for _, kb in ipairs(library.keybindsList) do
        if kb.text == name or kb.flag == name then
            kb.key = newKey
            break
        end
    end
    library:refreshKeybindsWindow()
end

function library:removeKeybindFromWindow(name)
    for i, kb in ipairs(library.keybindsList) do
        if kb.text == name or kb.flag == name then
            table.remove(library.keybindsList, i)
            break
        end
    end
    library:refreshKeybindsWindow()
end

function library:toggleKeybindsWindow()
    keybindsWindow.Enabled = not keybindsWindow.Enabled
end

library.toggleKeybindsWindow = library.toggleKeybindsWindow
library.addKeybindToWindow = library.addKeybindToWindow
library.updateKeybindInWindow = library.updateKeybindInWindow
library.removeKeybindFromWindow = library.removeKeybindFromWindow

local function CreateConfigTab()
    
local configTab = library:addTab("Settings")
local createconfigs = configTab:createGroup('left', 'Create Configs')
local configsettings = configTab:createGroup('left', 'Config Settings')
local uisettings = configTab:createGroup('center', 'UI Settings')
local othersettings = configTab:createGroup('right', 'Other')

createconfigs:addTextbox({
    text = "Name", 
    flag = "config_name"
})
createconfigs:addButton({
    text = "Create", 
    callback = library.createConfig
})

configsettings:addConfigbox({
    flag = 'selected_config', 
    values = {}
})
configsettings:addButton({
    text = "Load", 
    callback = library.loadConfig
})
configsettings:addButton({
    text = "Update", 
    callback = library.saveConfig
})
configsettings:addButton({
    text = "Delete", 
    callback = library.deleteConfig
})
configsettings:addButton({
    text = "Refresh", 
    callback = library.refreshConfigs
})
uisettings:addColorpicker({
    text = "Menu Accent", 
    ontop = true, 
    flag = "menuaccent", 
    color = Color3.new(1,1,1), 
    callback = function(v)
        library:updateLibColor(v)
    end
})
uisettings:addColorpicker({
    text = "Watermark Text Color", 
    ontop = true, 
    flag = "watermark_text_color", 
    color = Color3.new(1,1,1), 
    callback = function(v)
        local watermarkPre = watermarkGui:FindFirstChild("bg"):FindFirstChild("pre")
        if watermarkPre then
            watermarkPre.TextColor3 = v
        end
    end
})
uisettings:addColorpicker({
    text = "Keybinds Text Color", 
    ontop = true, 
    flag = "keybinds_text_color", 
    color = Color3.new(1,1,1), 
    callback = function(v)
        library:updateKeybindsTextColor(v)
    end
})

othersettings:addToggle({
    text = "Show WaterMark", 
    flag = "show_watermark",
    state = true,
    callback = function(v)
        watermarkGui.Enabled = v
    end
})

othersettings:addToggle({
    text = "Show Keybinds", 
    flag = "show_keybinds",
    keybind = false,
    state = true,
    callback = function(v)
        library:toggleKeybindsWindow()
    end
})

othersettings:addButton({
    text = "Test Notification",
    callback = function()
        library:notify("кто читает тот лох")
    end
})

library:refreshConfigs()

end

getgenv().library = library

--local cmb = library:addTab("Combat")
--local slt = cmb:createGroup('left', 'Aimbot')
--local visual = cmb:createGroup('center', 'Visual')
--local gnmd = cmb:createGroup('right', 'Modifications')

--slt:addToggle({
  --  text = "Silent Aim",
  --  flag = "Silent_Aim",
  --  keybind = false,
  --  state = false,
  --  callback = function(v)
  --  end
--})

--visual:addToggle({
   -- text = "Fov Circle",
 --   flag = "fov_circle",
 --   keybind = false,
--    state = false,
--    callback = function(v)
--    end
--}):addDoubleColorpicker({
 --   text1 = "First Color",
 --   flag1 = "primary_fcolor",
 --   color1 = Color3.new(1,1,1),
  --  callback1 = function(v)
 --       print(v)
  --  end,
  --  text2 = "Second Color",
  --  flag2 = "secondary_fcolor",
  --  color2 = Color3.new(1,0,0),
  --  callback2 = function(v)
  --      print(v)
  --  end
--})
--visual:addSlider({
 --   text = "AimBot Fov",
 --   flag = "aim_fov",
 --  min = 1,
 --   max = 180,
  --  increment = 1,
 --   value = 1,
 --   callback = function(v)
--        print(v)
 --  end
--})

--gnmd:addSlider({
  --  text = "RMP",
   -- flag = "rapid_mult",
   -- min = 1,
   -- max = 10,
   -- increment = 0.1,
   -- value = 1,
   -- callback = function(v)
    --    print("How much niggers:", v)
  --  end
--})

-- CreateConfigTab()