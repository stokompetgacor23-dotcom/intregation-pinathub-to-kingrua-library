color_picker_code = '''\t\t\t\tlocal Controller = {
\t\t\t\t\tSet = function(self, newKey)
\t\t\t\t\t\tKeyBadge.Text = newKey and newKey.Name or "None"
\t\t\t\t\t\tpcall(cfg.Callback, newKey)
\t\t\t\t\tend,
\t\t\t\t\tGet = function(self)
\t\t\t\t\t\treturn cfg.Default
\t\t\t\t\tend
\t\t\t\t}
\t\t\t\ttable.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame, Controller = Controller })
\t\t\t\treturn Controller
\t\t\tend

\t\t\t-- 12.11 COLOR PICKER
\t\t\tfunction SecObj:AddColorPicker(cpConfig)
\t\t\t\tlocal cfg = Library:MakeConfig({
\t\t\t\t\tTitle = "Color",
\t\t\t\t\tDescription = "",
\t\t\t\t\tDefault = Color3.fromRGB(168, 85, 247),
\t\t\t\t\tCallback = function() end
\t\t\t\t}, cpConfig or {})

\t\t\t\tif cfg.Desc and cfg.Description == "" then cfg.Description = cfg.Desc end
\t\t\t\tlocal currentColor = cfg.Default or Color3.fromRGB(168, 85, 247)

\t\t\t\tlocal ItemFrame = Instance.new("Frame")
\t\t\t\tItemFrame.Name = "ColorPicker_" .. cfg.Title
\t\t\t\tItemFrame.Parent = ControlsContainer
\t\t\t\tItemFrame.BackgroundColor3 = Theme.SurfaceHover
\t\t\t\tItemFrame.BackgroundTransparency = 0.55
\t\t\t\tItemFrame.BorderSizePixel = 0
\t\t\t\tItemFrame.Size = UDim2.new(1, 0, 0, (cfg.Description ~= "") and 44 or 36)

\t\t\t\tlocal ItemCorner = Instance.new("UICorner")
\t\t\t\tItemCorner.CornerRadius = UDim.new(0, 7)
\t\t\t\tItemCorner.Parent = ItemFrame

\t\t\t\tlocal ItemStroke = Instance.new("UIStroke")
\t\t\t\tItemStroke.Color = Theme.BorderSoft
\t\t\t\tItemStroke.Thickness = 1
\t\t\t\tItemStroke.Transparency = 0.4
\t\t\t\tItemStroke.Parent = ItemFrame

\t\t\t\tlocal TitleLabel = Instance.new("TextLabel")
\t\t\t\tTitleLabel.Name = "Title"
\t\t\t\tTitleLabel.Parent = ItemFrame
\t\t\t\tTitleLabel.BackgroundTransparency = 1
\t\t\t\tTitleLabel.Position = UDim2.new(0, 10, 0, (cfg.Description ~= "") and 5 or 0)
\t\t\t\tTitleLabel.Size = UDim2.new(1, -90, (cfg.Description ~= "") and 0 or 1, (cfg.Description ~= "") and 16 or 0)
\t\t\t\tTitleLabel.Font = Enum.Font.GothamBold
\t\t\t\tTitleLabel.Text = cfg.Title
\t\t\t\tTitleLabel.TextColor3 = Theme.Text
\t\t\t\tTitleLabel.TextSize = 12
\t\t\t\tTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

\t\t\t\tif cfg.Description ~= "" then
\t\t\t\t\tlocal DescLabel = Instance.new("TextLabel")
\t\t\t\t\tDescLabel.Name = "Desc"
\t\t\t\t\tDescLabel.Parent = ItemFrame
\t\t\t\t\tDescLabel.BackgroundTransparency = 1
\t\t\t\t\tDescLabel.Position = UDim2.new(0, 10, 0, 22)
\t\t\t\t\tDescLabel.Size = UDim2.new(1, -90, 0, 16)
\t\t\t\t\tDescLabel.Font = Enum.Font.Gotham
\t\t\t\t\tDescLabel.Text = cfg.Description
\t\t\t\t\tDescLabel.TextColor3 = Theme.TextMuted
\t\t\t\t\tDescLabel.TextSize = 10
\t\t\t\t\tDescLabel.TextXAlignment = Enum.TextXAlignment.Left
\t\t\t\tend

\t\t\t\tlocal ColorTile = Instance.new("TextButton")
\t\t\t\tColorTile.Name = "ColorTile"
\t\t\t\tColorTile.Parent = ItemFrame
\t\t\t\tColorTile.AnchorPoint = Vector2.new(1, 0.5)
\t\t\t\tColorTile.Position = UDim2.new(1, -10, 0.5, 0)
\t\t\t\tColorTile.Size = UDim2.new(0, 48, 0, 22)
\t\t\t\tColorTile.BackgroundColor3 = currentColor
\t\t\t\tColorTile.BorderSizePixel = 0
\t\t\t\tColorTile.AutoButtonColor = false
\t\t\t\tColorTile.Text = ""

\t\t\t\tlocal TileCorner = Instance.new("UICorner")
\t\t\t\tTileCorner.CornerRadius = UDim.new(0, 5)
\t\t\t\tTileCorner.Parent = ColorTile

\t\t\t\tlocal TileStroke = Instance.new("UIStroke")
\t\t\t\tTileStroke.Color = Color3.fromRGB(255, 255, 255)
\t\t\t\tTileStroke.Thickness = 1
\t\t\t\tTileStroke.Transparency = 0.5
\t\t\t\tTileStroke.Parent = ColorTile

\t\t\t\tlocal Presets = {
\t\t\t\t\tColor3.fromRGB(168, 85, 247),
\t\t\t\t\tColor3.fromRGB(59, 130, 246),
\t\t\t\t\tColor3.fromRGB(74, 222, 128),
\t\t\t\t\tColor3.fromRGB(251, 191, 36),
\t\t\t\t\tColor3.fromRGB(248, 113, 113),
\t\t\t\t\tColor3.fromRGB(236, 72, 153),
\t\t\t\t\tColor3.fromRGB(45, 212, 191),
\t\t\t\t\tColor3.fromRGB(255, 255, 255),
\t\t\t\t}
\t\t\t\tlocal pIdx = 1

\t\t\t\tlocal function SetColor(c)
\t\t\t\t\tcurrentColor = c
\t\t\t\t\tColorTile.BackgroundColor3 = c
\t\t\t\t\tpcall(cfg.Callback, c)
\t\t\t\tend

\t\t\t\tColorTile.MouseButton1Click:Connect(function()
\t\t\t\t\tpIdx = (pIdx % #Presets) + 1
\t\t\t\t\tSetColor(Presets[pIdx])
\t\t\t\tend)

\t\t\t\tlocal Controller = {
\t\t\t\t\tSet = function(self, newColor)
\t\t\t\t\t\tif typeof(newColor) == "Color3" then
\t\t\t\t\t\t\tSetColor(newColor)
\t\t\t\t\t\tend
\t\t\t\t\tend,
\t\t\t\t\tGet = function(self)
\t\t\t\t\t\treturn currentColor
\t\t\t\t\tend
\t\t\t\t}

\t\t\t\ttable.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame, Controller = Controller })
\t\t\t\treturn Controller
\t\t\tend'''

def patch_file(filepath):
    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    target = '\t\t\t\ttable.insert(secData.Elements, { Title = cfg.Title, Frame = ItemFrame })\n\t\t\tend'
    if target in content:
        content = content.replace(target, color_picker_code, 1)
        print(f"Successfully added AddColorPicker to {filepath}")
    else:
        print(f"Target not found in {filepath}")

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

patch_file('kingrualibrarysource.lua')
patch_file('kingrualibraryexample.lua')
