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
-- LOAD WINDUI (V2)
-- ================================================================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- PINATHUB Themes
WindUI:AddTheme({
    Name = "PinatDark",
    Accent = "#1a1a1e",
    Dialog = "#1a1a1e",
    Outline = "#8b5cf6",
    Text = "#ffffff",
    Placeholder = "#71717a",
    Background = "#0e0e10",
    Button = "#27272a",
    Icon = "#a1a1aa",
})

WindUI:AddTheme({
    Name = "PinatLight",
    Accent = "#f4f4f5",
    Dialog = "#f4f4f5",
    Outline = "#8b5cf6",
    Text = "#000000",
    Placeholder = "#666666",
    Background = "#ffffff",
    Button = "#e4e4e7",
    Icon = "#52525b",
})

WindUI:AddTheme({
    Name = "PinatPurple",
    Accent = "#581c87",
    Dialog = "#4c1d95",
    Outline = "#c4b5fd",
    Text = "#faf5ff",
    Placeholder = "#a78bfa",
    Background = "#2e1065",
    Button = "#7c3aed",
    Icon = "#c4b5fd",
})

WindUI:AddTheme({
    Name = "Dark",
    Accent = "#18181b",
    Dialog = "#18181b", 
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Placeholder = "#999999",
    Background = "#0e0e10",
    Button = "#52525b",
    Icon = "#a1a1aa",
})

WindUI:AddTheme({
    Name = "Light",
    Accent = "#f4f4f5",
    Dialog = "#f4f4f5",
    Outline = "#000000", 
    Text = "#000000",
    Placeholder = "#666666",
    Background = "#ffffff",
    Button = "#e4e4e7",
    Icon = "#52525b",
})

WindUI:AddTheme({
    Name = "Blue",
    Accent = "#1e40af",
    Dialog = "#1e3a8a",
    Outline = "#93c5fd", 
    Text = "#f0f9ff",
    Placeholder = "#60a5fa",
    Background = "#1e293b",
    Button = "#3b82f6",
    Icon = "#93c5fd",
})

WindUI:AddTheme({
    Name = "Green",
    Accent = "#059669",
    Dialog = "#047857",
    Outline = "#6ee7b7", 
    Text = "#ecfdf5",
    Placeholder = "#34d399",
    Background = "#064e3b",
    Button = "#10b981",
    Icon = "#6ee7b7",
})

WindUI:SetNotificationLower(true)

local themes = {"PinatDark", "Dark", "Light", "Blue", "Green", "PinatPurple"}
local currentThemeIndex = 1

if not getgenv().TransparencyEnabled then
    getgenv().TransparencyEnabled = true
end

-- ================================================================
-- PINATHUB LOGO LAUNCHER
-- ================================================================
local logoGui = Instance.new("ScreenGui")
logoGui.Name = "PinatHubLogo"
logoGui.ResetOnSpawn = false
logoGui.Parent = LocalPlayer:WaitForChild("PlayerGui", 5)

local logoButton = Instance.new("ImageButton")
logoButton.Name = "LogoButton"
logoButton.Size = UDim2.new(0, 50, 0, 50)
logoButton.Position = UDim2.new(0.5, -25, 0.5, -25)
logoButton.BackgroundTransparency = 1
logoButton.Image = "rbxassetid://118264723961739"
logoButton.ImageColor3 = Color3.fromRGB(139, 92, 246)
logoButton.ScaleType = Enum.ScaleType.Fit
logoButton.Parent = logoGui

local uiCornerLogo = Instance.new("UICorner")
uiCornerLogo.CornerRadius = UDim.new(1, 0)
uiCornerLogo.Parent = logoButton

local hoverTween = TweenService:Create(logoButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 60, 0, 60)})
local unhoverTween = TweenService:Create(logoButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 50, 0, 50)})

logoButton.MouseEnter:Connect(function() hoverTween:Play() end)
logoButton.MouseLeave:Connect(function() unhoverTween:Play() end)

local dragging = false
local dragStart = nil
local startPos = nil

logoButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = logoButton.Position
    end
end)

logoButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragStart = nil
        startPos = nil
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and dragStart and startPos then
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            local newX = startPos.X.Offset + delta.X
            local newY = startPos.Y.Offset + delta.Y
            logoButton.Position = UDim2.new(startPos.X.Scale, newX, startPos.Y.Scale, newY)
        end
    end
