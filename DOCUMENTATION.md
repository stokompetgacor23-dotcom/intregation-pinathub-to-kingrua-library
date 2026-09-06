# PinatHub UI Library — Dokumentasi & Panduan

> **Versi**: PinatHub Official Edition  
> **Developer**: vinzee  
> **Komunitas Utama (WhatsApp XploitForce)**: [Gabung Komunitas WhatsApp](https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp)  
> **Discord Official**: [https://discord.gg/ysHZCYFaX7](https://discord.gg/ysHZCYFaX7)  
> **YouTube Channel**: [https://www.youtube.com/@viunzee1](https://www.youtube.com/@viunzee1)  

---

## 📑 Daftar Isi
1. [Pengenalan & Keunggulan](#1-pengenalan--keunggulan)
2. [Tautan Komunitas & Dukungan](#2-tautan-komunitas--dukungan)
3. [Struktur File](#3-struktur-file)
4. [Quick Start (Memulai Cepat)](#4-quick-start-memulai-cepat)
5. [Inisialisasi Window (Library:CreateWindow)](#5-inisialisasi-window-librarycreatewindow)
6. [Floating Launcher Button (Icon Toggle PinatHub)](#6-floating-launcher-button-icon-toggle-pinathub)
7. [Metode Window](#7-metode-window)
8. [Sistem Tab & Section](#8-sistem-tab--section)
9. [Katalog Elemen & Kontrol Interaktif](#9-katalog-elemen--kontrol-interaktif)
   - [AddToggle](#addtoggle)
   - [AddButton](#addbutton)
   - [AddSlider](#addslider)
   - [AddDropdown](#adddropdown)
   - [AddTextInput](#addtextinput)
   - [AddKeybind](#addkeybind)
   - [AddColorPicker](#addcolorpicker)
   - [AddParagraph (Dukungan RichText Penuh)](#addparagraph-dukungan-richtext-penuh)
   - [AddGraph (Grafik Telemetri Real-Time)](#addgraph-grafik-telemetri-real-time)
   - [AddDiscordCard & AddCommunityCard](#adddiscordcard--addcommunitycard)
   - [AddDivider](#adddivider)
10. [Sistem Tema & Warna](#10-sistem-tema--warna)
11. [Daftar Icon Bawaan](#11-daftar-icon-bawaan)
12. [Template Boilerplate (Siap Pakai untuk Game Baru)](#12-template-boilerplate-siap-pakai-untuk-game-baru)
13. [FAQ & Solusi Masalah](#13-faq--solusi-masalah)

---

## 1. Pengenalan & Keunggulan

**PinatHub UI Library** adalah framework antarmuka pengguna (UI) modern berkinerja tinggi yang dirancang khusus untuk skrip eksekutor Roblox (Solara, Wave, Delta, Fluxus, Codex, Swift, Synapse Z, Macsploit, dll.). Framework ini memadukan estetika dark obsidian glassmorphism dengan aksen neon khas PinatHub.

### Fitur Unggulan:
- **Floating Launcher Button**: Tombol toggle melayang permanen berbentuk bulat (50×50 px) dengan latar putih, outline putih neon (`rgb(0, 255, 0)`), icon PinatHub permanen, dan dukungan drag & drop halus (Mouse & Touch).
- **CoreGui & Topbar Overlay**: Menggunakan layer rendering tertinggi (`DisplayOrder = 999999`, `IgnoreGuiInset = true`) sehingga mampu menembus menu atas Roblox tanpa terhalang.
- **RichText Engine Terintegrasi**: Label paragraf mendukung pewarnaan teks dinamis via tag Roblox XML seperti `<font color='#4ade80'>$50M</font>`, `<b>Teks Tebal</b>`, dan `<i>Miring</i>`.
- **Live Telemetry Bar Graph**: Modul grafik batang real-time dengan animasi tween halus untuk menampilkan performa, throughput data, dan statistik live.
- **Animasi Super Smooth**: Setiap interaksi (hover, klik, drag, transisi halaman, buka/tutup) diperhalus menggunakan `TweenService` dengan easing spring alami.
- **Dukungan Mobile & PC**: Kompatibel penuh dengan input sentuh (Touch) di Android/iOS dan mouse di Windows/Mac.

---

## 2. Tautan Komunitas & Dukungan

Bergabunglah dengan komunitas pengembang dan pengguna skrip PinatHub untuk mendapatkan pembaruan terkini, bantuan integrasi, dan skrip terbaru:

- 🟢 **Komunitas Utama WhatsApp (XploitForce)**:  
  [https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp](https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp)
- 🟣 **Discord Official PinatHub**:  
  [https://discord.gg/ysHZCYFaX7](https://discord.gg/ysHZCYFaX7)
- 🔴 **YouTube Channel (vinzee)**:  
  [https://www.youtube.com/@viunzee1](https://www.youtube.com/@viunzee1)

---

## 3. Struktur File

Project ini menyediakan file lengkap agar Anda dapat menggunakannya berulang kali:

| Nama File | Deskripsi |
|-----------|-----------|
| `kingrualibrarysource.lua` | **Full Source UI Library murni**. Berisi seluruh core logika UI, komponen grafis, launcher button, theme engine, dan manajemen event. Gunakan file ini jika ingin meng-host library di GitHub / Pastebin untuk di-`loadstring`. |
| `pinathublibraryexample.lua` | **Contoh Implementasi Lengkap (Full Script Bundled)**. Menggabungkan library dengan skrip fungsional game Drain Water (Auto Farm, Live Stats Dashboard, Upgrades, Auto Sell, Community). Siap dieksekusi langsung di eksekutor. |
| `DOCUMENTATION.md` | **Buku panduan lengkap (file ini)** dengan referensi API setiap fungsi dan contoh kode. |

---

## 4. Quick Start (Memulai Cepat)

Jika Anda memuat library via URL mentah (raw loadstring):

```lua
-- Memuat PinatHub Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua"))()

-- Membuat Jendela Utama
local Window = Library:CreateWindow({
    Title = "PinatHub",
    SubTitle = "Universal Script",
    Version = "1.0.0",
    Discord = "https://discord.gg/ysHZCYFaX7"
})

-- Menambahkan Tab
local MainTab = Window:AddTab({ Name = "Main", Icon = "home" })

-- Menambahkan Section
local FarmSection = MainTab:AddSection({ Title = "Automation" })

-- Menambahkan Toggle
FarmSection:AddToggle({
    Title = "Auto Farm Coins",
    Default = false,
    Callback = function(state)
        print("Status Auto Farm:", state)
    end
})

-- Notifikasi Sukses
Window:Notify({
    Title = "PinatHub Siap",
    Content = "Library berhasil dimuat!",
    Duration = 3
})
```

---

## 5. Inisialisasi Window (Library:CreateWindow)

Metode utama untuk membuat antarmuka GUI baru.

```lua
local Window = Library:CreateWindow({
    Title = "PinatHub",                          -- Judul utama di header (Default: "PinatHub")
    SubTitle = "Drain Water",                    -- Subjudul / nama game (Default: "Drain Water")
    Game = "Drain Water",                        -- Nama game
    Version = "1.4.8",                           -- Label versi di kanan atas header
    Discord = "https://discord.gg/ysHZCYFaX7",   -- Tautan Discord
    Logo = "rbxassetid://118264723961739",       -- Asset ID logo PinatHub
    OnClose = function()                         -- Callback saat GUI ditutup total (tombol X)
        print("GUI ditutup! Membersihkan semua loop...")
    end
})
```

### Opsi Konfigurasi:
| Parameter | Tipe Data | Nilai Bawaan | Keterangan |
|-----------|-----------|--------------|------------|
| `Title` | `string` | `"Pinathub"` | Teks judul utama pada header |
| `SubTitle` | `string` | `"Drain Water"` | Teks subjudul samping judul |
| `Version` | `string` | `"1.0.0"` | String versi yang tampil di pill header |
| `Discord` | `string` | `https://discord.gg/ysHZCYFaX7` | Link Discord resmi |
| `Logo` | `string` | `rbxassetid://118264723961739` | Asset ID gambar logo |
| `OnClose` | `function` | `nil` | Fungsi callback pembersih saat UI di-shutdown |

---

## 6. Floating Launcher Button (Icon Toggle PinatHub)

Tombol launcher dibuat secara otomatis saat `Library:CreateWindow` dipanggil. Tombol ini mengadopsi spesifikasi presisi PinatHub:

### Spesifikasi Teknis:
- **ScreenGui**: `MainGui` diparent ke `CoreGui` (prioritas executor) dengan fallback ke `PlayerGui`.
- **Dimensi**: `50 × 50` piksel (`UDim2.new(0, 50, 0, 50)`).
- **Posisi Awal**: Di tengah layar (`UDim2.new(0.5, -25, 0.5, -25)`).
- **Latar Belakang**: Putih solid (`Color3.fromRGB(255, 255, 255)`), `BackgroundTransparency = 0`.
- **Bentuk**: Bulat penuh (`UICorner.CornerRadius = UDim.new(1, 0)`).
- **Outline (UIStroke)**: Hijau neon (`Color3.fromRGB(255, 255, 255)`), ketebalan `2px`.
- **Icon**: Logo PinatHub permanen (`rbxassetid://118264723961739`).
- **Draggable**: Dapat digeser bebas di layar via kursor mouse maupun jari di layar sentuh (mobile support).
- **Fungsi Toggle**:
  - Klik tombol launcher -> Buka / Tutup jendela utama (`WindowOpen = not WindowOpen`).
  - Animasi transisi scale dan fade yang mulus.
  - Tombol minimize (`—`) pada header -> Menutup jendela utama (launcher tetap siaga di layar).
  - Tombol shutdown (`X`) pada header -> Menghancurkan jendela utama dan tombol launcher sepenuhnya, serta memanggil callback `OnClose`.

---

## 7. Metode Window

Objek `Window` yang dikembalikan memiliki fungsi-fungsi berikut:

### `Window:AddTab(config)`
Menambahkan tab baru di sidebar kiri.
```lua
local Tab = Window:AddTab({
    Name = "Auto Farm",
    Icon = "Farm" -- Bisa nama fitur atau nama icon Lucide
})
```

### `Window:Notify(config)`
Menampilkan notifikasi toast melayang yang elegan di pojok kanan bawah.
```lua
Window:Notify({
    Title = "Auto Farm",
    Content = "Mode pembibitan diaktifkan!",
    Duration = 3,
    Type = "Success" -- "Success", "Warning", "Danger", "Info"
})
```

### `Window:Minimize()`
Menyembunyikan jendela utama secara terprogram (bisa dipanggil kapan saja).

### `Window:SelectTab(index)`
Berpindah tab secara otomatis berdasarkan nomor urut (1-indexed).

### `Window:FullShutdown()`
Menutup UI, menghancurkan seluruh instance GUI termasuk floating launcher button, dan membersihkan semua resource.

---

## 8. Sistem Tab & Section

### Menambahkan Section
Section adalah kartu kontainer yang mengelompokkan elemen-elemen kontrol. Section dilengkapi header dengan judul beraksen neon dan ikon chevron (`v`) yang bisa diklik untuk collapse (melipat) dan expand (membuka) section.

```lua
local MySection = MyTab:AddSection({
    Title = "Konfigurasi Otomatis",
    Collapsed = false -- opsional, default false
})
```

### Shorthand Alias untuk Section
Untuk kenyamanan coding, tersedia alias singkat:
```lua
MySection.Toggle      = MySection.AddToggle
MySection.Button      = MySection.AddButton
MySection.Slider      = MySection.AddSlider
MySection.Dropdown    = MySection.AddDropdown
MySection.TextInput   = MySection.AddTextInput
MySection.Keybind     = MySection.AddKeybind
MySection.ColorPicker = MySection.AddColorPicker
MySection.Paragraph   = MySection.AddParagraph
MySection.Graph       = MySection.AddGraph
MySection.Divider     = MySection.AddDivider
```

---

## 9. Katalog Elemen & Kontrol Interaktif

### AddToggle
Tombol switch aktif/nonaktif dengan indikator animasi geser.

```lua
local FarmToggle = MySection:AddToggle({
    Title = "Auto Drain Water",
    Default = false,
    Callback = function(state)
        print("Status:", state)
    end
})

-- Mengubah nilai secara script:
FarmToggle:Set(true)
-- Membaca status saat ini:
local isRunning = FarmToggle:Get()
```

---


### AddSubToggle
Toggle sekunder dengan posisi sedikit menjorok ke dalam (indented), cocok untuk opsi tambahan di bawah fitur utama (misalnya opsi "Auto Sell" di bawah "Auto Farm").

```lua
MySection:AddSubToggle({
    Title = "Auto Sell Saat Tas Penuh",
    Default = false,
    Callback = function(state)
        print("Sub toggle status:", state)
    end
})
```

---

### AddToggleSlider
Kombinasi toggle switch dan slider dalam satu baris kartu yang ringkas. Sangat efisien untuk fitur seperti Speed Boost, Jump Power, atau Fly Speed.

```lua
MySection:AddToggleSlider({
    Title = "WalkSpeed Multiplier",
    DefaultToggle = false,
    Min = 16,
    Max = 150,
    DefaultSlider = 32,
    Suffix = " spd",
    Callback = function(enabled, speed)
        print("Status:", enabled, "Kecepatan:", speed)
    end
})
```

---

### AddButton
Tombol interaktif dengan efek hover dan animasi klik spring.

```lua
MySection:AddButton({
    Title = "Teleport ke Spawn",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        end
    end
})
```

---

### AddSlider
Slider geser untuk mengatur nilai numerik secara presisi.

```lua
local SpeedSlider = MySection:AddSlider({
    Title = "Kecepatan Drain",
    Min = 1,
    Max = 100,
    Default = 16,
    Suffix = " L/s",
    Callback = function(value)
        print("Nilai kecepatan:", value)
    end
})

SpeedSlider:Set(50)
local currentSpeed = SpeedSlider:Get()
```

---

### AddDropdown
Pilihan dropdown modern dengan daftar opsi yang dapat digulir dan dicari.

```lua
local AreaDropdown = MySection:AddDropdown({
    Title = "Pilih Zona Area",
    Options = { "Zona 1 (Laut Dangkal)", "Zona 2 (Terumbu Karang)", "Zona 3 (Palung Laut)" },
    Default = "Zona 1 (Laut Dangkal)",
    Callback = function(selected)
        print("Zona terpilih:", selected)
    end
})

-- Update pilihan baru secara dinamis:
AreaDropdown:Refresh({ "Area A", "Area B", "Area C" })
AreaDropdown:Set("Area B")
```

---

### AddTextInput
Kotak input teks untuk memasukkan nama pemain, angka, atau webhook.

```lua
local InputBox = MySection:AddTextInput({
    Title = "Nama Target",
    PlaceHolder = "Ketik nama pemain di sini...",
    Default = "",
    Callback = function(text)
        print("Teks diinput:", text)
    end
})

InputBox:Set("Player1")
local val = InputBox:Get()
```

---

### AddKeybind
Perekam tombol keyboard untuk shortcut aktivasi fitur.

```lua
local Keybind = MySection:AddKeybind({
    Title = "Shortcut Buka Menu",
    Default = Enum.KeyCode.RightControl,
    Callback = function(key)
        print("Tombol ditekan:", key)
    end
})
```

---

### AddColorPicker
Pemilih warna dinamis berbasis HSV untuk efek visual skrip (ESP, Glow, UI Color).

```lua
local ColorPicker = MySection:AddColorPicker({
    Title = "Warna ESP Target",
    Default = Color3.fromRGB(168, 85, 247),
    Callback = function(color)
        print("Warna diubah:", color)
    end
})
```

---

### AddParagraph (Dukungan RichText Penuh)
Kartu informasi yang mendukung teks multibaris dan **tag warna Roblox RichText**. Sangat ideal untuk dashboard statistik, deskripsi status, dan panduan fitur.

> 💡 **Fitur RichText**: `TitleLabel.RichText = true` dan `ContentLabel.RichText = true` telah terintegrasi secara otomatis, sehingga tag seperti `<font color='#hex'>`, `<b>`, dan `<i>` akan dirender dengan warna cerah tanpa terlihat mentah!

```lua
local StatsCard = MySection:AddParagraph({
    Title = "💰 Treasury & Status Akun",
    Content = "Koin: <font color='#4ade80'>$1,500,000</font>
Level: <font color='#fbbf24'>Level 50</font>
Status: <font color='#93c5fd'>Aktif</font>"
})

-- Memperbarui isi secara dinamis di dalam loop:
StatsCard:SetContent("Koin: <font color='#4ade80'>$2,000,000</font>")
StatsCard:SetTitle("📊 Ringkasan Baru")
StatsCard:Set("Judul Baru", "Isi <font color='#c084fc'>Aksen Baru</font>")
```

---

### AddGraph (Grafik Telemetri Real-Time)
Komponen grafik batang animasi bawaan untuk menampilkan metrik langsung seperti laju drain, throughput data, FPS, atau nilai fluktuatif lainnya.

```lua
local RateGraph = MySection:AddGraph({
    Title = "Laju Drain Air (L/s)", -- Judul grafik
    BarCount = 14,                  -- Jumlah batang grafik
    MaxValue = 100,                 -- Nilai maksimum skala Y
    Height = 110,                   -- Tinggi kontainer dalam piksel
    BarColor = Color3.fromRGB(168, 85, 247),     -- Warna dasar batang
    BarGlow = Color3.fromRGB(192, 132, 252),     -- Warna puncak gradien batang
    Unit = " L/s"                   -- Satuan teks pada label nilai
})

-- Memasukkan data baru (otomatis menggeser data lama ke kiri):
RateGraph:Push(45.5)

-- Mengubah batas maksimum grafik secara dinamis saat nilai melonjak:
RateGraph:SetMax(200)

-- Mengubah judul grafik:
RateGraph:SetTitle("Live Drain Rate")
```

---

### AddDiscordCard & AddCommunityCard
Kartu tautan komunitas resmi yang dilengkapi tombol salin tautan satu ketukan.

```lua
MySection:AddDiscordCard({
    Title = "PinatHub Official Community",
    Members = "10.000+",
    Online = "1.500+",
    Invite = "https://discord.gg/ysHZCYFaX7"
})
```

---

### AddDivider
Garis pemisah elegan tipis untuk merapikan tata letak antar elemen kontrol.

```lua
MySection:AddDivider()
```

---

## 10. Sistem Tema & Warna

Library ini menggunakan palet warna gelap Obsidian dengan aksen Amethyst Glow yang lembut di mata:

| Token Tema | Nilai RGB | Penggunaan |
|------------|-----------|------------|
| `Background` | `15, 14, 20` | Warna dasar jendela utama |
| `Header` | `20, 18, 28` | Bar navigasi header atas |
| `Sidebar` | `17, 16, 24` | Sidebar navigasi tab kiri |
| `Surface` | `25, 23, 35` | Latar kartu section |
| `SurfaceHover` | `34, 31, 48` | Latar elemen saat mouse hover |
| `SurfaceActive`| `46, 41, 66` | Latar elemen saat aktif / ditekan |
| `Accent` | `168, 85, 247` | Aksen ungu neon utama |
| `AccentGlow` | `192, 132, 252` | Kilau neon untuk teks penting & judul |
| `NeonWhite` | `245, 247, 255` | Teks judul utama & label tombol |
| `Text` | `245, 245, 250` | Teks reguler |
| `TextSecondary`| `170, 168, 185`| Teks deskripsi & keterangan |
| `TextMuted` | `115, 112, 130`| Teks nonaktif / placeholder |
| `Success` | `74, 222, 128` | Hijau neon (Status aktif / ON) |
| `Warning` | `251, 191, 36` | Kuning amber (Perhatian) |
| `Danger` | `248, 113, 113` | Merah terang (Tutup / Error) |

---

## 11. Daftar Icon Bawaan

Saat menambahkan tab dengan `Window:AddTab({ Name = "...", Icon = "..." })`, Anda dapat menggunakan kata kunci berikut:

### Icon Khas Game & Fitur:
- `"Auto Farm"` / `"Farm"` -> Tetesan Air (`droplet`)
- `"Upgrades"` / `"Upgrade"` -> Panah ke Atas (`arrow-up`)
- `"Fish & Pets"` / `"Fish"` -> Jangkar Laut (`anchor`)
- `"Pets"` -> Tas Ransel (`backpack`)
- `"Auto Sell"` / `"Sell"` -> Tanda Dolar (`dollar-sign`)
- `"Advanced"` -> Kunci Pas (`wrench`)
- `"Live Stats"` / `"Stats"` -> Grafik Batang (`bar-chart-2`)
- `"Community"` -> Grup Pengguna (`users`)

### Icon Lucide Umum:
- `"home"`, `"settings"`, `"sliders"`, `"user"`, `"users"`, `"eye"`, `"crosshair"`
- `"skull"`, `"swords"`, `"sword"`, `"shield"`, `"wrench"`, `"activity"`, `"heart"`
- `"bell"`, `"search"`, `"globe"`, `"database"`, `"discord"`, `"flame"`, `"coins"`

---

## 12. Template Boilerplate (Siap Pakai untuk Game Baru)

Salin kode di bawah ini sebagai pondasi cepat untuk membuat skrip cheat/utility game Roblox baru:

```lua
-- ------------------------------------------------------------
-- PINATHUB SCRIPT TEMPLATE — SIAP PAKAI
-- Discord: https://discord.gg/ysHZCYFaX7
-- WhatsApp XploitForce: https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp
-- YouTube: https://www.youtube.com/@viunzee1
-- ------------------------------------------------------------

repeat task.wait() until game:IsLoaded()

-- Memuat Library Source
-- Ganti RAW_URL dengan tautan mentah file kingrualibrarysource.lua Anda
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua"))()

local Window = Library:CreateWindow({
    Title = "PinatHub",
    SubTitle = "My New Game Script",
    Version = "1.0.0",
    Discord = "https://discord.gg/ysHZCYFaX7",
    OnClose = function()
        print("Script dinonaktifkan!")
    end
})

-- ==================== TAB UTAMA ====================
local MainTab = Window:AddTab({ Name = "Main Features", Icon = "home" })
local MainSec = MainTab:AddSection({ Title = "Automation" })

local isFarming = false
MainSec:AddToggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(state)
        isFarming = state
        if isFarming then
            task.spawn(function()
                while isFarming do
                    task.wait(0.5)
                    -- Logika farming Anda di sini
                end
            end)
        end
    end
})

MainSec:AddSlider({
    Title = "WalkSpeed Multiplier",
    Min = 16,
    Max = 200,
    Default = 16,
    Suffix = " spd",
    Callback = function(v)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

-- ==================== TAB STATISTIK ====================
local StatsTab = Window:AddTab({ Name = "Live Stats", Icon = "Live Stats" })
local GraphSec = StatsTab:AddSection({ Title = "Performance Metrics" })

local myGraph = GraphSec:AddGraph({
    Title = "Real-Time CPS / Throughput",
    BarCount = 14,
    MaxValue = 100,
    Height = 110,
    Unit = " op/s"
})

local MetricsSec = StatsTab:AddSection({ Title = "Status Overview" })
local myStatusPara = MetricsSec:AddParagraph({
    Title = "Player Telemetry",
    Content = "Memuat data telemetri..."
})

-- Worker Update Real-Time
task.spawn(function()
    while true do
        task.wait(1)
        local sample = math.random(20, 85)
        myGraph:Push(sample)
        myStatusPara:SetContent(string.format(
            "Uptime: <font color='#4ade80'>%d detik</font>
Throughput: <font color='#c084fc'>%d op/s</font>
Status: <font color='#93c5fd'>Optimal</font>",
            math.floor(workspace.DistributedGameTime), sample
        ))
    end
end)

-- ==================== TAB KOMUNITAS ====================
local CommTab = Window:AddTab({ Name = "Community", Icon = "Community" })
local CommSec = CommTab:AddSection({ Title = "Join Our Network" })

CommSec:AddParagraph({
    Title = "PinatHub Network",
    Content = "Dapatkan update script eksklusif dan tutorial di channel kami!"
})

CommSec:AddButton({
    Title = "Gabung WhatsApp XploitForce (Utama)",
    Callback = function()
        setclipboard("https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp")
        Library:Notify({ Title = "Berhasil", Content = "Link WhatsApp disalin!", Duration = 3 })
    end
})

CommSec:AddButton({
    Title = "Gabung Discord PinatHub",
    Callback = function()
        setclipboard("https://discord.gg/ysHZCYFaX7")
        Library:Notify({ Title = "Berhasil", Content = "Link Discord disalin!", Duration = 3 })
    end
})

CommSec:AddButton({
    Title = "Kunjungi YouTube @viunzee1",
    Callback = function()
        setclipboard("https://www.youtube.com/@viunzee1")
        Library:Notify({ Title = "Berhasil", Content = "Link YouTube disalin!", Duration = 3 })
    end
})

Window:Notify({
    Title = "PinatHub Siap",
    Content = "Selamat datang! Tekan floating launcher untuk membuka/tutup UI.",
    Duration = 4
})
```

---

## 13. FAQ & Solusi Masalah

### Q1: Mengapa tag warna `<font color=...>` sebelumnya muncul sebagai teks mentah?
**Jawaban**: Teks mentah terjadi bila properti `RichText = true` belum diaktifkan pada `TextLabel`. Pada versi ini, `TitleLabel.RichText = true` dan `ContentLabel.RichText = true` telah diaktifkan secara permanen di dalam `AddParagraph`, sehingga seluruh format XML Roblox akan diuraikan menjadi warna yang indah.

### Q2: Mengapa grafik telemetri sebelumnya kosong atau hilang?
**Jawaban**: Sebelumnya kontainer grafik di-parent secara manual melalui pemanggilan `pcall` yang gagal menemukan parent internal. Sekarang, library telah menyediakan fungsi bawaan `SecObj:AddGraph(cfg)` yang terhubung langsung ke `secData.Elements`, menghitung tinggi kartu secara dinamis, dan merender 14 batang grafik animasi secara presisi.

### Q3: Bagaimana cara kerja tombol launcher mengambang?
**Jawaban**: Tombol launcher berada di ScreenGui `MainGui` yang terpisah dengan `ZIndex = 50`. Tombol ini selalu tampil di layar. Ketika diklik, tombol ini mengubah nilai boolean `WindowOpen = not WindowOpen` dan memicu animasi scale serta visibilitas `DropShadowHolder`. Tombol ini dapat digeser bebas (draggable) kapan saja ke posisi yang Anda inginkan.

### Q4: Apakah GUI ini menembus menu atas Roblox?
**Jawaban**: Ya. `MainGui` dan `ScreenGui` diset dengan `IgnoreGuiInset = true` dan `DisplayOrder = 999999`, sehingga berada di atas layer HUD default Roblox.

### Q5: Bagaimana cara mematikan semua loop otomatis saat GUI di-close?
**Jawaban**: Masukkan fungsi pembersih pada opsi `OnClose` di `Library:CreateWindow`:
```lua
local isRunning = true
Library:CreateWindow({
    OnClose = function()
        isRunning = false -- Otomatis menghentikan semua loop while isRunning do
    end
})
```

---

*© 2026 PinatHub Official • Dikembangkan dengan bangga oleh vinzee*  
*Komunitas Utama WhatsApp: https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp*  
*Discord Official: https://discord.gg/ysHZCYFaX7*  
*YouTube: https://www.youtube.com/@viunzee1*
