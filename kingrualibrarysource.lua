-- ==============================================================================
-- PINATHUB X KINGRUA UI LIBRARY — MENG HUB MODERN EDITION
-- Official Pinathub Neon Identity & Meng Hub Glassmorphism Theme System
-- Full Topbar/Menu Overlay Capability (IgnoreGuiInset = true, DisplayOrder = 999999)
-- Ultra-Smooth Micro-Animations, Rich Elements & Complete KingRua Compatibility
-- ==============================================================================

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ==============================================================================
-- 1. BRANDING & ASSETS
-- ==============================================================================
local PINATHUB_LOGO = "rbxassetid://118264723961739"

local TabIcons = {
	Main = "rbxassetid://10723407389",       -- Home / Dashboard
	Info = "rbxassetid://10747373176",       -- User / Info
	Survivor = "rbxassetid://10734923549",   -- Sword / Survivor
	Killer = "rbxassetid://10723415766",     -- Skull / Killer
	ESP = "rbxassetid://10723415766",        -- Eye / ESP
	Visuals = "rbxassetid://10723415766",    -- Eye / Visuals
	Emote = "rbxassetid://10747373176",      -- Emote & Skin
	Aimbot = "rbxassetid://10734943760",     -- Crosshair / Aimbot
	Settings = "rbxassetid://10734950309",   -- Settings / Gear
	Configuration = "rbxassetid://10709782497", -- Sliders / Config
	Player = "rbxassetid://10747373176",     -- User / Player
	Misc = "rbxassetid://10709782497",       -- Sliders / Misc
	Credits = "rbxassetid://10723416652",    -- Info / Credits
	Search = "rbxassetid://10734943760",     -- Search Icon
	Minimize = "rbxassetid://10734896206",   -- Minimize Icon
	Maximize = "rbxassetid://10734914561",   -- Maximize Icon
	Close = "rbxassetid://10747384394",      -- Close Icon
	ChevronRight = "rbxassetid://10709790948",-- Arrow right
	ChevronDown = "rbxassetid://10709790948", -- Arrow down (rotation 90)
	Discord = "rbxassetid://10723416652",    -- Community
	Cursor = "rbxassetid://10734943760"      -- Cursor
}

-- Detect Executor Name dynamically
local function DetectExecutor()
	if identifyexecutor then
		local name, ver = identifyexecutor()
		if name then
			return tostring(name) .. (ver and (" " .. tostring(ver)) or "")
		end
	end
	if syn then return "Synapse X" end
	if KRNL_LOADED then return "Krnl" end
	if fluxus then return "Fluxus" end
	if shadow_loaded then return "Shadow" end
	if delta then return "Delta" end
	if getexecutorname then return tostring(getexecutorname()) end
	return "Vortex"
end

-- ==============================================================================
-- 2. COLOR PALETTE: MENG HUB DARK OBSIDIAN & AMETHYST PURPLE
-- ==============================================================================
local Theme = {
	Background = Color3.fromRGB(15, 14, 20),
	Header = Color3.fromRGB(20, 18, 28),
	Sidebar = Color3.fromRGB(17, 16, 24),
	Surface = Color3.fromRGB(25, 23, 35),
	SurfaceHover = Color3.fromRGB(34, 31, 48),
	SurfaceActive = Color3.fromRGB(46, 41, 66),

	Text = Color3.fromRGB(245, 245, 250),
	TextSecondary = Color3.fromRGB(170, 168, 185),
	TextMuted = Color3.fromRGB(115, 112, 130),

	Accent = Color3.fromRGB(168, 85, 247),       -- Vibrant Amethyst Purple
	AccentGlow = Color3.fromRGB(192, 132, 252),   -- Lighter Purple Glow
	NeonWhite = Color3.fromRGB(245, 247, 255),
	NeonGray = Color3.fromRGB(195, 202, 214),

	Success = Color3.fromRGB(74, 222, 128),       -- Vivid Green
	Warning = Color3.fromRGB(251, 191, 36),       -- Amber
	Danger = Color3.fromRGB(248, 113, 113),       -- Crimson Red

	Border = Color3.fromRGB(58, 52, 80),
	BorderSoft = Color3.fromRGB(38, 35, 52),
	BorderAccent = Color3.fromRGB(120, 75, 200),
}

-- Easing tokens for ultra-smooth responsiveness
local TweenInfoFast = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local TweenInfoSmooth = TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local TweenInfoSpring = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- ==============================================================================
-- 3. LIBRARY CORE & UTILITIES
-- ==============================================================================
local Library = {
	Theme = Theme,
	Logo = PINATHUB_LOGO,
	CurrentWindow = nil,
	NotificationHolder = nil
}

function Library:TweenInstance(instance, time, prop, value, easingStyle, easingDir)
	local tweenInfo = TweenInfo.new(
		time or 0.2,
		easingStyle or Enum.EasingStyle.Quad,
		easingDir or Enum.EasingDirection.Out
	)
	local tween = TweenService:Create(instance, tweenInfo, { [prop] = value })
	tween:Play()
	return tween
end

function Library:MakeConfig(defaults, userConfig)
	local result = {}
	for k, v in pairs(defaults) do
		result[k] = v
	end
	if type(userConfig) == "table" then
		for k, v in pairs(userConfig) do
			result[k] = v
		end
	end
	return result
end

function Library:MakeDraggable(dragBar, mainObject)
	local dragging = false
	local dragStart = nil
	local startPos = nil

	dragBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = mainObject.Position

			local endedConn
			endedConn = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					endedConn:Disconnect()
				end
			end)
		end
	end)

	dragBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragging and dragStart and startPos then
				local delta = input.Position - dragStart
				mainObject.Position = UDim2.new(
					startPos.X.Scale,
					startPos.X.Offset + delta.X,
					startPos.Y.Scale,
					startPos.Y.Offset + delta.Y
				)
			end
		end
	end)
end

function Library:UpdateScrolling(scrollFrame, uiLayout)
	local function update()
		scrollFrame.CanvasSize = UDim2.new(0, 0, 0, uiLayout.AbsoluteContentSize.Y + 16)
	end
	uiLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(update)
	task.defer(update)
end

-- ==============================================================================
-- 4. CUSTOM GLASS TOAST NOTIFICATION SYSTEM
-- ==============================================================================
function Library:Notify(config)
	local cfg = self:MakeConfig({
		Title = "Pinathub",
		Content = "",
		Duration = 3.5,
		Type = "Info",
		Icon = nil
	}, config or {})

	if not self.NotificationHolder then return end

	local typeColor = Theme.Accent
	if cfg.Type == "Success" then
		typeColor = Theme.Success
	elseif cfg.Type == "Warning" then
		typeColor = Theme.Warning
	elseif cfg.Type == "Danger" or cfg.Type == "Error" then
		typeColor = Theme.Danger
	end

	local Toast = Instance.new("Frame")
	Toast.Name = "Toast"
	Toast.Parent = self.NotificationHolder
	Toast.BackgroundColor3 = Theme.Surface
	Toast.BorderSizePixel = 0
	Toast.Size = UDim2.new(1, 0, 0, 0)
	Toast.ClipsDescendants = true
	Toast.BackgroundTransparency = 1

	local ToastCorner = Instance.new("UICorner")
	ToastCorner.CornerRadius = UDim.new(0, 8)
	ToastCorner.Parent = Toast

	local ToastStroke = Instance.new("UIStroke")
	ToastStroke.Color = Theme.Border
	ToastStroke.Thickness = 1
	ToastStroke.Transparency = 1
	ToastStroke.Parent = Toast

	local LeftStripe = Instance.new("Frame")
	LeftStripe.Name = "Stripe"
	LeftStripe.Parent = Toast
	LeftStripe.BackgroundColor3 = typeColor
	LeftStripe.BorderSizePixel = 0
	LeftStripe.Size = UDim2.new(0, 3, 1, 0)
	LeftStripe.ZIndex = 2

	local StripeCorner = Instance.new("UICorner")
	StripeCorner.CornerRadius = UDim.new(0, 2)
	StripeCorner.Parent = LeftStripe

	local IconLabel = Instance.new("ImageLabel")
	IconLabel.Name = "Icon"
	IconLabel.Parent = Toast
	IconLabel.AnchorPoint = Vector2.new(0, 0.5)
	IconLabel.Position = UDim2.new(0, 12, 0, 22)
	IconLabel.Size = UDim2.new(0, 18, 0, 18)
	IconLabel.BackgroundTransparency = 1
	IconLabel.Image = cfg.Icon or PINATHUB_LOGO
	IconLabel.ImageColor3 = typeColor
	IconLabel.ScaleType = Enum.ScaleType.Fit
	IconLabel.ZIndex = 2

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Parent = Toast
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0, 38, 0, 7)
	Title.Size = UDim2.new(1, -46, 0, 16)
	Title.Font = Enum.Font.GothamBold
	Title.Text = cfg.Title
	Title.TextColor3 = Theme.Text
	Title.TextSize = 12
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.ZIndex = 2

	local Desc = Instance.new("TextLabel")
	Desc.Name = "Desc"
	Desc.Parent = Toast
	Desc.BackgroundTransparency = 1
	Desc.Position = UDim2.new(0, 38, 0, 25)
	Desc.Size = UDim2.new(1, -46, 0, 30)
	Desc.Font = Enum.Font.Gotham
	Desc.Text = cfg.Content
	Desc.TextColor3 = Theme.TextSecondary
	Desc.TextSize = 11
	Desc.TextWrapped = true
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	Desc.TextYAlignment = Enum.TextYAlignment.Top
	Desc.ZIndex = 2

	local ProgressBar = Instance.new("Frame")
	ProgressBar.Name = "ProgressBar"
	ProgressBar.Parent = Toast
	ProgressBar.AnchorPoint = Vector2.new(0, 1)
	ProgressBar.Position = UDim2.new(0, 0, 1, 0)
	ProgressBar.Size = UDim2.new(1, 0, 0, 2)
	ProgressBar.BackgroundColor3 = typeColor
	ProgressBar.BackgroundTransparency = 0.2
	ProgressBar.BorderSizePixel = 0
	ProgressBar.ZIndex = 3

	local requiredHeight = math.max(Desc.TextBounds.Y + 36, 58)

	TweenService:Create(Toast, TweenInfoSpring, {
		Size = UDim2.new(1, 0, 0, requiredHeight),
		BackgroundTransparency = 0.1
	}):Play()
	TweenService:Create(ToastStroke, TweenInfoSmooth, { Transparency = 0.2 }):Play()

	TweenService:Create(ProgressBar, TweenInfo.new(cfg.Duration, Enum.EasingStyle.Linear), {
		Size = UDim2.new(0, 0, 0, 2)
	}):Play()

	task.delay(cfg.Duration, function()
		if Toast and Toast.Parent then
			local exitTween = TweenService:Create(Toast, TweenInfoFast, {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1
			})
			TweenService:Create(ToastStroke, TweenInfoFast, { Transparency = 1 }):Play()
			exitTween:Play()
			exitTween.Completed:Connect(function()
				Toast:Destroy()
			end)
		end
	end)
end