end)

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
-- CREATE WINDOW (PINATHUB STYLE)
-- ================================================================
local Window = WindUI:CreateWindow({
    Title = "PinatHub | Drain Water",
    Icon = "rbxassetid://118264723961739",
    Author = "PinatHub",
    Folder = "PinatHub",
    Size = UDim2.fromOffset(500, 350),
    Transparent = getgenv().TransparencyEnabled,
    Theme = "PinatDark",
    Resizable = true,
    SideBarWidth = 150,
    BackgroundImageTransparency = 0.8,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            currentThemeIndex = currentThemeIndex + 1
            if currentThemeIndex > #themes then
                currentThemeIndex = 1
            end
            
            local newTheme = themes[currentThemeIndex]
            WindUI:SetTheme(newTheme)
           
            WindUI:Notify({
                Title = "Theme Changed",
                Content = "Switched to " .. newTheme .. " theme!",
                Duration = 2,
                Icon = "palette"
            })
        end,
    },
})

Window:SetToggleKey(Enum.KeyCode.RightShift)

pcall(function()
    Window:CreateTopbarButton("TransparencyToggle", "eye", function()
        if getgenv().TransparencyEnabled then
            getgenv().TransparencyEnabled = false
            pcall(function() Window:ToggleTransparency(false) end)
            
            WindUI:Notify({
                Title = "Transparency", 
                Content = "Transparency disabled",
                Duration = 3,
                Icon = "eye"
            })
        else
            getgenv().TransparencyEnabled = true
            pcall(function() Window:ToggleTransparency(true) end)
            
            WindUI:Notify({
                Title = "Transparency",
                Content = "Transparency enabled", 
                Duration = 3,
                Icon = "eye-off"
            })
        end
    end, 990)
end)

Window:EditOpenButton({
    Title = "PinatHub - Open",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(139, 92, 246)),
    Draggable = true,
})

local guiVisible = true
logoButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    if Window then
        pcall(function()
            if guiVisible then
                Window:Open()
            else
                Window:Minimize()
            end
        end)
    end
end)

-- ================================================================
-- CREATE TABS
-- ================================================================
local Tabs = {}

Tabs.Farm = Window:Tab({
    Title = "Auto Farm",
    Icon = "droplet",
    Desc = "Drain Water Controls"
})

Tabs.Upgrades = Window:Tab({
    Title = "Upgrades",
    Icon = "arrow-up",
    Desc = "Upgrade Settings"
})

Tabs.Fish = Window:Tab({
    Title = "Fish & Pets",
    Icon = "fish",
    Desc = "Fish and Pet Settings"
})

Tabs.Sell = Window:Tab({
    Title = "Auto Sell",
    Icon = "dollar-sign",
    Desc = "Auto Sell Fish Settings"
})

Tabs.Advanced = Window:Tab({
    Title = "Advanced",
    Icon = "settings",
    Desc = "Advanced Features"
})

Tabs.Stats = Window:Tab({
    Title = "Live Stats",
    Icon = "chart-bar",
    Desc = "Real-time Statistics"
})

Tabs.Community = Window:Tab({
    Title = "Community",
    Icon = "users",
    Desc = "Join PinatHub Community"
})

Window:SelectTab(1)

-- ================================================================
-- COMMUNITY TAB
-- ================================================================
local communitySection = Tabs.Community:Section({ Title = "Join Community", Icon = "users" })

communitySection:Paragraph({
    Title = "PinatHub Community",
    Desc = "Join our community for updates, support, and more scripts!",
    Image = "rbxassetid://118264723961739",
    ImageSize = 50,
})

communitySection:Divider()

communitySection:Button({
    Title = "WhatsApp Group",
    Desc = "Join our WhatsApp community",
    Icon = "message-circle",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://chat.whatsapp.com/I8hG44FLgrRAwQcS3lvEft")
            WindUI:Notify({
                Title = "Copied!",
                Content = "WhatsApp link copied to clipboard!",
                Duration = 3,
                Icon = "clipboard-check"
            })
        end
    end
})

communitySection:Button({
    Title = "Discord Server",
    Desc = "Join our Discord server",
    Icon = "discord",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://discord.gg/eDbaHKEf7G")
            WindUI:Notify({
                Title = "Copied!",
                Content = "Discord invite copied to clipboard!",
                Duration = 3,
                Icon = "clipboard-check"
            })
        end
    end
})

