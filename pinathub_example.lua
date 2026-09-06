-- PinatHub UI Library Example
-- Raw Source: https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua
-- Discord: https://discord.gg/ysHZCYFaX7
-- WhatsApp: https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp
-- YouTube: https://www.youtube.com/@viunzee1

repeat task.wait() until game:IsLoaded()

-- Memuat PinatHub Library
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

-- Buat window utama
local Window = Library:CreateWindow({
    Title = "PinatHub",
    SubTitle = "Example Script",
    Game = "My Game",
    Version = "1.0.0",
    Discord = "https://discord.gg/ysHZCYFaX7",
    Logo = "rbxassetid://118264723961739",
    OnClose = function()
        print("UI ditutup, cleanup background tasks...")
    end
})

-- Jaminan kompatibilitas AddTab untuk versi apa pun
if not Window.AddTab then
    Window.AddTab = function(self, ...)
        if self.T then return self:T(...) end
        if self.Tab then return self:Tab(...) end
        if self.NewTab then return self:NewTab(...) end
    end
end

-- -----------------------------------------------------------------------------
-- TAB 1: FITUR UTAMA (MAIN / FARMING)
-- -----------------------------------------------------------------------------
local MainTab = Window:AddTab({
    Name = "Main",
    Icon = "Farm"
})

local FarmSec = MainTab:AddSection({
    Title = "Farming & Actions"
})

-- Toggle Utama
local isFarming = false
local farmLoop = nil

