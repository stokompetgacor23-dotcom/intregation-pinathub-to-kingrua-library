# Generator for pinathub_example.lua

code = '''-- PinatHub UI Library Example Script
-- Source Library: https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua
-- Discord: https://discord.gg/ysHZCYFaX7
-- WhatsApp Komunitas: https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp
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

-- Inisialisasi Window Utama PinatHub
local Window = Library:CreateWindow({
    Title = "PinatHub",
    SubTitle = "Universal Edition",
    Game = "Complete Showcase",
    Version = "2.5.0",
    Discord = "https://discord.gg/ysHZCYFaX7",
    Logo = "rbxassetid://118264723961739",
    OnClose = function()
        print("[PinatHub] UI ditutup, semua thread latar belakang dinonaktifkan.")
    end
})

-- Kompatibilitas AddTab lintas versi
if not Window.AddTab then
    Window.AddTab = function(self, ...)
        if self.T then return self:T(...) end
        if self.Tab then return self:Tab(...) end
        if self.NewTab then return self:NewTab(...) end
    end
end

-- =============================================================================
-- TAB 1: FITUR UTAMA & AUTOMATION
-- =============================================================================
local MainTab = Window:AddTab({
    Name = "Main",
    Icon = "Farm"
})

local FarmSec = MainTab:AddSection({
    Title = "Farming & Auto Actions"
})

-- 1. AddToggle (Standard Switch dengan Keybind)
local isFarming = false
local farmThread = nil

local FarmToggle = FarmSec:AddToggle({
    Title = "Auto Farm Cash",
    Description = "Mengumpulkan cash dan resource secara otomatis",
    Default = false,
    Keybind = Enum.KeyCode.F,
    Callback = function(state)
        isFarming = state
        if isFarming then
            farmThread = task.spawn(function()
                while isFarming do
                    task.wait(1)
                    -- Logika farming spesifik game di sini
                end
            end)
        else
            if farmThread then
                task.cancel(farmThread)
                farmThread = nil
            end
        end
    end
})

-- 2. AddSubToggle (Child Toggle dengan Garis Visual)
local AutoSellSub = FarmSec:AddSubToggle({
    Title = "Auto Sell Saat Penuh",
    Description = "Menjual inventory otomatis saat kapasitas tercapai",
    Default = true,
    Callback = function(state)
        print("[PinatHub] Auto Sell:", state)
    end
})

local AutoCollectSub = FarmSec:AddSubToggle({
    Title = "Auto Collect Dropped Items",
    Description = "Mengambil drop item di sekitar karakter",
    Default = false,
    Callback = function(state)
        print("[PinatHub] Auto Collect:", state)
    end
})

local FastCollectSub = FarmSec:AddSubToggle({
    Title = "Fast Collect Mode",
    Description = "Mengabaikan animasi delay saat mengumpulkan item",
    Default = false,
    Callback = function(state)
        print("[PinatHub] Fast Collect:", state)
    end
})

-- 3. AddToggleSlider (Toggle Switch + Slider Terintegrasi)
local SpeedTS = FarmSec:AddToggleSlider({
    Title = "Speed Multiplier Boost",
    Description = "Mengatur kecepatan jalan karakter",
    DefaultToggle = false,
    Min = 16,
    Max = 250,
    DefaultSlider = 32,
    Suffix = " spd",
    Callback = function(enabled, val)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = enabled and val or 16
        end
    end
})

-- 4. AddButton (Tombol Eksekusi Aksi)
FarmSec:AddButton({
    Title = "Klaim Daily Reward",
    Description = "Mengambil hadiah harian server langsung",
    Callback = function()
        Window:Notify({
            Title = "Hadiah Diambil",
            Content = "Daily reward berhasil diklaim ke akun Anda!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- 5. AddSlider (Slider Pengatur Nilai Presisi)
local JumpSlider = FarmSec:AddSlider({
    Title = "Jump Power",
    Description = "Ketinggian loncatan karakter",
    Min = 50,
    Max = 350,
    Default = 50,
    Suffix = " pwr",
    Callback = function(val)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.JumpPower = val
        end
    end
})

-- 6. AddDropdown (Menu Pilihan Area)
local AreaDropdown = FarmSec:AddDropdown({
    Title = "Pilih Area Farming",
    Description = "Lokasi target untuk auto farm",
    Options = { "Spawn Island", "Crystal Caves", "Forbidden Forest", "Dragon Peak", "Abyssal Rift" },
    Default = "Spawn Island",
    Callback = function(selected)
        print("[PinatHub] Area dipilih:", selected)
    end
})

-- 7. AddTextInput / AddInput (Input Text Custom)
local TargetInput = FarmSec:AddTextInput({
    Title = "Target Player",
    PlaceHolder = "Ketik username target...",
    Default = "",
    Callback = function(text)
        print("[PinatHub] Target Player disetel ke:", text)
    end
})

-- 8. AddKeybind (Dedicated Hotkey Listener)
FarmSec:AddKeybind({
    Title = "Quick Farm Hotkey",
    Description = "Tombol cepat untuk toggle farm dari keyboard",
    Default = Enum.KeyCode.G,
    Callback = function(key)
        local cur = FarmToggle:Get()
        FarmToggle:Set(not cur)
    end
})

-- 9. AddDivider (Garis Pemisah Visual)
FarmSec:AddDivider()

-- 10. AddParagraph (Informasi / Catatan Fitur)
FarmSec:AddParagraph({
    Title = "Petunjuk Farming",
    Content = "Pastikan karakter berada dalam jarak render item agar pengumpulan berjalan optimal tanpa deteksi lag."
})

-- =============================================================================
-- TAB 2: COMBAT & VISUALS
-- =============================================================================
local CombatTab = Window:AddTab({
    Name = "Combat & ESP",
    Icon = "swords"
})

local AimSec = CombatTab:AddSection({
    Title = "Aimbot & Targeting"
})

local isAimbot = false
local AimToggle = AimSec:AddToggle({
    Title = "Silent Aimbot",
    Description = "Mengarahkan tembakan ke target terdekat",
    Default = false,
    Keybind = Enum.KeyCode.X,
    Callback = function(state)
        isAimbot = state
        print("[PinatHub] Silent Aimbot status:", state)
    end
})

local WallCheckSub = AimSec:AddSubToggle({
    Title = "Wall Check",
    Description = "Hanya target musuh yang terlihat langsung",
    Default = true,
    Callback = function(state)
        print("[PinatHub] Wall Check:", state)
    end
})

local TeamCheckSub = AimSec:AddSubToggle({
    Title = "Team Check",
    Description = "Mengabaikan rekan satu tim",
    Default = true,
    Callback = function(state)
        print("[PinatHub] Team Check:", state)
    end
})

local HitboxTS = AimSec:AddToggleSlider({
    Title = "Hitbox Expander",
    Description = "Memperbesar ukuran hitbox karakter lawan",
    DefaultToggle = false,
    Min = 2,
    Max = 30,
    DefaultSlider = 8,
    Suffix = " studs",
    Callback = function(enabled, size)
        print(string.format("[PinatHub] Hitbox Expander: %s, Ukuran: %d", tostring(enabled), size))
    end
})

local FOVSlider = AimSec:AddSlider({
    Title = "FOV Radius",
    Description = "Lingkup deteksi sasaran",
    Min = 30,
    Max = 360,
    Default = 90,
    Suffix = "°",
    Callback = function(val)
        print("[PinatHub] FOV Radius:", val)
    end
})

local PartDropdown = AimSec:AddDropdown({
    Title = "Bagian Tubuh Target",
    Options = { "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso" },
    Default = "Head",
    Callback = function(part)
        print("[PinatHub] Bagian target:", part)
    end
})

local VisualSec = CombatTab:AddSection({
    Title = "Visuals & ESP Players"
})

local isESP = false
local ESPToggle = VisualSec:AddToggle({
    Title = "Master ESP Toggle",
    Description = "Menampilkan outline dan informasi pemain",
    Default = false,
    Callback = function(state)
        isESP = state
        print("[PinatHub] Master ESP:", state)
    end
})

local BoxSub = VisualSec:AddSubToggle({
    Title = "Box 2D ESP",
    Description = "Kotak pembatas di sekitar karakter lawan",
    Default = true,
    Callback = function(state)
        print("[PinatHub] Box ESP:", state)
    end
})

local TracerSub = VisualSec:AddSubToggle({
    Title = "Tracer Lines",
    Description = "Garis pelacak dari bawah layar ke target",
    Default = false,
    Callback = function(state)
        print("[PinatHub] Tracer Lines:", state)
    end
})

local NameDistSub = VisualSec:AddSubToggle({
    Title = "Nama & Jarak Pemain",
    Description = "Teks informasi nama dan jarak meter",
    Default = true,
    Callback = function(state)
        print("[PinatHub] Name & Distance:", state)
    end
})

-- 11. AddColorPicker (Pemilih Warna ESP)
local ESPColorPicker = VisualSec:AddColorPicker({
    Title = "Warna Aksen ESP",
    Description = "Klik untuk mengganti palet warna visual",
    Default = Color3.fromRGB(168, 85, 247),
    Callback = function(c)
        print("[PinatHub] Warna ESP diperbarui:", c)
    end
})

local MaxDistSlider = VisualSec:AddSlider({
    Title = "Jarak Maksimal Render",
    Min = 50,
    Max = 3000,
    Default = 1000,
    Suffix = " m",
    Callback = function(dist)
        print("[PinatHub] ESP Max Distance:", dist)
    end
})

-- =============================================================================
-- TAB 3: WORLD & MOVEMENT
-- =============================================================================
local WorldTab = Window:AddTab({
    Name = "World & TP",
    Icon = "compass"
})

local MoveSec = WorldTab:AddSection({
    Title = "Pergerakan Karakter"
})

local isNoclip = false
local noclipConn = nil

local NoclipToggle = MoveSec:AddToggle({
    Title = "Noclip Tembus Dinding",
    Description = "Berjalan menembus seluruh dinding bangunan",
    Default = false,
    Keybind = Enum.KeyCode.N,
    Callback = function(state)
        isNoclip = state
        if isNoclip then
            noclipConn = game:GetService("RunService").Stepped:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConn then
                noclipConn:Disconnect()
                noclipConn = nil
            end
        end
    end
})

local InfJumpToggle = MoveSec:AddToggle({
    Title = "Infinite Jump",
    Description = "Lompat tanpa batas di udara",
    Default = false,
    Callback = function(state)
        print("[PinatHub] Infinite Jump:", state)
    end
})

local FlyTS = MoveSec:AddToggleSlider({
    Title = "Fly Mode",
    Description = "Terbang bebas melintasi map",
    DefaultToggle = false,
    Min = 10,
    Max = 150,
    DefaultSlider = 50,
    Suffix = " spd",
    Callback = function(enabled, speed)
        print(string.format("[PinatHub] Fly: %s, Speed: %d", tostring(enabled), speed))
    end
})

local GravSlider = MoveSec:AddSlider({
    Title = "Gravitasi World",
    Min = 0,
    Max = 196,
    Default = 196,
    Suffix = " grav",
    Callback = function(val)
        workspace.Gravity = val
    end
})

local TPSec = WorldTab:AddSection({
    Title = "Teleportasi Instan"
})

local selectedTP = "Spawn Point"
local TPDropdown = TPSec:AddDropdown({
    Title = "Pilih Lokasi Teleport",
    Options = { "Spawn Point", "Shop Area", "Safe Zone", "PVP Arena", "Secret Chamber" },
    Default = "Spawn Point",
    Callback = function(loc)
        selectedTP = loc
    end
})

TPSec:AddButton({
    Title = "Teleport Sekarang",
    Callback = function()
        Window:Notify({
            Title = "Teleport Berhasil",
            Content = "Karakter dipindahkan ke: " .. tostring(selectedTP),
            Duration = 3,
            Type = "Success"
        })
    end
})

-- 12. AddPlayerList (Daftar Pemain Interaktif)
local PlayerSec = WorldTab:AddSection({
    Title = "Interaksi Pemain Server"
})

local selectedPlayerName = ""
local PlayerInfoPara = PlayerSec:AddParagraph({
    Title = "Status Pemain",
    Content = "Belum ada pemain yang dipilih."
})

PlayerSec:AddPlayerList({
    Title = "Pilih Pemain",
    ShowThumbnail = true,
    Callback = function(plr)
        if plr then
            selectedPlayerName = plr.Name
            PlayerInfoPara:SetContent(string.format(
                "Nama: <font color='#c084fc'><b>%s</b></font>\nDisplay: %s\nUser ID: %d",
                plr.Name, plr.DisplayName, plr.UserId
            ))
        end
    end
})

PlayerSec:AddButton({
    Title = "Teleport ke Pemain Terpilih",
    Callback = function()
        if selectedPlayerName ~= "" then
            Window:Notify({
                Title = "Teleport",
                Content = "Mencoba teleport ke " .. selectedPlayerName,
                Duration = 3,
                Type = "Success"
            })
        else
            Window:Notify({
                Title = "Peringatan",
                Content = "Silakan klik pemain dari daftar terlebih dahulu!",
                Duration = 3,
                Type = "Warning"
            })
        end
    end
})

-- =============================================================================
-- TAB 4: LIVE STATS & TELEMETRI REAL-TIME
-- =============================================================================
local StatsTab = Window:AddTab({
    Name = "Live Stats",
    Icon = "Live Stats"
})

local GraphSec = StatsTab:AddSection({
    Title = "Throughput & Kinerja Mesin"
})

-- 13. AddGraph (Grafik Real-Time Multi Bar)
local LiveGraph = GraphSec:AddGraph({
    Title = "THROUGHPUT OPERASI (CPS)",
    BarCount = 14,
    MaxValue = 100,
    Height = 110,
    BarColor = Color3.fromRGB(168, 85, 247),
    BarGlow = Color3.fromRGB(192, 132, 252),
    Unit = " op/s"
})

-- 14. AddProgressBar (Progress Bar Dinamis)
local QuestBar = GraphSec:AddProgressBar({
    Title = "Progress Misi Aktif",
    Default = 45,
    Max = 100
})

local MetricSec = StatsTab:AddSection({
    Title = "Data Akun & Metrik Real-Time"
})

local AccountCard = MetricSec:AddParagraph({
    Title = "Ringkasan Akun",
    Content = "Memuat data telemetri..."
})

local HealthCard = MetricSec:AddParagraph({
    Title = "Koneksi & Jaringan",
    Content = "Memuat status server..."
})

-- Background Worker untuk Animasi Grafik & Metrik
task.spawn(function()
    local progress = 45
    while true do
        task.wait(1)
        local rate = math.random(35, 95)
        local cash = math.random(50, 150)
        progress = (progress + math.random(2, 6))
        if progress > 100 then progress = 10 end

        LiveGraph:Push(rate)
        QuestBar:Set(progress)

        AccountCard:SetContent(string.format(
            "Uang Kas: <font color='#4ade80'>$%d.50M</font>\nThroughput: <font color='#c084fc'>%d op/s</font>\nProgress: <font color='#93c5fd'>%d%%</font>",
            cash, rate, progress
        ))

        HealthCard:SetContent(string.format(
            "Status: <font color='#4ade80'>● Beroperasi Normal</font>\nPing Jaringan: <font color='#93c5fd'>%d ms</font>",
            math.random(25, 45)
        ))
    end
end)

-- =============================================================================
-- TAB 5: SETTINGS & SISTEM CONFIG LENGKAP
-- =============================================================================
local SettingsTab = Window:AddTab({
    Name = "Settings",
    Icon = "settings"
})

local ConfigManagerSec = SettingsTab:AddSection({
    Title = "Manajemen Konfigurasi (Save / Load)"
})

local CONFIG_DIR = "PinatHub_Configs"
local AUTOLOAD_PATH = CONFIG_DIR .. "/autoload.txt"

-- Buat folder penyimpanan jika didukung executor
if makefolder and isfolder and not isfolder(CONFIG_DIR) then
    pcall(makefolder, CONFIG_DIR)
end

-- Penyimpanan fallback memory untuk executor tanpa akses disk
local MemoryConfigs = {
    ["Default"] = {
        autoFarm = false,
        autoSell = true,
        autoCollect = false,
        fastCollect = false,
        speedBoost = false,
        speedVal = 32,
        jumpPower = 50,
        area = "Spawn Island",
        targetPlayer = "",
        aimbot = false,
        wallCheck = true,
        teamCheck = true,
        hitbox = false,
        hitboxSize = 8,
        fov = 90,
        targetPart = "Head",
        esp = false,
        boxEsp = true,
        tracers = false,
        nameDist = true,
        noclip = false,
        infJump = false,
        gravity = 196
    }
}
local memoryAutoload = "Default"
local selectedConfig = "Default"
local configNameInput = "Default"

local HttpService = game:GetService("HttpService")

-- Fungsi serialisasi seluruh nilai UI saat ini
local function CollectCurrentUIConfig()
    local spdBoost, spdVal = SpeedTS:Get()
    local hbEnabled, hbVal = HitboxTS:Get()
    return {
        autoFarm = FarmToggle:Get(),
        autoSell = AutoSellSub:Get(),
        autoCollect = AutoCollectSub:Get(),
        fastCollect = FastCollectSub:Get(),
        speedBoost = spdBoost,
        speedVal = spdVal,
        jumpPower = JumpSlider:Get(),
        area = AreaDropdown:Get(),
        targetPlayer = TargetInput:Get(),
        aimbot = AimToggle:Get(),
        wallCheck = WallCheckSub:Get(),
        teamCheck = TeamCheckSub:Get(),
        hitbox = hbEnabled,
        hitboxSize = hbVal,
        fov = FOVSlider:Get(),
        targetPart = PartDropdown:Get(),
        esp = ESPToggle:Get(),
        boxEsp = BoxSub:Get(),
        tracers = TracerSub:Get(),
        nameDist = NameDistSub:Get(),
        noclip = NoclipToggle:Get(),
        infJump = InfJumpToggle:Get(),
        gravity = GravSlider:Get()
    }
end

-- Fungsi menerapkan data config ke elemen UI
local function ApplyConfigToUI(cfgData)
    if not cfgData then return end
    if cfgData.autoFarm ~= nil then FarmToggle:Set(cfgData.autoFarm) end
    if cfgData.autoSell ~= nil then AutoSellSub:Set(cfgData.autoSell) end
    if cfgData.autoCollect ~= nil then AutoCollectSub:Set(cfgData.autoCollect) end
    if cfgData.fastCollect ~= nil then FastCollectSub:Set(cfgData.fastCollect) end
    if cfgData.speedBoost ~= nil then SpeedTS:SetToggle(cfgData.speedBoost) end
    if cfgData.speedVal ~= nil then SpeedTS:SetSlider(cfgData.speedVal) end
    if cfgData.jumpPower ~= nil then JumpSlider:Set(cfgData.jumpPower) end
    if cfgData.area ~= nil then AreaDropdown:Set(cfgData.area) end
    if cfgData.targetPlayer ~= nil then TargetInput:Set(cfgData.targetPlayer) end
    if cfgData.aimbot ~= nil then AimToggle:Set(cfgData.aimbot) end
    if cfgData.wallCheck ~= nil then WallCheckSub:Set(cfgData.wallCheck) end
    if cfgData.teamCheck ~= nil then TeamCheckSub:Set(cfgData.teamCheck) end
    if cfgData.hitbox ~= nil then HitboxTS:SetToggle(cfgData.hitbox) end
    if cfgData.hitboxSize ~= nil then HitboxTS:SetSlider(cfgData.hitboxSize) end
    if cfgData.fov ~= nil then FOVSlider:Set(cfgData.fov) end
    if cfgData.targetPart ~= nil then PartDropdown:Set(cfgData.targetPart) end
    if cfgData.esp ~= nil then ESPToggle:Set(cfgData.esp) end
    if cfgData.boxEsp ~= nil then BoxSub:Set(cfgData.boxEsp) end
    if cfgData.tracers ~= nil then TracerSub:Set(cfgData.tracers) end
    if cfgData.nameDist ~= nil then NameDistSub:Set(cfgData.nameDist) end
    if cfgData.noclip ~= nil then NoclipToggle:Set(cfgData.noclip) end
    if cfgData.infJump ~= nil then InfJumpToggle:Set(cfgData.infJump) end
    if cfgData.gravity ~= nil then GravSlider:Set(cfgData.gravity) end
end

-- Fungsi simpan file config
local function SaveConfigFile(name, dataTable)
    MemoryConfigs[name] = dataTable
    if writefile then
        local ok, jsonStr = pcall(function()
            return HttpService:JSONEncode(dataTable)
        end)
        if ok then
            pcall(writefile, CONFIG_DIR .. "/" .. name .. ".json", jsonStr)
        end
    end
end

-- Fungsi load file config
local function LoadConfigFile(name)
    if readfile and isfile and isfile(CONFIG_DIR .. "/" .. name .. ".json") then
        local content = readfile(CONFIG_DIR .. "/" .. name .. ".json")
        local ok, decoded = pcall(function()
            return HttpService:JSONDecode(content)
        end)
        if ok and decoded then
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

-- Fungsi ambil daftar semua nama config
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

-- Form Input Nama Config
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
    Title = "Simpan Config (Save Config)",
    Callback = function()
        local name = configNameInput or "Default"
        local data = CollectCurrentUIConfig()
        SaveConfigFile(name, data)
        selectedConfig = name
        UpdateConfigUI()
        Window:Notify({
            Title = "Config Disimpan",
            Content = "Pengaturan berhasil disimpan ke '" .. name .. "'!",
            Duration = 3,
            Type = "Success"
        })
    end
})

-- Section Daftar & Aksi Config
local ConfigListSec = SettingsTab:AddSection({
    Title = "Daftar Config Tersimpan & Aksi"
})

-- Section AddParagraph untuk menampilkan daftar nama config
local ConfigListPara = ConfigListSec:AddParagraph({
    Title = "Config Explorer",
    Content = "Memuat daftar file konfigurasi..."
})

-- Dropdown untuk klik dan memilih config
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

-- Fungsi perbarui tampilan Paragraph dan Dropdown
function UpdateConfigUI()
    local all = GetAvailableConfigs()
    local autoName = GetAutoloadName()

    local lines = {
        "Config Terpilih: <font color='#c084fc'><b>" .. tostring(selectedConfig) .. "</b></font>",
        "Autoload Aktif: <font color='#4ade80'><b>" .. tostring(autoName) .. "</b></font>",
        "",
        "<b>Daftar File Konfigurasi:</b>"
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

-- Tombol Muat Config
ConfigListSec:AddButton({
    Title = "Muat Config (Load Config)",
    Callback = function()
        local data = LoadConfigFile(selectedConfig)
        if data then
            ApplyConfigToUI(data)
            Window:Notify({
                Title = "Config Dimuat",
                Content = "Pengaturan '" .. selectedConfig .. "' berhasil diterapkan!",
                Duration = 3,
                Type = "Success"
            })
        else
            Window:Notify({
                Title = "Gagal",
                Content = "File konfigurasi tidak ditemukan!",
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
            Title = "Autoload Ditetapkan",
            Content = "'" .. selectedConfig .. "' akan otomatis dimuat saat script dieksekusi!",
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
            Content = "Pengaturan terbaru ditimpa ke '" .. selectedConfig .. "'!",
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
            Content = "File konfigurasi berhasil dihapus!",
            Duration = 3,
            Type = "Warning"
        })
    end
})

-- Section Pengaturan UI & Kontrol Jendela
local UISettingsSec = SettingsTab:AddSection({
    Title = "Pengaturan UI & Tombol"
})

UISettingsSec:AddKeybind({
    Title = "Hotkey Toggle UI",
    Description = "Tombol keyboard untuk menyembunyikan/menampilkan jendela",
    Default = Enum.KeyCode.RightControl,
    Callback = function(key)
        print("[PinatHub] Hotkey UI:", key)
    end
})

UISettingsSec:AddButton({
    Title = "Tutup GUI (Close Window)",
    Description = "Menyembunyikan jendela UI (Gunakan launcher putih untuk buka kembali)",
    Callback = function()
        Window:Close()
    end
})

UISettingsSec:AddButton({
    Title = "Unload UI Sepenuhnya (Destroy)",
    Description = "Menghapus UI dan launcher dari memori game",
    Callback = function()
        Window:Destroy()
    end
})

-- Eksekusi Autoload saat pertama kali run
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

-- =============================================================================
-- TAB 6: KOMUNITAS RESMI PINATHUB
-- =============================================================================
local CommTab = Window:AddTab({
    Name = "Community",
    Icon = "Community"
})

local CommSec = CommTab:AddSection({
    Title = "Sosial Media & Jaringan Resmi"
})

-- 15. AddDiscordCard (Kartu Komunitas Discord Interaktif)
CommSec:AddDiscordCard({
    Title = "PinatHub Official Community",
    Members = "10.000+",
    Online = "2.000+",
    Invite = "https://discord.gg/ysHZCYFaX7"
})

CommSec:AddDivider()

CommSec:AddParagraph({
    Title = "Pusat Bantuan & Pembaruan",
    Content = "Bergabunglah dengan kanal resmi kami untuk mendapatkan update script, informasi status game, dan bantuan teknis dari developer."
})

CommSec:AddButton({
    Title = "WhatsApp XploitForce (Komunitas Utama)",
    Callback = function()
        if setclipboard then
            setclipboard("https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp")
        end
        Window:Notify({ Title = "Salin", Content = "Link WhatsApp disalin ke clipboard!", Duration = 3, Type = "Success" })
    end
})

CommSec:AddButton({
    Title = "YouTube Channel @viunzee1",
    Callback = function()
        if setclipboard then
            setclipboard("https://www.youtube.com/@viunzee1")
        end
        Window:Notify({ Title = "Salin", Content = "Link YouTube disalin ke clipboard!", Duration = 3, Type = "Success" })
    end
})

CommSec:AddButton({
    Title = "Salin Raw Script Library URL",
    Callback = function()
        if setclipboard then
            setclipboard("https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua")
        end
        Window:Notify({ Title = "Salin", Content = "URL Raw Library berhasil disalin!", Duration = 3, Type = "Success" })
    end
})

-- Notifikasi pembuka
Window:Notify({
    Title = "PinatHub Siap",
    Content = "Klik tombol launcher bulat bergaris putih untuk membuka/menutup UI kapan saja.",
    Duration = 4,
    Type = "Success"
})
'''

with open('pinathub_example.lua', 'w', encoding='utf-8') as f:
    f.write(code)

print("pinathub_example.lua successfully generated. Lines:", len(code.split('\n')))