communitySection:Button({
    Title = "TikTok @viunze",
    Desc = "Follow on TikTok for updates",
    Icon = "video",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://tiktok.com/@viunze")
            WindUI:Notify({
                Title = "Copied!",
                Content = "TikTok profile copied!",
                Duration = 3,
                Icon = "clipboard-check"
            })
        end
    end
})

communitySection:Button({
    Title = "YouTube Channel",
    Desc = "Subscribe for tutorials",
    Icon = "youtube",
    Callback = function()
        if set_clipboard then
            set_clipboard("https://youtube.com/@viunze")
            WindUI:Notify({
                Title = "Copied!",
                Content = "YouTube link copied!",
                Duration = 3,
                Icon = "clipboard-check"
            })
        end
    end
})

communitySection:Divider()

communitySection:Paragraph({
    Title = "Support PinatHub",
    Desc = "❤️ Like & Share to support the developer!",
    Image = "heart",
    ImageSize = 30,
})

-- ================================================================
-- UI: FARM TAB
-- ================================================================
local farmSection = Tabs.Farm:Section({ Title = "Auto Farm", Icon = "droplet" })

farmSection:Toggle({
    Title = "MASTER SWITCH",
    Desc = "Enable/Disable all auto farm components",
    Value = CONFIG.auto,
    Callback = function(value)
        CONFIG.auto = value
        note(value and "auto running" or "auto stopped")
        if value then
            WindUI:Notify({ Title = "Master Switch", Content = "All Auto Features ENABLED!", Duration = 2 })
        else
            WindUI:Notify({ Title = "Master Switch", Content = "All Auto Features DISABLED", Duration = 2 })
        end
    end
})

farmSection:Divider()

farmSection:Toggle({
    Title = "Drain pools",
    Desc = "Stand in the current stage's pool - presence alone drains it",
    Value = CONFIG.drain,
    Callback = function(value) 
        CONFIG.drain = value
        if value then
            WindUI:Notify({ Title = "Drain", Content = "Drain ACTIVE (Independent)", Duration = 2 })
        end
    end
})

farmSection:Toggle({
    Title = "Click",
    Desc = "Only feeds the level bar; server credits about 15/s at most",
    Value = CONFIG.click,
    Callback = function(value) 
        CONFIG.click = value
        if value then
            WindUI:Notify({ Title = "Click", Content = "Click ACTIVE (Independent)", Duration = 2 })
        end
    end
})

farmSection:Slider({
    Title = "Clicks/sec",
    Value = { Min = 4, Max = 50, Default = 20 },
    Callback = function(value)
        CONFIG.clickRate = math.floor(value)
    end
})

farmSection:Toggle({
    Title = "Claim fish",
    Desc = "Only pools you have already drained hand their fish over",
    Value = CONFIG.fish,
    Callback = function(value) 
        CONFIG.fish = value
        if value then
            WindUI:Notify({ Title = "Claim Fish", Content = "Fish Claim ACTIVE (Independent)", Duration = 2 })
        end
    end
})

farmSection:Toggle({
    Title = "Display best fish",
    Desc = "A displayed fish pays 10% of its price every minute, forever",
    Value = CONFIG.display,
    Callback = function(value) 
        CONFIG.display = value
        if value then
            WindUI:Notify({ Title = "Display", Content = "Display ACTIVE (Independent)", Duration = 2 })
        end
    end
})

farmSection:Divider()

farmSection:Toggle({
    Title = "Auto rebirth",
    Desc = "Resets the stage run, multiplies water and cash",
    Value = CONFIG.rebirth,
    Callback = function(value) 
        CONFIG.rebirth = value
        if value then
            WindUI:Notify({ Title = "Rebirth", Content = "Auto Rebirth ACTIVE", Duration = 2 })
        end
    end
})

farmSection:Slider({
    Title = "Dive seconds",
    Value = { Min = 10, Max = 120, Default = 30 },
    Callback = function(value) CONFIG.diveSeconds = value end
})

farmSection:Divider()

farmSection:Button({
    Title = "Unstuck",
    Desc = "Stop auto and reset busy state",
    Callback = function()
        CONFIG.auto = false
        STATE.busy = false
        note("unstuck, auto off")
        WindUI:Notify({ Title = "Unstuck", Content = "Auto disabled and state reset", Duration = 2 })
    end
})

