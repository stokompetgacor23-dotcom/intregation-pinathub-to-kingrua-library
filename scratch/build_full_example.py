# -*- coding: utf-8 -*-

example_content = '''-- PinatHub UI Library Example
-- Raw Source: https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua
-- Discord: https://discord.gg/ysHZCYFaX7
-- WhatsApp: https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp
-- YouTube: https://www.youtube.com/@viunzee1

repeat task.wait() until game:IsLoaded()

-- Memuat PinatHub Library (lokal fallback / github raw)
local Library
local success, res = pcall(function()
    if readfile and isfile and isfile("kingrualibrarysource.lua") then
        return loadstring(readfile("kingrualibrarysource.lua"))()
    end
end)

if success and res then
    Library = res
else
    Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua"))()
end

-- Inisialisasi Window Utama
local Window = Library:CreateWindow({
    Title = "PinatHub",
    SubTitle = "Complete Showcase",
    Game = "All-In-One Example",
    Version = "1.0.0",
    Discord = "https://discord.gg/ysHZCYFaX7",
    Logo = "rbxassetid://118264723961739",
    OnClose = function()
        print("[PinatHub] Window closed, cleaning up...")
    end
})

-- Guard kompatibilitas AddTab untuk berbagai eksekutor & versi raw
if not Window.AddTab then
    Window.AddTab = function(self, ...)
        if self.T then return self:T(...) end
        if self.Tab then return self:Tab(...) end
        if self.NewTab then return self:NewTab(...) end
    end
end

-- =============================================================================
-- TAB 1: AUTOMATION & FARMING (SEMUA VARIASI TOGGLE & CONTROL DASAR)
-- =============================================================================
local MainTab = Window:AddTab({
    Name = "Main",
    Icon = "Farm"
})

-- Section 1.1: Core Automation
local CoreSec = MainTab:AddSection({
    Title = "Core Automation"
})

-- 1. Standard Toggle
local isFarming = false
local farmLoop = nil
local FarmToggle = CoreSec:AddToggle({
    Title = "Master Auto Farm",
    Default = false,
    Callback = function(state)
        isFarming = state
        print("[Main] Master Auto Farm:", state)
        if isFarming then
            farmLoop = task.spawn(function()
                while isFarming do
                    task.wait(1)
                    -- logika farm utama di sini
                end
            end)
        else
            if farmLoop then
                task.cancel(farmLoop)
                farmLoop = nil
            end
        end
    end
})

-- 2. Sub-Toggle (Child Toggle Indented)
local AutoCollectSub = CoreSec:AddSubToggle({
    Title = "Auto Collect Drops",
    Default = true,
    Callback = function(state)
        print("[Main] Auto Collect Drops:", state)
    end
})

local AutoSellSub = CoreSec:AddSubToggle({
    Title = "Auto Sell Saat Tas Penuh",
    Default = true,
    Callback = function(state)
        print("[Main] Auto Sell:", state)
    end
})

local AutoRebirthSub = CoreSec:AddSubToggle({
    Title = "Auto Rebirth Bila Cukup",
    Default = false,
    Callback = function(state)
        print("[Main] Auto Rebirth:", state)
    end
})

CoreSec:AddDivider()

-- 3. ToggleSlider (Toggle switch + slider dalam 1 baris)
local AuraTS = CoreSec:AddToggleSlider({
    Title = "Kill Aura & Radius",
    DefaultToggle = false,
    Min = 5,
    Max = 60,
    DefaultSlider = 25,
    Suffix = " studs",
    Callback = function(enabled, radius)
        print("[Main] Kill Aura:", enabled, "Radius:", radius)
    end
})

-- 4. Action Button
CoreSec:AddButton({
    Title = "Klaim Semua Quest Selesai",
    Callback = function()
        Window:Notify({
            Title = "Quest",
            Content = "Semua reward quest berhasil diklaim!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- Section 1.2: Movement & Utility
local MoveSec = MainTab:AddSection({
    Title = "Movement & Physics"
})

local SpeedTS = MoveSec:AddToggleSlider({
    Title = "WalkSpeed Booster",
    DefaultToggle = false,
    Min = 16,
    Max = 250,
    DefaultSlider = 48,
    Suffix = " spd",
    Callback = function(enabled, speed)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = enabled and speed or 16
        end
    end
})

local JumpTS = MoveSec:AddToggleSlider({
    Title = "JumpPower Booster",
    DefaultToggle = false,
    Min = 50,
    Max = 350,
    DefaultSlider = 100,
    Suffix = " pwr",
    Callback = function(enabled, pwr)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.JumpPower = enabled and pwr or 50
        end
    end
})

local InfJumpToggle = MoveSec:AddToggle({
    Title = "Infinite Jump",
    Default = false,
    Callback = function(state)
        print("[Move] Infinite Jump:", state)
    end
})

local NoclipToggle = MoveSec:AddToggle({
    Title = "Noclip (Tembus Dinding)",
    Default = false,
    Callback = function(state)
        print("[Move] Noclip:", state)
    end
})

MoveSec:AddButton({
    Title = "Teleport Cepat ke Safezone",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(0, 50, 0)
            Window:Notify({
                Title = "Teleport",
                Content = "Tiba di Safezone aman!",
                Duration = 2.5,
                Type = "Success"
            })
        end
    end
})

-- =============================================================================
-- TAB 2: COMBAT & VISUALS (ESP, AIMBOT, PLAYERLIST, COLORPICKER)
-- =============================================================================
local CombatTab = Window:AddTab({
    Name = "Visuals & Combat",
    Icon = "eye"
})

-- Section 2.1: ESP & Wallhack
local ESPSec = CombatTab:AddSection({
    Title = "Player ESP & Visuals"
})

local ESPBoxToggle = ESPSec:AddToggle({
    Title = "Master ESP Box",
    Default = false,
    Callback = function(state)
        print("[ESP] Master Box:", state)
    end
})

local ESPTracersSub = ESPSec:AddSubToggle({
    Title = "Snaplines / Tracers",
    Default = false,
    Callback = function(state)
        print("[ESP] Tracers:", state)
    end
})

local ESPNamesSub = ESPSec:AddSubToggle({
    Title = "Nama Pemain & Jarak",
    Default = true,
    Callback = function(state)
        print("[ESP] Names & Distance:", state)
    end
})

local ESPHealthSub = ESPSec:AddSubToggle({
    Title = "Health Bar Warna",
    Default = true,
    Callback = function(state)
        print("[ESP] Health Bars:", state)
    end
})

ESPSec:AddDivider()

local espPrimaryColor = Color3.fromRGB(168, 85, 247)
local ESPColorPicker = ESPSec:AddColorPicker({
    Title = "Warna ESP Pemain",
    Default = espPrimaryColor,
    Callback = function(color)
        espPrimaryColor = color
        print("[ESP] Warna primer diubah:", color)
    end
})

local RainbowESPToggle = ESPSec:AddToggle({
    Title = "Rainbow ESP Cycling",
    Default = false,
    Callback = function(state)
        print("[ESP] Rainbow:", state)
    end
})

-- Section 2.2: Combat & Target Selection
local AimbotSec = CombatTab:AddSection({
    Title = "Aimbot & Target Tracking"
})

local SilentAimToggle = AimbotSec:AddToggle({
    Title = "Silent Aim / Camlock",
    Default = false,
    Callback = function(state)
        print("[Combat] Silent Aim:", state)
    end
})

local TeamCheckSub = AimbotSec:AddSubToggle({
    Title = "Abaikan Satu Tim (Team Check)",
    Default = true,
    Callback = function(state)
        print("[Combat] Team Check:", state)
    end
})

local WallCheckSub = AimbotSec:AddSubToggle({
    Title = "Hanya Target Terlihat (Wall Check)",
    Default = false,
    Callback = function(state)
        print("[Combat] Wall Check:", state)
    end
})

AimbotSec:AddSlider({
    Title = "FOV Radius",
    Min = 30,
    Max = 400,
    Default = 120,
    Suffix = " px",
    Callback = function(val)
        print("[Combat] FOV:", val)
    end
})

local HitboxDropdown = AimbotSec:AddDropdown({
    Title = "Target Hitbox Part",
    Options = { "Head", "HumanoidRootPart", "UpperTorso" },
    Default = "Head",
    Callback = function(selected)
        print("[Combat] Hitbox part terpilih:", selected)
    end
})

AimbotSec:AddKeybind({
    Title = "Aimbot Hold Keybind",
    Default = Enum.KeyCode.E,
    Callback = function(key)
        print("[Combat] Keybind aimbot ditekan:", key)
    end
})

AimbotSec:AddDivider()

-- Searchable Multi-Select Player List
local targetBlacklist = {}
local PlList = AimbotSec:AddPlayerList({
    Title = "Player Target Whitelist / Blacklist",
    Multi = true,
    Callback = function(selectedMap)
        targetBlacklist = selectedMap
        local count = 0
        for _ in pairs(selectedMap) do count = count + 1 end
        print("[Combat] Target terpilih diperbarui:", count, "player")
    end
})

-- =============================================================================
-- TAB 3: TELEPORTASI & WORLD (DROPDOWNS, SLIDERS, INPUTS)
-- =============================================================================
local WorldTab = Window:AddTab({
    Name = "World & TP",
    Icon = "compass"
})

local TPSec = WorldTab:AddSection({
    Title = "Teleportasi Zona & Lokasi"
})

local currentDestination = "Spawn"
local AreaDropdown = TPSec:AddDropdown({
    Title = "Pilih Lokasi Teleport",
    Options = { "Spawn Safezone", "Trading Plaza", "Dungeon Level 1", "Boss Arena", "VIP Sky Lounge" },
    Default = "Spawn Safezone",
    Callback = function(selected)
        currentDestination = selected
        print("[World] Lokasi dipilih:", selected)
    end
})

TPSec:AddButton({
    Title = "Eksekusi Teleport Sekarang",
    Callback = function()
        Window:Notify({
            Title = "Teleportasi",
            Content = "Berpindah menuju " .. currentDestination .. "!",
            Duration = 2.5,
            Type = "Success"
        })
    end
})

local TweenTPTS = TPSec:AddToggleSlider({
    Title = "Smooth Tween TP (Anti-Ban)",
    DefaultToggle = true,
    Min = 50,
    Max = 250,
    DefaultSlider = 120,
    Suffix = " spd",
    Callback = function(enabled, speed)
        print("[World] Tween TP:", enabled, "Speed:", speed)
    end
})

local StalkerSec = WorldTab:AddSection({
    Title = "Player Stalker & Follower"
})

local targetPlayerInput = ""
local TargetInput = StalkerSec:AddTextInput({
    Title = "Username Target",
    PlaceHolder = "Ketik username pemain...",
    Default = "",
    Callback = function(text)
        targetPlayerInput = text
        print("[World] Target input:", text)
    end
})

StalkerSec:AddButton({
    Title = "Teleport ke Pemain Terpilih",
    Callback = function()
        if targetPlayerInput ~= "" then
            Window:Notify({
                Title = "Player TP",
                Content = "Mendekati pemain " .. targetPlayerInput .. "...",
                Duration = 2.5,
                Type = "Info"
            })
        else
            Window:Notify({
                Title = "Peringatan",
                Content = "Masukkan username terlebih dahulu!",
                Duration = 2.5,
                Type = "Warning"
            })
        end
    end
})

local AutoFollowToggle = StalkerSec:AddToggle({
    Title = "Auto Follow / Shadow Target",
    Default = false,
    Callback = function(state)
        print("[World] Auto follow:", state)
    end
})

-- =============================================================================
-- TAB 4: LIVE STATS & TELEMETRI (GRAPH, PROGRESSBAR, RICHTEXT PARAGRAPH)
-- =============================================================================
local StatsTab = Window:AddTab({
    Name = "Live Stats",
    Icon = "Live Stats"
})

local TelemetryMonitorSec = StatsTab:AddSection({
    Title = "Live Telemetry Engine"
})

TelemetryMonitorSec:AddParagraph({
    Title = "● ENGINE TELEMETRI AKTIF",
    Content = "Memonitor throughput operasi script, latensi server, dan progres level."
})

-- 1. Real-Time Telemetry Bar Graph
local LiveGraph = TelemetryMonitorSec:AddGraph({
    Title = "THROUGHPUT OPERASI (OPS/SEC)",
    BarCount = 14,
    MaxValue = 100,
    Height = 110,
    BarColor = Color3.fromRGB(168, 85, 247),
    BarGlow = Color3.fromRGB(192, 132, 252),
    Unit = " op/s"
})

-- 2. Animated Progress Bar
local LevelProgressBar = TelemetryMonitorSec:AddProgressBar({
    Title = "Exp Level Menuju Level Berikutnya",
    Max = 100,
    Default = 45
})

TelemetryMonitorSec:AddDivider()

-- Section 4.2: Data Metrik Keuangan & Diagnostik
local MetricsSec = StatsTab:AddSection({
    Title = "Performance Metrics & Diagnostics"
})

local TreasuryCard = MetricsSec:AddParagraph({
    Title = "💰 Saldo & Kekayaan",
    Content = "Memuat data kas..."
})

local CombatMetricsCard = MetricsSec:AddParagraph({
    Title = "⚔️ Statistik Pertarungan",
    Content = "Kills: 0  |  Deaths: 0  |  Streak: 0"
})

local SystemCard = MetricsSec:AddParagraph({
    Title = "⚙️ Status Sistem & Server",
    Content = "Memuat data sistem..."
})

-- Worker real-time untuk simulasi metrik hidup
task.spawn(function()
    local exp = 45
    local kills = 0
    while true do
        task.wait(1)
        local ops = math.random(35, 95)
        local cash = math.random(50, 180)
        exp = (exp + math.random(1, 5))
        if exp > 100 then exp = 10 end
        kills = kills + (math.random(1, 10) > 7 and 1 or 0)

        LiveGraph:Push(ops)
        LevelProgressBar:Set(exp, 100)

        TreasuryCard:SetContent(string.format(
            "Uang Kas: <font color='#4ade80'>$%d.50M</font>\\n" ..
            "Laju Aliran: <font color='#c084fc'>%d op/s</font>",
            cash, ops
        ))

        CombatMetricsCard:SetContent(string.format(
            "Total Eliminasi: <font color='#fbbf24'>%d Kills</font>\\n" ..
            "Status Combat: <font color='#4ade80'>● Siaga</font>",
            kills
        ))

        SystemCard:SetContent(string.format(
            "Ping Server: <font color='#93c5fd'>%d ms</font>\\n" ..
            "Status Script: <font color='#4ade80'>Normal (Tanpa Lag)</font>",
            math.random(35, 60)
        ))
    end
end)

-- =============================================================================
-- TAB 5: SETTINGS & SISTEM CONFIG LENGKAP (SAVE, LIST, LOAD, AUTOLOAD, UPDATE, DELETE)
-- =============================================================================
local SettingsTab = Window:AddTab({
    Name = "Settings",
    Icon = "settings"
})

local ConfigManagerSec = SettingsTab:AddSection({
    Title = "Penyimpanan & Manajemen Config"
})

local CONFIG_DIR = "PinatHub_Configs"
local AUTOLOAD_PATH = CONFIG_DIR .. "/autoload.txt"

-- Buat direktori jika didukung eksekutor
if makefolder and isfolder and not isfolder(CONFIG_DIR) then
    pcall(makefolder, CONFIG_DIR)
end

-- In-memory fallback untuk eksekutor tanpa file system
local MemoryConfigs = {
    ["Default"] = {
        autoFarm = false,
        autoCollect = true,
        autoSell = true,
        autoRebirth = false,
        aura = false,
        auraRadius = 25,
        speedBoost = false,
        speed = 48,
        jumpBoost = false,
        jump = 100,
        espBox = false,
        destination = "Spawn Safezone"
    }
}
local memoryAutoload = "Default"

local selectedConfig = "Default"
local configNameInput = "Default"

local HttpService = game:GetService("HttpService")

-- Serialisasi data seluruh kontrol UI saat ini
local function CollectAllUIConfig()
    local auraEn, auraR = AuraTS:Get()
    local spdEn, spdVal = SpeedTS:Get()
    local jmpEn, jmpVal = JumpTS:Get()
    return {
        autoFarm = FarmToggle:Get(),
        autoCollect = AutoCollectSub:Get(),
        autoSell = AutoSellSub:Get(),
        autoRebirth = AutoRebirthSub:Get(),
        aura = auraEn,
        auraRadius = auraR,
        speedBoost = spdEn,
        speed = spdVal,
        jumpBoost = jmpEn,
        jump = jmpVal,
        infJump = InfJumpToggle:Get(),
        noclip = NoclipToggle:Get(),
        espBox = ESPBoxToggle:Get(),
        espTracers = ESPTracersSub:Get(),
        destination = currentDestination
    }
end

-- Terapkan data config ke kontrol UI
local function ApplyAllUIConfig(data)
    if not data then return end
    if data.autoFarm ~= nil then FarmToggle:Set(data.autoFarm) end
    if data.autoCollect ~= nil then AutoCollectSub:Set(data.autoCollect) end
    if data.autoSell ~= nil then AutoSellSub:Set(data.autoSell) end
    if data.autoRebirth ~= nil then AutoRebirthSub:Set(data.autoRebirth) end
    if data.aura ~= nil then AuraTS:SetToggle(data.aura) end
    if data.auraRadius ~= nil then AuraTS:SetSlider(data.auraRadius) end
    if data.speedBoost ~= nil then SpeedTS:SetToggle(data.speedBoost) end
    if data.speed ~= nil then SpeedTS:SetSlider(data.speed) end
    if data.jumpBoost ~= nil then JumpTS:SetToggle(data.jumpBoost) end
    if data.jump ~= nil then JumpTS:SetSlider(data.jump) end
    if data.infJump ~= nil then InfJumpToggle:Set(data.infJump) end
    if data.noclip ~= nil then NoclipToggle:Set(data.noclip) end
    if data.espBox ~= nil then ESPBoxToggle:Set(data.espBox) end
    if data.espTracers ~= nil then ESPTracersSub:Set(data.espTracers) end
    if data.destination ~= nil then AreaDropdown:Set(data.destination) end
end

-- Simpan ke file / memory
local function SaveConfigFile(name, dataTable)
    MemoryConfigs[name] = dataTable
    if writefile then
        local success, jsonStr = pcall(function()
            return HttpService:JSONEncode(dataTable)
        end)
        if success then
            pcall(writefile, CONFIG_DIR .. "/" .. name .. ".json", jsonStr)
        end
    end
end

-- Muat dari file / memory
local function LoadConfigFile(name)
    if readfile and isfile and isfile(CONFIG_DIR .. "/" .. name .. ".json") then
        local content = readfile(CONFIG_DIR .. "/" .. name .. ".json")
        local success, decoded = pcall(function()
            return HttpService:JSONDecode(content)
        end)
        if success and decoded then
            return decoded
        end
    end
    return MemoryConfigs[name]
end

-- Hapus dari file / memory
local function DeleteConfigFile(name)
    MemoryConfigs[name] = nil
    if delfile and isfile and isfile(CONFIG_DIR .. "/" .. name .. ".json") then
        pcall(delfile, CONFIG_DIR .. "/" .. name .. ".json")
    end
    if readfile and isfile and isfile(AUTOLOAD_PATH) then
        local curAuto = readfile(AUTOLOAD_PATH)
        if curAuto == name and writefile then
            pcall(writefile, AUTOLOAD_PATH, "")
        end
    end
    if memoryAutoload == name then memoryAutoload = "" end
end

-- Ambil nama autoload aktif
local function GetAutoloadName()
    if readfile and isfile and isfile(AUTOLOAD_PATH) then
        local txt = readfile(AUTOLOAD_PATH)
        txt = string.match(txt, "^%s*(.-)%s*$") or ""
        if txt ~= "" then return txt end
    end
    return memoryAutoload ~= "" and memoryAutoload or "Tidak Ada"
end

-- Set nama autoload
local function SetAutoloadName(name)
    memoryAutoload = name
    if writefile then
        pcall(writefile, AUTOLOAD_PATH, name)
    end
end

-- Daftar seluruh file config yang tersedia
local function GetAvailableConfigs()
    local names = {}
    local seen = {}

    if listfiles and isfolder and isfolder(CONFIG_DIR) then
        for _, path in ipairs(listfiles(CONFIG_DIR)) do
            if string.sub(path, -5) == ".json" then
                local filename = string.match(path, "([%w_%-]+)%.json$")
                if filename and not seen[filename] then
                    seen[filename] = true
                    table.insert(names, filename)
                end
            end
        end
    end

    for k, _ in pairs(MemoryConfigs) do
        if not seen[k] then
            seen[k] = true
            table.insert(names, k)
        end
    end

    if #names == 0 then
        table.insert(names, "Default")
    end
    table.sort(names)
    return names
end

-- Input teks nama config
ConfigManagerSec:AddTextInput({
    Title = "Nama Config Baru",
    PlaceHolder = "Ketik nama konfigurasi...",
    Default = "Default",
    Callback = function(text)
        if text and text ~= "" then
            configNameInput = text
        end
    end
})

-- Tombol Simpan Config
ConfigManagerSec:AddButton({
    Title = "Simpan Config Baru (Save Config)",
    Callback = function()
        local name = configNameInput or "Default"
        local data = CollectAllUIConfig()
        SaveConfigFile(name, data)
        selectedConfig = name
        UpdateConfigUI()
        Window:Notify({
            Title = "Config Disimpan",
            Content = "Config '" .. name .. "' berhasil disimpan!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- Section Daftar & Aksi Config
local ConfigListSec = SettingsTab:AddSection({
    Title = "Daftar Config Tersimpan"
})

-- AddParagraph untuk menampilkan daftar nama config yang tersedia
local ConfigListPara = ConfigListSec:AddParagraph({
    Title = "Config Explorer",
    Content = "Memuat daftar config..."
})

-- Dropdown untuk klik / pilih nama config
local ConfigSelectorDropdown = ConfigListSec:AddDropdown({
    Title = "Pilih Nama Config",
    Options = GetAvailableConfigs(),
    Default = selectedConfig,
    Callback = function(name)
        selectedConfig = name
        configNameInput = name
        UpdateConfigUI()
    end
})

-- Fungsi update paragraph & dropdown
function UpdateConfigUI()
    local all = GetAvailableConfigs()
    local autoName = GetAutoloadName()

    local lines = {
        "Config Terpilih: <font color='#c084fc'><b>" .. tostring(selectedConfig) .. "</b></font>",
        "Autoload Aktif: <font color='#4ade80'><b>" .. tostring(autoName) .. "</b></font>",
        "",
        "<b>Daftar File Config:</b>"
    }

    for _, n in ipairs(all) do
        local badges = {}
        if n == selectedConfig then table.insert(badges, "<font color='#c084fc'>[Terpilih]</font>") end
        if n == autoName then table.insert(badges, "<font color='#4ade80'>[Autoload]</font>") end
        local badgeStr = #badges > 0 and (" " .. table.concat(badges, " ")) or ""
        table.insert(lines, "• " .. n .. badgeStr)
    end

    ConfigListPara:SetContent(table.concat(lines, "\\n"))
    ConfigSelectorDropdown:Refresh(all)
    ConfigSelectorDropdown:Set(selectedConfig)
end

-- Tombol Load Config
ConfigListSec:AddButton({
    Title = "Muat Config Terpilih (Load Config)",
    Callback = function()
        local data = LoadConfigFile(selectedConfig)
        if data then
            ApplyAllUIConfig(data)
            Window:Notify({
                Title = "Config Dimuat",
                Content = "Pengaturan dari '" .. selectedConfig .. "' berhasil dimuat!",
                Duration = 3,
                Type = "Success"
            })
        else
            Window:Notify({
                Title = "Gagal",
                Content = "File config tidak ditemukan!",
                Duration = 3,
                Type = "Danger"
            })
        end
    end
})

-- Tombol Set Autoload Config
ConfigListSec:AddButton({
    Title = "Set Autoload Config",
    Callback = function()
        SetAutoloadName(selectedConfig)
        UpdateConfigUI()
        Window:Notify({
            Title = "Autoload Diatur",
            Content = "'" .. selectedConfig .. "' otomatis dimuat saat script start!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- Tombol Update Config
ConfigListSec:AddButton({
    Title = "Perbarui Config (Update Config)",
    Callback = function()
        local data = CollectAllUIConfig()
        SaveConfigFile(selectedConfig, data)
        UpdateConfigUI()
        Window:Notify({
            Title = "Config Diperbarui",
            Content = "Pengaturan terbaru disimpan ke '" .. selectedConfig .. "'!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- Tombol Hapus Config
ConfigListSec:AddButton({
    Title = "Hapus Config (Delete Config)",
    Callback = function()
        DeleteConfigFile(selectedConfig)
        local remaining = GetAvailableConfigs()
        selectedConfig = remaining[1] or "Default"
        UpdateConfigUI()
        Window:Notify({
            Title = "Config Dihapus",
            Content = "Config berhasil dihapus!",
            Duration = 3,
            Type = "Warning"
        })
    end
})

-- Section UI Utility
local UIUtilSec = SettingsTab:AddSection({
    Title = "UI Controls & Shortcut"
})

UIUtilSec:AddKeybind({
    Title = "Hotkey Buka / Tutup UI",
    Default = Enum.KeyCode.RightControl,
    Callback = function(key)
        print("[Settings] Hotkey ditekan:", key)
    end
})

UIUtilSec:AddButton({
    Title = "Shutdown Seluruh Script (Destroy UI)",
    Callback = function()
        Window:FullShutdown()
    end
})

-- Autoload saat start
task.defer(function()
    local autoName = GetAutoloadName()
    if autoName and autoName ~= "Tidak Ada" and autoName ~= "" then
        local data = LoadConfigFile(autoName)
        if data then
            ApplyAllUIConfig(data)
            selectedConfig = autoName
            print("[PinatHub] Autoload diterapkan:", autoName)
        end
    end
    UpdateConfigUI()
end)

-- =============================================================================
-- TAB 6: KOMUNITAS RESMI PINATHUB
-- =============================================================================
local CommTab = Window:AddTab({
    Name = "Community",
    Icon = "Community"
})

local CommSec = CommTab:AddSection({
    Title = "Media & Komunitas Resmi"
})

CommSec:AddParagraph({
    Title = "PinatHub Official Network",
    Content = "Bergabunglah untuk pembaruan skrip, bantuan teknis, dan rilis skrip game terbaru!"
})

CommSec:AddDiscordCard({
    Title = "PinatHub Official Community",
    Members = "10.000+",
    Online = "2.000+",
    Invite = "https://discord.gg/ysHZCYFaX7"
})

CommSec:AddDivider()

CommSec:AddButton({
    Title = "WhatsApp XploitForce (Komunitas Utama)",
    Callback = function()
        if setclipboard then
            setclipboard("https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp")
        end
        Window:Notify({ Title = "Salin", Content = "Link WhatsApp disalin!", Duration = 3, Type = "Success" })
    end
})

CommSec:AddButton({
    Title = "YouTube @viunzee1",
    Callback = function()
        if setclipboard then
            setclipboard("https://www.youtube.com/@viunzee1")
        end
        Window:Notify({ Title = "Salin", Content = "Link YouTube disalin!", Duration = 3, Type = "Success" })
    end
})

CommSec:AddButton({
    Title = "Salin Raw Loadstring URL",
    Callback = function()
        if setclipboard then
            setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua"))()')
        end
        Window:Notify({ Title = "Salin", Content = "Loadstring URL disalin ke clipboard!", Duration = 3, Type = "Success" })
    end
})

Window:Notify({
    Title = "PinatHub Siap",
    Content = "Tekan launcher bulat putih untuk membuka / menutup UI.",
    Duration = 4,
    Type = "Success"
})
'''

with open("pinathub_example.lua", "w", encoding="utf-8") as f:
    f.write(example_content)

print("Full pinathub_example.lua written successfully, length:", len(example_content))