local FarmToggle = FarmSec:AddToggle({
    Title = "Auto Farm Cash",
    Default = false,
    Callback = function(state)
        isFarming = state
        print("Auto Farm status:", state)
        if isFarming then
            farmLoop = task.spawn(function()
                while isFarming do
                    task.wait(1)
                    -- Logika farming game di sini
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

-- Sub-Toggle (opsi child dengan indent visual)
local AutoSellSub = FarmSec:AddSubToggle({
    Title = "Auto Sell Saat Tas Penuh",
    Default = true,
    Callback = function(state)
        print("Auto Sell:", state)
    end
})

local AutoCollectSub = FarmSec:AddSubToggle({
    Title = "Koleksi Koin Otomatis",
    Default = false,
    Callback = function(state)
        print("Auto Collect:", state)
    end
})

-- ToggleSlider (switch toggle + slider dalam satu baris)
local SpeedTS = FarmSec:AddToggleSlider({
    Title = "Speed Boost",
    DefaultToggle = false,
    Min = 16,
    Max = 150,
    DefaultSlider = 32,
    Suffix = " spd",
    Callback = function(enabled, speed)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = enabled and speed or 16
        end
    end
})

-- Action Button
FarmSec:AddButton({
    Title = "Claim Daily Reward",
    Callback = function()
        Window:Notify({
            Title = "Hadiah Diambil",
            Content = "Daily reward berhasil diklaim!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- Slider Biasa
local JumpSlider = FarmSec:AddSlider({
    Title = "Jump Power",
    Min = 50,
    Max = 300,
    Default = 50,
    Suffix = " pwr",
    Callback = function(val)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.JumpPower = val
        end
    end
})

-- Dropdown
local AreaDropdown = FarmSec:AddDropdown({
    Title = "Pilih Area",
    Options = { "Spawn", "Farming Ground", "Boss Arena" },
    Default = "Spawn",
    Callback = function(selected)
        print("Area terpilih:", selected)
    end
})

-- Text Input
local TargetInput = FarmSec:AddTextInput({
    Title = "Target Player",
    PlaceHolder = "Masukkan nama player...",
    Default = "",
    Callback = function(text)
        print("Target player:", text)
    end
})

-- Keybind
FarmSec:AddKeybind({
    Title = "Hotkey Toggle UI",
    Default = Enum.KeyCode.RightControl,
    Callback = function(key)
        print("Hotkey ditekan:", key)
    end
})

-- ColorPicker
FarmSec:AddColorPicker({
    Title = "ESP Color",
    Default = Color3.fromRGB(168, 85, 247),
    Callback = function(c)
        print("Warna ESP diubah:", c)
    end
})

-- -----------------------------------------------------------------------------
-- TAB 2: LIVE STATS & TELEMETRI REAL-TIME
-- -----------------------------------------------------------------------------
local StatsTab = Window:AddTab({
    Name = "Live Stats",
    Icon = "Live Stats"
})

local GraphSec = StatsTab:AddSection({
    Title = "Throughput Monitor"
})

local LiveGraph = GraphSec:AddGraph({
    Title = "OPERASI PER DETIK (CPS)",
    BarCount = 14,
    MaxValue = 100,
    Height = 110,
    BarColor = Color3.fromRGB(168, 85, 247),
    BarGlow = Color3.fromRGB(192, 132, 252),
    Unit = " op/s"
})

local MetricSec = StatsTab:AddSection({
    Title = "Data Akun & Metrik"
})

local CashCard = MetricSec:AddParagraph({
    Title = "Saldo Kas",
    Content = "Memuat data kas..."
})

local StatusCard = MetricSec:AddParagraph({
    Title = "Status Aktivitas",
    Content = "Memuat data aktivitas..."
})

task.spawn(function()
    while true do
        task.wait(1)
        local rate = math.random(30, 95)
        local cash = math.random(50, 150)

        LiveGraph:Push(rate)

        CashCard:SetContent(string.format(
            "Uang: <font color='#4ade80'>$%d.00M</font>\nThroughput: <font color='#c084fc'>%d op/s</font>",
            cash, rate
        ))

        StatusCard:SetContent(string.format(
            "Status: <font color='#4ade80'>● Optimal</font>\nSistem: <font color='#93c5fd'>Terkoneksi</font>"
        ))
    end
end)

-- -----------------------------------------------------------------------------
-- TAB 3: SETTINGS & SISTEM CONFIG LENGKAP
-- -----------------------------------------------------------------------------
local SettingsTab = Window:AddTab({
    Name = "Settings",
    Icon = "settings"
})

local ConfigManagerSec = SettingsTab:AddSection({
    Title = "Pengaturan Simpan & Muat Config"
})

local CONFIG_DIR = "PinatHub_Configs"
local AUTOLOAD_PATH = CONFIG_DIR .. "/autoload.txt"

-- Buat folder penyimpanan jika didukung executor
if makefolder and isfolder and not isfolder(CONFIG_DIR) then
    pcall(makefolder, CONFIG_DIR)
end

-- Fallback memory storage untuk executor tanpa file IO
local MemoryConfigs = {
    ["Default"] = {
        autoFarm = false,
        autoSell = true,
        autoCollect = false,
        speedBoost = false,
        speed = 32,
        jumpPower = 50,
        area = "Spawn",
        targetPlayer = ""
    }
}
local memoryAutoload = "Default"

local selectedConfig = "Default"
local configNameInput = "Default"

local HttpService = game:GetService("HttpService")

-- Fungsi serialisasi nilai UI saat ini
local function CollectCurrentUIConfig()
    local spdBoost, spdVal = SpeedTS:Get()
    return {
        autoFarm = FarmToggle:Get(),
        autoSell = AutoSellSub:Get(),
        autoCollect = AutoCollectSub:Get(),
        speedBoost = spdBoost,
        speed = spdVal,
        jumpPower = JumpSlider:Get(),
        area = AreaDropdown:Get(),
        targetPlayer = TargetInput:Get()
    }
end

-- Fungsi terapkan nilai ke elemen UI
local function ApplyConfigToUI(cfgData)
    if not cfgData then return end
    if cfgData.autoFarm ~= nil then FarmToggle:Set(cfgData.autoFarm) end
    if cfgData.autoSell ~= nil then AutoSellSub:Set(cfgData.autoSell) end
    if cfgData.autoCollect ~= nil then AutoCollectSub:Set(cfgData.autoCollect) end
    if cfgData.speedBoost ~= nil then SpeedTS:SetToggle(cfgData.speedBoost) end
    if cfgData.speed ~= nil then SpeedTS:SetSlider(cfgData.speed) end
    if cfgData.jumpPower ~= nil then JumpSlider:Set(cfgData.jumpPower) end
    if cfgData.area ~= nil then AreaDropdown:Set(cfgData.area) end
    if cfgData.targetPlayer ~= nil then TargetInput:Set(cfgData.targetPlayer) end
end

-- Fungsi simpan file config
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

-- Fungsi load file config
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

-- Fungsi hapus file config
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

-- Fungsi ambil nama autoload saat ini
local function GetAutoloadName()
    if readfile and isfile and isfile(AUTOLOAD_PATH) then
        local txt = readfile(AUTOLOAD_PATH)
        txt = string.match(txt, "^%s*(.-)%s*$") or ""
        if txt ~= "" then return txt end
    end
    return memoryAutoload ~= "" and memoryAutoload or "Tidak Ada"
end

-- Fungsi simpan autoload
local function SetAutoloadName(name)
    memoryAutoload = name
    if writefile then
        pcall(writefile, AUTOLOAD_PATH, name)
    end
end

-- Fungsi ambil daftar semua nama config yang tersimpan
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

-- Input nama config baru
ConfigManagerSec:AddTextInput({
    Title = "Nama Config",
    PlaceHolder = "Ketik nama config...",
    Default = "Default",
    Callback = function(text)
        if text and text ~= "" then
            configNameInput = text
        end
    end
})

-- Tombol simpan config
ConfigManagerSec:AddButton({
    Title = "Simpan Config Baru (Save)",
    Callback = function()
        local name = configNameInput or "Default"
        local data = CollectCurrentUIConfig()
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

-- Section AddParagraph untuk menampilkan nama-nama config
local ConfigListPara = ConfigListSec:AddParagraph({
    Title = "Config Explorer",
    Content = "Memuat daftar config..."
})

-- Dropdown untuk klik / pilih nama config
local ConfigSelectorDropdown = ConfigListSec:AddDropdown({
    Title = "Pilih Config",
    Options = GetAvailableConfigs(),
    Default = selectedConfig,
    Callback = function(name)
        selectedConfig = name
        configNameInput = name
        UpdateConfigUI()
    end
})

-- Fungsi perbarui tampilan paragraph & dropdown
function UpdateConfigUI()
    local all = GetAvailableConfigs()
    local autoName = GetAutoloadName()

    local lines = {
        "Config Terpilih: <font color='#c084fc'><b>" .. tostring(selectedConfig) .. "</b></font>",
        "Autoload Saat Ini: <font color='#4ade80'><b>" .. tostring(autoName) .. "</b></font>",
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

    ConfigListPara:SetContent(table.concat(lines, "\n"))
    ConfigSelectorDropdown:Refresh(all)
    ConfigSelectorDropdown:Set(selectedConfig)
end

-- Tombol Muat Config (Load)
ConfigListSec:AddButton({
    Title = "Muat Config (Load Config)",
    Callback = function()
        local data = LoadConfigFile(selectedConfig)
        if data then
            ApplyConfigToUI(data)
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
            Title = "Autoload Diaktifkan",
            Content = "'" .. selectedConfig .. "' akan otomatis dimuat saat script dijalankan!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- Tombol Perbarui Config (Update)
ConfigListSec:AddButton({
    Title = "Perbarui Config (Update Config)",
    Callback = function()
        local data = CollectCurrentUIConfig()
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

-- Tombol Hapus Config (Delete)
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

-- Eksekusi autoload saat script pertama kali aktif
task.defer(function()
    local autoName = GetAutoloadName()
    if autoName and autoName ~= "Tidak Ada" and autoName ~= "" then
        local data = LoadConfigFile(autoName)
        if data then
            ApplyConfigToUI(data)
            selectedConfig = autoName
            print("[PinatHub] Autoload diterapkan:", autoName)
        end
    end
    UpdateConfigUI()
end)

-- -----------------------------------------------------------------------------
-- TAB 4: KOMUNITAS RESMI PINATHUB
-- -----------------------------------------------------------------------------
local CommTab = Window:AddTab({
    Name = "Community",
    Icon = "Community"
})

local CommSec = CommTab:AddSection({
    Title = "Sosial Media & Komunitas"
})

CommSec:AddParagraph({
    Title = "PinatHub Official Network",
    Content = "Bergabunglah untuk update script, diskusi fitur baru, dan bantuan teknis."
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

Window:Notify({
    Title = "PinatHub Siap",
    Content = "Tekan launcher bulat putih untuk toggle UI kapan saja.",
    Duration = 4,
    Type = "Success"
})
