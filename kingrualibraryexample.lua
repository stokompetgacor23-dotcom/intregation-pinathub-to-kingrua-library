-- ==============================================================================
-- PINATHUB X KINGRUA UI LIBRARY — PinatHub MODERN EDITION
-- Official Pinathub Neon Identity & PinatHub Glassmorphism Theme System
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
	-- PinatHub Drain Water Specific Tabs
	["Auto Farm"] = "rbxassetid://10723344432",   -- Droplet
	["Farm"] = "rbxassetid://10723344432",        -- Droplet
	["Upgrades"] = "rbxassetid://10709768939",    -- Arrow Up
	["Upgrade"] = "rbxassetid://10709768939",     -- Arrow Up
	["Fish & Pets"] = "rbxassetid://10709761530", -- Anchor (Marine / Aquatic / Fish)
	["Fish"] = "rbxassetid://10709761530",        -- Anchor
	["Pets"] = "rbxassetid://10709769841",        -- Backpack / Pet Pack
	["Auto Sell"] = "rbxassetid://10723343958",   -- Dollar Sign
	["Sell"] = "rbxassetid://10723343958",        -- Dollar Sign
	["Advanced"] = "rbxassetid://10747383470",    -- Wrench / Tools
	["Live Stats"] = "rbxassetid://10709770317",  -- Bar Chart 2
	["Stats"] = "rbxassetid://10709770317",       -- Bar Chart 2
	["Community"] = "rbxassetid://10747373426",   -- Users

	-- Standard Lucide Icons by String Name
	["droplet"] = "rbxassetid://10723344432",
	["fish"] = "rbxassetid://10709761530",
	["anchor"] = "rbxassetid://10709761530",
	["backpack"] = "rbxassetid://10709769841",
	["arrow-up"] = "rbxassetid://10709768939",
	["dollar-sign"] = "rbxassetid://10723343958",
	["coins"] = "rbxassetid://10709811110",
	["settings"] = "rbxassetid://10734950309",
	["sliders"] = "rbxassetid://10734963400",
	["bar-chart"] = "rbxassetid://10709773755",
	["bar-chart-2"] = "rbxassetid://10709770317",
	["chart-bar"] = "rbxassetid://10709770317",
	["users"] = "rbxassetid://10747373426",
	["user"] = "rbxassetid://10747373176",
	["crosshair"] = "rbxassetid://10709818534",
	["target"] = "rbxassetid://10734977012",
	["skull"] = "rbxassetid://10734962068",
	["eye"] = "rbxassetid://10723346959",
	["swords"] = "rbxassetid://10734975692",
	["sword"] = "rbxassetid://10734975486",
	["backpack"] = "rbxassetid://10709769841",
	["shield"] = "rbxassetid://10734951847",
	["wrench"] = "rbxassetid://10747383470",
	["cpu"] = "rbxassetid://10709813383",
	["activity"] = "rbxassetid://10709752035",
	["heart"] = "rbxassetid://10723406885",
	["home"] = "rbxassetid://10723407389",
	["search"] = "rbxassetid://10734943674",
	["bell"] = "rbxassetid://10709775704",
	["flame"] = "rbxassetid://10723376114",
	["database"] = "rbxassetid://10709818996",
	["discord"] = "rbxassetid://10734950553",
	["message-circle"] = "rbxassetid://10734888000",
	["video"] = "rbxassetid://10747374938",
	["youtube"] = "rbxassetid://10747374938",
	["globe"] = "rbxassetid://10723404337",
	["clipboard-check"] = "rbxassetid://10709783474",

	-- General Navigation & UI Icons
	Main = "rbxassetid://10723407389",
	Info = "rbxassetid://10723406988",            -- Help / Info circle
	Survivor = "rbxassetid://10734975692",        -- Swords
	Killer = "rbxassetid://10734962068",          -- Skull
	ESP = "rbxassetid://10723346959",             -- Eye
	Visuals = "rbxassetid://10723346959",         -- Eye
	["Emote & Skin"] = "rbxassetid://10747373176",-- User
	Emote = "rbxassetid://10747373176",           -- User
	Aimbot = "rbxassetid://10709818534",          -- Crosshair (FIXED, NOT BLANK)
	Settings = "rbxassetid://10734950309",        -- Gear
	Configuration = "rbxassetid://10734963400",   -- Sliders
	Config = "rbxassetid://10734963400",          -- Sliders
	Player = "rbxassetid://10747373176",          -- User
	Misc = "rbxassetid://10747383470",            -- Wrench
	Credits = "rbxassetid://10723406988",         -- Help / Info
	Search = "rbxassetid://10734943674",          -- Search (FIXED)
	Minimize = "rbxassetid://10734896206",
	Maximize = "rbxassetid://10734914561",
	Close = "rbxassetid://10747384394",
	ChevronRight = "rbxassetid://10709791437",
	ChevronDown = "rbxassetid://10709790948",
	Discord = "rbxassetid://10734950553",
	Cursor = "rbxassetid://10709818534"
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
-- 2. COLOR PALETTE: PinatHub DARK OBSIDIAN & AMETHYST PURPLE
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
-- 5. WINDOW CREATION (PinatHub COMPACT DIMENSIONS & MODERN STYLING)
-- ==============================================================================
function Library:NewWindow(ConfigWindow)
	local Config = self:MakeConfig({
		Title = "Pinathub",
		Description = "PinatHub Community",
		Size = UDim2.fromOffset(630, 390), -- Compact PinatHub landscape proportions
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

	-- PinatHub Watermark Background Logo (Subtle & Dimmed)
	local WindowBackgroundLogo = Instance.new("ImageLabel")
	WindowBackgroundLogo.Name = "WindowBackgroundLogo"
	WindowBackgroundLogo.Parent = MainWindow
	WindowBackgroundLogo.AnchorPoint = Vector2.new(0.5, 0.5)
	WindowBackgroundLogo.Position = UDim2.fromScale(0.5, 0.5)
	WindowBackgroundLogo.Size = UDim2.new(0.62, 0, 0.62, 0)
	WindowBackgroundLogo.BackgroundTransparency = 1
	WindowBackgroundLogo.Image = PINATHUB_LOGO
	WindowBackgroundLogo.ImageColor3 = Theme.AccentGlow
	WindowBackgroundLogo.ImageTransparency = 0.93 -- Dimmed subtle lighting
	WindowBackgroundLogo.ScaleType = Enum.ScaleType.Fit
	WindowBackgroundLogo.ZIndex = 2

	-- 4. Floating Launcher Button (PinatHub User Spec: 50x50, white bg, green stroke, draggable)
	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	local MainGui = Instance.new("ScreenGui")
	MainGui.Name = "MainGui"
	MainGui.ResetOnSpawn = false
	MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	pcall(function() MainGui.Parent = game:GetService("CoreGui") end)
	if not MainGui.Parent then
		MainGui.Parent = PlayerGui
	end

	-- Buat ImageButton untuk toggle (buka/tutup) dengan 1 icon permanen
	local ToggleButton = Instance.new("ImageButton")
	ToggleButton.Name = "ToggleButton"
	ToggleButton.Parent = MainGui
	ToggleButton.Size = UDim2.new(0, 50, 0, 50)
	ToggleButton.Position = UDim2.new(0.5, -25, 0.5, -25)
	ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.BackgroundTransparency = 0
	ToggleButton.BorderSizePixel = 0
	ToggleButton.Image = PINATHUB_LOGO  -- Icon permanen PinatHub
	ToggleButton.ScaleType = Enum.ScaleType.Fit
	ToggleButton.ZIndex = 50

	-- Tambahkan corner biar icon berbentuk bulat
	local Corner = Instance.new("UICorner")
	Corner.Parent = ToggleButton
	Corner.CornerRadius = UDim.new(1, 0)

	-- Tambahkan stroke outline hijau
	local Stroke = Instance.new("UIStroke")
	Stroke.Parent = ToggleButton
	Stroke.Thickness = 2
	Stroke.Color = Color3.fromRGB(0, 255, 0)

	-- Variable untuk tracking status window
	local WindowOpen = true
	local isMaximized = false
	local originalSize = DropShadowHolder.Size

	-- Fungsi toggle (icon tetap sama)
	local function OpenWindow()
		WindowOpen = true
		DropShadowHolder.Visible = true
		UIScale.Scale = 0.92
		MainWindow.BackgroundTransparency = 0.5
		DropShadow.ImageTransparency = 1

		TweenService:Create(UIScale, TweenInfoSpring, { Scale = 1 }):Play()
		TweenService:Create(MainWindow, TweenInfoSmooth, { BackgroundTransparency = 0.08 }):Play()
		TweenService:Create(DropShadow, TweenInfoSmooth, { ImageTransparency = 0.35 }):Play()
	end

	local function CloseWindow()
		WindowOpen = false
		local closeTween = TweenService:Create(UIScale, TweenInfoFast, { Scale = 0.92 })
		TweenService:Create(MainWindow, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
		TweenService:Create(DropShadow, TweenInfoFast, { ImageTransparency = 1 }):Play()
		closeTween:Play()
		closeTween.Completed:Connect(function()
			if not WindowOpen then
				DropShadowHolder.Visible = false
			end
		end)
	end

	ToggleButton.MouseButton1Click:Connect(function()
		WindowOpen = not WindowOpen
		if WindowOpen then
			OpenWindow()
		else
			CloseWindow()
		end
	end)

	-- Hover effects on ToggleButton
	ToggleButton.MouseEnter:Connect(function()
		TweenService:Create(ToggleButton, TweenInfoSpring, { Size = UDim2.new(0, 56, 0, 56) }):Play()
	end)
	ToggleButton.MouseLeave:Connect(function()
		TweenService:Create(ToggleButton, TweenInfoSpring, { Size = UDim2.new(0, 50, 0, 50) }):Play()
	end)

	-- Untuk membuat tombol ini draggable (bisa digeser)
	local Dragging = false
	local DragStart = nil
	local StartPos = nil

	ToggleButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = input.Position
			StartPos = ToggleButton.Position
		end
	end)

	ToggleButton.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local Delta = input.Position - DragStart
			ToggleButton.Position = UDim2.new(
				StartPos.X.Scale,
				StartPos.X.Offset + Delta.X,
				StartPos.Y.Scale,
				StartPos.Y.Offset + Delta.Y
			)
		end
	end)

	local function ToggleMaximize()
		isMaximized = not isMaximized
		local targetSize = isMaximized and UDim2.fromOffset(800, 500) or originalSize
		TweenService:Create(DropShadowHolder, TweenInfoSpring, { Size = targetSize }):Play()
	end

	-- 6. Header (PinatHub Style: Logo + Title + Separator + Subtitle | Pills & Actions)
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

	-- Title "Pinathub | Drain Water" (Clean, No Subtitle)
	local BrandName = Instance.new("TextLabel")
	BrandName.Name = "BrandName"
	BrandName.Parent = LeftHeaderContainer
	BrandName.BackgroundTransparency = 1
	BrandName.Size = UDim2.new(0, 0, 1, 0)
	BrandName.AutomaticSize = Enum.AutomaticSize.X
	BrandName.Font = Enum.Font.GothamBold
	BrandName.Text = Config.Title
	BrandName.TextColor3 = Theme.Text
	BrandName.TextSize = 13
	BrandName.TextXAlignment = Enum.TextXAlignment.Left
	BrandName.LayoutOrder = 2

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

	-- Executor Badge Only (VD | Premium Removed)
	local currentExecutor = DetectExecutor()
	local execPill, execText = CreatePillBadge("Executor: " .. currentExecutor, 1)
	execText.RichText = true
	execText.Text = "<font color='#4ade80'>●</font> " .. currentExecutor

	local onCloseCallbacks = {}
	local function FullShutdownWindow()
		for _, cb in ipairs(onCloseCallbacks) do
			pcall(cb)
		end
		local closeTween = TweenService:Create(UIScale, TweenInfoFast, { Scale = 0.8 })
		TweenService:Create(MainWindow, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
		TweenService:Create(DropShadow, TweenInfoFast, { ImageTransparency = 1 }):Play()
		closeTween:Play()
		closeTween.Completed:Connect(function()
			pcall(function()
				if MainGui then MainGui:Destroy() end
				if ScreenGui then ScreenGui:Destroy() end
			end)
		end)
	end

	-- Window Control Buttons (Minimize & True Close Icon)
	local MinimizeBtn = Instance.new("TextButton")
	MinimizeBtn.Name = "Btn_Minimize"
	MinimizeBtn.Parent = RightHeaderContainer
	MinimizeBtn.Size = UDim2.new(0, 24, 0, 24)
	MinimizeBtn.BackgroundColor3 = Theme.Surface
	MinimizeBtn.BackgroundTransparency = 1
	MinimizeBtn.BorderSizePixel = 0
	MinimizeBtn.Font = Enum.Font.GothamBold
	MinimizeBtn.Text = "—"
	MinimizeBtn.TextColor3 = Theme.TextSecondary
	MinimizeBtn.TextSize = 13
	MinimizeBtn.AutoButtonColor = false
	MinimizeBtn.LayoutOrder = 2

	local MinCorner = Instance.new("UICorner")
	MinCorner.CornerRadius = UDim.new(0, 5)
	MinCorner.Parent = MinimizeBtn

	MinimizeBtn.MouseEnter:Connect(function()
		TweenService:Create(MinimizeBtn, TweenInfoFast, { BackgroundTransparency = 0.3, BackgroundColor3 = Theme.SurfaceHover }):Play()
		MinimizeBtn.TextColor3 = Theme.Text
	end)
	MinimizeBtn.MouseLeave:Connect(function()
		TweenService:Create(MinimizeBtn, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
		MinimizeBtn.TextColor3 = Theme.TextSecondary
	end)
	MinimizeBtn.MouseButton1Click:Connect(CloseWindow)

	-- Proper Close Icon Button with Lucide Close Asset
	local CloseBtn = Instance.new("ImageButton")
	CloseBtn.Name = "Btn_Close"
	CloseBtn.Parent = RightHeaderContainer
	CloseBtn.Size = UDim2.new(0, 24, 0, 24)
	CloseBtn.BackgroundColor3 = Theme.Surface
	CloseBtn.BackgroundTransparency = 1
	CloseBtn.BorderSizePixel = 0
	CloseBtn.Image = "rbxassetid://10747384394" -- Genuine Lucide X Close Icon
	CloseBtn.ImageColor3 = Theme.TextSecondary
	CloseBtn.ScaleType = Enum.ScaleType.Fit
	CloseBtn.AutoButtonColor = false
	CloseBtn.LayoutOrder = 3

	local CloseCorner = Instance.new("UICorner")
	CloseCorner.CornerRadius = UDim.new(0, 5)
	CloseCorner.Parent = CloseBtn

	local ClosePadding = Instance.new("UIPadding")
	ClosePadding.Parent = CloseBtn
	ClosePadding.PaddingTop = UDim.new(0, 5)
	ClosePadding.PaddingBottom = UDim.new(0, 5)
	ClosePadding.PaddingLeft = UDim.new(0, 5)
	ClosePadding.PaddingRight = UDim.new(0, 5)

	CloseBtn.MouseEnter:Connect(function()
		TweenService:Create(CloseBtn, TweenInfoFast, { BackgroundTransparency = 0, BackgroundColor3 = Theme.Danger }):Play()
		TweenService:Create(CloseBtn, TweenInfoFast, { ImageColor3 = Color3.fromRGB(255, 255, 255) }):Play()
	end)
	CloseBtn.MouseLeave:Connect(function()
		TweenService:Create(CloseBtn, TweenInfoFast, { BackgroundTransparency = 1 }):Play()
		TweenService:Create(CloseBtn, TweenInfoFast, { ImageColor3 = Theme.TextSecondary }):Play()
	end)
	CloseBtn.MouseButton1Click:Connect(FullShutdownWindow)

	-- 7. Sidebar Setup (PinatHub Width: 155px)
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

	-- Search Box in Sidebar (PinatHub Pill Style)
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

	-- Bottom User Profile (PinatHub Feature: Avatar Headshot + "Welcome, <username>")
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

	-- 9. Right Popout Drawer for Dropdown (PinatHub Screenshot 2 Style)
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

	function Window:OnClose(cb)
		if type(cb) == "function" then
			table.insert(onCloseCallbacks, cb)
		end
	end

	function Window:Destroy()
		FullShutdownWindow()
	end

	function Window:FullShutdown()
		FullShutdownWindow()
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
		local function ResolveIcon(iconInput, fallbackTitle)
			if type(iconInput) == "string" then
				local trimmed = string.match(iconInput, "^%s*(.-)%s*$") or iconInput
				if string.sub(trimmed, 1, 13) == "rbxassetid://" or string.sub(trimmed, 1, 10) == "rbxasset://" or string.sub(trimmed, 1, 4) == "http" then
					return trimmed
				end
				if TabIcons[trimmed] then
					return TabIcons[trimmed]
				end
				local lowerName = string.lower(trimmed)
				if TabIcons[lowerName] then
					return TabIcons[lowerName]
				end
			end
			if fallbackTitle then
				if TabIcons[fallbackTitle] then
					return TabIcons[fallbackTitle]
				end
				local lowerTitle = string.lower(fallbackTitle)
				if TabIcons[lowerTitle] then
					return TabIcons[lowerTitle]
				end
			end
			return PINATHUB_LOGO
		end

		icon = ResolveIcon(icon, title)
		descText = descText or title

		-- Tab Button in Sidebar (PinatHub: Left Accent Indicator Bar on Active)
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

		-- PinatHub Left Accent Indicator Bar
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
		-- 11. SECTION CREATION (PinatHub Style: Accent Title + Right Chevron)
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

			-- Section Header (PinatHub: Bold Purple Title + Right Chevron Down "v")
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
			SecTitleLabel.TextColor3 = Theme.AccentGlow -- PinatHub Purple Accent Title
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
			-- 12. SECTION CONTROLS (PinatHub MODERN DESIGN)
			-- ==============================================================================
			local SecObj = {}

			-- 12.1 TOGGLE SWITCH (PinatHub Style: Optional Inline Keybind [None] + Elastic Switch)
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

				-- Keybind Pill [None] (PinatHub Screenshot 1)
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

			-- 12.2 ACTION BUTTON (PinatHub Style: Clean Row with optional Right Icon)
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

			-- 12.3 RICH PARAGRAPH (PinatHub Screenshot 3: Multi-line description card)
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
				TitleLabel.RichText = true  -- Allow <font color='...'> tags in title

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
				ContentLabel.RichText = true  -- CRITICAL: Allow <font color='#...'> tags to render

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

			-- 12.4 REAL-TIME DATA GRAPH (Animated Bar Chart Telemetry)
			function SecObj:AddGraph(graphConfig)
				local cfg = Library:MakeConfig({
					Title = "Data Graph",
					BarCount = 14,
					MaxValue = 100,
					Height = 110,
					BarColor = Theme.Accent,
					BarGlow = Theme.AccentGlow,
					Unit = "/s"
				}, graphConfig or {})

				local ItemFrame = Instance.new("Frame")
				ItemFrame.Name = "Graph_" .. cfg.Title
				ItemFrame.Parent = ControlsContainer
				ItemFrame.BackgroundColor3 = Theme.SurfaceHover
				ItemFrame.BackgroundTransparency = 0.5
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, cfg.Height)
				ItemFrame.ClipsDescendants = true

				local ItemCorner = Instance.new("UICorner")
				ItemCorner.CornerRadius = UDim.new(0, 8)
				ItemCorner.Parent = ItemFrame

				local ItemStroke = Instance.new("UIStroke")
				ItemStroke.Color = Theme.BorderSoft
				ItemStroke.Thickness = 1
				ItemStroke.Transparency = 0.5
				ItemStroke.Parent = ItemFrame

				-- Header Info
				local TitleLabel = Instance.new("TextLabel")
				TitleLabel.Name = "Title"
				TitleLabel.Parent = ItemFrame
				TitleLabel.BackgroundTransparency = 1
				TitleLabel.Position = UDim2.new(0, 12, 0, 8)
				TitleLabel.Size = UDim2.new(0.6, 0, 0, 16)
				TitleLabel.Font = Enum.Font.GothamBold
				TitleLabel.Text = string.upper(cfg.Title)
				TitleLabel.TextColor3 = Theme.TextSecondary
				TitleLabel.TextSize = 10
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local ValueLabel = Instance.new("TextLabel")
				ValueLabel.Name = "Value"
				ValueLabel.Parent = ItemFrame
				ValueLabel.AnchorPoint = Vector2.new(1, 0)
				ValueLabel.Position = UDim2.new(1, -12, 0, 8)
				ValueLabel.Size = UDim2.new(0.35, 0, 0, 16)
				ValueLabel.BackgroundTransparency = 1
				ValueLabel.Font = Enum.Font.GothamBold
				ValueLabel.Text = "0" .. cfg.Unit
				ValueLabel.TextColor3 = Theme.AccentGlow
				ValueLabel.TextSize = 11
				ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

				-- Bars Container
				local ChartFrame = Instance.new("Frame")
				ChartFrame.Name = "Bars"
				ChartFrame.Parent = ItemFrame
				ChartFrame.Position = UDim2.new(0, 12, 0, 30)
				ChartFrame.Size = UDim2.new(1, -24, 0, cfg.Height - 38)
				ChartFrame.BackgroundTransparency = 1

				local ChartLayout = Instance.new("UIListLayout")
				ChartLayout.Parent = ChartFrame
				ChartLayout.FillDirection = Enum.FillDirection.Horizontal
				ChartLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				ChartLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
				ChartLayout.Padding = UDim.new(0, 5)

				local history = {}
				local barFills = {}
				for i = 1, cfg.BarCount do
					table.insert(history, 0)

					local track = Instance.new("Frame")
					track.Name = "Track_" .. i
					track.Parent = ChartFrame
					track.BackgroundColor3 = Theme.SurfaceActive
					track.BackgroundTransparency = 0.4
					track.BorderSizePixel = 0
					track.Size = UDim2.new(0, 18, 1, 0)

					local trCorner = Instance.new("UICorner")
					trCorner.CornerRadius = UDim.new(0, 4)
					trCorner.Parent = track

					local fill = Instance.new("Frame")
					fill.Name = "Fill"
					fill.Parent = track
					fill.AnchorPoint = Vector2.new(0, 1)
					fill.Position = UDim2.new(0, 0, 1, 0)
					fill.Size = UDim2.new(1, 0, 0.08, 0)
					fill.BackgroundColor3 = cfg.BarColor
					fill.BorderSizePixel = 0

					local fCorner = Instance.new("UICorner")
					fCorner.CornerRadius = UDim.new(0, 4)
					fCorner.Parent = fill

					local barGrad = Instance.new("UIGradient")
					barGrad.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, cfg.BarGlow),
						ColorSequenceKeypoint.new(1, cfg.BarColor)
					})
					barGrad.Rotation = 90
					barGrad.Parent = fill

					table.insert(barFills, fill)
				end

				local GraphObj = {
					MaxValue = cfg.MaxValue,
					Unit = cfg.Unit
				}

				function GraphObj:Push(val)
					val = tonumber(val) or 0
					table.remove(history, 1)
					table.insert(history, val)
					ValueLabel.Text = tostring(math.floor(val)) .. self.Unit

					for i, fill in ipairs(barFills) do
						local hVal = history[i] or 0
						local ratio = math.clamp(hVal / math.max(self.MaxValue, 1), 0.08, 1)
						TweenService:Create(fill, TweenInfoFast, { Size = UDim2.new(1, 0, ratio, 0) }):Play()
					end
				end

				function GraphObj:SetRate(val)
					self:Push(val)
				end

				function GraphObj:SetMax(newMax)
					self.MaxValue = tonumber(newMax) or 100
				end

				function GraphObj:SetTitle(newTitle)
					TitleLabel.Text = string.upper(tostring(newTitle))
				end

				table.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })
				return GraphObj
			end


			-- 12.4 DISCORD / COMMUNITY CARD (PinatHub Screenshot 3: Discord card with stats & COPY LINK)
			function SecObj:AddDiscordCard(discordConfig)
				local cfg = Library:MakeConfig({
					Title = "PinatHub Official Community",
					Members = "30522",
					Online = "2309",
					Invite = "https://discord.gg/ysHZCYFaX7",
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

			-- 12.6 DROPDOWN (PinatHub Screenshot 1 & 2: Pill Row that triggers Popout Drawer on right)
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

				-- Open Popout Drawer (PinatHub Screenshot 2)
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

			-- 12.7 TEXT INPUT (PinatHub Style)
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
			SecObj.Graph = SecObj.AddGraph
			SecObj.AddGraph = SecObj.AddGraph
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

-- ================================================================
-- PINATHUB | DRAIN WATER - COMPLETE EDITION
-- WindUI v2 | Full Auto Farm + Advanced Features (Independent)
-- ================================================================
repeat task.wait() until game:IsLoaded()

-- ================================================================
-- ANTI-AFK
-- ================================================================
local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    warn("anti-afk")
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- ================================================================
-- SERVICES
-- ================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

-- ================================================================
-- EXECUTOR COMPATIBILITY
-- ================================================================
local function noop() end
local set_clipboard = setclipboard or (syn and syn.setclipboard) or noop

-- ================================================================
-- LIGHTING SETUP
-- ================================================================
Lighting.ClockTime = 14
Lighting.GlobalShadows = false

-- ================================================================

-- GENERATION GUARD
-- ================================================================
_G.__DRAINWATER = (_G.__DRAINWATER or 0) + 1
local GEN = _G.__DRAINWATER
local function alive() return _G.__DRAINWATER == GEN end

-- ================================================================
-- SAFE LOAD CONFIGURATIONS
-- ================================================================
local function safeRequire(module)
    local success, result = pcall(require, module)
    if success then
        return result
    else
        warn("Failed to load module:", module, tostring(result))
        return nil
    end
end

local TrainingAreaHelper = safeRequire(ReplicatedStorage:FindFirstChild("Config") and ReplicatedStorage.Config:FindFirstChild("TrainingAreaHelper"))
local ShopHelper = safeRequire(ReplicatedStorage:FindFirstChild("Config") and ReplicatedStorage.Config:FindFirstChild("ShopHelper"))
local PetHelper = safeRequire(ReplicatedStorage:FindFirstChild("Config") and ReplicatedStorage.Config:FindFirstChild("PetHelper"))
local TrainingAreaConfig = safeRequire(ReplicatedStorage:FindFirstChild("Config") and ReplicatedStorage.Config:FindFirstChild("TrainingAreaHelper") and ReplicatedStorage.Config.TrainingAreaHelper:FindFirstChild("TrainingAreaConfig"))

local SpinHelper = nil
pcall(function()
    SpinHelper = require(ReplicatedStorage.Config.SpinHelper)
end)

-- ================================================================
-- CONFIG
-- ================================================================
local CONFIG = {
    -- Master Switch
    auto = false,
    
    -- Farm Components
    drain = false,
    click = false,
    fish = false,
    display = false,
    sell = false,
    
    -- AUTO SELL FISH (NEW)
    autoSellFish = false,
    sellProtected = false,
    sellThreshold = 0.92,
    sellInterval = 30,
    
    -- Upgrade Components
    pumps = false,
    auras = false,
    upgrades = false,
    eggs = false,
    pets = false,
    merge = false,
    rebirth = false,
    offline = false,
    
    -- Settings
    clickRate = 20,
    fillRatio = 0.92,
    rebirthUntil = 0,
    spendEvery = 10,
    diveSeconds = 30,
    harvestAfter = 15,
    stallSeconds = 30,
    claimShare = 0.35,
    topupShare = 0.1,
    pumpReach = 2.5,
    claimRadius = 14,
    settle = 0.5,
    
    -- Advanced Features
    autoTrainingArea = false,
    autoSpin = false,
    autoShopItems = false,
    autoPetUpgrade = false,
    autoFishTraining = false,
    autoClaimLimitedFish = false,
    autoBuyStamina = false,
    maxTrainingArea = 9,
    spinInterval = 60,
}

-- ================================================================
-- STATE
-- ================================================================
local STATE = {
    phase = "idle", note = "",
    stage = 1, remaining = 0, water = 0, cash = 0, level = 0, rebirth = 0,
    displayed = 0, slots = 0, backpack = 0, capacity = 0,
    pump = 1, pumpMult = 1, aura = 0, claimed = 0, sold = 0, placed = 0,
    rate = 0,
    deepest = 1, lastProgress = 0, reserve = 0,
    busy = false,
    trainingArea = 1,
    spinCount = 0,
    limitedFishClaimed = 0,
    lastSellTime = 0,
}

-- ================================================================
-- ORIGINAL DRAIN WATER LOGIC
-- ================================================================

local function short(n)
    n = tonumber(n) or 0
    local units = { { 1e12, "T" }, { 1e9, "B" }, { 1e6, "M" }, { 1e3, "K" } }
    for _, u in ipairs(units) do
        if math.abs(n) >= u[1] then return string.format("%.2f%s", n / u[1], u[2]) end
    end
    return string.format("%d", n)
end

local function note(text) STATE.note = text end

local abbConvert
local function num(v)
    if type(v) == "number" then return v end
    if type(v) ~= "string" then return nil end
    local plain = tonumber(v)
    if plain then return plain end
    if abbConvert == nil then
        local utils = ReplicatedStorage:FindFirstChild("Utils")
        local module = utils and utils:FindFirstChild("AbbNumber")
        local ok, loaded = pcall(require, module)
        abbConvert = (ok and type(loaded) == "table" and loaded.ConvertToNumber) or false
    end
    if not abbConvert then return nil end
    local ok, parsed = pcall(abbConvert, v)
    return (ok and type(parsed) == "number") and parsed or nil
end

local function value(folder, key, default)
    local f = LocalPlayer:FindFirstChild(folder)
    local v = f and f:FindFirstChild(key)
    return v and v.Value or default
end

local function char()
    local model = LocalPlayer.Character
    if not model then return nil, nil, nil end
    return model, model:FindFirstChild("HumanoidRootPart"), model:FindFirstChildOfClass("Humanoid")
end

local function pin(getPos)
    local stop, conn = false, nil
    conn = RunService.Heartbeat:Connect(function()
        if stop or GEN ~= _G.__DRAINWATER then conn:Disconnect() return end
        local _, hrp = char()
        local pos = getPos()
        if hrp and pos then hrp.CFrame = CFrame.new(pos) end
    end)
    return function() stop = true pcall(function() conn:Disconnect() end) end
end

local function withLock(name, fn)
    if STATE.busy then return false end
    STATE.busy = true
    local ok, err = pcall(fn)
    STATE.busy = false
    if not ok then note(name .. " failed: " .. tostring(err)) end
    return ok
end

local function invoke(fn, ...)
    if not fn then return nil end
    local args = table.pack(...)
    local out, done = nil, false
    task.spawn(function()
        local ok, res = pcall(function() return fn:InvokeServer(table.unpack(args, 1, args.n)) end)
        out, done = ok and res or nil, true
    end)
    local t0 = os.clock()
    while not done and os.clock() - t0 < 5 do task.wait(0.05) end
    return out
end

local Remote = ReplicatedStorage:WaitForChild("Remote", 10)
local EV, FN = Remote:WaitForChild("Event", 10), Remote:WaitForChild("Function", 10)

local function ev(category, name)
    local folder = EV:FindFirstChild(category)
    return folder and folder:FindFirstChild(name)
end

local function fn(category, name)
    local folder = FN:FindFirstChild(category)
    return folder and folder:FindFirstChild(name)
end

local SCENE = "\228\184\187\229\156\186\230\153\175"
local VERIFY = "\233\170\140\232\175\129\229\156\186\230\153\175"
local STAGE_PREFIX = "\229\133\179\229\141\161"
local WATER_PART = "\230\176\180\233\157\162"
local PLACE_BUTTON = "\230\148\190\231\189\174\230\140\137\233\146\174"
local COLLECT_BUTTON = "\230\148\182\233\155\134\230\140\137\233\146\174"

local function verifyFolder()
    local scene = workspace:FindFirstChild(SCENE)
    return scene and scene:FindFirstChild(VERIFY)
end

local function poolOf(stageId)
    local verify = verifyFolder()
    local stage = verify and verify:FindFirstChild(STAGE_PREFIX .. tostring(stageId))
    return stage and stage:FindFirstChild(WATER_PART)
end

local function poolStand(part)
    if not part then return nil end
    return part.Position + Vector3.new(0, part.Size.Y / 2 + 3, 0)
end

local function stageRows()
    local out = invoke(fn("Stage", "[C-S]GetStageState"))
    return type(out) == "table" and out or {}
end

local function remainingOf(stageId)
    for _, row in ipairs(stageRows()) do
        if row.stageId == stageId then return row.remaining, row.required end
    end
    return nil
end

-- state
local function refresh()
    STATE.stage = value("Stage", "stage", 1)
    STATE.water = value("Level", "water", 0)
    STATE.cash = value("Cash", "cash", 0)
    STATE.level = value("Level", "level", 0)
    STATE.rebirth = value("Rebirth", "rebirth", 0)
    STATE.backpack = value("BackpackData", "amount", 0)
    STATE.capacity = value("BackpackData", "capacity", 0)
    STATE.pump = LocalPlayer:GetAttribute("EquippedPumpId") or 1
    STATE.aura = LocalPlayer:GetAttribute("EquippedAuraId") or 0
    local cfg = rawget(_G, "__DRAINWATER_PUMPCFG")
    local row = cfg and (cfg[tostring(STATE.pump)] or cfg[STATE.pump])
    if row then STATE.pumpMult = num(row.multiplier) or STATE.pumpMult end
end

-- click (INDEPENDENT)
local function clickLoop()
    local remote = ev("Level", "[C-S]Click")
    while GEN == _G.__DRAINWATER do
        if CONFIG.click and remote then
            pcall(function() remote:FireServer() end)
            task.wait(1 / math.max(1, CONFIG.clickRate))
        else
            task.wait(0.4)
        end
    end
end

-- fish
local function worldFish()
    local verify = verifyFolder()
    local folder = verify and verify:FindFirstChild("WorldFish")
    return folder
end

local function clearedStages()
    local done = {}
    for _, row in ipairs(stageRows()) do
        if row.completed then done[tostring(row.stageId)] = true end
    end
    for id = 1, 15 do
        if LocalPlayer:GetAttribute("StageCompleted_" .. id) then done[tostring(id)] = true end
    end
    return done
end

local function claimableFish()
    local out = {}
    local folder = worldFish()
    if not folder then return out end
    local cleared = clearedStages()
    for _, model in ipairs(folder:GetChildren()) do
        if model:GetAttribute("Claimed") ~= true then
            local prompt = model:FindFirstChildWhichIsA("ProximityPrompt", true)
            local stageId = tostring(model:GetAttribute("StageId"))
            if prompt and prompt.Enabled and cleared[stageId] then
                local parent = prompt.Parent
                local pos = parent:IsA("BasePart") and parent.Position
                    or (parent:IsA("Model") and parent:GetPivot().Position)
                if pos then
                    local mutation = model:GetAttribute("Mutation")
                    local mutMult = num(model:GetAttribute("MutationMultiplier")) or 1
                    out[#out + 1] = {
                        model = model, prompt = prompt, pos = pos,
                        price = num(model:GetAttribute("Price")) or 0,
                        rarity = model:GetAttribute("Rarity"),
                        mutation = mutation, mutMult = mutMult,
                    }
                end
            end
        end
    end
    table.sort(out, function(a, b)
        if a.price ~= b.price then return a.price > b.price end
        return (a.mutMult or 1) > (b.mutMult or 1)
    end)
    return out
end

local function carried()
    local data = invoke(fn("Fish", "[C-S]GetCarryFishData"))
    if type(data) ~= "table" then return {}, 0, 0 end
    return data.Items or {}, tonumber(data.Count) or 0, tonumber(data.Capacity) or 0
end

local function tankState()
    local ui = invoke(fn("FishShow", "[C-S]GetUIState"))
    if type(ui) ~= "table" then return nil end
    STATE.displayed = tonumber(ui.displayedCount) or 0
    STATE.slots = tonumber(ui.unlockedSlots) or 0
    return ui
end

local function claimNearby(budgetSeconds, minPrice)
    local list = claimableFish()
    if #list == 0 then return 0 end
    if minPrice and minPrice > 0 then
        local keep = {}
        for _, fish in ipairs(list) do
            if fish.price >= minPrice then keep[#keep + 1] = fish end
        end
        list = keep
        if #list == 0 then return 0 end
    end
    local _, count, capacity = carried()
    local taken = 0
    local t0 = os.clock()
    for _, fish in ipairs(list) do
        if count + taken >= math.max(1, capacity) then break end
        if os.clock() - t0 > (budgetSeconds or 8) then break end
        local _, had = carried()
        local unpin = pin(function() return fish.pos + Vector3.new(0, 3, 0) end)
        task.wait(CONFIG.settle)
        pcall(function() fireproximityprompt(fish.prompt) end)
        task.wait(0.3)
        unpin()
        local _, now = carried()
        if now > had then
            taken = taken + 1
            STATE.claimed = STATE.claimed + 1
            note("claimed " .. tostring(fish.rarity) .. " " .. short(fish.price))
        else
            break
        end
    end
    return taken
end

local function plotButtons()
    local plot = workspace:FindFirstChild(tostring(LocalPlayer:GetAttribute("FishShowPlotId")))
    if not plot then return nil, nil end
    local function posOf(name)
        local part = plot:FindFirstChild(name, true)
        if not part then return nil end
        if part:IsA("BasePart") then return part.Position end
        if part:IsA("Model") then return part:GetPivot().Position end
        local inner = part:FindFirstChildWhichIsA("BasePart", true)
        return inner and inner.Position
    end
    return posOf(PLACE_BUTTON), posOf(COLLECT_BUTTON)
end

-- ================================================================
-- AUTO SELL FISH (DARI DECOMPILE SCRIPTS)
-- ================================================================

-- Sell all fish function
local function sellAllFish(force)
    local before = STATE.cash
    local sellRemote = fn("Fish", "[C-S]SellAllFish")
    
    if not sellRemote then
        note("Sell remote not found!")
        return false
    end
    
    -- Jika force enabled, kita coba sell dengan parameter
    if force or CONFIG.sellProtected then
        -- Coba sell semua termasuk protected
        local result = invoke(sellRemote)
        task.wait(0.3)
        refresh()
        local gained = STATE.cash - before
        if gained > 0 then
            STATE.sold = STATE.sold + 1
            note("Force sold fish for " .. short(gained))
            return true
        end
    end
    
    -- Sell normal (tidak menjual protected)
    local result = invoke(sellRemote)
    task.wait(0.3)
    refresh()
    local gained = STATE.cash - before
    if gained > 0 then
        STATE.sold = STATE.sold + 1
        note("Sold fish for " .. short(gained))
        return true
    end
    
    return false
end

-- Auto Sell Loop (Independent)
local function autoSellLoop()
    while GEN == _G.__DRAINWATER do
        if not CONFIG.autoSellFish then
            task.wait(0.5)
            continue
        end
        
        local _, count, capacity = carried()
        
        -- Cek apakah sudah waktunya sell (berdasarkan threshold)
        if capacity > 0 and count >= capacity * CONFIG.sellThreshold then
            withLock("auto_sell", function()
                sellAllFish(CONFIG.sellProtected)
                STATE.lastSellTime = os.clock()
            end)
        elseif CONFIG.autoSellFish and os.clock() - STATE.lastSellTime > CONFIG.sellInterval then
            -- Sell periodik jika ada fish dan belum sell dalam interval
            if count > 0 then
                withLock("auto_sell", function()
                    sellAllFish(CONFIG.sellProtected)
                    STATE.lastSellTime = os.clock()
                end)
            end
        end
        
        task.wait(1)
    end
end

-- ================================================================
-- PLOT TRIP (DENGAN AUTO SELL)
-- ================================================================
local function plotTrip()
    local placePos, collectPos = plotButtons()
    if not placePos then note("no plot found") return false end

    local unpin = pin(function() return placePos + Vector3.new(0, 4, 0) end)
    task.wait(CONFIG.settle + 0.4)
    local ui = tankState()

    local inventory = {}
    if ui and type(ui.items) == "table" then
        for _, item in pairs(ui.items) do
            if type(item) == "table" and item.uid then inventory[#inventory + 1] = item end
        end
    end
    table.sort(inventory, function(a, b)
        return (tonumber(a.price) or 0) > (tonumber(b.price) or 0)
    end)

    local free = math.max(0, (STATE.slots or 0) - (STATE.displayed or 0))
    for _, item in ipairs(inventory) do
        if free <= 0 or not CONFIG.display then break end
        local reply = invoke(fn("FishShow", "[C-S]PlaceFishUI"), item.uid)
        if type(reply) == "table" and reply.success then
            STATE.placed = STATE.placed + 1
            free = free - 1
            note("displayed " .. tostring(item.name) .. " " .. short(item.price))
        end
        task.wait(0.15)
    end
    invoke(fn("FishShow", "[C-S]BestFishUI"))

    -- AUTO SELL (dari display)
    if CONFIG.sell or CONFIG.autoSellFish then
        sellAllFish(CONFIG.sellProtected)
    end

    if collectPos then
        unpin()
        unpin = pin(function() return collectPos + Vector3.new(0, 4, 0) end)
        task.wait(CONFIG.settle)
        refresh()
    end
    unpin()
    tankState()
    return true
end

-- ================================================================
-- DRAIN LOOP (INDEPENDENT)
-- ================================================================
local function drainLoop()
    while GEN == _G.__DRAINWATER do
        if not CONFIG.drain then
            task.wait(0.5)
            continue
        end
        
        refresh()
        local stageId = STATE.stage
        local pool = poolOf(stageId)
        if not pool then note("no pool for stage " .. stageId) task.wait(1) continue end

        local unpin = pin(function()
            local current = value("Stage", "stage", stageId)
            local part = (current == stageId) and pool or poolOf(current)
            if part then
                if current ~= stageId then stageId, pool = current, part end
                return poolStand(part)
            end
            return nil
        end)

        local t0 = os.clock()
        while CONFIG.drain and GEN == _G.__DRAINWATER do
            task.wait(0.5)
            refresh()
            local left = remainingOf(STATE.stage)
            STATE.remaining = left or 0
            local dt = os.clock() - t0
            if left and dt > 0.5 then
                STATE.rate = math.max(0, left / dt)
            end
            note(string.format("stage %d   %s left   %s/s   pump x%s",
                STATE.stage, short(STATE.remaining), short(STATE.rate), short(STATE.pumpMult)))
            local _, count, capacity = carried()
            
            -- Auto sell check dalam drain loop
            if CONFIG.autoSellFish and capacity > 0 and count >= capacity * CONFIG.sellThreshold then
                unpin()
                withLock("auto_sell", function()
                    sellAllFish(CONFIG.sellProtected)
                    STATE.lastSellTime = os.clock()
                end)
                -- Re-pin setelah sell
                unpin = pin(function()
                    local current = value("Stage", "stage", stageId)
                    local part = (current == stageId) and pool or poolOf(current)
                    if part then
                        if current ~= stageId then stageId, pool = current, part end
                        return poolStand(part)
                    end
                    return nil
                end)
            end
            
            if count >= math.max(1, capacity) then break end
            if os.clock() - t0 > CONFIG.diveSeconds then break end
        end
        unpin()
        
        if not CONFIG.drain then break end
        
        if CONFIG.fish then
            withLock("harvest", function()
                local best = 0
                for _, fish in ipairs(claimableFish()) do
                    if fish.price > best then best = fish.price end
                end
                claimNearby(12, best * CONFIG.claimShare)
            end)
        end
        
        local _, count, capacity = carried()
        if CONFIG.fish and count > 0 and (capacity > 0 and count >= capacity * CONFIG.fillRatio) then
            withLock("plot", function() plotTrip() end)
        end
        
        task.wait(0.5)
    end
end

-- ================================================================
-- ADVANCED FEATURES (INDEPENDENT)
-- ================================================================

local function autoUpgradeTrainingArea()
    if not CONFIG.autoTrainingArea then return end
    if not TrainingAreaHelper then return end
    if not TrainingAreaConfig then return end
    
    local currentArea = STATE.trainingArea or 1
    local nextArea = currentArea + 1
    
    if nextArea > CONFIG.maxTrainingArea then return end
    
    local config = TrainingAreaConfig[tostring(nextArea)]
    if not config then return end
    
    local rebirthRequired = config.rebirthRequired or 0
    if STATE.rebirth < rebirthRequired then return end
    
    local price = TrainingAreaHelper.GetMiningPrice and TrainingAreaHelper.GetMiningPrice(nextArea)
    if price and STATE.cash >= price then
        local remote = ev("Training", "[C-S]BuyTrainingArea")
        if remote then
            pcall(function() remote:FireServer(nextArea) end)
            task.wait(0.5)
            refresh()
            STATE.trainingArea = nextArea
            note("Upgraded to Training Area " .. nextArea .. " (x" .. config.multiplier .. ")")
        end
    end
end

local function autoSpin()
    if not CONFIG.autoSpin then return end
    if not SpinHelper then return end
    
    local spinData = invoke(fn("Spin", "[C-S]GetSpinData"))
    if not spinData or spinData.availableSpins <= 0 then return end
    
    local remote = ev("Spin", "[C-S]Spin")
    if remote then
        local success, reward = pcall(function() return remote:InvokeServer() end)
        if success and reward then
            STATE.spinCount = STATE.spinCount + 1
            note("Spin reward: " .. tostring(reward))
        end
    end
end

local function autoBuyShopItems()
    if not CONFIG.autoShopItems then return end
    if not ShopHelper then return end
    
    local configs = ShopHelper.GetAllConfig and ShopHelper.GetAllConfig()
    if not configs then return end
    
    for key, item in pairs(configs) do
        if item.kind == "CashMultiplier" and CONFIG.autoBuyStamina then
            local remote = ev("Shop", "[C-S]BuyProduct")
            if remote then
                pcall(function() remote:FireServer(key) end)
                task.wait(0.3)
            end
        elseif item.kind == "RepeatableProduct" and CONFIG.autoClaimLimitedFish then
            local stock = Workspace:GetAttribute("MechaGaiokaRemaining") or 0
            if stock > 0 then
                local remote = ev("Shop", "[C-S]BuyProduct")
                if remote then
                    pcall(function() remote:FireServer(key) end)
                    STATE.limitedFishClaimed = STATE.limitedFishClaimed + 1
                    task.wait(0.5)
                end
            end
        end
    end
end

local function autoUpgradePets()
    if not CONFIG.autoPetUpgrade then return end
    if not PetHelper then return end
    
    local equip = ev("Pet", "EquipBest")
    if equip then pcall(function() equip:FireServer() end) end
    
    local petData = invoke(fn("Pet", "GetPlayerPetData"))
    if not petData then return end
    
    local allPets = PetHelper.GetAllPetConfig and PetHelper.GetAllPetConfig()
    if not allPets then return end
    
    local bestPet = nil
    local bestValue = 0
    
    for id, config in pairs(allPets) do
        local value = (config.add or 0) * (config.luckWeight or 1)
        if value > bestValue then
            bestValue = value
            bestPet = id
        end
    end
    
    if bestPet then
        for _, pet in pairs(petData.UnEquipPet or {}) do
            if pet.ID == tonumber(bestPet) and pet.Star < 3 then
                local upgrade = ev("Pet", "UpgradePet")
                if upgrade then
                    pcall(function() upgrade:FireServer(pet.UID) end)
                    task.wait(0.2)
                end
            end
        end
    end
end

local function autoFishTraining()
    if not CONFIG.autoFishTraining then return end
    
    local plotId = LocalPlayer:GetAttribute("FishShowPlotId")
    if not plotId then return end
    
    local remote = ev("Fish", "[C-S]TrainFish")
    if remote then
        pcall(function() remote:FireServer() end)
        task.wait(0.3)
    end
end

local function autoClaimLimitedFish()
    if not CONFIG.autoClaimLimitedFish then return end
    
    local available = Workspace:GetAttribute("MechaGaiokaStockAvailable") == true
    local soldOut = Workspace:GetAttribute("MechaGaiokaSoldOut") == true
    local remaining = Workspace:GetAttribute("MechaGaiokaRemaining") or 0
    
    if available and not soldOut and remaining > 0 then
        local buy = ev("Fish", "[C-S]BuyLimitedFish")
        if buy then
            pcall(function() buy:FireServer() end)
            task.wait(0.5)
            STATE.limitedFishClaimed = STATE.limitedFishClaimed + 1
            note("Claimed limited fish! Remaining: " .. (remaining - 1))
        end
    end
end

local function autoClaimBestFishReward()
    local state = invoke(fn("FishShow", "[C-S]GetState"))
    if state and state.bestFishReward and state.bestFishReward.amount > 0 then
        local claim = fn("FishShow", "[C-S]ClaimBestFishReward")
        if claim then
            local result = invoke(claim)
            if result and result.success then
                note("Claimed Best Fish Reward")
            end
        end
    end
end

local function autoClaimOfflineCash()
    if not CONFIG.offline then return end
    
    local state = invoke(fn("FishShow", "[C-S]GetState"))
    if state and state.offlinePendingCash and state.offlinePendingCash > 0 then
        local claim = fn("FishShow", "[C-S]ClaimOfflineCash")
        if claim then
            local result = invoke(claim)
            if result and result.success then
                note("Claimed offline cash: " .. short(state.offlinePendingCash))
            end
        end
    end
end

-- ================================================================
-- SPENDING (INDEPENDENT)
-- ================================================================
local function configModule(name)
    local root = ReplicatedStorage:FindFirstChild("Config") or ReplicatedStorage
    local module = root:FindFirstChild(name, true)
    if not module then return nil end
    local ok, loaded = pcall(require, module)
    return ok and loaded or nil
end

local function ladderBuy(helper, getter, buyEvent, equipEvent, ownedGetter, label)
    local cfg = configModule(helper)
    local all = cfg and cfg[getter] and select(2, pcall(cfg[getter]))
    if type(all) ~= "table" then return false end

    local owned = {}
    local data = invoke(ownedGetter)
    if type(data) == "table" and type(data.Owned) == "table" then
        for id, flag in pairs(data.Owned) do
            if flag then owned[tostring(id)] = true end
        end
    end
    local equipped = type(data) == "table" and data.Equipped or nil

    local best
    for id, entry in pairs(all) do
        local price = num(entry.cashPrice)
        local mult = num(entry.multiplier) or 0
        if price and price <= STATE.cash then
            if not best or mult > best.mult then best = { id = id, mult = mult, price = price,
                name = tostring(entry.name or id) }
            end
        end
    end
    if not best then return false end

    local currentMult = 0
    for id, entry in pairs(all) do
        if tostring(id) == tostring(equipped) then currentMult = num(entry.multiplier) or 0 end
    end
    if best.mult <= currentMult then return false end

    local before = STATE.cash
    if not owned[tostring(best.id)] then
        pcall(function() buyEvent:FireServer(best.id) end)
        task.wait(0.2)
    end
    pcall(function() equipEvent:FireServer(best.id) end)
    task.wait(0.3)
    refresh()
    if STATE.cash < before or best.mult > currentMult then
        note(label .. " " .. best.name .. "  x" .. tostring(best.mult))
        return true
    end
    return false
end

local function buyPump()
    if not CONFIG.pumps then return false end
    if not rawget(_G, "__DRAINWATER_PUMPCFG") then
        local cfg = configModule("PumpHelper")
        local all = cfg and cfg.GetAllPumpConfig and select(2, pcall(cfg.GetAllPumpConfig))
        if type(all) == "table" then _G.__DRAINWATER_PUMPCFG = all end
    end
    return ladderBuy("PumpHelper", "GetAllPumpConfig",
        ev("Pump", "[C-S]BuyCashPump"), ev("Pump", "[C-S]EquipPump"),
        fn("Pump", "[C-S]GetPumpData"), "pump")
end

local function buyAura()
    if not CONFIG.auras then return false end
    return ladderBuy("AuraHelper", "GetAllAuraConfig",
        ev("Aura", "[C-S]BuyCashAura"), ev("Aura", "[C-S]EquipAura"),
        fn("Aura", "[C-S]GetAuraData"), "aura")
end

local function pumpReserve()
    local cfg = rawget(_G, "__DRAINWATER_PUMPCFG")
    if type(cfg) ~= "table" then return 0 end
    local cheapest
    for id, entry in pairs(cfg) do
        local price = num(entry.cashPrice)
        local mult = num(entry.multiplier) or 0
        if price and price > 0 and mult > (STATE.pumpMult or 0) then
            if not cheapest or price < cheapest then cheapest = price end
        end
    end
    if not cheapest then return 0 end
    return (cheapest <= STATE.cash * CONFIG.pumpReach) and cheapest or 0
end

local function spendable()
    local reserve = pumpReserve()
    STATE.reserve = reserve
    return math.max(0, STATE.cash - reserve)
end

local UPGRADE_ORDER = { "Backpack", "FishDisplay", "Speed" }

local function buyUpgrades()
    if not CONFIG.upgrades then return false end
    local data = invoke(fn("Upgrade", "[C-S]GetUpgradeData"))
    if type(data) ~= "table" then return false end
    local remote = ev("Upgrade", "[C-S]BuyCashUpgrade")
    if not remote then return false end
    local bought = false
    for _, name in ipairs(UPGRADE_ORDER) do
        local row = data[name]
        local price = num(row and (row.price or row.cost))
        local blocked = price and price > spendable()
        if type(row) == "table" and not blocked
            and (num(row.level) or 0) < (num(row.maxLevel) or 0) then
            local before = STATE.cash
            pcall(function() remote:FireServer(name) end)
            task.wait(0.3)
            refresh()
            if STATE.cash < before then
                note("upgrade " .. name .. " -> " .. tostring((num(row.level) or 0) + 1))
                bought = true
            end
        end
    end
    return bought
end

local function openEggs()
    if not CONFIG.eggs then return false end
    local cfg = configModule("EggHelper")
    local all = cfg and cfg.GetAllEggConfig and select(2, pcall(cfg.GetAllEggConfig))
    if type(all) ~= "table" then return false end
    local best
    for id, entry in pairs(all) do
        local price = num(entry.cashPrice)
        if price and price <= spendable() then
            if not best or price > best.price then best = { id = id, price = price } end
        end
    end
    if not best then return false end
    local can = invoke(fn("Egg", "[C-S]CanOpenEgg"), best.id, 1)
    if can == false then return false end
    local before = STATE.cash
    invoke(fn("Egg", "[C-S]OpenEgg"), best.id, 1)
    task.wait(0.5)
    refresh()
    if STATE.cash < before then
        note("egg " .. tostring(best.id) .. " opened")
        if CONFIG.pets then
            local equip = ev("Pet", "EquipBest")
            if equip then pcall(function() equip:FireServer() end) end
        end
        return true
    end
    return false
end

local function mergePets()
    if not CONFIG.merge then return false end
    local getData = fn("Pet", "GetPlayerPetData")
    local craft = ev("Pet", "CraftPet")
    if not (getData and craft) then return false end

    local merged = 0
    for _ = 1, 10 do
        local data = invoke(getData)
        if type(data) ~= "table" then break end
        local groups, total = {}, 0
        for _, list in ipairs({ data.UnEquipPet or {}, data.EquipPet or {} }) do
            for _, pet in pairs(list) do
                if not pet.isLock then
                    local key = tostring(pet.ID) .. "*" .. tostring(pet.Star)
                    groups[key] = groups[key] or { id = pet.ID, count = 0, name = pet.Name }
                    groups[key].count = groups[key].count + 1
                end
                total = total + 1
            end
        end
        local pick
        for _, group in pairs(groups) do
            if group.count >= 3 and (not pick or group.count > pick.count) then pick = group end
        end
        if not pick then break end

        pcall(function() craft:FireServer(pick.id) end)
        task.wait(0.5)
        local after = invoke(getData)
        local newTotal = 0
        if type(after) == "table" then
            for _, list in ipairs({ after.UnEquipPet or {}, after.EquipPet or {} }) do
                for _ in pairs(list) do newTotal = newTotal + 1 end
            end
        end
        if newTotal >= total then break end
        merged = merged + 1
        note("merged 3x " .. tostring(pick.name))
    end
    if merged > 0 then
        local equip = ev("Pet", "EquipBest")
        if equip then pcall(function() equip:FireServer() end) end
    end
    return merged > 0
end

local function doRebirth()
    if not CONFIG.rebirth then return false end
    local remote = ev("Rebirth", "[C - S]TryRebirth")
        or ev("Rebirth", "[C-S]TryRebirth")
    if not remote then return false end
    local before = STATE.rebirth
    if CONFIG.rebirthUntil > 0 and before >= CONFIG.rebirthUntil then return false end
    pcall(function() remote:FireServer() end)
    task.wait(0.8)
    refresh()
    if STATE.rebirth > before then
        note("rebirth " .. STATE.rebirth)
        return true
    end
    return false
end

-- ================================================================
-- ADVANCED INDEPENDENT LOOPS
-- ================================================================

task.spawn(function()
    while GEN == _G.__DRAINWATER do
        pcall(autoUpgradeTrainingArea)
        pcall(autoBuyShopItems)
        pcall(autoClaimLimitedFish)
        pcall(autoFishTraining)
        pcall(autoClaimBestFishReward)
        
        if SpinHelper and CONFIG.autoSpin and STATE.spinCount % CONFIG.spinInterval == 0 then
            pcall(autoSpin)
        end
        
        task.wait(5)
    end
end)

task.spawn(function()
    while GEN == _G.__DRAINWATER do
        if CONFIG.autoPetUpgrade then
            pcall(autoUpgradePets)
        end
        task.wait(10)
    end
end)

-- ================================================================
-- MAIN FARM LOOP
-- ================================================================
task.spawn(function()
    while GEN == _G.__DRAINWATER do
        if CONFIG.auto then
            local lastSpend = 0
            
            while CONFIG.auto and GEN == _G.__DRAINWATER do
                refresh()
                
                if CONFIG.offline then
                    pcall(autoClaimOfflineCash)
                end
                
                if CONFIG.pumps then pcall(buyPump) end
                if CONFIG.upgrades then pcall(buyUpgrades) end
                if CONFIG.auras then pcall(buyAura) end
                if CONFIG.eggs then pcall(openEggs) end
                if CONFIG.pets then
                    if CONFIG.merge then pcall(mergePets) end
                end
                if CONFIG.display then pcall(function() invoke(fn("FishShow", "[C-S]BestFishUI")) end) end
                if CONFIG.rebirth then pcall(doRebirth) end
                
                task.wait(1)
            end
        else
            task.wait(0.5)
        end
    end
end)

-- ================================================================
-- BACKGROUND LOOPS
-- ================================================================

task.spawn(clickLoop)
task.spawn(drainLoop)
task.spawn(autoSellLoop) -- Auto sell loop independent

task.spawn(function()
    while GEN == _G.__DRAINWATER do
        refresh()
        task.wait(0.5)
    end
end)

-- Load pump config
do
    local cfg = configModule("PumpHelper")
    local all = cfg and cfg.GetAllPumpConfig and select(2, pcall(cfg.GetAllPumpConfig))
    if type(all) == "table" then _G.__DRAINWATER_PUMPCFG = all end
end



-- ================================================================
-- MOVEMENT & PLAYER UTILITY HOOKS
-- ================================================================
RunService.Stepped:Connect(function()
    if CONFIG.noclip then
        local c = LocalPlayer.Character
        if c then
            for _, part in ipairs(c:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if CONFIG.infiniteJump then
        local _, _, h = char()
        if h then
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)


-- ================================================================
-- CREATE WINDOW (PINATHUB BRANDING - PinatHub MODERN STYLE)
-- ================================================================
local Window = Library:NewWindow({
    Title = "PinatHub | Drain Water",
    Description = "Control Center",
    Size = UDim2.fromOffset(630, 390)
})

Window:SetToggleKey(Enum.KeyCode.RightShift)

-- FULL SHUTDOWN HOOK ON CLOSE
Window:OnClose(function()
    _G.__DRAINWATER = (_G.__DRAINWATER or 0) + 1
    for k, _ in pairs(CONFIG) do
        if type(CONFIG[k]) == "boolean" then
            CONFIG[k] = false
        end
    end
    pcall(function()
        local _, _, h = char()
        if h then
            h.WalkSpeed = 16
            h.JumpPower = 50
        end
    end)
    warn("[PinatHub] Full shutdown completed. All features and loops stopped.")
end)

-- Welcome Toast Notification
Library:Notify({
    Title = "PinatHub | Drain Water",
    Content = "Successfully initialized!\nPress RightShift or click floating logo to toggle.",
    Type = "Success",
    Duration = 4
})

-- ================================================================
-- CREATE TABS (100% UNIQUE ICONS - NO DUPLICATES, NO BLANKS)
-- ================================================================
local Tabs = {}

Tabs.Farm = Window:T("Auto Farm", "rbxassetid://10723344432", "Drain Water Controls")
Tabs.Upgrades = Window:T("Upgrades", "rbxassetid://10709768939", "Upgrade Settings")
Tabs.Fish = Window:T("Fish & Pets", "rbxassetid://10709761530", "Fish and Pet Settings")
Tabs.Sell = Window:T("Auto Sell", "rbxassetid://10723343958", "Auto Sell Fish Settings")
Tabs.Advanced = Window:T("Advanced", "rbxassetid://10747383470", "Advanced & Utilities")
Tabs.Stats = Window:T("Live Stats", "rbxassetid://10709770317", "Real-time Telemetry")
Tabs.Community = Window:T("Community", "rbxassetid://10747373426", "Join PinatHub Community")

-- ================================================================
-- 1. AUTO FARM TAB
-- ================================================================
local farmSection = Tabs.Farm:AddSection("Auto Farm")

farmSection:AddToggle({
    Title = "MASTER SWITCH",
    Description = "Enable/Disable all auto farm components",
    Default = CONFIG.auto,
    Callback = function(v)
        CONFIG.auto = v
        note(v and "auto running" or "auto stopped")
        Library:Notify({
            Title = "Master Switch",
            Content = v and "All Auto Features ENABLED!" or "All Auto Features DISABLED",
            Type = v and "Success" or "Info",
            Duration = 2
        })
    end
})

farmSection:AddSeperator()

farmSection:AddToggle({
    Title = "Drain pools",
    Description = "Stand in the current stage pool - presence alone drains it",
    Default = CONFIG.drain,
    Callback = function(v)
        CONFIG.drain = v
        if v then Library:Notify({ Title = "Drain", Content = "Drain ACTIVE (Independent)", Type = "Success", Duration = 2 }) end
    end
})

farmSection:AddToggle({
    Title = "Click",
    Description = "Only feeds the level bar; server credits about 15/s at most",
    Default = CONFIG.click,
    Callback = function(v)
        CONFIG.click = v
        if v then Library:Notify({ Title = "Click", Content = "Click ACTIVE (Independent)", Type = "Success", Duration = 2 }) end
    end
})

farmSection:AddSlider({
    Title = "Clicks/sec",
    Min = 4,
    Max = 50,
    Default = CONFIG.clickRate,
    Increment = 1,
    Callback = function(v) CONFIG.clickRate = math.floor(v) end
})

farmSection:AddToggle({
    Title = "Claim fish",
    Description = "Only pools you have already drained hand their fish over",
    Default = CONFIG.fish,
    Callback = function(v)
        CONFIG.fish = v
        if v then Library:Notify({ Title = "Claim Fish", Content = "Fish Claim ACTIVE (Independent)", Type = "Success", Duration = 2 }) end
    end
})

farmSection:AddToggle({
    Title = "Display best fish",
    Description = "A displayed fish pays 10% of its price every minute, forever",
    Default = CONFIG.display,
    Callback = function(v)
        CONFIG.display = v
        if v then Library:Notify({ Title = "Display", Content = "Display ACTIVE (Independent)", Type = "Success", Duration = 2 }) end
    end
})

farmSection:AddSeperator()

farmSection:AddToggle({
    Title = "Auto rebirth",
    Description = "Resets the stage run, multiplies water and cash",
    Default = CONFIG.rebirth,
    Callback = function(v)
        CONFIG.rebirth = v
        if v then Library:Notify({ Title = "Rebirth", Content = "Auto Rebirth ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

farmSection:AddSlider({
    Title = "Dive seconds",
    Min = 10,
    Max = 120,
    Default = CONFIG.diveSeconds,
    Increment = 1,
    Callback = function(v) CONFIG.diveSeconds = v end
})

-- Extended Farm Tuning Section
local farmSettingsSection = Tabs.Farm:AddSection("Farm Tuning & Radius")

farmSettingsSection:AddSlider({
    Title = "Claim Radius (studs)",
    Min = 5,
    Max = 50,
    Default = CONFIG.claimRadius,
    Increment = 1,
    Callback = function(v) CONFIG.claimRadius = math.floor(v) end
})

farmSettingsSection:AddSlider({
    Title = "Pump Reach Multiplier",
    Min = 1,
    Max = 10,
    Default = math.floor(CONFIG.pumpReach),
    Increment = 0.5,
    Callback = function(v) CONFIG.pumpReach = v end
})

farmSettingsSection:AddSlider({
    Title = "Rebirth Target Stage",
    Min = 0,
    Max = 100,
    Default = CONFIG.rebirthUntil,
    Increment = 1,
    Callback = function(v) CONFIG.rebirthUntil = math.floor(v) end
})

farmSettingsSection:AddSlider({
    Title = "Plot Settle Delay (s)",
    Min = 0.1,
    Max = 3,
    Default = CONFIG.settle,
    Increment = 0.1,
    Callback = function(v) CONFIG.settle = v end
})

farmSettingsSection:AddButton({
    Title = "Unstuck Character",
    Description = "Stop auto and reset character busy state",
    Callback = function()
        CONFIG.auto = false
        STATE.busy = false
        note("unstuck, auto off")
        Library:Notify({ Title = "Unstuck", Content = "Auto disabled and state reset", Type = "Warning", Duration = 2 })
    end
})

-- ================================================================
-- 2. UPGRADES TAB
-- ================================================================
local upgradeSection = Tabs.Upgrades:AddSection("Upgrades")

upgradeSection:AddToggle({
    Title = "Buy pumps",
    Description = "The pump multiplies the drain, bought first",
    Default = CONFIG.pumps,
    Callback = function(v)
        CONFIG.pumps = v
        if v then Library:Notify({ Title = "Pumps", Content = "Auto Pumps ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

upgradeSection:AddToggle({
    Title = "Buy upgrades",
    Description = "FishDisplay and Backpack first, widen the pipeline",
    Default = CONFIG.upgrades,
    Callback = function(v)
        CONFIG.upgrades = v
        if v then Library:Notify({ Title = "Upgrades", Content = "Auto Upgrades ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

upgradeSection:AddToggle({
    Title = "Buy auras",
    Description = "Buy aura upgrades",
    Default = CONFIG.auras,
    Callback = function(v)
        CONFIG.auras = v
        if v then Library:Notify({ Title = "Auras", Content = "Auto Auras ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

upgradeSection:AddToggle({
    Title = "Open eggs",
    Description = "Cash eggs only; Robux eggs have no cash price and are skipped",
    Default = CONFIG.eggs,
    Callback = function(v)
        CONFIG.eggs = v
        if v then Library:Notify({ Title = "Eggs", Content = "Auto Eggs ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

upgradeSection:AddToggle({
    Title = "Free rewards",
    Description = "Offline earnings and tank pending cash",
    Default = CONFIG.offline,
    Callback = function(v)
        CONFIG.offline = v
        if v then Library:Notify({ Title = "Free Rewards", Content = "Auto Claim Rewards ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

upgradeSection:AddToggle({
    Title = "Merge pets",
    Description = "Three of a kind into one better one, locked pets are left alone",
    Default = CONFIG.merge,
    Callback = function(v)
        CONFIG.merge = v
        if v then Library:Notify({ Title = "Merge Pets", Content = "Auto Merge Pets ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

upgradeSection:AddToggle({
    Title = "Pets",
    Description = "Equip best pet after every hatch",
    Default = CONFIG.pets,
    Callback = function(v)
        CONFIG.pets = v
        if v then Library:Notify({ Title = "Pets", Content = "Auto Pets ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

upgradeSection:AddSlider({
    Title = "Spend every (seconds)",
    Min = 3,
    Max = 60,
    Default = CONFIG.spendEvery,
    Increment = 1,
    Callback = function(v) CONFIG.spendEvery = v end
})

-- ================================================================
-- 3. FISH & PETS TAB
-- ================================================================
local fishSection = Tabs.Fish:AddSection("Fish & Pets Settings")

fishSection:AddToggle({
    Title = "Display best fish",
    Description = "A displayed fish pays 10% of its price every minute, forever",
    Default = CONFIG.display,
    Callback = function(v) CONFIG.display = v end
})

fishSection:AddToggle({
    Title = "Merge pets",
    Description = "Three of a kind into one better one, locked pets are left alone",
    Default = CONFIG.merge,
    Callback = function(v) CONFIG.merge = v end
})

fishSection:AddToggle({
    Title = "Pets",
    Description = "Equip best pet after every hatch",
    Default = CONFIG.pets,
    Callback = function(v) CONFIG.pets = v end
})

fishSection:AddSlider({
    Title = "Harvest after (seconds)",
    Min = 5,
    Max = 45,
    Default = CONFIG.harvestAfter,
    Increment = 1,
    Callback = function(v) CONFIG.harvestAfter = v end
})

fishSection:AddSlider({
    Title = "Stall seconds",
    Min = 10,
    Max = 90,
    Default = CONFIG.stallSeconds,
    Increment = 1,
    Callback = function(v) CONFIG.stallSeconds = v end
})

fishSection:AddSlider({
    Title = "Claim share (%)",
    Min = 5,
    Max = 90,
    Default = math.floor(CONFIG.claimShare * 100),
    Increment = 1,
    Callback = function(v) CONFIG.claimShare = v / 100 end
})

fishSection:AddSlider({
    Title = "Topup share (%)",
    Min = 5,
    Max = 90,
    Default = math.floor(CONFIG.topupShare * 100),
    Increment = 1,
    Callback = function(v) CONFIG.topupShare = v / 100 end
})

fishSection:AddSlider({
    Title = "Backpack Fill Ratio (%)",
    Min = 50,
    Max = 100,
    Default = math.floor(CONFIG.fillRatio * 100),
    Increment = 1,
    Callback = function(v) CONFIG.fillRatio = v / 100 end
})

-- ================================================================
-- 4. AUTO SELL TAB
-- ================================================================
local sellSection = Tabs.Sell:AddSection("Auto Sell Fish")

sellSection:AddToggle({
    Title = "Auto Sell Fish",
    Description = "Enable automatic fish selling when backpack is full",
    Default = CONFIG.autoSellFish,
    Callback = function(v)
        CONFIG.autoSellFish = v
        Library:Notify({
            Title = "Auto Sell",
            Content = v and "Auto Sell Fish ACTIVE" or "Auto Sell Fish DISABLED",
            Type = v and "Success" or "Info",
            Duration = 2
        })
    end
})

sellSection:AddToggle({
    Title = "Sell Protected Fish",
    Description = "⚠️ Sell fish even if protected (risky!)",
    Default = CONFIG.sellProtected,
    Callback = function(v)
        CONFIG.sellProtected = v
        if v then Library:Notify({ Title = "Warning", Content = "Sell Protected Fish ENABLED - Risky!", Type = "Warning", Duration = 3 }) end
    end
})

sellSection:AddSlider({
    Title = "Sell Threshold (%)",
    Min = 50,
    Max = 100,
    Default = math.floor(CONFIG.sellThreshold * 100),
    Increment = 1,
    Callback = function(v) CONFIG.sellThreshold = v / 100 end
})

sellSection:AddSlider({
    Title = "Sell Interval (seconds)",
    Min = 5,
    Max = 120,
    Default = CONFIG.sellInterval,
    Increment = 1,
    Callback = function(v) CONFIG.sellInterval = v end
})

sellSection:AddSeperator()

sellSection:AddButton({
    Title = "Sell All Fish Now",
    Description = "Force sell all fish immediately",
    Callback = function()
        task.spawn(function()
            withLock("manual_sell", function()
                local result = sellAllFish(true)
                if result then
                    Library:Notify({ Title = "Sell", Content = "Fish sold successfully!", Type = "Success", Duration = 2 })
                else
                    Library:Notify({ Title = "Sell", Content = "No fish to sell or failed", Type = "Warning", Duration = 2 })
                end
            end)
        end)
    end
})

-- ================================================================
-- 5. ADVANCED TAB & UTILITIES
-- ================================================================
local advancedSection = Tabs.Advanced:AddSection("Advanced Automation")

advancedSection:AddToggle({
    Title = "Auto Training Area",
    Description = "Upgrade training area for pump multiplier (x1.5 to x100)",
    Default = CONFIG.autoTrainingArea,
    Callback = function(v)
        CONFIG.autoTrainingArea = v
        if v then Library:Notify({ Title = "Training Area", Content = "Auto Training Area ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

advancedSection:AddToggle({
    Title = "Auto Spin",
    Description = "Auto use available spins",
    Default = CONFIG.autoSpin,
    Callback = function(v)
        CONFIG.autoSpin = v
        if v then Library:Notify({ Title = "Spin", Content = "Auto Spin ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

advancedSection:AddToggle({
    Title = "Auto Shop Items",
    Description = "Buy Stamina, Trophy and other shop items",
    Default = CONFIG.autoShopItems,
    Callback = function(v)
        CONFIG.autoShopItems = v
        if v then Library:Notify({ Title = "Shop Items", Content = "Auto Shop Items ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

advancedSection:AddToggle({
    Title = "Auto Pet Upgrade",
    Description = "Auto upgrade best pet stars to max",
    Default = CONFIG.autoPetUpgrade,
    Callback = function(v)
        CONFIG.autoPetUpgrade = v
        if v then Library:Notify({ Title = "Pet Upgrade", Content = "Auto Pet Upgrade ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

advancedSection:AddToggle({
    Title = "Auto Fish Training",
    Description = "Train fish in training area",
    Default = CONFIG.autoFishTraining,
    Callback = function(v)
        CONFIG.autoFishTraining = v
        if v then Library:Notify({ Title = "Fish Training", Content = "Auto Fish Training ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

advancedSection:AddToggle({
    Title = "Auto Claim Limited Fish",
    Description = "Auto claim Mecha Kunka limited fish",
    Default = CONFIG.autoClaimLimitedFish,
    Callback = function(v)
        CONFIG.autoClaimLimitedFish = v
        if v then Library:Notify({ Title = "Limited Fish", Content = "Auto Claim Limited Fish ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

advancedSection:AddToggle({
    Title = "Auto Buy Stamina",
    Description = "Auto buy 2x Cash multiplier",
    Default = CONFIG.autoBuyStamina,
    Callback = function(v)
        CONFIG.autoBuyStamina = v
        if v then Library:Notify({ Title = "Stamina", Content = "Auto Buy Stamina ACTIVE", Type = "Success", Duration = 2 }) end
    end
})

advancedSection:AddSlider({
    Title = "Max Training Area",
    Min = 1,
    Max = 9,
    Default = CONFIG.maxTrainingArea,
    Increment = 1,
    Callback = function(v) CONFIG.maxTrainingArea = math.floor(v) end
})

advancedSection:AddSlider({
    Title = "Spin Interval (spins)",
    Min = 1,
    Max = 20,
    Default = CONFIG.spinInterval,
    Increment = 1,
    Callback = function(v) CONFIG.spinInterval = math.floor(v) end
})

-- Section: Player & World Utilities
local utilSection = Tabs.Advanced:AddSection("Player & World Utilities")

utilSection:AddToggle({
    Title = "Anti-AFK Protection",
    Description = "Prevents Roblox 20-minute idle disconnect",
    Default = true,
    Callback = function(v)
        Library:Notify({
            Title = "Anti-AFK",
            Content = v and "Anti-AFK is ACTIVE" or "Anti-AFK disabled",
            Type = v and "Success" or "Info",
            Duration = 2
        })
    end
})

utilSection:AddToggle({
    Title = "Disable Shadows",
    Description = "Improves FPS and makes visibility clearer",
    Default = true,
    Callback = function(v)
        pcall(function() Lighting.GlobalShadows = not v end)
    end
})

utilSection:AddToggle({
    Title = "Fullbright Mode",
    Description = "Maximizes ambient lighting for clear vision",
    Default = false,
    Callback = function(v)
        pcall(function()
            if v then
                Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                Lighting.Brightness = 2
            else
                Lighting.Ambient = Color3.fromRGB(128, 128, 128)
                Lighting.Brightness = 1
            end
        end)
    end
})

utilSection:AddToggle({
    Title = "Infinite Jump",
    Description = "Jump continuously even while in mid-air",
    Default = false,
    Callback = function(v) CONFIG.infiniteJump = v end
})

utilSection:AddToggle({
    Title = "Noclip",
    Description = "Walk through walls and barriers smoothly",
    Default = false,
    Callback = function(v) CONFIG.noclip = v end
})

utilSection:AddSlider({
    Title = "WalkSpeed",
    Min = 16,
    Max = 120,
    Default = 16,
    Increment = 1,
    Callback = function(v)
        local _, _, h = char()
        if h then h.WalkSpeed = v end
    end
})

utilSection:AddSlider({
    Title = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Increment = 1,
    Callback = function(v)
        local _, _, h = char()
        if h then h.JumpPower = v end
    end
})

utilSection:AddButton({
    Title = "Rejoin Server",
    Description = "Reconnect to the same server instance",
    Callback = function()
        pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
    end
})

-- ================================================================
-- 6. LIVE STATS TAB (MODERN REAL-TIME WEBSITE STATS DASHBOARD)
-- ================================================================
local statsHeaderSec = Tabs.Stats:AddSection("Telemetry Control Center")

-- Status Header Pill
local statusPill = statsHeaderSec:AddParagraph({
    Title = "● LIVE TELEMETRY ENGINE",
    Content = "Streaming real-time water throughput, stage pipeline, and currency metrics..."
})

-- MODERN REAL-TIME DATA GRAPH SECTION
local graphSection = Tabs.Stats:AddSection("Live Water Drain Rate Graph (L/s)")

-- Built-in Real-Time Graph Component
local drainGraph = graphSection:AddGraph({
    Title = "DRAIN RATE THROUGHPUT",
    BarCount = 14,
    MaxValue = 100,
    Height = 110,
    BarColor = Library.Theme.Accent,
    BarGlow = Library.Theme.AccentGlow,
    Unit = "/s"
})

-- KPI METRICS CARDS
local metricsSec = Tabs.Stats:AddSection("Key Performance Metrics")

local ecoCard = metricsSec:AddParagraph({
    Title = "💰 Treasury & Resources",
    Content = "Cash: $0  |  Water: 0 L  |  Rate: 0/s"
})

local stageCard = metricsSec:AddParagraph({
    Title = "⚡ Stage Pipeline & Drain Power",
    Content = "Stage: 1 (Deepest: 1)  |  Remaining: 0\nPump: #1 (Multiplier: x1.00)"
})

local storageCard = metricsSec:AddParagraph({
    Title = "🎒 Aquarium & Backpack Storage",
    Content = "Displayed Fish: 0/0  |  Backpack: 0/0\nTotal Claimed: 0  |  Total Sold: 0"
})

local autoCard = metricsSec:AddParagraph({
    Title = "🏆 Automation & Progress",
    Content = "Level: 0  |  Rebirth: 0\nTraining Area: 1  |  Spins Used: 0"
})

local diagnosticCard = metricsSec:AddParagraph({
    Title = "⚙️ Diagnostics & Activity State",
    Content = "Phase: idle\nNote: Initialized"
})

-- REAL-TIME ANIMATED TELEMETRY WORKER
task.spawn(function()
    local graphHistory = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    while alive() do
        local rate = tonumber(STATE.rate) or 0
        table.remove(graphHistory, 1)
        table.insert(graphHistory, rate)

        -- Find peak rate in history for dynamic scaling
        local maxVal = 1
        for _, val in ipairs(graphHistory) do
            if val > maxVal then maxVal = val end
        end

        if drainGraph then
            drainGraph:SetMax(maxVal)
            drainGraph:Push(rate)
        end

        -- Update KPI Cards
        ecoCard:Set("💰 Treasury & Resources", string.format(
            "Total Cash: <font color='#4ade80'>$%s</font>\nTotal Water: <font color='#93c5fd'>%s L</font>\nReal-time Drain Flow: <font color='#c084fc'>%s/s</font>",
            short(STATE.cash), short(STATE.water), short(STATE.rate)
        ))

        stageCard:Set("⚡ Stage Pipeline & Drain Power", string.format(
            "Current Stage: Stage %d  (Deepest Record: Stage %d)\nRemaining Pool Water: %s\nEquipped Pump: #%d  |  Pump Multiplier: <font color='#fbbf24'>x%s</font>",
            STATE.stage, STATE.deepest, short(STATE.remaining), STATE.pump, short(STATE.pumpMult)
        ))

        local tankPct = (STATE.slots > 0) and math.floor((STATE.displayed / STATE.slots) * 100) or 0
        local bagPct = (STATE.capacity > 0) and math.floor((STATE.backpack / STATE.capacity) * 100) or 0
        storageCard:Set("🎒 Aquarium & Backpack Storage", string.format(
            "Tank Displayed: %d/%d (%d%% Filled)\nBackpack Storage: %d/%d (%d%% Filled)\nLifetime Fish Claimed: %d  |  Lifetime Fish Sold: %d",
            STATE.displayed, STATE.slots, tankPct,
            STATE.backpack, STATE.capacity, bagPct,
            STATE.claimed, STATE.sold
        ))

        autoCard:Set("🏆 Automation & Progress", string.format(
            "Player Level: %d  |  Rebirth Level: %d\nTraining Area: Area %d\nLucky Wheel Spins: %d  |  Limited Fish Caught: %d",
            STATE.level, STATE.rebirth,
            STATE.trainingArea or 1, STATE.spinCount or 0, STATE.limitedFishClaimed or 0
        ))

        local phaseColor = (STATE.phase == "idle") and "#94a3b8" or "#4ade80"
        diagnosticCard:Set("⚙️ Diagnostics & Activity State", string.format(
            "Active State: <font color='%s'><b>%s</b></font>\nLive Stream: %s",
            phaseColor, string.upper(tostring(STATE.phase)), tostring(STATE.note or "Standing by")
        ))

        task.wait(0.6)
    end
end)

-- ================================================================
-- 7. COMMUNITY TAB (ORIGINAL PINATHUB SOCIALS)
-- ================================================================
local communitySection = Tabs.Community:AddSection("Join PinatHub Community")

communitySection:AddParagraph({
    Title = "PinatHub Community",
    Content = "Join our community for updates, support, and the latest scripts!\nCreated with passion by @viunze on TikTok."
})

communitySection:AddDiscordCard({
    Title = "PinatHub | Community Hub",
    Members = "10.000+",
    Online = "500+",
    Invite = "https://discord.gg/ysHZCYFaX7"
})

communitySection:AddSeperator()

communitySection:AddButton({
    Title = "WhatsApp XploitForce (Komunitas Utama)",
    Description = "Komunitas Utama XploitForce WhatsApp",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp")
        end
        Library:Notify({
            Title = "Copied!",
            Content = "WhatsApp link copied to clipboard!",
            Type = "Success",
            Duration = 3
        })
    end
})

communitySection:AddButton({
    Title = "Discord Server",
    Description = "https://discord.gg/ysHZCYFaX7",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://discord.gg/ysHZCYFaX7")
        end
        Library:Notify({
            Title = "Copied!",
            Content = "Discord invite copied to clipboard!",
            Type = "Success",
            Duration = 3
        })
    end
})

communitySection:AddButton({
    Title = "TikTok @viunze",
    Description = "Follow on TikTok for script updates & tutorials",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://tiktok.com/@viunze")
        end
        Library:Notify({
            Title = "Copied!",
            Content = "TikTok profile link copied!",
            Type = "Success",
            Duration = 3
        })
    end
})

communitySection:AddButton({
    Title = "YouTube Channel",
    Description = "Subscribe for video showcases & tutorials",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://www.youtube.com/@viunzee1")
        end
        Library:Notify({
            Title = "Copied!",
            Content = "YouTube link copied!",
            Type = "Success",
            Duration = 3
        })
    end
})

communitySection:AddSeperator()

communitySection:AddParagraph({
    Title = "Support PinatHub",
    Content = "Kalau script ini membantu, like & share ke teman-teman! ❤️\nDukung developer dengan follow @viunze di TikTok & YouTube!"
})