-- ================================================================
-- UI: UPGRADES TAB
-- ================================================================
local upgradeSection = Tabs.Upgrades:Section({ Title = "Upgrades", Icon = "arrow-up" })

upgradeSection:Toggle({
    Title = "Buy pumps",
    Desc = "The pump multiplies the drain, bought first",
    Value = CONFIG.pumps,
    Callback = function(value) 
        CONFIG.pumps = value
        if value then
            WindUI:Notify({ Title = "Pumps", Content = "Auto Pumps ACTIVE", Duration = 2 })
        end
    end
})

upgradeSection:Toggle({
    Title = "Buy upgrades",
    Desc = "FishDisplay and Backpack first, widen the pipeline",
    Value = CONFIG.upgrades,
    Callback = function(value) 
        CONFIG.upgrades = value
        if value then
            WindUI:Notify({ Title = "Upgrades", Content = "Auto Upgrades ACTIVE", Duration = 2 })
        end
    end
})

upgradeSection:Toggle({
    Title = "Buy auras",
    Desc = "Buy aura upgrades",
    Value = CONFIG.auras,
    Callback = function(value) 
        CONFIG.auras = value
        if value then
            WindUI:Notify({ Title = "Auras", Content = "Auto Auras ACTIVE", Duration = 2 })
        end
    end
})

upgradeSection:Toggle({
    Title = "Open eggs",
    Desc = "Cash eggs only; Robux eggs have no cash price and are skipped",
    Value = CONFIG.eggs,
    Callback = function(value) 
        CONFIG.eggs = value
        if value then
            WindUI:Notify({ Title = "Eggs", Content = "Auto Eggs ACTIVE", Duration = 2 })
        end
    end
})

upgradeSection:Toggle({
    Title = "Free rewards",
    Desc = "Offline earnings and tank's pending cash",
    Value = CONFIG.offline,
    Callback = function(value) 
        CONFIG.offline = value
        if value then
            WindUI:Notify({ Title = "Free Rewards", Content = "Auto Claim Rewards ACTIVE", Duration = 2 })
        end
    end
})

upgradeSection:Toggle({
    Title = "Merge pets",
    Desc = "Three of a kind into one better one, locked pets are left alone",
    Value = CONFIG.merge,
    Callback = function(value) 
        CONFIG.merge = value
        if value then
            WindUI:Notify({ Title = "Merge Pets", Content = "Auto Merge Pets ACTIVE", Duration = 2 })
        end
    end
})

upgradeSection:Toggle({
    Title = "Pets",
    Desc = "Equip best pet after every hatch",
    Value = CONFIG.pets,
    Callback = function(value) 
        CONFIG.pets = value
        if value then
            WindUI:Notify({ Title = "Pets", Content = "Auto Pets ACTIVE", Duration = 2 })
        end
    end
})

upgradeSection:Slider({
    Title = "Spend every (seconds)",
    Value = { Min = 3, Max = 60, Default = 10 },
    Callback = function(value) CONFIG.spendEvery = value end
})

-- ================================================================
-- UI: FISH & PETS TAB
-- ================================================================
local fishSection = Tabs.Fish:Section({ Title = "Fish & Pets", Icon = "fish" })

fishSection:Toggle({
    Title = "Display best fish",
    Desc = "A displayed fish pays 10% of its price every minute, forever",
    Value = CONFIG.display,
    Callback = function(value) CONFIG.display = value end
})

fishSection:Toggle({
    Title = "Merge pets",
    Desc = "Three of a kind into one better one, locked pets are left alone",
    Value = CONFIG.merge,
    Callback = function(value) CONFIG.merge = value end
})

fishSection:Toggle({
    Title = "Pets",
    Desc = "Equip best pet after every hatch",
    Value = CONFIG.pets,
    Callback = function(value) CONFIG.pets = value end
})

fishSection:Slider({
    Title = "Harvest after (seconds)",
    Value = { Min = 5, Max = 45, Default = 15 },
    Callback = function(value) CONFIG.harvestAfter = value end
})

fishSection:Slider({
    Title = "Stall seconds",
    Value = { Min = 10, Max = 90, Default = 30 },
    Callback = function(value) CONFIG.stallSeconds = value end
})

