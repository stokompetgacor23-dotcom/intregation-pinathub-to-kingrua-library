# PinatHub UI Library — Dokumentasi & Panduan Lengkap

> **Versi**: PinatHub Official Edition (Universal Engine 3.1.0)  
> **Developer**: vinzee (@viunzee1)  
> **Komunitas Utama WhatsApp (XploitForce)**: [https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp](https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp)  
> **Discord Official**: [https://discord.gg/ysHZCYFaX7](https://discord.gg/ysHZCYFaX7)  
> **YouTube Channel**: [https://www.youtube.com/@viunzee1](https://www.youtube.com/@viunzee1)  
> **TikTok**: [https://tiktok.com/@viunze](https://tiktok.com/@viunze)  

---

## 📑 Daftar Isi

1. [Pengenalan & Keunggulan](#1-pengenalan--keunggulan)
2. [Tautan Komunitas & Dukungan](#2-tautan-komunitas--dukungan)
3. [Struktur File Workspace](#3-struktur-file-workspace)
4. [Quick Start (Memulai Cepat)](#4-quick-start-memulai-cepat)
5. [Inisialisasi Window (Library:CreateWindow)](#5-inisialisasi-window-librarycreatewindow)
6. [Floating Launcher Button (PinatHub Toggle Icon)](#6-floating-launcher-button-pinathub-toggle-icon)
7. [Metode & Kontrol Window](#7-metode--kontrol-window)
8. [Sistem Tab & Section](#8-sistem-tab--section)
9. [Katalog Lengkap Seluruh 15 Elemen UI](#9-katalog-lengkap-seluruh-15-elemen-ui)
   - [9.1 AddToggle (Dengan Opsi Keybind & Deskripsi)](#91-addtoggle)
   - [9.2 AddSubToggle (Sub-Toggle Bercabang / Indented)](#92-addsubtoggle)
   - [9.3 AddToggleSlider (Kombinasi Toggle + Slider dalam 1 Baris)](#93-addtoggleslider)
   - [9.4 AddButton (Tombol Interaktif dengan Ikon)](#94-addbutton)
   - [9.5 AddSlider (Slider Presisi dengan Input Box Langsung)](#95-addslider)
   - [9.6 AddDropdown (Popout Drawer Kanan + Pencarian Opsi)](#96-adddropdown)
   - [9.7 AddInput / AddTextInput (Kotak Masukan Teks)](#97-addinput--addtextinput)
   - [9.8 AddKeybind (Perekam Hotkey Keyboard)](#98-addkeybind)
   - [9.9 AddColorPicker (Pemilih Warna & Preset Palet)](#99-addcolorpicker)
   - [9.10 AddParagraph (Kartu Informasi & Dukungan RichText Penuh)](#910-addparagraph)
   - [9.11 AddGraph (Grafik Batang Telemetri Animasi Real-Time)](#911-addgraph)
   - [9.12 AddProgressBar (Bilah Progres Halus / XP / Level)](#912-addprogressbar)
   - [9.13 AddPlayerList (Daftar Pemilih Pemain Interaktif & Searchable)](#913-addplayerlist)
   - [9.14 AddDiscordCard / AddCommunityCard (Kartu Komunitas Resmi)](#914-adddiscordcard--addcommunitycard)
   - [9.15 AddSeperator / AddDivider (Garis Pemisah & Header Kategori)](#915-addseperator--adddivider)
10. [Struktur Section & Toggle di Example Resmi (`pinathub_example.lua`)](#10-struktur-section--toggle-di-example-resmi)
11. [Sistem Config Profile Manager (Penyimpanan JSON & Memori)](#11-sistem-config-profile-manager)
12. [Sistem Tema & Palet Warna](#12-sistem-tema--palet-warna)
13. [Daftar Icon Bawaan](#13-daftar-icon-bawaan)
14. [Template Boilerplate Universal (Siap Pakai untuk Game Baru)](#14-template-boilerplate-universal)
15. [FAQ & Solusi Masalah Teknis](#15-faq--solusi-masalah-teknis)

---

## 1. Pengenalan & Keunggulan

**PinatHub UI Library** adalah framework antarmuka pengguna (UI) modern berkinerja tinggi yang dirancang khusus untuk skrip Roblox (kompatibel dengan Solara, Wave, Delta, Fluxus, Codex, Swift, Synapse Z, Macsploit, dll.). Framework ini memadukan estetika obsidian glassmorphism gelap dengan aksen neon ungu-putih khas PinatHub.

### Fitur Unggulan:
- **Floating Launcher Button**: Tombol toggle melayang permanen berbentuk bulat (50×50 px) dengan latar putih, outline putih neon, logo PinatHub permanen, dan dukungan drag & drop halus (Mouse PC & Touch Mobile).
- **CoreGui & Topbar Overlay**: Menggunakan layer rendering tertinggi (`DisplayOrder = 999999`, `IgnoreGuiInset = true`) sehingga mampu menembus menu atas Roblox tanpa terhalang.
- **RichText Engine Terintegrasi**: Komponen teks mendukung penuh pewarnaan dinamis via tag Roblox XML seperti `<font color='#4ade80'>$50M</font>`, `<b>Teks Tebal</b>`, dan `<i>Miring</i>`.
- **Live Telemetry Bar Graph**: Modul grafik batang 14 bar real-time dengan animasi tween halus untuk menampilkan performa, throughput data, dan statistik live.
- **Multi-Select Collapsible Paragraphs**: Kartu informasi yang dapat dibuka/ditutup secara independen. Beberapa kartu bisa terbuka sekaligus (multi-select), klik di luar semua kartu yang terbuka untuk auto-collapse, chevron indicator, dan opsi `DefaultOpen = true`.
- **Interaksi Komprehensif**: Mendukung semua jenis kontrol: Regular Toggle, Sub-Toggle (indented), Dual Toggle-Slider, Progress Bar, Multi-Player Selector, Color Picker, hingga Drawer Popout Dropdown.
- **Dukungan Mobile & PC**: Kompatibel penuh dengan input sentuh (Touch) di Android/iOS dan mouse di Windows/Mac.

---

## 2. Tautan Komunitas & Dukungan

Bergabunglah dengan jaringan resmi PinatHub untuk mendapatkan pembaruan terkini, tutorial, dan rilis skrip baru:

- 🟢 **Komunitas Utama WhatsApp (XploitForce)**:  
  [https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp](https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp)
- 🟣 **Discord Official PinatHub**:  
  [https://discord.gg/ysHZCYFaX7](https://discord.gg/ysHZCYFaX7)
- 🔴 **YouTube Channel (vinzee)**:  
  [https://www.youtube.com/@viunzee1](https://www.youtube.com/@viunzee1)
- ⚫ **TikTok Official (@viunze)**:  
  [https://tiktok.com/@viunze](https://tiktok.com/@viunze)

---

## 3. Struktur File Workspace

| Nama File | Deskripsi |
|-----------|-----------|
| `kingrualibrarysource.lua` | **Source UI Library Murni**. Berisi seluruh core logika UI, komponen visual, launcher button, drawer popout, theme engine, dan manajemen event. Gunakan file ini jika ingin meng-host library di GitHub / Pastebin untuk di-`loadstring`. |
| `pinathub_example.lua` | **Example Showcase Lengkap**. Contoh implementasi komprehensif tanpa fitur game spesifik. Mendemonstrasikan seluruh 7 tab, semua variasi section & toggle, ke-15 elemen UI, sistem telemetri live, dan Config Profile Manager. |
| `DOCUMENTATION.md` | **Buku Panduan & Dokumentasi Lengkap (File Ini)** dengan referensi API setiap fungsi, tabel parameter, dan contoh kode. |

---

## 4. Quick Start (Memulai Cepat)

Jika Anda ingin memuat library langsung via URL mentah (raw GitHub loadstring):

```lua
-- Tunggu hingga game selesai dimuat
repeat task.wait() until game:IsLoaded()

-- Memuat PinatHub Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua"))()

-- Membuat Window Utama
local Window = Library:CreateWindow({
    Title = "PinatHub",
    SubTitle = "Universal Control Center",
    Version = "3.0.0",
    Discord = "https://discord.gg/ysHZCYFaX7"
})

-- Menambahkan Tab
local MainTab = Window:AddTab({ Title = "Main", Icon = "home" })

-- Menambahkan Section
local FarmSection = MainTab:AddSection({ Title = "Automation" })

-- Menambahkan Toggle
FarmSection:AddToggle({
    Title = "Auto Farm Coins",
    Description = "Mengaktifkan loop otomatis",
    Default = false,
    Callback = function(state)
        print("Status Auto Farm:", state)
    end
})

-- Mengirim Notifikasi
Library:Notify({
    Title = "PinatHub",
    Content = "Skrip berhasil diinisialisasi!",
    Type = "Success"
})
```

---

## 5. Inisialisasi Window (Library:CreateWindow)

Metode utama untuk membuat jendela antarmuka GUI baru.

```lua
local Window = Library:CreateWindow({
    Title = "PinatHub",                          -- Judul utama di header (Default: "PinatHub")
    SubTitle = "Universal Control Center",       -- Subjudul / nama kategori (Default: "Drain Water")
    Game = "Universal Script Hub",               -- Nama game / mode
    Version = "3.0.0",                           -- Label versi di kanan atas header
    Discord = "https://discord.gg/ysHZCYFaX7",   -- Tautan Discord resmi
    Logo = "rbxassetid://118264723961739",       -- Asset ID logo PinatHub
    OnClose = function()                         -- Callback saat tombol Close (X) ditekan
        print("[PinatHub] Window ditutup total! Bersihkan semua loop background...")
    end
})
```

### Parameter Konfigurasi:
| Parameter | Tipe Data | Nilai Bawaan | Keterangan |
|-----------|-----------|--------------|------------|
| `Title` | `string` | `"Pinathub"` | Teks judul utama pada header |
| `SubTitle` | `string` | `"Drain Water"` | Teks subjudul samping judul |
| `Game` | `string` | `"Drain Water"` | Nama game atau edisi skrip |
| `Version` | `string` | `"1.0.0"` | String versi yang tampil pada pill kanan header |
| `Discord` | `string` | `https://discord.gg/ysHZCYFaX7` | Link Discord resmi |
| `Logo` | `string` | `rbxassetid://118264723961739` | Asset ID gambar watermark dan logo launcher |
| `OnClose` | `function` | `nil` | Callback fungsi pembersih saat UI di-shutdown |

---

## 6. Floating Launcher Button (PinatHub Toggle Icon)

Tombol launcher dibuat secara otomatis saat `Library:CreateWindow` dipanggil. Tombol ini memiliki spesifikasi teknis presisi:

- **Dimensi**: `50 × 50` piksel (`UDim2.new(0, 50, 0, 50)`).
- **Posisi Awal**: Di tengah layar (`UDim2.new(0.5, -25, 0.5, -25)`).
- **Latar Belakang**: Putih solid (`Color3.fromRGB(255, 255, 255)`), `BackgroundTransparency = 0`.
- **Bentuk**: Lingkaran bulat penuh (`UICorner.CornerRadius = UDim.new(1, 0)`).
- **Outline (UIStroke)**: Putih neon (`Color3.fromRGB(255, 255, 255)`), ketebalan `2px`.
- **Icon**: Logo PinatHub permanen (`rbxassetid://118264723961739`).
- **Draggable**: Dapat digeser bebas di layar via mouse (PC) maupun layar sentuh (Mobile).
- **Fungsi**:
  - Klik tombol launcher -> Buka / Tutup jendela utama dengan animasi transisi smooth scale & fade.
  - Tombol minimize (`—`) pada header -> Menyembunyikan jendela (launcher tetap siaga di layar).
  - Tombol close (`X`) pada header -> Menghancurkan seluruh UI dan memanggil callback `OnClose`.

---

## 7. Metode & Kontrol Window

Objek `Window` yang dikembalikan memiliki metode-metode berikut:

### `Window:AddTab(config)` / `Window:Tab(config)` / `Window:T(config)`
Menambahkan tab navigasi baru di sidebar kiri.
```lua
local MyTab = Window:AddTab({
    Title = "Combat",
    Icon = "swords", -- Nama icon Lucide atau asset ID
    Desc = "Pengaturan pertarungan dan target"
})
```

### `Window:Minimize()`
Menyembunyikan jendela utama secara terprogram (bisa dipanggil kapan saja dari script).
```lua
Window:Minimize()
```

### `Window:SelectTab(index)`
Berpindah tab secara otomatis berdasarkan nomor urut (1-indexed).
```lua
Window:SelectTab(1) -- Berpindah ke tab pertama
```

### `Library:Notify(config)`
Menampilkan notifikasi toast melayang di pojok kanan bawah.
```lua
Library:Notify({
    Title = "Auto Farm",
    Content = "Target berhasil dikumpulkan!",
    Type = "Success" -- Opsi: "Success", "Warning", "Danger", "Info"
})
```

---

## 8. Sistem Tab & Section

### Menambahkan Section
Section adalah kartu kontainer pengelompok elemen. Header section dilengkapi teks beraksen neon dan ikon panah (`v`) yang dapat diklik untuk melipat (*collapse*) atau membuka (*expand*) section.

```lua
local MySec = MyTab:AddSection({
    Title = "Automation Engine"
})
-- Bisa juga langsung string:
local MySec2 = MyTab:AddSection("Player Modifiers")
```

### Alias Shorthand Method Section:
Untuk fleksibilitas penulisan skrip, Anda dapat menggunakan nama metode standar maupun alias:
- `AddToggle` / `Toggle`
- `AddSubToggle` / `SubToggle`
- `AddToggleSlider` / `ToggleSlider`
- `AddButton` / `Button`
- `AddSlider` / `Slider`
- `AddDropdown` / `Dropdown`
- `AddInput` / `AddTextInput` / `Input` / `TextInput`
- `AddKeybind` / `Keybind`
- `AddColorPicker` / `ColorPicker`
- `AddParagraph` / `Paragraph`
- `AddGraph` / `Graph`
- `AddProgressBar` / `ProgressBar`
- `AddPlayerList` / `PlayerList`
- `AddDiscordCard` / `AddCommunityCard` / `DiscordCard` / `CommunityCard`
- `AddSeperator` / `AddSeparator` / `AddDivider` / `Divider`

---

## 9. Katalog Lengkap Seluruh 15 Elemen UI

### 9.1 AddToggle
Tombol switch aktif/nonaktif utama dengan opsi deskripsi dan lencana keybind inline `[None]`.

```lua
local MasterToggle = MySec:AddToggle({
    Title = "Master Farm Switch",
    Description = "Aktifkan siklus utama dengan hotkey F",
    Default = false,
    Keybind = Enum.KeyCode.F, -- Opsional: langsung pasang hotkey
    Callback = function(state)
        print("Status toggle:", state)
    end
})

-- Metode Controller:
MasterToggle:Set(true)   -- Mengubah nilai secara terprogram
print(MasterToggle.Value) -- Membaca nilai saat ini (boolean)
```

---

### 9.2 AddSubToggle
Toggle sekunder dengan indent visual ke dalam. Sangat ideal untuk opsi turunan di bawah toggle utama.

```lua
local SubSell = MySec:AddSubToggle({
    Title = "Auto Sell Saat Tas Penuh",
    Default = true,
    Callback = function(state)
        print("Sub-toggle state:", state)
    end
})

-- Metode Controller:
SubSell:Set(false)
local current = SubSell:Get()
```

---

### 9.3 AddToggleSlider
Elemen ganda yang menggabungkan Switch Toggle dan Slider ke dalam **satu baris kartu ringkas**. Sangat efisien untuk menghemat ruang pada fitur seperti WalkSpeed, JumpPower, FOV, atau Fly Speed.

```lua
local SpeedCtrl = MySec:AddToggleSlider({
    Title = "Custom WalkSpeed",
    DefaultToggle = false,
    Min = 16,
    Max = 250,
    DefaultSlider = 32,
    Suffix = " studs/s",
    Callback = function(toggleState, sliderValue)
        print("Aktif:", toggleState, "Kecepatan:", sliderValue)
    end
})

-- Metode Controller:
SpeedCtrl:SetToggle(true)
SpeedCtrl:SetSlider(50)
local isEnabled, currentVal = SpeedCtrl:Get()
```

---

### 9.4 AddButton
Tombol aksi interaktif dengan animasi bounce spring saat diklik dan dukungan ikon.

```lua
MySec:AddButton({
    Title = "Teleport ke Safe Zone",
    Description = "Pindah posisi karakter secara instan",
    Icon = "target", -- Lucide icon name atau rbxassetid
    Callback = function()
        print("Tombol ditekan!")
    end
})
```

---

### 9.5 AddSlider
Slider geser horizontal presisi dengan kotak input teks langsung di sebelah kanan judul (bisa digeser atau diketik langsung nilainya).

```lua
local DelaySlider = MySec:AddSlider({
    Title = "Harvest Action Delay",
    Min = 0.1,
    Max = 5.0,
    Default = 0.5,
    Increment = 0.1,
    Callback = function(value)
        print("Delay:", value)
    end
})

-- Metode Controller:
DelaySlider:Set(1.2)
print(DelaySlider.Value)
```

---

### 9.6 AddDropdown
Dropdown modern yang memicu **Drawer Popout di sisi kanan layar** dengan fitur kotak pencarian (*search filter*), tombol tutup cepat (`X`), deteksi klik di luar drawer (*click outside to close*), dan dukungan pilihan tunggal maupun ganda (*multi-select*). Drawer otomatis tertutup jika pengguna berpindah tab.

```lua
local ModeDropdown = MySec:AddDropdown({
    Title = "Farming Routine Mode",
    Description = "Pilih pola pergerakan auto-farm",
    Values = { "Default Pattern", "Aggressive Orbit", "Stealth Safe", "Custom Path" },
    Default = "Default Pattern",
    Multi = false,
    Callback = function(selected)
        print("Pilihan terpilih:", selected)
    end
})

-- Fitur Drawer Popout:
-- 1. Tombol 'X' di header drawer untuk menutup drawer secara manual
-- 2. Klik di luar area popout drawer untuk langsung menutup drawer
-- 3. Otomatis menutup saat pengguna berpindah tab di sidebar
-- 4. Ukuran kompak (155px) sehingga tidak menutupi seluruh konten

-- Metode Controller:
ModeDropdown:Set("Aggressive Orbit")
ModeDropdown:Refresh({ "Opsi 1", "Opsi 2", "Opsi 3" }) -- Memperbarui daftar opsi
local current = ModeDropdown:Get()
```

---

### 9.7 AddInput / AddTextInput
Kotak masukan teks dengan efek glowing stroke saat sedang fokus (diketik).

```lua
local WaypointInput = MySec:AddTextInput({
    Title = "Nama Waypoint",
    Default = "Base_Alpha",
    PlaceHolder = "Ketik identitas koordinat...",
    Callback = function(text)
        print("Teks diinput:", text)
    end
})
```

---

### 9.8 AddKeybind
Perekam tombol keyboard mandiri (*standalone keybind selector*). Pengguna cukup mengklik tombol, lalu menekan tombol keyboard apa pun yang diinginkan.

```lua
local UIKeybind = MySec:AddKeybind({
    Title = "Toggle UI Window Keybind",
    Default = Enum.KeyCode.RightControl,
    Callback = function(keyCode)
        print("Keybind baru:", keyCode.Name)
    end
})

-- Metode Controller:
UIKeybind:Set(Enum.KeyCode.F8)
local key = UIKeybind:Get()
```

---

### 9.9 AddColorPicker
Pemilih warna interaktif dengan kotak preview warna dan siklus palet preset (ungu, biru, hijau, kuning, merah, pink, toska, putih).

```lua
local ESPColor = MySec:AddColorPicker({
    Title = "Warna ESP Accent",
    Description = "Warna outline untuk sorotan visual",
    Default = Color3.fromRGB(168, 85, 247),
    Callback = function(color3)
        print("Warna dipilih:", color3)
    end
})

-- Metode Controller:
ESPColor:Set(Color3.fromRGB(74, 222, 128))
local c = ESPColor:Get()
```

---

### 9.10 AddParagraph
Kartu informasi multi-baris collapsible dengan **multi-select expand/collapse independen**, dukungan penuh **Roblox RichText XML formatting** (`<font color='#hex'>`, `<b>`, `<i>`, dll.), animasi smooth slide, chevron rotate indicator, tombol tutup kartu (`X`), dan auto-collapse saat klik di luar kartu.

#### Perilaku Baru (v3.1):
- **Collapsed by default**: Kartu mulai dalam keadaan lipat (26px header saja — hanya judul + chevron + X).
- **Click header → expand**: Klik area header untuk membuka isi kartu dengan animasi slide + accent glow + chevron rotate 90°.
- **Click header lagi → collapse**: Lipat kembali ke mode header saja.
- **Multi-select**: Beberapa kartu dapat dibuka sekaligus secara independen — membuka satu tidak menutup yang lain.
- **Click anywhere outside → auto-collapse**: Jika ada kartu yang terbuka dan pengguna mengklik area di luar kartu tersebut, kartu otomatis terlipat.
- **Tombol X**: Menyembunyikan kartu sepenuhnya dari tampilan (bukan sekadar collapse).
- **DefaultOpen = true**: Kartu langsung ter-expand otomatis saat dibuat.

```lua
-- Contoh 1: Collapsed by default (klik header untuk expand)
local StatusCard = MySec:AddParagraph({
    Title = "Session Analytics Overview",
    Content = "<b>Status:</b> <font color='#4ade80'>Aktif</font>\n" ..
              "<b>Latency:</b> <font color='#38bdf8'>35 ms</font>\n" ..
              "<b>Throughput:</b> <font color='#facc15'>24 op/s</font>"
    -- DefaultOpen = false (nilai bawaan: dimulai dalam keadaan collapse)
})

-- Contoh 2: Auto-expanded saat dibuat (untuk kartu dengan data live)
local LiveCard = MySec:AddParagraph({
    Title = "Live System Metrics",
    Content = "Initializing...",
    DefaultOpen = true  -- Langsung expand saat dibuat
})

-- Contoh 3: Multi-select — dua kartu bisa terbuka bersamaan
local CardA = MySec:AddParagraph({ Title = "Info A", Content = "Detail A..." })
local CardB = MySec:AddParagraph({ Title = "Info B", Content = "Detail B..." })
-- User bisa expand CardA lalu expand CardB — keduanya tetap terbuka
-- Klik di luar keduanya -> keduanya auto-collapse
```

#### Parameter Konfigurasi:
| Parameter | Tipe Data | Nilai Bawaan | Keterangan |
|-----------|-----------|--------------|------------|
| `Title` | `string` | `"Information"` | Judul header kartu |
| `Content` | `string` | `""` | Isi konten (mendukung RichText XML) |
| `Desc` / `Description` | `string` | — | Alias untuk `Content` |
| `DefaultOpen` | `boolean` | `false` | `true` = auto-expand saat dibuat |

#### Metode Controller (ParaObj API):
```lua
-- ── Expand / Collapse ───────────────────────────────────────────────
StatusCard:Expand()         -- Buka kartu (expand dengan animasi)
StatusCard:Collapse()       -- Tutup kartu (collapse ke header saja)
StatusCard:Toggle()         -- Toggle antara expand dan collapse

-- ── Visibilitas ─────────────────────────────────────────────────────
StatusCard:Open()           -- Tampilkan & expand kartu (jika tersembunyi)
StatusCard:Close()          -- Sembunyikan kartu sepenuhnya dari tampilan

-- ── Update Konten ───────────────────────────────────────────────────
StatusCard:SetTitle("Judul Baru")
StatusCard:SetContent("<b>Data:</b> <font color='#4ade80'>Updated</font>")
StatusCard:SetDesc("Alias untuk SetContent")
StatusCard:Set("Judul", "Isi baru")       -- Update judul + isi sekaligus
StatusCard:Set("Hanya Isi Baru")          -- Update isi saja (tanpa judul)
```

#### Contoh Live Data Feed:
```lua
-- Buat kartu yang auto-expand dan update kontennya tiap detik
local LiveCard = MySec:AddParagraph({
    Title = "Live Stats",
    Content = "Loading...",
    DefaultOpen = true
})

task.spawn(function()
    while task.wait(1) do
        local ping = math.floor((game.Players.LocalPlayer:GetNetworkPing()) * 1000)
        LiveCard:SetContent(
            string.format("<b>Ping:</b> <font color='#4ade80'>%d ms</font>", ping)
        )
    end
end)
```

---

### 9.11 AddGraph
Grafik batang telemetri real-time 14-bar dengan animasi tweening tinggi batang yang halus.

```lua
local CPSGraph = MySec:AddGraph({
    Title = "Action Throughput & CPS",
    BarCount = 14,
    MaxValue = 60,
    Height = 115,
    Unit = "/s"
})

-- Metode Controller:
CPSGraph:Push(28)          -- Memasukkan data baru (menggeser batang lama ke kiri)
CPSGraph:SetMax(100)       -- Mengubah skala batas maksimum Y
CPSGraph:SetTitle("Throughput Live") -- Mengubah judul grafik
```

---

### 9.12 AddProgressBar
Bilah progres animasi halus dengan indikator persentase otomatis. Sangat ideal untuk status kapasitas tas penyimpanan, level XP, atau proses unduhan data.

```lua
local BagProgress = MySec:AddProgressBar({
    Title = "Inventory Bag Capacity",
    Default = 45,
    Max = 100
})

-- Metode Controller:
BagProgress:Set(80, 100) -- Memperbarui nilai dan batas maksimum (otomatis update teks ke 80%)
```

---

### 9.13 AddPlayerList
Komponen daftar pemain interaktif lengkap dengan fitur **kotak pencarian pemain real-time**, tombol **Select All**, tombol **Deselect All**, checklist tanda centang (`✓` / `○`), serta sinkronisasi otomatis saat pemain masuk (`PlayerAdded`) atau keluar (`PlayerRemoving`).

```lua
local PlayerFilter = MySec:AddPlayerList({
    Title = "Target & Whitelist Players",
    Multi = true,
    Callback = function(selectedPlayersMap)
        print("Daftar pemain terpilih:")
        for playerName, playerInstance in pairs(selectedPlayersMap) do
            print(" -", playerName)
        end
    end
})
```

---

### 9.14 AddDiscordCard / AddCommunityCard
Kartu tautan komunitas resmi PinatHub yang menampilkan jumlah total member, status online live, dan tombol satu-ketukan untuk menyalin link invite Discord ke clipboard.

```lua
MySec:AddDiscordCard({
    Title = "PinatHub Official Community",
    Members = "30522",
    Online = "2309",
    Invite = "https://discord.gg/ysHZCYFaX7",
    Callback = function()
        print("Link Discord disalin ke clipboard!")
    end
})
```

---

### 9.15 AddSeperator / AddDivider
Garis pembatas pemisah antar grup elemen. Dapat berupa garis horizontal tipis elegan (jika teks kosong) atau berupa header teks kategori beraksen ungu neon (jika diberikan teks judul).

```lua
-- Contoh 1: Garis pemisah tipis
MySec:AddSeperator()

-- Contoh 2: Header Kategori
MySec:AddSeperator("PENGATURAN PROFIL & PREFERENSI")
```

---

## 10. Struktur Section & Toggle di Example Resmi

Skrip contoh lengkap [`pinathub_example.lua`](file:///c:/Users/personal/pinathubkingrua/intregation-pinathub-to-kingrua-library/pinathub_example.lua) menyusun seluruh elemen ke dalam 7 tab tematik:

| Tab | Section | Elemen & Toggle yang Tersedia |
|-----|---------|--------------------------------|
| **1. Main** (`home`) | **Auto Farming** | • `AddToggle`: Master Farm Switch (Hotkey: `F`)<br>• `AddSubToggle`: Auto Collect Drops<br>• `AddSubToggle`: Auto Sell Inventory<br>• `AddSubToggle`: Auto Level Up & Rebirth<br>• `AddToggleSlider`: Fast Clicker (5–60 CPS)<br>• `AddSlider`: Harvest Action Delay (0.1–3.0s)<br>• `AddDropdown`: Farming Routine Mode |
| | **Combat & Targeting** | • `AddToggle`: Auto Attack Target (Hotkey: `R`)<br>• `AddSubToggle`: Prioritize Boss & Elite Targets<br>• `AddSubToggle`: Auto Equip Strongest Weapon<br>• `AddToggle`: Kill Aura (360° Sphere)<br>• `AddSlider`: Aura Detection Radius (5–50 studs)<br>• `AddDropdown`: Target Mode Priority |
| **2. Player** (`user`) | **Mobility Modifiers** | • `AddToggleSlider`: Custom WalkSpeed (16–250 studs/s)<br>• `AddToggleSlider`: Custom JumpPower (50–350 pwr)<br>• `AddToggle`: Infinite Air Jump<br>• `AddToggle`: Noclip (Phase Walls, Hotkey: `N`)<br>• `AddToggleSlider`: Fly Mode (10–200 studs/s) |
| | **Character Utilities** | • `AddToggle`: Anti-AFK Protection (Anti Disconnect)<br>• `AddToggle`: Auto Respawn on Death<br>• `AddToggle`: Godmode Simulation (Auto Heal)<br>• `AddButton`: Instant Reset Character |
| **3. Visuals** (`eye`) | **Player ESP & Overlays** | • `AddToggle`: Master Player ESP<br>• `AddSubToggle`: Show Bounding Boxes<br>• `AddSubToggle`: Show Display Names<br>• `AddSubToggle`: Show Health & Distance Bars<br>• `AddSubToggle`: Show Bottom Screen Tracers<br>• `AddColorPicker`: ESP Color Theme<br>• `AddSlider`: Max ESP Render Distance (100–3000 studs) |
| | **World Lighting & Camera** | • `AddToggle`: Fullbright (Remove Darkness)<br>• `AddToggle`: Disable Map Shadows<br>• `AddToggleSlider`: Field of View (FOV: 70–120°)<br>• `AddButton`: Clear Atmosphere Blur & Fog |
| **4. Teleport** (`compass`) | **Preset Waypoints** | • `AddDropdown`: Select Destination (Spawn, Shop, PVP, VIP, dll.)<br>• `AddButton`: Teleport to Selected Destination<br>• `AddToggle`: Click to Teleport (Ctrl + Click) |
| | **Custom Waypoint Memory** | • `AddTextInput`: Waypoint Name<br>• `AddButton`: Record Current Position<br>• `AddButton`: Teleport to Saved Waypoint |
| | **Server Controls** | • `AddButton`: Rejoin Current Server<br>• `AddButton`: Server Hop (Find New Server) |
| **5. Live Stats** (`bar-chart-2`) | **Performance & Metrics** | • `AddParagraph`: Session Analytics Overview (RichText Live Feed)<br>• `AddGraph`: Action Throughput & CPS Rate (14-Bar Chart)<br>• `AddProgressBar`: Inventory Bag Capacity<br>• `AddProgressBar`: Account Level Experience (XP)<br>• `AddButton`: Reset Analytics Counters |
| **6. Settings** (`settings`) | **Profile Manager** | • `AddSeperator`: PROFILE MANAGEMENT<br>• `AddTextInput`: Config Profile Name<br>• `AddDropdown`: Select Profile (Auto File Scan)<br>• `AddButton`: Save Current Settings to Profile<br>• `AddButton`: Load Selected Profile<br>• `AddToggle`: Auto Load Profile on Launch<br>• `AddSubToggle`: Create Automatic Timestamped Backups |
| | **Player Target Filters** | • `AddSeperator`: TARGETING MODES<br>• `AddDropdown`: Filter Evaluation Mode (Whitelist / Blacklist)<br>• `AddPlayerList`: Target & Whitelist Players (Searchable Multiselect) |
| | **Preferences & Hub Controls** | • `AddSeperator`: KEYBINDS & THEME<br>• `AddKeybind`: Toggle UI Window Keybind<br>• `AddColorPicker`: Accent Theme Color<br>• `AddButton`: Minimize UI to Floating Launcher |
| **7. Community** (`users`) | **Official Socials** | • `AddDiscordCard`: PinatHub Official Community (30k+ Member)<br>• `AddSeperator`: KOMUNITAS WHATSAPP & MEDIA SOSIAL<br>• `AddParagraph` (`MediaPara`): Official PinatHub Media Links *(collapsed by default, klik header untuk expand)*<br>• `AddButton`: Copy WhatsApp Community Link (XploitForce)<br>• `AddButton`: Copy YouTube Channel Link (@viunzee1)<br>• `AddButton`: Copy TikTok Profile Link (@viunze)<br>• `AddSeperator`: CREDITS<br>• `AddParagraph` (`CreditsPara`): PinatHub Credits & Team *(DefaultOpen = true, auto-expanded)*<br>• **Multi-select demo**: `MediaPara` & `CreditsPara` bisa terbuka bersamaan secara independen |

---

## 11. Sistem Config Profile Manager

PinatHub UI Library menyediakan pola arsitektur penyimpanan konfigurasi yang andal:
1. **File System Executor**: Menggunakan API standar eksekutor (`writefile`, `readfile`, `isfolder`, `makefolder`, `listfiles`).
2. **Format JSON**: Data disimpan secara terstruktur via `HttpService:JSONEncode()` dan `HttpService:JSONDecode()`.
3. **Memory Fallback**: Apabila skrip dijalankan di eksekutor tanpa izin file system, skrip tetap berjalan normal dengan penyimpanan tabel memori tanpa mengalami crash.

### Contoh Implementasi Simpan & Muat:
```lua
local HttpService = game:GetService("HttpService")
local ProfileFolder = "PinatHub_Configs"

pcall(function()
    if makefolder and not isfolder(ProfileFolder) then
        makefolder(ProfileFolder)
    end
end)

-- Menyimpan Pengaturan
local function SaveConfig(profileName, dataTable)
    local serialized = HttpService:JSONEncode(dataTable)
    local filePath = ProfileFolder .. "/" .. profileName .. ".json"
    pcall(function()
        if writefile then
            writefile(filePath, serialized)
        end
    end)
end

-- Memuat Pengaturan
local function LoadConfig(profileName, targetTable)
    local filePath = ProfileFolder .. "/" .. profileName .. ".json"
    pcall(function()
        if readfile and isfile and isfile(filePath) then
            local data = HttpService:JSONDecode(readfile(filePath))
            if type(data) == "table" then
                for k, v in pairs(data) do targetTable[k] = v end
            end
        end
    end)
end
```

---

## 12. Sistem Tema & Palet Warna

Library menggunakan sistem tema gelap Obsidian Glassmorphism dengan aksen Amethyst Glow:

| Token Tema | Nilai RGB | Kegunaan |
|------------|-----------|----------|
| `Background` | `15, 14, 20` | Latar belakang jendela utama |
| `Header` | `20, 18, 28` | Header atas navigasi |
| `Sidebar` | `17, 16, 24` | Sidebar navigasi tab samping |
| `Surface` | `25, 23, 35` | Latar dasar kartu section |
| `SurfaceHover` | `34, 31, 48` | Latar elemen saat cursor di atasnya (hover) |
| `SurfaceActive`| `46, 41, 66` | Latar elemen saat ditekan / aktif |
| `Accent` | `168, 85, 247` | Aksen ungu neon utama |
| `AccentGlow` | `192, 132, 252` | Kilau neon judul dan teks utama |
| `NeonWhite` | `245, 247, 255` | Teks judul utama & label tombol |
| `Text` | `245, 245, 250` | Teks utama reguler |
| `TextSecondary`| `170, 168, 185`| Teks sub-label dan deskripsi |
| `TextMuted` | `115, 112, 130`| Teks placeholder dan elemen nonaktif |
| `Success` | `74, 222, 128` | Hijau neon status sukses / aktif |
| `Warning` | `251, 191, 36` | Kuning amber perhatian |
| `Danger` | `248, 113, 113` | Merah terang tombol tutup / error |

---

## 13. Daftar Icon Bawaan

Saat menambahkan tab dengan `Window:AddTab({ Title = "...", Icon = "..." })`, Anda dapat memasukkan nama icon berikut:

- **Navigasi & Kontrol**: `"home"`, `"settings"`, `"sliders"`, `"compass"`, `"activity"`, `"database"`
- **Karakter & Player**: `"user"`, `"users"`, `"heart"`, `"backpack"`
- **Pertarungan & Combat**: `"swords"`, `"sword"`, `"crosshair"`, `"target"`, `"shield"`, `"skull"`
- **Visual & ESP**: `"eye"`, `"flame"`, `"globe"`
- **Data & Telemetri**: `"bar-chart"`, `"bar-chart-2"`, `"chart-bar"`
- **Finansial & Upgrade**: `"coins"`, `"dollar-sign"`, `"arrow-up"`
- **Komunitas & Chat**: `"discord"`, `"bell"`, `"search"`

---

## 14. Template Boilerplate Universal

Gunakan template di bawah ini untuk memulai skrip game baru Anda dengan cepat:

```lua
-- =============================================================================
-- PINATHUB UNIVERSAL BOILERPLATE TEMPLATE
-- Komunitas Utama WhatsApp: https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp
-- Discord Official: https://discord.gg/ysHZCYFaX7
-- =============================================================================

repeat task.wait() until game:IsLoaded()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xploitforceofficial-stack/intregation-pinathub-to-kingrua-library/refs/heads/main/kingrualibrarysource.lua"))()

local Window = Library:CreateWindow({
    Title = "PinatHub",
    SubTitle = "Game Name Here",
    Version = "1.0.0",
    Discord = "https://discord.gg/ysHZCYFaX7",
    OnClose = function()
        print("[PinatHub] Script dinonaktifkan!")
    end
})

-- TAB 1: AUTOMATION
local MainTab = Window:AddTab({ Title = "Main", Icon = "home" })
local AutoSec = MainTab:AddSection({ Title = "Auto Farming" })

local isFarming = false
AutoSec:AddToggle({
    Title = "Auto Farm Mobs",
    Default = false,
    Callback = function(val)
        isFarming = val
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

AutoSec:AddToggleSlider({
    Title = "Speed Multiplier",
    DefaultToggle = false,
    Min = 16,
    Max = 200,
    DefaultSlider = 32,
    Suffix = " spd",
    Callback = function(toggle, spd)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = toggle and spd or 16 end
    end
})

-- TAB 2: COMMUNITY
local CommTab = Window:AddTab({ Title = "Community", Icon = "users" })
local CommSec = CommTab:AddSection({ Title = "Join Our Network" })

CommSec:AddDiscordCard({
    Title = "PinatHub Official Discord",
    Members = "30522",
    Online = "2309",
    Invite = "https://discord.gg/ysHZCYFaX7"
})

CommSec:AddButton({
    Title = "Salin Link Komunitas WhatsApp (XploitForce)",
    Callback = function()
        setclipboard("https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp")
        Library:Notify({ Title = "Berhasil", Content = "Tautan WhatsApp disalin!", Type = "Success" })
    end
})

Library:Notify({
    Title = "PinatHub Ready",
    Content = "Tekan ikon launcher bulat putih di layar untuk membuka/menutup UI!",
    Type = "Success"
})
```

---

## 15. FAQ & Solusi Masalah Teknis

### Q1: Mengapa tag warna RichText `<font color=...>` tampil sebagai teks mentah pada library lama?
**Solusi**: Hal tersebut terjadi jika properti `RichText = true` belum diaktifkan pada `TextLabel`. Pada PinatHub Library versi ini, properti `RichText = true` telah diaktifkan secara baku pada `TitleLabel` dan `ContentLabel` di dalam `AddParagraph`, sehingga seluruh tag XML format warna seperti `<font color='#hex'>`, `<b>`, dan `<i>` akan dirender dengan warna cerah dan tajam.

### Q2: Bagaimana cara kerja Floating Launcher Button?
**Solusi**: Tombol launcher berada di ScreenGui terpisah bernama `MainGui` yang diletakkan pada `CoreGui` (dengan fallback ke `PlayerGui`) dengan `DisplayOrder = 999999` dan `ZIndex = 50`. Tombol ini permanen berada di layar, dapat digeser bebas (draggable), dan men-toggle visibilitas jendela utama dengan animasi tween scale & fade yang mulus.

### Q3: Apakah library ini aman dari deteksi UI reset saat karakter mati (respawn)?
**Solusi**: Ya. Seluruh ScreenGui diset dengan properti `ResetOnSpawn = false`, sehingga antarmuka pengguna tidak akan hilang atau ter-reset ketika karakter Anda respawn.

### Q4: Bagaimana cara menghentikan semua loop otomatis saat jendela UI ditutup?
**Solusi**: Pasang callback pada parameter `OnClose` saat memanggil `Library:CreateWindow`. Di dalam fungsi tersebut, ubah flag penanda loop (misal `isRunning = false`) atau putuskan koneksi event aktif.

### Q5: Bagaimana cara kerja multi-select paragraph?
**Solusi**: Setiap kartu `AddParagraph` adalah entitas independen. Klik header suatu kartu → kartu tersebut expand (kartu lain tetap pada state masing-masing). Klik header lagi → collapse. Untuk menutup semua kartu yang terbuka sekaligus, cukup klik di area mana saja di luar kartu-kartu tersebut. Gunakan `DefaultOpen = true` dalam konfigurasi agar kartu langsung terbuka saat dibuat. Gunakan `:Expand()`, `:Collapse()`, `:Toggle()` untuk kontrol programatik.

### Q6: Apa perbedaan antara `:Close()` dan `:Collapse()` pada paragraf?
**Solusi**: `:Collapse()` melipat kartu ke mode header saja (26px) — kartu masih terlihat dan bisa dibuka lagi dengan klik. `:Close()` menyembunyikan kartu sepenuhnya dari tampilan (`Visible = false`), sama seperti menekan tombol X di pojok kartu. Untuk menampilkan kembali kartu yang ter-close, panggil `:Open()`.

---

*© 2026 PinatHub Official v3.1 • Dikembangkan oleh vinzee (@viunzee1)*  
*Komunitas Utama WhatsApp: https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp*  
*Discord Official: https://discord.gg/ysHZCYFaX7*  
*YouTube: https://www.youtube.com/@viunzee1*  
*TikTok: https://tiktok.com/@viunze*