-- ==============================================================================
-- 5. WINDOW CREATION (MENG HUB COMPACT DIMENSIONS & MODERN STYLING)
-- ==============================================================================
function Library:NewWindow(ConfigWindow)
	local Config = self:MakeConfig({
		Title = "Pinathub",
		Description = "Peacefull Community",
		Size = UDim2.fromOffset(630, 390), -- Compact Meng Hub landscape proportions
		Logo = PINATHUB_LOGO
	}, ConfigWindow or {})

	-- Auto-cleanup any old instances
	local function SafeCleanup(parent, name)
		if parent and parent:FindFirstChild(name) then
			pcall(function() parent[name]:Destroy() end)
		end
	end

	pcall(function()
		local pg = LocalPlayer:FindFirstChild("PlayerGui")
		SafeCleanup(pg, "PinathubGui")
		SafeCleanup(pg, "KingRuaUI_Premium")
		SafeCleanup(pg, "PinatHubLogo")
	end)

	-- Resolve top-level parent container (gethui / CoreGui / PlayerGui)
	local targetParent = LocalPlayer:WaitForChild("PlayerGui")
	pcall(function()
		if gethui then
			targetParent = gethui()
		elseif syn and syn.protect_gui then
			local cg = game:GetService("CoreGui")
			syn.protect_gui(ScreenGui)
			targetParent = cg
		elseif game:GetService("CoreGui") then
			local cg = game:GetService("CoreGui")
			local s = pcall(function()
				local t = Instance.new("Folder", cg)
				t:Destroy()
			end)
			if s then targetParent = cg end
		end
	end)

	-- 1. ScreenGui with full overlay capabilities (Menembus Roblox topbar menu)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "PinathubGui"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.IgnoreGuiInset = true  -- Menembus Roblox Topbar/MUI Menu
	ScreenGui.DisplayOrder = 999999  -- Render di atas menu dan UI default Roblox
	ScreenGui.Parent = targetParent

	-- Toast Notification Container (Bottom-Right)
	local NotificationHolder = Instance.new("Frame")
	NotificationHolder.Name = "NotificationHolder"
	NotificationHolder.Parent = ScreenGui
	NotificationHolder.AnchorPoint = Vector2.new(1, 1)
	NotificationHolder.Position = UDim2.new(1, -20, 1, -20)
	NotificationHolder.Size = UDim2.new(0, 280, 0, 320)
	NotificationHolder.BackgroundTransparency = 1
	NotificationHolder.ZIndex = 100

	local NotifLayout = Instance.new("UIListLayout")
	NotifLayout.Parent = NotificationHolder
	NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
	NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	NotifLayout.Padding = UDim.new(0, 6)

	self.NotificationHolder = NotificationHolder

	-- 2. DropShadow & Scaling Wrapper for MainWindow
	local DropShadowHolder = Instance.new("Frame")
	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = ScreenGui
	DropShadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadowHolder.BackgroundTransparency = 1
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Position = UDim2.fromScale(0.5, 0.5)
	DropShadowHolder.Size = Config.Size or UDim2.fromOffset(630, 390)
	DropShadowHolder.ZIndex = 10

	local UIScale = Instance.new("UIScale")
	UIScale.Scale = 1
	UIScale.Parent = DropShadowHolder

	-- Multi-layer ambient drop shadow for modern glass elevation
	local DropShadow = Instance.new("ImageLabel")
	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.fromScale(0.5, 0.5)
	DropShadow.Size = UDim2.new(1, 44, 1, 44)
	DropShadow.ZIndex = 1
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.35
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	-- 3. MainWindow with Frosted Glass Surface
	local MainWindow = Instance.new("Frame")
	MainWindow.Name = "MainWindow"
	MainWindow.Parent = DropShadowHolder
	MainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
	MainWindow.Position = UDim2.fromScale(0.5, 0.5)
	MainWindow.Size = UDim2.fromScale(1, 1)
	MainWindow.BackgroundColor3 = Theme.Background
	MainWindow.BackgroundTransparency = 0.08
	MainWindow.BorderSizePixel = 0
	MainWindow.ClipsDescendants = true
	MainWindow.ZIndex = 2

	local MainCorner = Instance.new("UICorner")
	MainCorner.CornerRadius = UDim.new(0, 12)
	MainCorner.Parent = MainWindow

	-- Deep Amethyst Gradient Background
	local backgroundGradient = Instance.new("UIGradient")
	backgroundGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 20, 36)),
		ColorSequenceKeypoint.new(0.4, Color3.fromRGB(15, 14, 20)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 9, 14)),
	})
	backgroundGradient.Rotation = 135
	backgroundGradient.Parent = MainWindow

	-- Glass Reflection Sheen
	local glassSheen = Instance.new("Frame")
	glassSheen.Name = "GlassSheen"
	glassSheen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	glassSheen.BorderSizePixel = 0
	glassSheen.Size = UDim2.fromScale(1, 1)
	glassSheen.ZIndex = 2
	glassSheen.Parent = MainWindow

	local sheenGrad = Instance.new("UIGradient")
	sheenGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(0.35, Theme.AccentGlow),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
	})
	sheenGrad.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.95),
		NumberSequenceKeypoint.new(0.4, 0.98),
		NumberSequenceKeypoint.new(1, 1.0)
	})
	sheenGrad.Rotation = 120
	sheenGrad.Parent = glassSheen

	-- Neon Edge Stroke (Amethyst Glow Rim)
	local MainStroke = Instance.new("UIStroke")
	MainStroke.Name = "Stroke"
	MainStroke.Color = Theme.BorderAccent
	MainStroke.Thickness = 1.2
	MainStroke.Transparency = 0.4
	MainStroke.Parent = MainWindow

	-- 4. Floating Launcher Button (52x52 Glass Circle with Pinathub Logo)
	local LauncherButton = Instance.new("ImageButton")
	LauncherButton.Name = "LauncherButton"
	LauncherButton.Parent = ScreenGui
	LauncherButton.AnchorPoint = Vector2.new(0, 0.5)
	LauncherButton.Position = UDim2.new(0, 20, 0.5, 0)
	LauncherButton.Size = UDim2.new(0, 52, 0, 52)
	LauncherButton.BackgroundColor3 = Theme.Header
	LauncherButton.BackgroundTransparency = 0.15
	LauncherButton.BorderSizePixel = 0
	LauncherButton.Image = PINATHUB_LOGO
	LauncherButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
	LauncherButton.ScaleType = Enum.ScaleType.Fit
	LauncherButton.Visible = false
	LauncherButton.ZIndex = 50

	local LauncherCorner = Instance.new("UICorner")
	LauncherCorner.CornerRadius = UDim.new(1, 0)
	LauncherCorner.Parent = LauncherButton

	local LauncherStroke = Instance.new("UIStroke")
	LauncherStroke.Color = Theme.Accent
	LauncherStroke.Thickness = 1.5
	LauncherStroke.Transparency = 0.2
	LauncherStroke.Parent = LauncherButton

	local LauncherShadow = Instance.new("ImageLabel")
	LauncherShadow.Name = "Shadow"
	LauncherShadow.Parent = LauncherButton
	LauncherShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	LauncherShadow.Position = UDim2.fromScale(0.5, 0.5)
	LauncherShadow.Size = UDim2.new(1, 20, 1, 20)
	LauncherShadow.BackgroundTransparency = 1
	LauncherShadow.Image = "rbxassetid://6015897843"
	LauncherShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	LauncherShadow.ImageTransparency = 0.4
	LauncherShadow.ScaleType = Enum.ScaleType.Slice
	LauncherShadow.SliceCenter = Rect.new(49, 49, 450, 450)
	LauncherShadow.ZIndex = 49

	self:MakeDraggable(LauncherButton, LauncherButton)

	LauncherButton.MouseEnter:Connect(function()
		TweenService:Create(LauncherButton, TweenInfoSpring, { Size = UDim2.new(0, 58, 0, 58) }):Play()
		TweenService:Create(LauncherStroke, TweenInfoFast, { Color = Theme.AccentGlow, Transparency = 0.1 }):Play()
	end)
	LauncherButton.MouseLeave:Connect(function()
		TweenService:Create(LauncherButton, TweenInfoSpring, { Size = UDim2.new(0, 52, 0, 52) }):Play()
		TweenService:Create(LauncherStroke, TweenInfoFast, { Color = Theme.Accent, Transparency = 0.2 }):Play()
	end)

	-- 5. Window State Controllers
	local isWindowOpen = true
	local isMaximized = false
	local originalSize = DropShadowHolder.Size

	local function OpenWindow()
		if isWindowOpen then return end
		isWindowOpen = true
		DropShadowHolder.Visible = true
		UIScale.Scale = 0.92
		MainWindow.BackgroundTransparency = 0.5
		DropShadow.ImageTransparency = 1

		TweenService:Create(UIScale, TweenInfoSpring, { Scale = 1 }):Play()
		TweenService:Create(MainWindow, TweenInfoSmooth, { BackgroundTransparency = 0.08 }):Play()
		TweenService:Create(DropShadow, TweenInfoSmooth, { ImageTransparency = 0.35 }):Play()

		local hideLauncher = TweenService:Create(LauncherButton, TweenInfoFast, { Size = UDim2.new(0, 0, 0, 0) })
		hideLauncher:Play()
		hideLauncher.Completed:Connect(function()
			LauncherButton.Visible = false
		end)
	end

	local function CloseWindow()
		if not isWindowOpen then return end
		isWindowOpen = false
		local closeTween = TweenService:Create(UIScale, TweenInfoFast, { Scale = 0.92 })
		TweenService:Create(MainWindow, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
		TweenService:Create(DropShadow, TweenInfoFast, { ImageTransparency = 1 }):Play()
		closeTween:Play()
		closeTween.Completed:Connect(function()
			DropShadowHolder.Visible = false
			LauncherButton.Visible = true
			LauncherButton.Size = UDim2.new(0, 0, 0, 0)
			TweenService:Create(LauncherButton, TweenInfoSpring, { Size = UDim2.new(0, 52, 0, 52) }):Play()
		end)
	end

	local function ToggleMaximize()
		isMaximized = not isMaximized
		local targetSize = isMaximized and UDim2.fromOffset(800, 500) or originalSize
		TweenService:Create(DropShadowHolder, TweenInfoSpring, { Size = targetSize }):Play()
	end

	LauncherButton.MouseButton1Click:Connect(OpenWindow)

	-- 6. Header (Meng Hub Style: Logo + Title + Separator + Subtitle | Pills & Actions)
	local Header = Instance.new("Frame")
	Header.Name = "Header"
	Header.Parent = MainWindow
	Header.BackgroundColor3 = Theme.Header
	Header.BackgroundTransparency = 0.3
	Header.BorderSizePixel = 0
	Header.Size = UDim2.new(1, 0, 0, 46)
	Header.ZIndex = 5

	local HeaderDivider = Instance.new("Frame")
	HeaderDivider.Name = "Divider"
	HeaderDivider.Parent = Header
	HeaderDivider.BackgroundColor3 = Theme.BorderSoft
	HeaderDivider.BorderSizePixel = 0
	HeaderDivider.Position = UDim2.new(0, 0, 1, -1)
	HeaderDivider.Size = UDim2.new(1, 0, 0, 1)

	self:MakeDraggable(Header, DropShadowHolder)

	-- Left Title Container
	local LeftHeaderContainer = Instance.new("Frame")
	LeftHeaderContainer.Name = "LeftTitle"
	LeftHeaderContainer.Parent = Header
	LeftHeaderContainer.BackgroundTransparency = 1
	LeftHeaderContainer.Position = UDim2.new(0, 14, 0, 0)
	LeftHeaderContainer.Size = UDim2.new(0, 320, 1, 0)

	local LeftLayout = Instance.new("UIListLayout")
	LeftLayout.Parent = LeftHeaderContainer
	LeftLayout.FillDirection = Enum.FillDirection.Horizontal
	LeftLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
	LeftLayout.Padding = UDim.new(0, 8)

	-- Logo Pinathub
	local BrandLogo = Instance.new("ImageLabel")
	BrandLogo.Name = "BrandLogo"
	BrandLogo.Parent = LeftHeaderContainer
	BrandLogo.Size = UDim2.new(0, 22, 0, 22)
	BrandLogo.BackgroundTransparency = 1
	BrandLogo.Image = PINATHUB_LOGO
	BrandLogo.ImageColor3 = Color3.fromRGB(255, 255, 255)
	BrandLogo.ScaleType = Enum.ScaleType.Fit
	BrandLogo.LayoutOrder = 1

	-- Title "Pinathub" / "Meng Hub"
	local BrandName = Instance.new("TextLabel")
	BrandName.Name = "BrandName"
	BrandName.Parent = LeftHeaderContainer
	BrandName.BackgroundTransparency = 1
	BrandName.Size = UDim2.new(0, 0, 1, 0)
	BrandName.AutomaticSize = Enum.AutomaticSize.X
	BrandName.Font = Enum.Font.GothamBold
	BrandName.Text = Config.Title
	BrandName.TextColor3 = Theme.Text
	BrandName.TextSize = 14
	BrandName.TextXAlignment = Enum.TextXAlignment.Left
	BrandName.LayoutOrder = 2

	-- Separator "|"
	local SepLabel = Instance.new("TextLabel")
	SepLabel.Name = "Sep"
	SepLabel.Parent = LeftHeaderContainer
	SepLabel.BackgroundTransparency = 1
	SepLabel.Size = UDim2.new(0, 8, 1, 0)
	SepLabel.Font = Enum.Font.Gotham
	SepLabel.Text = "|"
	SepLabel.TextColor3 = Theme.TextMuted
	SepLabel.TextSize = 13
	SepLabel.LayoutOrder = 3

	-- Subtitle "Peacefull Community" / "Control Center"
	local SubtitleLabel = Instance.new("TextLabel")
	SubtitleLabel.Name = "Subtitle"
	SubtitleLabel.Parent = LeftHeaderContainer
	SubtitleLabel.BackgroundTransparency = 1
	SubtitleLabel.Size = UDim2.new(0, 0, 1, 0)
	SubtitleLabel.AutomaticSize = Enum.AutomaticSize.X
	SubtitleLabel.Font = Enum.Font.Gotham
	SubtitleLabel.Text = Config.Description
	SubtitleLabel.TextColor3 = Theme.TextSecondary
	SubtitleLabel.TextSize = 11
	SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	SubtitleLabel.LayoutOrder = 4

	-- Right Header Container (Badges + Minimize & Close Buttons)
	local RightHeaderContainer = Instance.new("Frame")
	RightHeaderContainer.Name = "RightBadges"
	RightHeaderContainer.Parent = Header
	RightHeaderContainer.AnchorPoint = Vector2.new(1, 0.5)
	RightHeaderContainer.Position = UDim2.new(1, -10, 0.5, 0)
	RightHeaderContainer.Size = UDim2.new(0, 310, 0, 28)
	RightHeaderContainer.BackgroundTransparency = 1

	local RightLayout = Instance.new("UIListLayout")
	RightLayout.Parent = RightHeaderContainer
	RightLayout.FillDirection = Enum.FillDirection.Horizontal
	RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	RightLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
	RightLayout.Padding = UDim.new(0, 6)

	-- Helper for Pill Badges
	local function CreatePillBadge(text, order)
		local pill = Instance.new("Frame")
		pill.Name = "PillBadge_" .. order
		pill.Parent = RightHeaderContainer
		pill.BackgroundColor3 = Theme.SurfaceActive
		pill.BackgroundTransparency = 0.4
		pill.BorderSizePixel = 0
		pill.Size = UDim2.new(0, 0, 0, 22)
		pill.AutomaticSize = Enum.AutomaticSize.X
		pill.LayoutOrder = order

		local pCorner = Instance.new("UICorner")
		pCorner.CornerRadius = UDim.new(1, 0)
		pCorner.Parent = pill

		local pStroke = Instance.new("UIStroke")
		pStroke.Color = Theme.BorderSoft
		pStroke.Thickness = 1
		pStroke.Parent = pill

		local pPadding = Instance.new("UIPadding")
		pPadding.Parent = pill
		pPadding.PaddingLeft = UDim.new(0, 10)
		pPadding.PaddingRight = UDim.new(0, 10)

		local pText = Instance.new("TextLabel")
		pText.Parent = pill
		pText.BackgroundTransparency = 1
		pText.Size = UDim2.new(0, 0, 1, 0)
		pText.AutomaticSize = Enum.AutomaticSize.X
		pText.Font = Enum.Font.GothamBold
		pText.Text = text
		pText.TextColor3 = Theme.TextSecondary
		pText.TextSize = 10
		pText.TextXAlignment = Enum.TextXAlignment.Center

		return pill, pText
	end

	-- Badge 1: [ VD | Premium ] / [ Pinathub | Premium ]
	CreatePillBadge("VD | Premium", 1)

	-- Badge 2: [ Executor: <Name> ]
	local currentExecutor = DetectExecutor()
	CreatePillBadge("Executor: " .. currentExecutor, 2)

	-- Window Control Buttons (Minimize & Close)
	local function CreateActionBtn(text, callback, isDanger, order)
		local btn = Instance.new("TextButton")
		btn.Name = "Btn_" .. text
		btn.Parent = RightHeaderContainer
		btn.Size = UDim2.new(0, 24, 0, 24)
		btn.BackgroundColor3 = Theme.Surface
		btn.BackgroundTransparency = 1
		btn.BorderSizePixel = 0
		btn.Font = Enum.Font.GothamBold
		btn.Text = text
		btn.TextColor3 = Theme.TextSecondary
		btn.TextSize = 13
		btn.AutoButtonColor = false
		btn.LayoutOrder = order

		local bCorner = Instance.new("UICorner")
		bCorner.CornerRadius = UDim.new(0, 5)
		bCorner.Parent = btn

		btn.MouseEnter:Connect(function()
			if isDanger then
				TweenService:Create(btn, TweenInfoFast, { BackgroundTransparency = 0, BackgroundColor3 = Theme.Danger }):Play()
				btn.TextColor3 = Color3.fromRGB(255, 255, 255)
			else
				TweenService:Create(btn, TweenInfoFast, { BackgroundTransparency = 0.3, BackgroundColor3 = Theme.SurfaceHover }):Play()
				btn.TextColor3 = Theme.Text
			end
		end)

		btn.MouseLeave:Connect(function()
			TweenService:Create(btn, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
			btn.TextColor3 = Theme.TextSecondary
		end)

		btn.MouseButton1Click:Connect(callback)
		return btn
	end

	CreateActionBtn("—", CloseWindow, false, 3)
	CreateActionBtn("✕", CloseWindow, true, 4)

	-- 7. Sidebar Setup (Meng Hub Width: 155px)
	local Sidebar = Instance.new("Frame")
	Sidebar.Name = "Sidebar"
	Sidebar.Parent = MainWindow
	Sidebar.BackgroundColor3 = Theme.Sidebar
	Sidebar.BackgroundTransparency = 0.25
	Sidebar.BorderSizePixel = 0
	Sidebar.Position = UDim2.new(0, 0, 0, 46)
	Sidebar.Size = UDim2.new(0, 155, 1, -46)
	Sidebar.ZIndex = 4

	local SidebarDivider = Instance.new("Frame")
	SidebarDivider.Name = "Divider"
	SidebarDivider.Parent = Sidebar
	SidebarDivider.BackgroundColor3 = Theme.BorderSoft
	SidebarDivider.BorderSizePixel = 0
	SidebarDivider.Position = UDim2.new(1, -1, 0, 0)
	SidebarDivider.Size = UDim2.new(0, 1, 1, 0)

	-- Search Box in Sidebar (Meng Hub Pill Style)
	local SearchFrame = Instance.new("Frame")
	SearchFrame.Name = "SearchFrame"
	SearchFrame.Parent = Sidebar
	SearchFrame.BackgroundColor3 = Theme.Surface
	SearchFrame.BackgroundTransparency = 0.45
	SearchFrame.BorderSizePixel = 0
	SearchFrame.Position = UDim2.new(0, 10, 0, 10)
	SearchFrame.Size = UDim2.new(1, -20, 0, 28)

	local SearchCorner = Instance.new("UICorner")
	SearchCorner.CornerRadius = UDim.new(0, 7)
	SearchCorner.Parent = SearchFrame

	local SearchStroke = Instance.new("UIStroke")
	SearchStroke.Color = Theme.BorderSoft
	SearchStroke.Thickness = 1
	SearchStroke.Parent = SearchFrame

	local SearchIcon = Instance.new("ImageLabel")
	SearchIcon.Name = "Icon"
	SearchIcon.Parent = SearchFrame
	SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
	SearchIcon.Position = UDim2.new(0, 8, 0.5, 0)
	SearchIcon.Size = UDim2.new(0, 13, 0, 13)
	SearchIcon.BackgroundTransparency = 1
	SearchIcon.Image = TabIcons.Search
	SearchIcon.ImageColor3 = Theme.TextMuted
	SearchIcon.ScaleType = Enum.ScaleType.Fit

	local SearchBox = Instance.new("TextBox")
	SearchBox.Name = "SearchBox"
	SearchBox.Parent = SearchFrame
	SearchBox.BackgroundTransparency = 1
	SearchBox.Position = UDim2.new(0, 26, 0, 0)
	SearchBox.Size = UDim2.new(1, -30, 1, 0)
	SearchBox.Font = Enum.Font.Gotham
	SearchBox.PlaceholderColor3 = Theme.TextMuted
	SearchBox.PlaceholderText = "Search..."
	SearchBox.Text = ""
	SearchBox.TextColor3 = Theme.Text
	SearchBox.TextSize = 11
	SearchBox.TextXAlignment = Enum.TextXAlignment.Left
	SearchBox.ClearTextOnFocus = false

	SearchBox.Focused:Connect(function()
		TweenService:Create(SearchStroke, TweenInfoFast, { Color = Theme.Accent, Transparency = 0.2 }):Play()
		TweenService:Create(SearchIcon, TweenInfoFast, { ImageColor3 = Theme.AccentGlow }):Play()
	end)
	SearchBox.FocusLost:Connect(function()
		TweenService:Create(SearchStroke, TweenInfoFast, { Color = Theme.BorderSoft, Transparency = 0 }):Play()
		TweenService:Create(SearchIcon, TweenInfoFast, { ImageColor3 = Theme.TextMuted }):Play()
	end)

	-- Tab List (ScrollingFrame)
	local TabList = Instance.new("ScrollingFrame")
	TabList.Name = "TabList"
	TabList.Parent = Sidebar
	TabList.BackgroundTransparency = 1
	TabList.BorderSizePixel = 0
	TabList.Position = UDim2.new(0, 0, 0, 46)
	TabList.Size = UDim2.new(1, 0, 1, -90) -- Leaves 44px for Profile footer at bottom
	TabList.ScrollBarThickness = 2
	TabList.ScrollBarImageColor3 = Theme.Border
	TabList.CanvasSize = UDim2.new(0, 0, 0, 0)

	local TabPadding = Instance.new("UIPadding")
	TabPadding.Parent = TabList
	TabPadding.PaddingTop = UDim.new(0, 4)
	TabPadding.PaddingBottom = UDim.new(0, 6)
	TabPadding.PaddingLeft = UDim.new(0, 8)
	TabPadding.PaddingRight = UDim.new(0, 8)

	local TabListLayout = Instance.new("UIListLayout")
	TabListLayout.Parent = TabList
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabListLayout.Padding = UDim.new(0, 3)

	self:UpdateScrolling(TabList, TabListLayout)

	-- Bottom User Profile (Meng Hub Feature: Avatar Headshot + "Welcome, <username>")
	local ProfileFooter = Instance.new("Frame")
	ProfileFooter.Name = "ProfileFooter"
	ProfileFooter.Parent = Sidebar
	ProfileFooter.AnchorPoint = Vector2.new(0, 1)
	ProfileFooter.Position = UDim2.new(0, 0, 1, 0)
	ProfileFooter.Size = UDim2.new(1, 0, 0, 44)
	ProfileFooter.BackgroundColor3 = Theme.Sidebar
	ProfileFooter.BackgroundTransparency = 0.1
	ProfileFooter.BorderSizePixel = 0

	local ProfileDivider = Instance.new("Frame")
	ProfileDivider.Name = "Divider"
	ProfileDivider.Parent = ProfileFooter
	ProfileDivider.BackgroundColor3 = Theme.BorderSoft
	ProfileDivider.BorderSizePixel = 0
	ProfileDivider.Position = UDim2.new(0, 10, 0, 0)
	ProfileDivider.Size = UDim2.new(1, -20, 0, 1)

	local AvatarImage = Instance.new("ImageLabel")
	AvatarImage.Name = "Avatar"
	AvatarImage.Parent = ProfileFooter
	AvatarImage.AnchorPoint = Vector2.new(0, 0.5)
	AvatarImage.Position = UDim2.new(0, 10, 0.5, 0)
	AvatarImage.Size = UDim2.new(0, 26, 0, 26)
	AvatarImage.BackgroundColor3 = Theme.Surface
	AvatarImage.BorderSizePixel = 0
	pcall(function()
		AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(LocalPlayer.UserId) .. "&w=48&h=48"
	end)

	local AvatarCorner = Instance.new("UICorner")
	AvatarCorner.CornerRadius = UDim.new(1, 0)
	AvatarCorner.Parent = AvatarImage

	local AvatarStroke = Instance.new("UIStroke")
	AvatarStroke.Color = Theme.BorderSoft
	AvatarStroke.Thickness = 1
	AvatarStroke.Parent = AvatarImage

	local WelcomeText = Instance.new("TextLabel")
	WelcomeText.Name = "Welcome"
	WelcomeText.Parent = ProfileFooter
	WelcomeText.BackgroundTransparency = 1
	WelcomeText.Position = UDim2.new(0, 42, 0, 0)
	WelcomeText.Size = UDim2.new(1, -48, 1, 0)
	WelcomeText.Font = Enum.Font.GothamBold
	local displayName = LocalPlayer and (LocalPlayer.DisplayName or LocalPlayer.Name) or "Player"
	WelcomeText.Text = "Welcome, " .. displayName
	WelcomeText.TextColor3 = Theme.TextSecondary
	WelcomeText.TextSize = 11
	WelcomeText.TextTruncate = Enum.TextTruncate.AtEnd
	WelcomeText.TextXAlignment = Enum.TextXAlignment.Left

	-- 8. Content Area
	local Content = Instance.new("Frame")
	Content.Name = "Content"
	Content.Parent = MainWindow
	Content.BackgroundTransparency = 1
	Content.BorderSizePixel = 0
	Content.Position = UDim2.new(0, 155, 0, 46)
	Content.Size = UDim2.new(1, -155, 1, -46)
	Content.ZIndex = 4

	local PageContainer = Instance.new("Frame")
	PageContainer.Name = "PageContainer"
	PageContainer.Parent = Content
	PageContainer.BackgroundTransparency = 1
	PageContainer.Position = UDim2.new(0, 0, 0, 0)
	PageContainer.Size = UDim2.fromScale(1, 1)
	PageContainer.ClipsDescendants = true

	local UIPageLayout = Instance.new("UIPageLayout")
	UIPageLayout.Parent = PageContainer
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIPageLayout.EasingStyle = Enum.EasingStyle.Quart
	UIPageLayout.EasingDirection = Enum.EasingDirection.Out
	UIPageLayout.TweenTime = 0.22

	-- 9. Right Popout Drawer for Dropdown (Meng Hub Screenshot 2 Style)
	local PopoutDrawer = Instance.new("Frame")
	PopoutDrawer.Name = "PopoutDrawer"
	PopoutDrawer.Parent = MainWindow
	PopoutDrawer.AnchorPoint = Vector2.new(1, 0)
	PopoutDrawer.Position = UDim2.new(1, 0, 0, 46)
	PopoutDrawer.Size = UDim2.new(0, 190, 1, -46)
	PopoutDrawer.BackgroundColor3 = Theme.Header
	PopoutDrawer.BackgroundTransparency = 0.05
	PopoutDrawer.BorderSizePixel = 0
	PopoutDrawer.Visible = false
	PopoutDrawer.ZIndex = 30

	local PopoutStroke = Instance.new("UIStroke")
	PopoutStroke.Color = Theme.Accent
	PopoutStroke.Thickness = 1.2
	PopoutStroke.Parent = PopoutDrawer

	local PopoutSearchFrame = Instance.new("Frame")
	PopoutSearchFrame.Name = "Search"
	PopoutSearchFrame.Parent = PopoutDrawer
	PopoutSearchFrame.Position = UDim2.new(0, 10, 0, 10)
	PopoutSearchFrame.Size = UDim2.new(1, -20, 0, 28)
	PopoutSearchFrame.BackgroundColor3 = Theme.Surface
	PopoutSearchFrame.BorderSizePixel = 0

	local PopoutSCorner = Instance.new("UICorner")
	PopoutSCorner.CornerRadius = UDim.new(0, 6)
	PopoutSCorner.Parent = PopoutSearchFrame

	local PopoutSBox = Instance.new("TextBox")
	PopoutSBox.Parent = PopoutSearchFrame
	PopoutSBox.BackgroundTransparency = 1
	PopoutSBox.Position = UDim2.new(0, 8, 0, 0)
	PopoutSBox.Size = UDim2.new(1, -16, 1, 0)
	PopoutSBox.Font = Enum.Font.Gotham
	PopoutSBox.PlaceholderColor3 = Theme.TextMuted
	PopoutSBox.PlaceholderText = "Search..."
	PopoutSBox.Text = ""
	PopoutSBox.TextColor3 = Theme.Text
	PopoutSBox.TextSize = 11
	PopoutSBox.TextXAlignment = Enum.TextXAlignment.Left

	local PopoutScroll = Instance.new("ScrollingFrame")
	PopoutScroll.Name = "Options"
	PopoutScroll.Parent = PopoutDrawer
	PopoutScroll.BackgroundTransparency = 1
	PopoutScroll.Position = UDim2.new(0, 8, 0, 44)
	PopoutScroll.Size = UDim2.new(1, -16, 1, -50)
	PopoutScroll.ScrollBarThickness = 2
	PopoutScroll.ScrollBarImageColor3 = Theme.Border
	PopoutScroll.BorderSizePixel = 0

	local PopoutLayout = Instance.new("UIListLayout")
	PopoutLayout.Parent = PopoutScroll
	PopoutLayout.SortOrder = Enum.SortOrder.LayoutOrder
	PopoutLayout.Padding = UDim.new(0, 4)

	self:UpdateScrolling(PopoutScroll, PopoutLayout)

	-- 10. Tab System & Tab Creation Implementation
	local TabCount = 0
	local TabsCollection = {}
	local ActiveTabIndex = 1

	SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
		local query = string.lower(SearchBox.Text):match("^%s*(.-)%s*$")
		for _, tabData in ipairs(TabsCollection) do
			if tabData.Sections then
				for _, sec in ipairs(tabData.Sections) do
					local secMatch = (query == "") or (string.find(string.lower(sec.Title), query) ~= nil)
					local anyChildMatch = false
					for _, elem in ipairs(sec.Elements) do
						local match = (query == "") or (string.find(string.lower(elem.Title), query) ~= nil)
						elem.Frame.Visible = match
						if match then anyChildMatch = true end
					end
					sec.Frame.Visible = (query == "") or secMatch or anyChildMatch
				end
			end
		end
	end)

	local Window = {}

	function Window:SetToggleKey(keyCode)
		if typeof(keyCode) == "EnumItem" then
			Config.ToggleKey = keyCode
		end
	end

	function Window:ToggleTransparency(disabled)
		MainWindow.BackgroundTransparency = disabled and 0 or 0.08
		glassSheen.Visible = not disabled
	end

	function Window:Destroy()
		ScreenGui:Destroy()
	end

	function Window:Open()
		OpenWindow()
	end

	function Window:Close()
		CloseWindow()
	end

	-- Hotkey Listener for Toggle Key
	Config.ToggleKey = Config.ToggleKey or Enum.KeyCode.RightShift
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Config.ToggleKey then
			if isWindowOpen then
				CloseWindow()
			else
				OpenWindow()
			end
		end
	end)

	-- TAB CREATION (Window:T / Window:Tab / Window:NewTab)
	-- Supports both table style ({Title, Icon, Desc}) and positional args (title, icon, desc)
	function Window:T(tabTitle, tabIcon, tabDesc)
		local currentOrder = TabCount
		TabCount = TabCount + 1

		local title, icon, descText
		if type(tabTitle) == "table" then
			title = tostring(tabTitle.Title or tabTitle.Name or ("Tab " .. TabCount))
			icon = tabTitle.Icon
			descText = tabTitle.Desc or tabTitle.Description or title
		else
			title = tostring(tabTitle or ("Tab " .. TabCount))
			icon = tabIcon
			descText = tabDesc or title
		end
		icon = icon or TabIcons[title] or TabIcons.Main
		descText = descText or title

		-- Tab Button in Sidebar (Meng Hub: Left Accent Indicator Bar on Active)
		local TabBtn = Instance.new("TextButton")
		TabBtn.Name = "TabBtn_" .. title
		TabBtn.Parent = TabList
		TabBtn.BackgroundColor3 = Theme.SurfaceHover
		TabBtn.BackgroundTransparency = 1
		TabBtn.BorderSizePixel = 0
		TabBtn.Size = UDim2.new(1, 0, 0, 32)
		TabBtn.AutoButtonColor = false
		TabBtn.LayoutOrder = currentOrder
		TabBtn.Text = ""

		local TabBtnCorner = Instance.new("UICorner")
		TabBtnCorner.CornerRadius = UDim.new(0, 6)
		TabBtnCorner.Parent = TabBtn

		-- Meng Hub Left Accent Indicator Bar
		local ActiveIndicator = Instance.new("Frame")
		ActiveIndicator.Name = "ActiveIndicator"
		ActiveIndicator.Parent = TabBtn
		ActiveIndicator.AnchorPoint = Vector2.new(0, 0.5)
		ActiveIndicator.Position = UDim2.new(0, 2, 0.5, 0)
		ActiveIndicator.Size = UDim2.new(0, 3, 0.62, 0)
		ActiveIndicator.BackgroundColor3 = Theme.Accent
		ActiveIndicator.BorderSizePixel = 0
		ActiveIndicator.Visible = false

		local IndCorner = Instance.new("UICorner")
		IndCorner.CornerRadius = UDim.new(1, 0)
		IndCorner.Parent = ActiveIndicator

		local IconImage = Instance.new("ImageLabel")
		IconImage.Name = "Icon"
		IconImage.Parent = TabBtn
		IconImage.AnchorPoint = Vector2.new(0, 0.5)
		IconImage.Position = UDim2.new(0, 10, 0.5, 0)
		IconImage.Size = UDim2.new(0, 15, 0, 15)
		IconImage.BackgroundTransparency = 1
		IconImage.Image = icon
		IconImage.ImageColor3 = Theme.TextMuted
		IconImage.ScaleType = Enum.ScaleType.Fit

		local TabLabel = Instance.new("TextLabel")
		TabLabel.Name = "Label"
		TabLabel.Parent = TabBtn
		TabLabel.BackgroundTransparency = 1
		TabLabel.Position = UDim2.new(0, 32, 0, 0)
		TabLabel.Size = UDim2.new(1, -36, 1, 0)
		TabLabel.Font = Enum.Font.Gotham
		TabLabel.Text = title
		TabLabel.TextColor3 = Theme.TextSecondary
		TabLabel.TextSize = 12
		TabLabel.TextXAlignment = Enum.TextXAlignment.Left

		local Page = Instance.new("ScrollingFrame")
		Page.Name = "Page_" .. title
		Page.Parent = PageContainer
		Page.BackgroundTransparency = 1
		Page.BorderSizePixel = 0
		Page.Size = UDim2.fromScale(1, 1)
		Page.ScrollBarThickness = 2
		Page.ScrollBarImageColor3 = Theme.Border
		Page.LayoutOrder = currentOrder

		local PagePadding = Instance.new("UIPadding")
		PagePadding.Parent = Page
		PagePadding.PaddingTop = UDim.new(0, 10)
		PagePadding.PaddingBottom = UDim.new(0, 16)
		PagePadding.PaddingLeft = UDim.new(0, 14)
		PagePadding.PaddingRight = UDim.new(0, 14)

		local PageListLayout = Instance.new("UIListLayout")
		PageListLayout.Parent = Page
		PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		PageListLayout.Padding = UDim.new(0, 10)

		Library:UpdateScrolling(Page, PageListLayout)

		local tabData = {
			Title = title,
			Description = descText,
			Button = TabBtn,
			Page = Page,
			Order = currentOrder,
			Sections = {}
		}
		table.insert(TabsCollection, tabData)

		local function SelectThisTab()
			ActiveTabIndex = currentOrder + 1
			UIPageLayout:JumpToIndex(currentOrder)

			for _, t in ipairs(TabsCollection) do
				local isActive = (t.Order == currentOrder)
				t.Button.ActiveIndicator.Visible = isActive
				if isActive then
					TweenService:Create(t.Button, TweenInfoFast, { BackgroundTransparency = 0.25 }):Play()
					TweenService:Create(t.Button.Icon, TweenInfoFast, { ImageColor3 = Theme.NeonWhite }):Play()
					t.Button.Label.Font = Enum.Font.GothamBold
					TweenService:Create(t.Button.Label, TweenInfoFast, { TextColor3 = Theme.Text }):Play()
				else
					TweenService:Create(t.Button, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
					TweenService:Create(t.Button.Icon, TweenInfoFast, { ImageColor3 = Theme.TextMuted }):Play()
					t.Button.Label.Font = Enum.Font.Gotham
					TweenService:Create(t.Button.Label, TweenInfoFast, { TextColor3 = Theme.TextSecondary }):Play()
				end
			end
		end
		tabData.SelectFn = SelectThisTab

		TabBtn.MouseEnter:Connect(function()
			if ActiveTabIndex ~= (currentOrder + 1) then
				TweenService:Create(TabBtn, TweenInfoFast, { BackgroundTransparency = 0.55 }):Play()
				TweenService:Create(IconImage, TweenInfoFast, { ImageColor3 = Theme.NeonGray }):Play()
			end
		end)

		TabBtn.MouseLeave:Connect(function()
			if ActiveTabIndex ~= (currentOrder + 1) then
				TweenService:Create(TabBtn, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
				TweenService:Create(IconImage, TweenInfoFast, { ImageColor3 = Theme.TextMuted }):Play()
			end
		end)

		TabBtn.MouseButton1Click:Connect(SelectThisTab)

		if currentOrder == 0 then
			task.defer(SelectThisTab)
		end

		-- ==============================================================================
		-- 11. SECTION CREATION (Meng Hub Style: Accent Title + Right Chevron)
		-- ==============================================================================
		local TabObj = {}

		function TabObj:AddSection(sectionNameOrConfig)
			local secTitle = "Section"
			if type(sectionNameOrConfig) == "table" then
				secTitle = sectionNameOrConfig.Title or sectionNameOrConfig.Name or secTitle
			else
				secTitle = tostring(sectionNameOrConfig or "Section")
			end

			local SectionCard = Instance.new("Frame")
			SectionCard.Name = "Section_" .. secTitle
			SectionCard.Parent = Page
			SectionCard.BackgroundColor3 = Theme.Surface
			SectionCard.BackgroundTransparency = 0.4
			SectionCard.BorderSizePixel = 0
			SectionCard.Size = UDim2.new(1, 0, 0, 36)
			SectionCard.ClipsDescendants = true

			local SecCorner = Instance.new("UICorner")
			SecCorner.CornerRadius = UDim.new(0, 8)
			SecCorner.Parent = SectionCard

			local SecStroke = Instance.new("UIStroke")
			SecStroke.Color = Theme.BorderSoft
			SecStroke.Thickness = 1
			SecStroke.Parent = SectionCard

			-- Section Header (Meng Hub: Bold Purple Title + Right Chevron Down "v")
			local SecHeader = Instance.new("TextButton")
			SecHeader.Name = "Header"
			SecHeader.Parent = SectionCard
			SecHeader.BackgroundTransparency = 1
			SecHeader.Size = UDim2.new(1, 0, 0, 34)
			SecHeader.AutoButtonColor = false
			SecHeader.Text = ""

			local SecTitleLabel = Instance.new("TextLabel")
			SecTitleLabel.Name = "Title"
			SecTitleLabel.Parent = SecHeader
			SecTitleLabel.BackgroundTransparency = 1
			SecTitleLabel.Position = UDim2.new(0, 12, 0, 0)
			SecTitleLabel.Size = UDim2.new(1, -40, 1, 0)
			SecTitleLabel.Font = Enum.Font.GothamBold
			SecTitleLabel.Text = secTitle
			SecTitleLabel.TextColor3 = Theme.AccentGlow -- Meng Hub Purple Accent Title
			SecTitleLabel.TextSize = 13
			SecTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			-- Chevron Arrow "v"
			local Chevron = Instance.new("ImageLabel")
			Chevron.Name = "Chevron"
			Chevron.Parent = SecHeader
			Chevron.AnchorPoint = Vector2.new(1, 0.5)
			Chevron.Position = UDim2.new(1, -12, 0.5, 0)
			Chevron.Size = UDim2.new(0, 14, 0, 14)
			Chevron.BackgroundTransparency = 1
			Chevron.Image = TabIcons.ChevronRight
			Chevron.Rotation = 90
			Chevron.ImageColor3 = Theme.TextSecondary
			Chevron.ScaleType = Enum.ScaleType.Fit

			local ControlsContainer = Instance.new("Frame")
			ControlsContainer.Name = "Controls"
			ControlsContainer.Parent = SectionCard
			ControlsContainer.BackgroundTransparency = 1
			ControlsContainer.Position = UDim2.new(0, 0, 0, 36)
			ControlsContainer.Size = UDim2.new(1, 0, 0, 0)

			local ControlsPadding = Instance.new("UIPadding")
			ControlsPadding.Parent = ControlsContainer
			ControlsPadding.PaddingTop = UDim.new(0, 2)
			ControlsPadding.PaddingBottom = UDim.new(0, 8)
			ControlsPadding.PaddingLeft = UDim.new(0, 8)
			ControlsPadding.PaddingRight = UDim.new(0, 8)

			local ControlsLayout = Instance.new("UIListLayout")
			ControlsLayout.Parent = ControlsContainer
			ControlsLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ControlsLayout.Padding = UDim.new(0, 5)

			local isCollapsed = false
			local function UpdateSectionSize()
				if not isCollapsed then
					SectionCard.Size = UDim2.new(1, 0, 0, ControlsLayout.AbsoluteContentSize.Y + 44)
				end
			end
			ControlsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateSectionSize)

			-- Collapsible toggle
			SecHeader.MouseButton1Click:Connect(function()
				isCollapsed = not isCollapsed
				if isCollapsed then
					TweenService:Create(Chevron, TweenInfoFast, { Rotation = 0 }):Play()
					TweenService:Create(SectionCard, TweenInfoFast, { Size = UDim2.new(1, 0, 0, 34) }):Play()
				else
					TweenService:Create(Chevron, TweenInfoFast, { Rotation = 90 }):Play()
					TweenService:Create(SectionCard, TweenInfoFast, { Size = UDim2.new(1, 0, 0, ControlsLayout.AbsoluteContentSize.Y + 44) }):Play()
				end
			end)

			local secData = {
				Title = secTitle,
				Frame = SectionCard,
				Elements = {}
			}
			table.insert(tabData.Sections, secData)

			-- ==============================================================================
			-- 12. SECTION CONTROLS (MENG HUB MODERN DESIGN)
			-- ==============================================================================
			local SecObj = {}

			-- 12.1 TOGGLE SWITCH (Meng Hub Style: Optional Inline Keybind [None] + Elastic Switch)
			function SecObj:AddToggle(toggleConfig)
				local cfg = Library:MakeConfig({
					Title = "Toggle",
					Description = "",
					Default = false,
					Keybind = nil, -- Optional KeyCode or nil
					HasKeybind = false,
					Callback = function() end
				}, toggleConfig or {})

				if cfg.Desc and cfg.Description == "" then cfg.Description = cfg.Desc end
				if cfg.Value ~= nil and toggleConfig.Default == nil then cfg.Default = cfg.Value end
				local hasBind = (cfg.Keybind ~= nil) or cfg.HasKeybind or (cfg.Bind ~= nil)

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "Toggle_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.55
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, (cfg.Description ~= "") and 44 or 36)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 7)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, (cfg.Description ~= "") and 5 or 0)
				TitleLabel.Size = UDim2.new(1, -125, (cfg.Description ~= "") and 0 or 1, (cfg.Description ~= "") and 16 or 0)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				if cfg.Description ~= "" then
					local DescLabel = Instance.new("TextLabel")
					DescLabel.Name = "Desc"
					DescLabel.Parent = ItemFrame
					DescLabel.BackgroundTransparency = 1
					DescLabel.Position = UDim2.new(0, 10, 0, 22)
					DescLabel.Size = UDim2.new(1, -125, 0, 16)
					DescLabel.Font = Enum.Font.Gotham
					DescLabel.Text = cfg.Description
					DescLabel.TextColor3 = Theme.TextMuted
					DescLabel.TextSize = 10
					DescLabel.TextXAlignment = Enum.TextXAlignment.Left
				end

				-- Right Controls (Keybind badge + Switch)
				local RightControls = Instance.new("Frame")
				RightControls.Name = "RightControls"
				RightControls.Parent = ItemFrame
				RightControls.AnchorPoint = Vector2.new(1, 0.5)
				RightControls.Position = UDim2.new(1, -10, 0.5, 0)
				RightControls.Size = UDim2.new(0, 110, 0, 24)
				RightControls.BackgroundTransparency = 1

				local RCLayout = Instance.new("UIListLayout")
				RCLayout.Parent = RightControls
				RCLayout.FillDirection = Enum.FillDirection.Horizontal
				RCLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				RCLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				RCLayout.SortOrder = Enum.SortOrder.LayoutOrder
				RCLayout.Padding = UDim.new(0, 8)

				-- Keybind Pill [None] (Meng Hub Screenshot 1)
				local currentBind = cfg.Keybind or cfg.Bind
				local KeybindBtn = nil

				if hasBind or currentBind then
					KeybindBtn = Instance.new("TextButton")
					KeybindBtn.Name = "Keybind"
					KeybindBtn.Parent = RightControls
					KeybindBtn.Size = UDim2.new(0, 48, 0, 20)
					KeybindBtn.BackgroundColor3 = Theme.SurfaceActive
					KeybindBtn.BackgroundTransparency = 0.5
					KeybindBtn.BorderSizePixel = 0
					KeybindBtn.Font = Enum.Font.GothamBold
					KeybindBtn.Text = currentBind and ("[" .. currentBind.Name .. "]") or "[None]"
					KeybindBtn.TextColor3 = Theme.TextMuted
					KeybindBtn.TextSize = 10
					KeybindBtn.LayoutOrder = 1

					local KCorner = Instance.new("UICorner")
					KCorner.CornerRadius = UDim.new(0, 4)
					KCorner.Parent = KeybindBtn

					local KStroke = Instance.new("UIStroke")
					KStroke.Color = Theme.BorderSoft
					KStroke.Thickness = 1
					KStroke.Parent = KeybindBtn

					local listening = false
					KeybindBtn.MouseButton1Click:Connect(function()
						if listening then return end
						listening = true
						KeybindBtn.Text = "[...]"
						KeybindBtn.TextColor3 = Theme.AccentGlow

						local conn
						conn = UserInputService.InputBegan:Connect(function(inp)
							if inp.UserInputType == Enum.UserInputType.Keyboard then
								listening = false
								if inp.KeyCode == Enum.KeyCode.Backspace or inp.KeyCode == Enum.KeyCode.Escape then
									currentBind = nil
									KeybindBtn.Text = "[None]"
									KeybindBtn.TextColor3 = Theme.TextMuted
								else
									currentBind = inp.KeyCode
									KeybindBtn.Text = "[" .. inp.KeyCode.Name .. "]"
									KeybindBtn.TextColor3 = Theme.TextSecondary
								end
								conn:Disconnect()
							end
						end)
					end)
				end

				-- Sliding Switch Track
				local SwitchTrack = Instance.new("TextButton")
				SwitchTrack.Name = "SwitchTrack"
				SwitchTrack.Parent = RightControls
				SwitchTrack.Size = UDim2.new(0, 38, 0, 20)
				SwitchTrack.BackgroundColor3 = Theme.SurfaceActive
				SwitchTrack.BorderSizePixel = 0
				SwitchTrack.Text = ""
				SwitchTrack.AutoButtonColor = false
				SwitchTrack.LayoutOrder = 2

				local TrackCorner = Instance.new("UICorner")
				TrackCorner.CornerRadius = UDim.new(1, 0)
				TrackCorner.Parent = SwitchTrack

				local TrackStroke = Instance.new("UIStroke")
				TrackStroke.Color = Theme.BorderSoft
				TrackStroke.Thickness = 1
				TrackStroke.Parent = SwitchTrack

				local SwitchKnob = Instance.new("Frame")
				SwitchKnob.Name = "Knob"
				SwitchKnob.Parent = SwitchTrack
				SwitchKnob.AnchorPoint = Vector2.new(0, 0.5)
				SwitchKnob.Position = UDim2.new(0, 2, 0.5, 0)
				SwitchKnob.Size = UDim2.new(0, 16, 0, 16)
				SwitchKnob.BackgroundColor3 = Theme.TextMuted
				SwitchKnob.BorderSizePixel = 0

				local KnobCorner = Instance.new("UICorner")
				KnobCorner.CornerRadius = UDim.new(1, 0)
				KnobCorner.Parent = SwitchKnob

				local ToggleState = { Value = cfg.Default }

				local function AnimateToggle(state)
					if state then
						TweenService:Create(SwitchTrack, TweenInfoFast, { BackgroundColor3 = Theme.Accent }):Play()
						TweenService:Create(TrackStroke, TweenInfoFast, { Color = Theme.AccentGlow }):Play()
						TweenService:Create(SwitchKnob, TweenInfoSpring, {
							Position = UDim2.new(1, -18, 0.5, 0),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						}):Play()
					else
						TweenService:Create(SwitchTrack, TweenInfoFast, { BackgroundColor3 = Theme.SurfaceActive }):Play()
						TweenService:Create(TrackStroke, TweenInfoFast, { Color = Theme.BorderSoft }):Play()
						TweenService:Create(SwitchKnob, TweenInfoSpring, {
							Position = UDim2.new(0, 2, 0.5, 0),
							BackgroundColor3 = Theme.TextMuted
						}):Play()
					end
				end

				function ToggleState:Set(newValue)
					self.Value = not not newValue
					AnimateToggle(self.Value)
					pcall(cfg.Callback, self.Value)
				end

				SwitchTrack.MouseButton1Click:Connect(function()
					ToggleState:Set(not ToggleState.Value)
				end)

				-- Listen for hotkey
				UserInputService.InputBegan:Connect(function(input, gpe)
					if not gpe and currentBind and input.KeyCode == currentBind then
						ToggleState:Set(not ToggleState.Value)
					end
				end)

				if cfg.Default then AnimateToggle(true) end
				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return ToggleState
			end

			-- 12.2 ACTION BUTTON (Meng Hub Style: Clean Row with optional Right Icon)
			function SecObj:AddButton(btnConfig)
				local cfg = Library:MakeConfig({
					Title = "Button",
					Description = "",
					Icon = nil,
					Callback = function() end
				}, btnConfig or {})

				if cfg.Desc and cfg.Description == "" then cfg.Description = cfg.Desc end

				local BtnFrame = Instance.new("TextButton")
				BtnFrame.Name = "Button_" .. cfg.Title
				BtnFrame.Parent = ControlsContainer
				BtnFrame.BackgroundColor3 = Theme.SurfaceHover
				BtnFrame.BackgroundTransparency = 0.55
				BtnFrame.BorderSizePixel = 0
				BtnFrame.Size = UDim2.new(1, 0, 0, (cfg.Description ~= "") and 44 or 34)
				BtnFrame.AutoButtonColor = false
				BtnFrame.Text = ""

				local BtnCorner = Instance.new("UICorner")
				BtnCorner.CornerRadius = UDim.new(0, 7)
				BtnCorner.Parent = BtnFrame

				local BtnStroke = Instance.new("UIStroke")
				BtnStroke.Color = Theme.BorderSoft
				BtnStroke.Thickness = 1
				BtnStroke.Transparency = 0.4
				BtnStroke.Parent = BtnFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = BtnFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, (cfg.Description ~= "") and 5 or 0)
				TitleLabel.Size = UDim2.new(1, -40, (cfg.Description ~= "") and 0 or 1, (cfg.Description ~= "") and 16 or 0)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				if cfg.Description ~= "" then
					local DescLabel = Instance.new("TextLabel")
					DescLabel.Name = "Desc"
					DescLabel.Parent = BtnFrame
					DescLabel.BackgroundTransparency = 1
					DescLabel.Position = UDim2.new(0, 10, 0, 22)
					DescLabel.Size = UDim2.new(1, -40, 0, 16)
					DescLabel.Font = Enum.Font.Gotham
					DescLabel.Text = cfg.Description
					DescLabel.TextColor3 = Theme.TextMuted
					DescLabel.TextSize = 10
					DescLabel.TextXAlignment = Enum.TextXAlignment.Left
				end

				local ActionIcon = Instance.new("ImageLabel")
				ActionIcon.Name = "ActionIcon"
				ActionIcon.Parent = BtnFrame
				ActionIcon.AnchorPoint = Vector2.new(1, 0.5)
				ActionIcon.Position = UDim2.new(1, -10, 0.5, 0)
				ActionIcon.Size = UDim2.new(0, 15, 0, 15)
				ActionIcon.BackgroundTransparency = 1
				ActionIcon.Image = cfg.Icon or TabIcons.Cursor
				ActionIcon.ImageColor3 = Theme.TextMuted
				ActionIcon.ScaleType = Enum.ScaleType.Fit

				BtnFrame.MouseEnter:Connect(function()
					TweenService:Create(BtnFrame, TweenInfoFast, { BackgroundTransparency = 0.25 }):Play()
					TweenService:Create(BtnStroke, TweenInfoFast, { Color = Theme.AccentGlow }):Play()
					TweenService:Create(ActionIcon, TweenInfoFast, { ImageColor3 = Theme.AccentGlow }):Play()
				end)

				BtnFrame.MouseLeave:Connect(function()
					TweenService:Create(BtnFrame, TweenInfoFast, { BackgroundTransparency = 0.55 }):Play()
					TweenService:Create(BtnStroke, TweenInfoFast, { Color = Theme.BorderSoft }):Play()
					TweenService:Create(ActionIcon, TweenInfoFast, { ImageColor3 = Theme.TextMuted }):Play()
				end)

				BtnFrame.MouseButton1Click:Connect(function()
					local pulse = TweenService:Create(BtnFrame, TweenInfoFast, { BackgroundColor3 = Theme.SurfaceActive })
					pulse:Play()
					pulse.Completed:Connect(function()
						TweenService:Create(BtnFrame, TweenInfoFast, { BackgroundColor3 = Theme.SurfaceHover }):Play()
					end)
					pcall(cfg.Callback)
				end)

				table.insert(secData.Elements, { Title = cfg.Title, Frame = BtnFrame })
				return BtnFrame
			end

			-- 12.3 RICH PARAGRAPH (Meng Hub Screenshot 3: Multi-line description card)
			function SecObj:AddParagraph(paraConfig)
				local cfg = Library:MakeConfig({
					Title = "Information",
					Content = ""
				}, paraConfig or {})

				if cfg.Desc and cfg.Content == "" then cfg.Content = cfg.Desc end
				if cfg.Description and cfg.Content == "" then cfg.Content = cfg.Description end

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "Para_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.65
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 50)
				ItemFrame.ClipsDescendants = true

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 8)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.5
				ItemStroke.Parent = ItemFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 12, 0, 8)
				TitleLabel.Size = UDim2.new(1, -24, 0, 16)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.NeonWhite
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local ContentLabel = Instance.new("TextLabel")
				ContentLabel.Name = "Content"
				ContentLabel.Parent = ItemFrame
				ContentLabel.BackgroundTransparency = 1
				ContentLabel.Position = UDim2.new(0, 12, 0, 26)
				ContentLabel.Size = UDim2.new(1, -24, 0, 20)
				ContentLabel.Font = Enum.Font.Gotham
				ContentLabel.Text = cfg.Content
				ContentLabel.TextColor3 = Theme.TextSecondary
				ContentLabel.TextSize = 11
				ContentLabel.TextWrapped = true
				ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
				ContentLabel.TextYAlignment = Enum.TextYAlignment.Top

				local function ResizePara()
					ContentLabel.Size = UDim2.new(1, -24, 0, 1000)
					local textHeight = ContentLabel.TextBounds.Y
					ContentLabel.Size = UDim2.new(1, -24, 0, textHeight)
					ItemFrame.Size = UDim2.new(1, 0, 0, textHeight + 36)
				end

				ContentLabel:GetPropertyChangedSignal("TextBounds"):Connect(ResizePara)
				task.defer(ResizePara)

				local ParaObj = {}
				function ParaObj:SetTitle(newTitle)
					TitleLabel.Text = tostring(newTitle)
				end
				function ParaObj:SetDesc(newDesc)
					ContentLabel.Text = tostring(newDesc)
					ResizePara()
				end
				function ParaObj:SetContent(newDesc)
					ContentLabel.Text = tostring(newDesc)
					ResizePara()
				end
				function ParaObj:Set(arg1, arg2)
					if arg2 ~= nil then
						TitleLabel.Text = tostring(arg1)
						ContentLabel.Text = tostring(arg2)
					else
						ContentLabel.Text = tostring(arg1)
					end
					ResizePara()
				end

				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return ParaObj
			end

			-- 12.4 DISCORD / COMMUNITY CARD (Meng Hub Screenshot 3: Discord card with stats & COPY LINK)
			function SecObj:AddDiscordCard(discordConfig)
				local cfg = Library:MakeConfig({
					Title = "Pinathub | Peacefull Community",
					Members = "30522",
					Online = "2309",
					Invite = "https://discord.gg/pinathub",
					Callback = function() end
				}, discordConfig or {})

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "DiscordCard"
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.6
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 86)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 8)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				-- Logo on left
				local Logo = Instance.new("ImageLabel")
				Logo.Name = "Logo"
				Logo.Parent = ItemFrame
				Logo.Position = UDim2.new(0, 12, 0, 12)
				Logo.Size = UDim2.new(0, 28, 0, 28)
				Logo.BackgroundTransparency = 1
				Logo.Image = PINATHUB_LOGO
				Logo.ImageColor3 = Theme.AccentGlow
				Logo.ScaleType = Enum.ScaleType.Fit

				-- Title
				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 48, 0, 10)
				TitleLabel.Size = UDim2.new(1, -56, 0, 16)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				-- Members & Online text
				local SubtitleLabel = Instance.new("TextLabel")
				SubtitleLabel.Name = "Subtitle"
				SubtitleLabel.Parent = ItemFrame
				SubtitleLabel.BackgroundTransparency = 1
				SubtitleLabel.Position = UDim2.new(0, 48, 0, 26)
				SubtitleLabel.Size = UDim2.new(1, -56, 0, 14)
				SubtitleLabel.Font = Enum.Font.Gotham
				SubtitleLabel.RichText = true
				SubtitleLabel.Text = string.format("Members: %s • <font color='#4ade80'>Online: %s</font>", cfg.Members, cfg.Online)
				SubtitleLabel.TextColor3 = Theme.TextMuted
				SubtitleLabel.TextSize = 10
				SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				-- "COPY LINK" Button (Screenshot 3)
				local CopyBtn = Instance.new("TextButton")
				CopyBtn.Name = "CopyBtn"
				CopyBtn.Parent = ItemFrame
				CopyBtn.Position = UDim2.new(0, 12, 0, 48)
				CopyBtn.Size = UDim2.new(1, -24, 0, 26)
				CopyBtn.BackgroundColor3 = Theme.SurfaceActive
				CopyBtn.BackgroundTransparency = 0.3
				CopyBtn.BorderSizePixel = 0
				CopyBtn.Font = Enum.Font.GothamBold
				CopyBtn.Text = "COPY LINK"
				CopyBtn.TextColor3 = Theme.TextSecondary
				CopyBtn.TextSize = 10

				local CBCorner = Instance.new("UICorner")
				CBCorner.CornerRadius = UDim.new(0, 5)
				CBCorner.Parent = CopyBtn

				local CBStroke = Instance.new("UIStroke")
				CBStroke.Color = Theme.BorderSoft
				CBStroke.Thickness = 1
				CBStroke.Parent = CopyBtn

				CopyBtn.MouseEnter:Connect(function()
					TweenService:Create(CopyBtn, TweenInfoFast, { BackgroundTransparency = 0, TextColor3 = Theme.Text }):Play()
				end)
				CopyBtn.MouseLeave:Connect(function()
					TweenService:Create(CopyBtn, TweenInfoFast, { BackgroundTransparency = 0.3, TextColor3 = Theme.TextSecondary }):Play()
				end)

				CopyBtn.MouseButton1Click:Connect(function()
					if setclipboard then
						setclipboard(cfg.Invite)
					end
					Library:Notify({
						Title = "Invite Copied",
						Content = "Link copied to your clipboard!",
						Type = "Success",
						Duration = 2.5
					})
					pcall(cfg.Callback, cfg.Invite)
				end)

				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return ItemFrame
			end

			-- 12.5 SLIDER (Modern Slider Row)
			function SecObj:AddSlider(sliderConfig)
				local cfg = Library:MakeConfig({
					Title = "Slider",
					Description = "",
					Min = 0,
					Max = 100,
					Increment = 1,
					Default = 50,
					Callback = function() end
				}, sliderConfig or {})

				if cfg.Desc and cfg.Description == "" then cfg.Description = cfg.Desc end

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "Slider_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.55
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 48)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 7)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, 6)
				TitleLabel.Size = UDim2.new(1, -70, 0, 16)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local ValueInput = Instance.new("TextBox")
				ValueInput.Name = "Value"
				ValueInput.Parent = ItemFrame
				ValueInput.AnchorPoint = Vector2.new(1, 0)
				ValueInput.Position = UDim2.new(1, -10, 0, 6)
				ValueInput.Size = UDim2.new(0, 50, 0, 16)
				ValueInput.BackgroundTransparency = 1
				ValueInput.Font = Enum.Font.GothamBold
				ValueInput.Text = tostring(cfg.Default)
				ValueInput.TextColor3 = Theme.AccentGlow
				ValueInput.TextSize = 11
				ValueInput.TextXAlignment = Enum.TextXAlignment.Right

				local SliderRail = Instance.new("Frame")
				SliderRail.Name = "Rail"
				SliderRail.Parent = ItemFrame
				SliderRail.Position = UDim2.new(0, 10, 0, 30)
				SliderRail.Size = UDim2.new(1, -20, 0, 6)
				SliderRail.BackgroundColor3 = Theme.SurfaceActive
				SliderRail.BorderSizePixel = 0

				local RailCorner = Instance.new("UICorner")
				RailCorner.CornerRadius = UDim.new(1, 0)
				RailCorner.Parent = SliderRail

				local RailFill = Instance.new("Frame")
				RailFill.Name = "Fill"
				RailFill.Parent = SliderRail
				RailFill.BackgroundColor3 = Theme.Accent
				RailFill.BorderSizePixel = 0
				RailFill.Size = UDim2.fromScale(0, 1)

				local FillCorner = Instance.new("UICorner")
				FillCorner.CornerRadius = UDim.new(1, 0)
				FillCorner.Parent = RailFill

				local Thumb = Instance.new("Frame")
				Thumb.Name = "Thumb"
				Thumb.Parent = SliderRail
				Thumb.AnchorPoint = Vector2.new(0.5, 0.5)
				Thumb.Position = UDim2.new(0, 0, 0.5, 0)
				Thumb.Size = UDim2.new(0, 12, 0, 12)
				Thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Thumb.BorderSizePixel = 0

				local ThumbCorner = Instance.new("UICorner")
				ThumbCorner.CornerRadius = UDim.new(1, 0)
				ThumbCorner.Parent = Thumb

				local SliderState = { Value = cfg.Default }
				local dragging = false

				local function Round(num, inc)
					return math.floor(num / inc + 0.5) * inc
				end

				function SliderState:Set(value)
					value = math.clamp(Round(value, cfg.Increment), cfg.Min, cfg.Max)
					self.Value = value
					ValueInput.Text = tostring(value)
					local scale = (value - cfg.Min) / (cfg.Max - cfg.Min)
					TweenService:Create(RailFill, TweenInfoFast, { Size = UDim2.fromScale(scale, 1) }):Play()
					TweenService:Create(Thumb, TweenInfoFast, { Position = UDim2.new(scale, 0, 0.5, 0) }):Play()
					pcall(cfg.Callback, value)
				end

				SliderRail.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = true
						local scale = math.clamp((input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
						SliderState:Set(cfg.Min + ((cfg.Max - cfg.Min) * scale))
					end
				end)

				UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = false
					end
				end)

				UserInputService.InputChanged:Connect(function(input)
					if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
						local scale = math.clamp((input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
						SliderState:Set(cfg.Min + ((cfg.Max - cfg.Min) * scale))
					end
				end)

				ValueInput.FocusLost:Connect(function()
					local val = tonumber(ValueInput.Text)
					if val then SliderState:Set(val) else ValueInput.Text = tostring(SliderState.Value) end
				end)

				SliderState:Set(cfg.Default)
				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return SliderState
			end

			-- 12.6 DROPDOWN (Meng Hub Screenshot 1 & 2: Pill Row that triggers Popout Drawer on right)
			function SecObj:AddDropdown(dropdownConfig)
				local cfg = Library:MakeConfig({
					Title = "Dropdown",
					Description = "",
					Values = {},
					Default = nil,
					Multi = false,
					Callback = function() end
				}, dropdownConfig or {})

				if cfg.Desc and cfg.Description == "" then cfg.Description = cfg.Desc end
				if cfg.Value ~= nil and dropdownConfig.Default == nil then cfg.Default = cfg.Value end

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "Dropdown_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.55
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 36)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 7)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, 0)
				TitleLabel.Size = UDim2.new(1, -125, 1, 0)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				-- Dropdown Pill (Screenshot 1: "Default v")
				local DropPill = Instance.new("TextButton")
				DropPill.Name = "Pill"
				DropPill.Parent = ItemFrame
				DropPill.AnchorPoint = Vector2.new(1, 0.5)
				DropPill.Position = UDim2.new(1, -10, 0.5, 0)
				DropPill.Size = UDim2.new(0, 105, 0, 22)
				DropPill.BackgroundColor3 = Theme.SurfaceActive
				DropPill.BorderSizePixel = 0
				DropPill.AutoButtonColor = false
				DropPill.Text = ""

				local PillCorner = Instance.new("UICorner")
				PillCorner.CornerRadius = UDim.new(0, 5)
				PillCorner.Parent = DropPill

				local PillStroke = Instance.new("UIStroke")
				PillStroke.Color = Theme.BorderSoft
				PillStroke.Thickness = 1
				PillStroke.Parent = DropPill

				local PillText = Instance.new("TextLabel")
				PillText.Name = "Label"
				PillText.Parent = DropPill
				PillText.BackgroundTransparency = 1
				PillText.Position = UDim2.new(0, 8, 0, 0)
				PillText.Size = UDim2.new(1, -24, 1, 0)
				PillText.Font = Enum.Font.Gotham
				PillText.Text = "Select..."
				PillText.TextColor3 = Theme.TextSecondary
				PillText.TextSize = 10
				PillText.TextTruncate = Enum.TextTruncate.AtEnd
				PillText.TextXAlignment = Enum.TextXAlignment.Left

				local Arrow = Instance.new("ImageLabel")
				Arrow.Name = "Arrow"
				Arrow.Parent = DropPill
				Arrow.AnchorPoint = Vector2.new(1, 0.5)
				Arrow.Position = UDim2.new(1, -4, 0.5, 0)
				Arrow.Size = UDim2.new(0, 12, 0, 12)
				Arrow.BackgroundTransparency = 1
				Arrow.Image = TabIcons.ChevronRight
				Arrow.Rotation = 90
				Arrow.ImageColor3 = Theme.TextMuted

				local SelectedValues = {}
				if cfg.Multi then
					if type(cfg.Default) == "table" then
						for _, v in ipairs(cfg.Default) do table.insert(SelectedValues, v) end
					elseif cfg.Default then
						table.insert(SelectedValues, cfg.Default)
					end
				else
					if type(cfg.Default) == "table" and #cfg.Default > 0 then
						SelectedValues = { cfg.Default[1] }
					elseif cfg.Default then
						SelectedValues = { tostring(cfg.Default) }
					end
				end

				local DropdownObj = {
					Values = cfg.Values or {},
					Selected = SelectedValues
				}

				local function UpdatePillDisplay()
					if #DropdownObj.Selected == 0 then
						PillText.Text = "Select..."
						PillText.TextColor3 = Theme.TextMuted
					else
						PillText.Text = table.concat(DropdownObj.Selected, ", ")
						PillText.TextColor3 = Theme.Text
					end
				end

				UpdatePillDisplay()

				-- Open Popout Drawer (Meng Hub Screenshot 2)
				local renderedOptions = {}
				local function OpenDrawer()
					for _, item in ipairs(renderedOptions) do item:Destroy() end
					renderedOptions = {}

					PopoutDrawer.Visible = true
					PopoutSBox.Text = ""

					local function RenderList()
						for _, item in ipairs(renderedOptions) do item:Destroy() end
						renderedOptions = {}

						local query = string.lower(PopoutSBox.Text or "")
						for _, optVal in ipairs(DropdownObj.Values) do
							local strVal = tostring(optVal)
							if query == "" or string.find(string.lower(strVal), query) then
								local isSelected = table.find(DropdownObj.Selected, strVal) ~= nil

								local row = Instance.new("TextButton")
								row.Name = "Opt_" .. strVal
								row.Parent = PopoutScroll
								row.Size = UDim2.new(1, 0, 0, 26)
								row.BackgroundColor3 = isSelected and Theme.SurfaceActive or Theme.Header
								row.BackgroundTransparency = isSelected and 0.2 or 0.8
								row.BorderSizePixel = 0
								row.AutoButtonColor = false
								row.Text = ""

								local rCorner = Instance.new("UICorner")
								rCorner.CornerRadius = UDim.new(0, 5)
								rCorner.Parent = row

								-- Active Purple Indicator Bar (Screenshot 2)
								local optIndicator = Instance.new("Frame")
								optIndicator.Name = "Bar"
								optIndicator.Parent = row
								optIndicator.AnchorPoint = Vector2.new(0, 0.5)
								optIndicator.Position = UDim2.new(0, 2, 0.5, 0)
								optIndicator.Size = UDim2.new(0, 3, 0.6, 0)
								optIndicator.BackgroundColor3 = Theme.Accent
								optIndicator.BorderSizePixel = 0
								optIndicator.Visible = isSelected

								local optLbl = Instance.new("TextLabel")
								optLbl.Parent = row
								optLbl.BackgroundTransparency = 1
								optLbl.Position = UDim2.new(0, 10, 0, 0)
								optLbl.Size = UDim2.new(1, -14, 1, 0)
								optLbl.Font = isSelected and Enum.Font.GothamBold or Enum.Font.Gotham
								optLbl.Text = strVal
								optLbl.TextColor3 = isSelected and Theme.Text or Theme.TextSecondary
								optLbl.TextSize = 11
								optLbl.TextXAlignment = Enum.TextXAlignment.Left

								row.MouseButton1Click:Connect(function()
									if cfg.Multi then
										local idx = table.find(DropdownObj.Selected, strVal)
										if idx then
											table.remove(DropdownObj.Selected, idx)
										else
											table.insert(DropdownObj.Selected, strVal)
										end
										UpdatePillDisplay()
										RenderList()
										pcall(cfg.Callback, DropdownObj.Selected)
									else
										DropdownObj.Selected = { strVal }
										UpdatePillDisplay()
										PopoutDrawer.Visible = false
										pcall(cfg.Callback, strVal)
									end
								end)

								table.insert(renderedOptions, row)
							end
						end
					end

					PopoutSBox:GetPropertyChangedSignal("Text"):Connect(RenderList)
					RenderList()
				end

				DropPill.MouseButton1Click:Connect(function()
					if PopoutDrawer.Visible then
						PopoutDrawer.Visible = false
					else
						OpenDrawer()
					end
				end)

				function DropdownObj:Set(newValues)
					if type(newValues) == "table" then
						self.Selected = newValues
					else
						self.Selected = { tostring(newValues) }
					end
					UpdatePillDisplay()
				end

				function DropdownObj:Refresh(newOptions, resetSelection)
					self.Values = newOptions or {}
					if resetSelection then self.Selected = {} end
					UpdatePillDisplay()
				end

				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return DropdownObj
			end

			-- 12.7 TEXT INPUT (Meng Hub Style)
			function SecObj:AddInput(inputConfig)
				local cfg = Library:MakeConfig({
					Title = "Input",
					Description = "",
					PlaceHolder = "Type here...",
					Default = "",
					Callback = function() end
				}, inputConfig or {})

				if cfg.Desc and cfg.Description == "" then cfg.Description = cfg.Desc end

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "Input_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.55
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 36)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 7)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, 0)
				TitleLabel.Size = UDim2.new(1, -125, 1, 0)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local BoxFrame = Instance.new("Frame")
				BoxFrame.Name = "BoxFrame"
				BoxFrame.Parent = ItemFrame
				BoxFrame.AnchorPoint = Vector2.new(1, 0.5)
				BoxFrame.Position = UDim2.new(1, -10, 0.5, 0)
				BoxFrame.Size = UDim2.new(0, 105, 0, 22)
				BoxFrame.BackgroundColor3 = Theme.SurfaceActive
				BoxFrame.BorderSizePixel = 0

				local BoxCorner = Instance.new("UICorner")
				BoxCorner.CornerRadius = UDim.new(0, 5)
				BoxCorner.Parent = BoxFrame

				local BoxStroke = Instance.new("UIStroke")
				BoxStroke.Color = Theme.BorderSoft
				BoxStroke.Thickness = 1
				BoxStroke.Parent = BoxFrame

				local TextBox = Instance.new("TextBox")
				TextBox.Name = "TextBox"
				TextBox.Parent = BoxFrame
				TextBox.BackgroundTransparency = 1
				TextBox.Position = UDim2.new(0, 6, 0, 0)
				TextBox.Size = UDim2.new(1, -12, 1, 0)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderColor3 = Theme.TextMuted
				TextBox.PlaceholderText = cfg.PlaceHolder or "Type..."
				TextBox.Text = cfg.Default or ""
				TextBox.TextColor3 = Theme.Text
				TextBox.TextSize = 11
				TextBox.TextXAlignment = Enum.TextXAlignment.Left

				TextBox.Focused:Connect(function()
					TweenService:Create(BoxStroke, TweenInfoFast, { Color = Theme.Accent, Transparency = 0.2 }):Play()
				end)

				TextBox.FocusLost:Connect(function()
					TweenService:Create(BoxStroke, TweenInfoFast, { Color = Theme.BorderSoft, Transparency = 0 }):Play()
					pcall(cfg.Callback, TextBox.Text)
				end)

				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return TextBox
			end

			-- 12.8 SEPARATOR / DIVIDER
			function SecObj:AddSeperator(titleText)
				local SepFrame = Instance.new("Frame")
				SepFrame.Name = "Separator"
				SepFrame.Parent = ControlsContainer
				SepFrame.BackgroundTransparency = 1
				SepFrame.Size = UDim2.new(1, 0, 0, (titleText and titleText ~= "") and 22 or 8)

				if titleText and titleText ~= "" then
					local SepLabel = Instance.new("TextLabel")
					SepLabel.Parent = SepFrame
					SepLabel.BackgroundTransparency = 1
					SepLabel.Position = UDim2.new(0, 4, 0, 0)
					SepLabel.Size = UDim2.new(1, -8, 1, 0)
					SepLabel.Font = Enum.Font.GothamBold
					SepLabel.Text = string.upper(tostring(titleText))
					SepLabel.TextColor3 = Theme.AccentGlow
					SepLabel.TextSize = 10
					SepLabel.TextXAlignment = Enum.TextXAlignment.Left
				else
					local Line = Instance.new("Frame")
					Line.Parent = SepFrame
					Line.AnchorPoint = Vector2.new(0, 0.5)
					Line.Position = UDim2.new(0, 0, 0.5, 0)
					Line.Size = UDim2.new(1, 0, 0, 1)
					Line.BackgroundColor3 = Theme.BorderSoft
					Line.BorderSizePixel = 0
				end

				table.insert(secData.Elements, { Title = titleText or "Separator", Frame = SepFrame })
			end

			-- 12.9 KEYBIND SELECTOR (Standalone)
			function SecObj:AddKeybind(keybindConfig)
				local cfg = Library:MakeConfig({
					Title = "Keybind",
					Default = Enum.KeyCode.RightShift,
					Callback = function() end
				}, keybindConfig or {})

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "Keybind_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.55
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 36)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 7)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, 0)
				TitleLabel.Size = UDim2.new(1, -100, 1, 0)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local KeyBadge = Instance.new("TextButton")
				KeyBadge.Parent = ItemFrame
				KeyBadge.AnchorPoint = Vector2.new(1, 0.5)
				KeyBadge.Position = UDim2.new(1, -10, 0.5, 0)
				KeyBadge.Size = UDim2.new(0, 65, 0, 22)
				KeyBadge.BackgroundColor3 = Theme.SurfaceActive
				KeyBadge.BorderSizePixel = 0
				KeyBadge.Font = Enum.Font.GothamBold
				KeyBadge.Text = cfg.Default and cfg.Default.Name or "None"
				KeyBadge.TextColor3 = Theme.TextSecondary
				KeyBadge.TextSize = 11

				local BadgeCorner = Instance.new("UICorner")
				BadgeCorner.CornerRadius = UDim.new(0, 5)
				BadgeCorner.Parent = KeyBadge

				local BadgeStroke = Instance.new("UIStroke")
				BadgeStroke.Color = Theme.BorderSoft
				BadgeStroke.Thickness = 1
				BadgeStroke.Parent = KeyBadge

				local listening = false
				KeyBadge.MouseButton1Click:Connect(function()
					if listening then return end
					listening = true
					KeyBadge.Text = "..."
					TweenService:Create(BadgeStroke, TweenInfoFast, { Color = Theme.Accent }):Play()

					local conn
					conn = UserInputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							listening = false
							KeyBadge.Text = input.KeyCode.Name
							TweenService:Create(BadgeStroke, TweenInfoFast, { Color = Theme.BorderSoft }):Play()
							conn:Disconnect()
							pcall(cfg.Callback, input.KeyCode)
						end
					end)
				end)

				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
			end

			-- 12.10 PROGRESS BAR
			function SecObj:AddProgressBar(pbConfig)
				local cfg = Library:MakeConfig({
					Title = "Progress",
					Default = 0,
					Max = 100
				}, pbConfig or {})

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "ProgressBar_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.55
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 44)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 7)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, 6)
				TitleLabel.Size = UDim2.new(1, -70, 0, 16)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local PercentLabel = Instance.new("TextLabel")
				PercentLabel.Parent = ItemFrame
				PercentLabel.AnchorPoint = Vector2.new(1, 0)
				PercentLabel.Position = UDim2.new(1, -10, 0, 6)
				PercentLabel.Size = UDim2.new(0, 50, 0, 16)
				PercentLabel.BackgroundTransparency = 1
				PercentLabel.Font = Enum.Font.GothamBold
				PercentLabel.Text = tostring(cfg.Default) .. "%"
				PercentLabel.TextColor3 = Theme.AccentGlow
				PercentLabel.TextSize = 11
				PercentLabel.TextXAlignment = Enum.TextXAlignment.Right

				local Rail = Instance.new("Frame")
				Rail.Parent = ItemFrame
				Rail.Position = UDim2.new(0, 10, 0, 26)
				Rail.Size = UDim2.new(1, -20, 0, 6)
				Rail.BackgroundColor3 = Theme.SurfaceActive
				Rail.BorderSizePixel = 0

				local RailCorner = Instance.new("UICorner")
				RailCorner.CornerRadius = UDim.new(1, 0)
				RailCorner.Parent = Rail

				local Fill = Instance.new("Frame")
				Fill.Parent = Rail
				Fill.BackgroundColor3 = Theme.Accent
				Fill.BorderSizePixel = 0
				Fill.Size = UDim2.fromScale(math.clamp(cfg.Default / cfg.Max, 0, 1), 1)

				local FillCorner = Instance.new("UICorner")
				FillCorner.CornerRadius = UDim.new(1, 0)
				FillCorner.Parent = Fill

				local PBObj = { Value = cfg.Default }
				function PBObj:Set(newVal, newMax)
					local max = newMax or cfg.Max
					newVal = math.clamp(newVal, 0, max)
					self.Value = newVal
					local pct = math.floor((newVal / max) * 100)
					PercentLabel.Text = tostring(pct) .. "%"
					TweenService:Create(Fill, TweenInfoFast, { Size = UDim2.fromScale(newVal / max, 1) }):Play()
				end

				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return PBObj
			end

			-- 12.11 SEARCHABLE PLAYER SELECTION LIST
			function SecObj:AddPlayerList(plConfig)
				local cfg = Library:MakeConfig({
					Title = "Player Selection",
					Multi = true,
					Callback = function() end
				}, plConfig or {})

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "PlayerList_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.55
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 190)

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 8)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.4
				ItemStroke.Parent = ItemFrame

				local TopFrame = Instance.new("Frame")
				TopFrame.Parent = ItemFrame
				TopFrame.BackgroundTransparency = 1
				TopFrame.Size = UDim2.new(1, 0, 0, 30)

				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Parent = TopFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 10, 0, 0)
				TitleLabel.Size = UDim2.new(0.5, -10, 1, 0)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = cfg.Title
				TitleLabel.TextColor3 = Theme.Text
				TitleLabel.TextSize = 12
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local StatusCount = Instance.new("TextLabel")
				StatusCount.Parent = TopFrame
				StatusCount.AnchorPoint = Vector2.new(1, 0)
				StatusCount.Position = UDim2.new(1, -10, 0, 0)
				StatusCount.Size = UDim2.new(0.5, -10, 1, 0)
				StatusCount.BackgroundTransparency = 1
				StatusCount.Font = Enum.Font.Gotham
				StatusCount.Text = "0 selected"
				StatusCount.TextColor3 = Theme.AccentGlow
				StatusCount.TextSize = 10
				StatusCount.TextXAlignment = Enum.TextXAlignment.Right

				local BtnRow = Instance.new("Frame")
				BtnRow.Parent = ItemFrame
				BtnRow.BackgroundTransparency = 1
				BtnRow.Position = UDim2.new(0, 10, 0, 30)
				BtnRow.Size = UDim2.new(1, -20, 0, 24)

				local SelectAllBtn = Instance.new("TextButton")
				SelectAllBtn.Parent = BtnRow
				SelectAllBtn.Size = UDim2.new(0.48, 0, 1, 0)
				SelectAllBtn.BackgroundColor3 = Theme.SurfaceActive
				SelectAllBtn.Font = Enum.Font.GothamBold
				SelectAllBtn.Text = "Select All"
				SelectAllBtn.TextColor3 = Theme.Text
				SelectAllBtn.TextSize = 10
				SelectAllBtn.BorderSizePixel = 0

				local SABCorner = Instance.new("UICorner")
				SABCorner.CornerRadius = UDim.new(0, 5)
				SABCorner.Parent = SelectAllBtn

				local DeselectAllBtn = Instance.new("TextButton")
				DeselectAllBtn.Parent = BtnRow
				DeselectAllBtn.Position = UDim2.new(0.52, 0, 0, 0)
				DeselectAllBtn.Size = UDim2.new(0.48, 0, 1, 0)
				DeselectAllBtn.BackgroundColor3 = Theme.SurfaceActive
				DeselectAllBtn.Font = Enum.Font.GothamBold
				DeselectAllBtn.Text = "Deselect All"
				DeselectAllBtn.TextColor3 = Theme.TextMuted
				DeselectAllBtn.TextSize = 10
				DeselectAllBtn.BorderSizePixel = 0

				local DABCorner = Instance.new("UICorner")
				DABCorner.CornerRadius = UDim.new(0, 5)
				DABCorner.Parent = DeselectAllBtn

				local PlSearch = Instance.new("TextBox")
				PlSearch.Parent = ItemFrame
				PlSearch.Position = UDim2.new(0, 10, 0, 58)
				PlSearch.Size = UDim2.new(1, -20, 0, 22)
				PlSearch.BackgroundColor3 = Theme.Header
				PlSearch.BorderSizePixel = 0
				PlSearch.Font = Enum.Font.Gotham
				PlSearch.PlaceholderColor3 = Theme.TextMuted
				PlSearch.PlaceholderText = "Filter players..."
				PlSearch.Text = ""
				PlSearch.TextColor3 = Theme.Text
				PlSearch.TextSize = 10

				local PSCorner = Instance.new("UICorner")
				PSCorner.CornerRadius = UDim.new(0, 5)
				PSCorner.Parent = PlSearch

				local PlScroll = Instance.new("ScrollingFrame")
				PlScroll.Parent = ItemFrame
				PlScroll.BackgroundTransparency = 1
				PlScroll.Position = UDim2.new(0, 10, 0, 84)
				PlScroll.Size = UDim2.new(1, -20, 0, 98)
				PlScroll.BorderSizePixel = 0
				PlScroll.ScrollBarThickness = 2
				PlScroll.ScrollBarImageColor3 = Theme.Border

				local PlLayout = Instance.new("UIListLayout")
				PlLayout.Parent = PlScroll
				PlLayout.SortOrder = Enum.SortOrder.LayoutOrder
				PlLayout.Padding = UDim.new(0, 3)

				Library:UpdateScrolling(PlScroll, PlLayout)

				local selectedPlayers = {}
				local renderedItems = {}

				local function UpdateCount()
					local c = 0
					for _ in pairs(selectedPlayers) do c = c + 1 end
					StatusCount.Text = tostring(c) .. " selected"
				end

				local function RefreshPlayers()
					for _, item in ipairs(renderedItems) do item:Destroy() end
					renderedItems = {}

					local query = string.lower(PlSearch.Text or "")
					for _, plr in ipairs(Players:GetPlayers()) do
						if plr ~= LocalPlayer then
							local pName = plr.Name
							if query == "" or string.find(string.lower(pName), query) then
								local isSel = selectedPlayers[pName] ~= nil

								local row = Instance.new("TextButton")
								row.Name = "Row_" .. pName
								row.Parent = PlScroll
								row.BackgroundColor3 = isSel and Theme.SurfaceActive or Theme.Header
								row.BorderSizePixel = 0
								row.Size = UDim2.new(1, 0, 0, 24)
								row.AutoButtonColor = false
								row.Text = ""

								local rCorner = Instance.new("UICorner")
								rCorner.CornerRadius = UDim.new(0, 5)
								rCorner.Parent = row

								local check = Instance.new("TextLabel")
								check.Parent = row
								check.Position = UDim2.new(0, 6, 0, 0)
								check.Size = UDim2.new(0, 16, 1, 0)
								check.BackgroundTransparency = 1
								check.Font = Enum.Font.GothamBold
								check.Text = isSel and "✓" or "○"
								check.TextColor3 = isSel and Theme.Success or Theme.TextMuted
								check.TextSize = 11

								local nameLbl = Instance.new("TextLabel")
								nameLbl.Parent = row
								nameLbl.Position = UDim2.new(0, 24, 0, 0)
								nameLbl.Size = UDim2.new(1, -28, 1, 0)
								nameLbl.BackgroundTransparency = 1
								nameLbl.Font = Enum.Font.Gotham
								nameLbl.Text = pName
								nameLbl.TextColor3 = isSel and Theme.Text or Theme.TextSecondary
								nameLbl.TextSize = 10
								nameLbl.TextXAlignment = Enum.TextXAlignment.Left

								row.MouseButton1Click:Connect(function()
									if selectedPlayers[pName] then
										selectedPlayers[pName] = nil
									else
										selectedPlayers[pName] = plr
									end
									UpdateCount()
									RefreshPlayers()
									pcall(cfg.Callback, selectedPlayers)
								end)

								table.insert(renderedItems, row)
							end
						end
					end
				end

				SelectAllBtn.MouseButton1Click:Connect(function()
					for _, plr in ipairs(Players:GetPlayers()) do
						if plr ~= LocalPlayer then selectedPlayers[plr.Name] = plr end
					end
					UpdateCount()
					RefreshPlayers()
					pcall(cfg.Callback, selectedPlayers)
				end)

				DeselectAllBtn.MouseButton1Click:Connect(function()
					selectedPlayers = {}
					UpdateCount()
					RefreshPlayers()
					pcall(cfg.Callback, selectedPlayers)
				end)

				PlSearch:GetPropertyChangedSignal("Text"):Connect(RefreshPlayers)
				Players.PlayerAdded:Connect(RefreshPlayers)
				Players.PlayerRemoving:Connect(function(plr)
					selectedPlayers[plr.Name] = nil
					UpdateCount()
					RefreshPlayers()
				end)

				task.defer(RefreshPlayers)
				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
			end

			-- Aliases for section methods
			SecObj.Toggle = SecObj.AddToggle
			SecObj.Button = SecObj.AddButton
			SecObj.Paragraph = SecObj.AddParagraph
			SecObj.DiscordCard = SecObj.AddDiscordCard
			SecObj.CommunityCard = SecObj.AddDiscordCard
			SecObj.AddCommunityCard = SecObj.AddDiscordCard
			SecObj.Slider = SecObj.AddSlider
			SecObj.Dropdown = SecObj.AddDropdown
			SecObj.Input = SecObj.AddInput
			SecObj.Separator = SecObj.AddSeperator
			SecObj.AddSeparator = SecObj.AddSeperator
			SecObj.Divider = SecObj.AddSeperator
			SecObj.AddDivider = SecObj.AddSeperator
			SecObj.Keybind = SecObj.AddKeybind
			SecObj.ProgressBar = SecObj.AddProgressBar
			SecObj.PlayerList = SecObj.AddPlayerList

			return SecObj
		end

		TabObj.Section = TabObj.AddSection
		return TabObj
	end

	-- Compatibility stubs for pinathubforintregation.lua (WindUI v2 API)
	function Window:CreateTopbarButton(...) end
	function Window:EditOpenButton(...) end
	function Window:Minimize()
		CloseWindow()
	end
	function Window:SelectTab(idx)
		if TabsCollection[idx] and TabsCollection[idx].SelectFn then
			TabsCollection[idx].SelectFn()
		end
	end

	Window.Tab = Window.T
	Window.NewTab = Window.T
	Window.CreateWindow = Window.NewWindow
	Library.CurrentWindow = Window

	return Window
end

Library.CreateWindow = Library.NewWindow
function Library:SetTheme(...) end
function Library:AddTheme(...) end
function Library:SetNotificationLower(...) end

return Library