fishSection:Slider({
    Title = "Claim share",
    Value = { Min = 5, Max = 90, Default = 35 },
    Callback = function(value) CONFIG.claimShare = value / 100 end
})

fishSection:Slider({
    Title = "Topup share",
    Value = { Min = 5, Max = 90, Default = 10 },
    Callback = function(value) CONFIG.topupShare = value / 100 end
})

-- ================================================================
-- UI: AUTO SELL TAB (NEW)
-- ================================================================
local sellSection = Tabs.Sell:Section({ Title = "Auto Sell Fish", Icon = "dollar-sign" })

sellSection:Toggle({
    Title = "Auto Sell Fish",
    Desc = "Enable automatic fish selling",
    Value = CONFIG.autoSellFish,
    Callback = function(value)
        CONFIG.autoSellFish = value
        if value then
            WindUI:Notify({ Title = "Auto Sell", Content = "Auto Sell Fish ACTIVE", Duration = 2 })
        else
            WindUI:Notify({ Title = "Auto Sell", Content = "Auto Sell Fish DISABLED", Duration = 2 })
        end
    end
})

sellSection:Toggle({
    Title = "Sell Protected Fish",
    Desc = "⚠️ Sell fish even if protected (risky!)",
    Value = CONFIG.sellProtected,
    Callback = function(value) 
        CONFIG.sellProtected = value
        if value then
            WindUI:Notify({ Title = "Warning", Content = "Sell Protected Fish ENABLED - Risky!", Duration = 3 })
        end
    end
})

sellSection:Slider({
    Title = "Sell Threshold (%)",
    Desc = "Sell when bag reaches this % full",
    Value = { Min = 50, Max = 100, Default = 92 },
    Callback = function(value) 
        CONFIG.sellThreshold = value / 100
    end
})

sellSection:Slider({
    Title = "Sell Interval (seconds)",
    Desc = "Sell periodically even if not full",
    Value = { Min = 5, Max = 120, Default = 30 },
    Callback = function(value) CONFIG.sellInterval = value end
})

sellSection:Divider()

sellSection:Button({
    Title = "Sell All Fish Now",
    Desc = "Force sell all fish immediately",
    Callback = function()
        task.spawn(function()
            withLock("manual_sell", function()
                local result = sellAllFish(true)
                if result then
                    WindUI:Notify({ Title = "Sell", Content = "Fish sold successfully!", Duration = 2 })
                else
                    WindUI:Notify({ Title = "Sell", Content = "No fish to sell or failed", Duration = 2 })
                end
            end)
        end)
    end
})

-- ================================================================
-- UI: ADVANCED TAB
-- ================================================================
local advancedSection = Tabs.Advanced:Section({ Title = "Advanced Features", Icon = "settings" })

advancedSection:Toggle({
    Title = "Auto Training Area",
    Desc = "Upgrade training area for pump multiplier (x1.5 to x100)",
    Value = CONFIG.autoTrainingArea,
    Callback = function(value) 
        CONFIG.autoTrainingArea = value
        if value then
            WindUI:Notify({ Title = "Training Area", Content = "Auto Training Area ACTIVE", Duration = 2 })
        end
    end
})

advancedSection:Toggle({
    Title = "Auto Spin",
    Desc = "Auto use available spins",
    Value = CONFIG.autoSpin,
    Callback = function(value) 
        CONFIG.autoSpin = value
        if value then
            WindUI:Notify({ Title = "Spin", Content = "Auto Spin ACTIVE", Duration = 2 })
        end
    end
})

advancedSection:Toggle({
    Title = "Auto Shop Items",
    Desc = "Buy Stamina, Trophy and other shop items",
    Value = CONFIG.autoShopItems,
    Callback = function(value) 
        CONFIG.autoShopItems = value
        if value then
            WindUI:Notify({ Title = "Shop Items", Content = "Auto Shop Items ACTIVE", Duration = 2 })
        end
    end
})

advancedSection:Toggle({
    Title = "Auto Pet Upgrade",
    Desc = "Auto upgrade best pet stars to max",
    Value = CONFIG.autoPetUpgrade,
    Callback = function(value) 
        CONFIG.autoPetUpgrade = value
        if value then
            WindUI:Notify({ Title = "Pet Upgrade", Content = "Auto Pet Upgrade ACTIVE", Duration = 2 })
        end
    end
})

advancedSection:Toggle({
    Title = "Auto Fish Training",
    Desc = "Train fish in training area",
    Value = CONFIG.autoFishTraining,
    Callback = function(value) 
        CONFIG.autoFishTraining = value
        if value then
            WindUI:Notify({ Title = "Fish Training", Content = "Auto Fish Training ACTIVE", Duration = 2 })
        end
    end
})

advancedSection:Toggle({
    Title = "Auto Claim Limited Fish",
    Desc = "Auto claim Mecha Kunka limited fish",
    Value = CONFIG.autoClaimLimitedFish,
    Callback = function(value) 
        CONFIG.autoClaimLimitedFish = value
        if value then
            WindUI:Notify({ Title = "Limited Fish", Content = "Auto Claim Limited Fish ACTIVE", Duration = 2 })
        end
    end
})

advancedSection:Toggle({
    Title = "Auto Buy Stamina",
    Desc = "Auto buy 2x Cash multiplier",
    Value = CONFIG.autoBuyStamina,
    Callback = function(value) 
        CONFIG.autoBuyStamina = value
        if value then
            WindUI:Notify({ Title = "Stamina", Content = "Auto Buy Stamina ACTIVE", Duration = 2 })
        end
    end
})

advancedSection:Divider()

advancedSection:Slider({
    Title = "Max Training Area",
    Value = { Min = 1, Max = 9, Default = 9 },
    Callback = function(value) CONFIG.maxTrainingArea = math.floor(value) end
})

advancedSection:Slider({
    Title = "Spin Interval (spins)",
    Value = { Min = 1, Max = 20, Default = 5 },
    Callback = function(value) CONFIG.spinInterval = math.floor(value) end
})

advancedSection:Divider()

advancedSection:Paragraph({
    Title = "📋 Training Area Config",
    Desc = [[
    Area 1: x1.5 (Rebirth 0)
    Area 2: x2 (Rebirth 2)
    Area 3: x4 (Rebirth 5)
    Area 4: x6 (Rebirth 9)
    Area 5: x8 (Rebirth 12)
    Area 6: x10 (Rebirth 15)
    Area 7: x15 (119 Cash)
    Area 8: x25 (299 Cash)
    Area 9: x100 (999 Cash)
    ]],
    Image = "info",
    ImageSize = 30,
})

-- ================================================================
-- UI: STATS TAB
-- ================================================================
local statsSection = Tabs.Stats:Section({ Title = "Live Stats", Icon = "chart-bar" })

local statsLabel = statsSection:Paragraph({
    Title = "Loading...",
    Desc = "",
    Image = "",
    ImageSize = 0,
})

task.spawn(function()
    while alive() do
        local stats = string.format([[
📊 LIVE STATS

💰 Cash: $%s
💧 Water: %s
📈 Level: %d
🔄 Rebirth: %d

🎣 Stage: %d (deepest %d)
⏱️ Remaining: %s
📊 Drain Rate: %s/s
🏊 Pump: #%d x%s

🐟 Tank: %d/%d displayed
🎒 Backpack: %d/%d

✅ Claimed: %d
📌 Placed: %d
💰 Sold: %d

⚡ Advanced:
🏋️ Training Area: %d
🎰 Spins Used: %d
🐟 Limited Fish: %d

📍 Phase: %s
📝 Note: %s
]],
            short(STATE.cash),
            short(STATE.water),
            STATE.level,
            STATE.rebirth,
            STATE.stage,
            STATE.deepest,
            short(STATE.remaining),
            short(STATE.rate),
            STATE.pump,
            short(STATE.pumpMult),
            STATE.displayed,
            STATE.slots,
            STATE.backpack,
            STATE.capacity,
            STATE.claimed,
            STATE.placed,
            STATE.sold,
            STATE.trainingArea or 1,
            STATE.spinCount or 0,
            STATE.limitedFishClaimed or 0,
            STATE.phase,
            tostring(STATE.note)
        )
        statsLabel:Set("Live Stats", stats)
        task.wait(0.5)
    end
end)

-- ================================================================
-- INITIAL NOTIFICATION
-- ================================================================
task.wait(1)
WindUI:Notify({
    Title = "PinatHub",
    Content = "by @viunze on TikTok\nPress RightShift or click the logo to toggle UI",
    Duration = 5,
    Icon = "check-circle"
})
