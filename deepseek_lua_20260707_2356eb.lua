-- ============================================================
-- UI GIFT BOX – HỖ TRỢ TÊN VẬT PHẨM + GỬI MAIL
-- Tích hợp cấu hình kiểu AhmadV99 (dùng tên, không cần ID)
-- Bản full, chạy trên Delta / Synapse X / Arceus
-- ============================================================

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "GiftBoxUI_Full"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

-- ========== DANH SÁCH TÊN VẬT PHẨM (LẤY TỪ CONFIG AHMADV99) ==========
local itemNameDatabase = {
    -- Seeds
    "Carrot", "Strawberry", "Blueberry", "Tulip", "Tomato", "Apple",
    "Corn", "Bamboo", "Mushroom", "Cactus", "Pineapple", "Green Bean",
    "Banana", "Grape", "Coconut", "Mango", "Dragon Fruit", "Acorn",
    "Cherry", "Sunflower",
    -- Mutations / Special
    "Dragon's Breath", "Moon Bloom", "Venus Fly Trap", "Pomegranate",
    "Poison Apple", "Venom Spitter", "Ghost Pepper", "Baby Cactus",
    "Horned Melon", "Glow Mushroom", "Poison Ivy",
    -- Gears
    "Common Watering Can", "Common Sprinkler", "Sign", "Uncommon Sprinkler",
    "Trowel", "Rare Sprinkler", "Jump Mushroom", "Speed Mushroom",
    "Lantern", "Shrink Mushroom", "Supersize Mushroom", "Gnome",
    "Flashbang", "Basic Pot", "Legendary Sprinkler", "Invisibility Mushroom",
    "Teleporter", "Wheelbarrow", "Super Watering Can", "Super Sprinkler",
    "Player Magnet", "Pet Server Teleporter", "Megaphone", "Freeze Ray",
    "Vine Wrapper", "Rainbow Carpet",
    -- Pets
    "Monkey", "Bee", "BlackDragon", "GoldenDragonfly", "Unicorn",
    "Raccoon", "IceSerpent", "Robin", "Deer",
    -- Others (có thể gift)
    "Golden Shovel", "Diamond Hoe", "Gold", "Emerald", "Treasure Chest",
    "Golden Key", "Phoenix Feather", "Rainbow",
}

-- ========== KHUNG CHÍNH ==========
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 560)
frame.Position = UDim2.new(1, -510, 0, 30)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 100, 120)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 34)
title.BackgroundTransparency = 1
title.Text = "🎁 GIFT BOX – GỬI MAIL (THEO TÊN)"
title.TextColor3 = Color3.fromRGB(255, 150, 170)
title.TextSize = 17
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Ô người nhận
local userBox = Instance.new("TextBox")
userBox.Size = UDim2.new(1, -20, 0, 28)
userBox.Position = UDim2.new(0, 10, 0, 40)
userBox.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
userBox.TextColor3 = Color3.fromRGB(255, 255, 255)
userBox.BorderSizePixel = 1
userBox.BorderColor3 = Color3.fromRGB(70, 70, 100)
userBox.PlaceholderText = "👤 Người nhận (nickname)"
userBox.Text = ""
userBox.Font = Enum.Font.SourceSans
userBox.TextSize = 14
userBox.Parent = frame

-- Ô endpoint (ẩn)
local endpointBox = Instance.new("TextBox")
endpointBox.Size = UDim2.new(1, -20, 0, 28)
endpointBox.Position = UDim2.new(0, 10, 0, 74)
endpointBox.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
endpointBox.TextColor3 = Color3.fromRGB(255, 255, 255)
endpointBox.BorderSizePixel = 1
endpointBox.BorderColor3 = Color3.fromRGB(70, 70, 100)
endpointBox.PlaceholderText = "🔗 Endpoint (mặc định: /api/mail/send)"
endpointBox.Text = "/api/mail/send"
endpointBox.Font = Enum.Font.SourceSans
endpointBox.TextSize = 13
endpointBox.Visible = false
endpointBox.Parent = frame

-- ========== HÀNG NHẬP ==========
local row = Instance.new("Frame")
row.Size = UDim2.new(1, -20, 0, 34)
row.Position = UDim2.new(0, 10, 0, 108)
row.BackgroundTransparency = 1
row.Parent = frame

local nameBox = Instance.new("TextBox")
nameBox.Size = UDim2.new(0, 180, 0, 30)
nameBox.Position = UDim2.new(0, 0, 0, 0)
nameBox.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
nameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
nameBox.BorderSizePixel = 1
nameBox.BorderColor3 = Color3.fromRGB(70, 70, 100)
nameBox.PlaceholderText = "Tên vật phẩm"
nameBox.Text = ""
nameBox.Font = Enum.Font.SourceSans
nameBox.TextSize = 13
nameBox.Parent = row

local pickBtn = Instance.new("TextButton")
pickBtn.Size = UDim2.new(0, 60, 0, 30)
pickBtn.Position = UDim2.new(0, 185, 0, 0)
pickBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 140)
pickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
pickBtn.BorderSizePixel = 0
pickBtn.Text = "📋 Chọn"
pickBtn.Font = Enum.Font.SourceSansBold
pickBtn.TextSize = 13
pickBtn.Parent = row

local qtyBox = Instance.new("TextBox")
qtyBox.Size = UDim2.new(0, 60, 0, 30)
qtyBox.Position = UDim2.new(0, 250, 0, 0)
qtyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
qtyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
qtyBox.BorderSizePixel = 1
qtyBox.BorderColor3 = Color3.fromRGB(70, 70, 100)
qtyBox.PlaceholderText = "SL"
qtyBox.Text = "1"
qtyBox.Font = Enum.Font.SourceSans
qtyBox.TextSize = 14
qtyBox.Parent = row

local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 65, 0, 30)
addBtn.Position = UDim2.new(0, 315, 0, 0)
addBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 110)
addBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
addBtn.BorderSizePixel = 0
addBtn.Text = "+ Thêm"
addBtn.Font = Enum.Font.SourceSansBold
addBtn.TextSize = 14
addBtn.Parent = row

-- Nút cài đặt (hiện endpoint)
local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 40, 0, 30)
settingsBtn.Position = UDim2.new(0, 385, 0, 0)
settingsBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.BorderSizePixel = 0
settingsBtn.Text = "⚙"
settingsBtn.Font = Enum.Font.SourceSansBold
settingsBtn.TextSize = 16
settingsBtn.Parent = row
settingsBtn.MouseButton1Click:Connect(function()
    endpointBox.Visible = not endpointBox.Visible
end)

-- ========== POPUP CHỌN TÊN ==========
local popupFrame = Instance.new("Frame")
popupFrame.Size = UDim2.new(0, 340, 0, 400)
popupFrame.Position = UDim2.new(0.5, -170, 0.5, -200)
popupFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 45)
popupFrame.BorderSizePixel = 3
popupFrame.BorderColor3 = Color3.fromRGB(200, 150, 200)
popupFrame.Visible = false
popupFrame.ZIndex = 999
popupFrame.Parent = gui

local popupTitle = Instance.new("TextLabel")
popupTitle.Size = UDim2.new(1, 0, 0, 34)
popupTitle.BackgroundTransparency = 1
popupTitle.Text = "📋 Chọn tên vật phẩm"
popupTitle.TextColor3 = Color3.fromRGB(255, 200, 200)
popupTitle.TextSize = 16
popupTitle.Font = Enum.Font.SourceSansBold
popupTitle.Parent = popupFrame

local popupList = Instance.new("ScrollingFrame")
popupList.Size = UDim2.new(1, -16, 1, -60)
popupList.Position = UDim2.new(0, 8, 0, 40)
popupList.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
popupList.BorderSizePixel = 1
popupList.BorderColor3 = Color3.fromRGB(80, 80, 120)
popupList.CanvasSize = UDim2.new(0, 0, 0, 0)
popupList.ScrollBarThickness = 6
popupList.Parent = popupFrame

local popupLayout = Instance.new("UIListLayout")
popupLayout.Parent = popupList
popupLayout.SortOrder = Enum.SortOrder.LayoutOrder
popupLayout.Padding = UDim.new(0, 2)

local closePopupBtn = Instance.new("TextButton")
closePopupBtn.Size = UDim2.new(0, 80, 0, 30)
closePopupBtn.Position = UDim2.new(1, -90, 1, -40)
closePopupBtn.BackgroundColor3 = Color3.fromRGB(140, 40, 40)
closePopupBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closePopupBtn.BorderSizePixel = 0
closePopupBtn.Text = "✖ Đóng"
closePopupBtn.Font = Enum.Font.SourceSansBold
closePopupBtn.TextSize = 14
closePopupBtn.Parent = popupFrame
closePopupBtn.MouseButton1Click:Connect(function()
    popupFrame.Visible = false
end)

local function buildPopupList()
    for _, child in pairs(popupList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, name in ipairs(itemNameDatabase) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -4, 0, 28)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BorderSizePixel = 0
        btn.Text = name
        btn.TextSize = 13
        btn.Font = Enum.Font.SourceSans
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.ZIndex = 1000
        btn.Parent = popupList
        btn.MouseButton1Click:Connect(function()
            nameBox.Text = name
            popupFrame.Visible = false
        end)
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 120)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
        end)
    end
    popupList.CanvasSize = UDim2.new(0, 0, 0, #itemNameDatabase * 30 + 6)
end

pickBtn.MouseButton1Click:Connect(function()
    buildPopupList()
    popupFrame.Visible = true
end)

-- ========== DANH SÁCH ĐÃ CHỌN ==========
local listBox = Instance.new("ScrollingFrame")
listBox.Size = UDim2.new(1, -20, 0, 100)
listBox.Position = UDim2.new(0, 10, 0, 155)
listBox.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
listBox.BorderSizePixel = 1
listBox.BorderColor3 = Color3.fromRGB(50, 50, 80)
listBox.CanvasSize = UDim2.new(0, 0, 0, 0)
listBox.ScrollBarThickness = 4
listBox.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = listBox
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 2)

-- ========== NÚT GỬI ==========
local sendBtn = Instance.new("TextButton")
sendBtn.Size = UDim2.new(1, -20, 0, 34)
sendBtn.Position = UDim2.new(0, 10, 0, 265)
sendBtn.BackgroundColor3 = Color3.fromRGB(230, 80, 100)
sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sendBtn.BorderSizePixel = 0
sendBtn.Text = "🚀 GỬI TẤT CẢ (THEO TÊN)"
sendBtn.Font = Enum.Font.SourceSansBold
sendBtn.TextSize = 14
sendBtn.Parent = frame

-- ========== HÀNG XÓA + ĐÓNG ==========
local actionRow = Instance.new("Frame")
actionRow.Size = UDim2.new(1, -20, 0, 30)
actionRow.Position = UDim2.new(0, 10, 0, 305)
actionRow.BackgroundTransparency = 1
actionRow.Parent = frame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 100, 0, 28)
clearBtn.Position = UDim2.new(0, 0, 0, 0)
clearBtn.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 0
clearBtn.Text = "🗑 Xóa hết"
clearBtn.Font = Enum.Font.SourceSansBold
clearBtn.TextSize = 14
clearBtn.Parent = actionRow

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 80, 0, 28)
closeBtn.Position = UDim2.new(0, 110, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✖ Đóng"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 14
closeBtn.Parent = actionRow
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- ========== LOG ==========
local logBox = Instance.new("ScrollingFrame")
logBox.Size = UDim2.new(1, -20, 0, 130)
logBox.Position = UDim2.new(0, 10, 0, 345)
logBox.BackgroundColor3 = Color3.fromRGB(8, 8, 20)
logBox.BorderSizePixel = 1
logBox.BorderColor3 = Color3.fromRGB(50, 50, 80)
logBox.CanvasSize = UDim2.new(0, 0, 0, 0)
logBox.ScrollBarThickness = 4
logBox.Parent = frame

local logLayout = Instance.new("UIListLayout")
logLayout.Parent = logBox
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Padding = UDim.new(0, 1)

-- ========== BIẾN VÀ HÀM ==========
local items = {}  -- mỗi item {name, qty}

local function addLog(msg, color)
    local line = Instance.new("TextLabel")
    line.Size = UDim2.new(1, 0, 0, 18)
    line.BackgroundTransparency = 1
    line.Text = "[" .. os.date("%H:%M:%S") .. "] " .. msg
    line.TextColor3 = color or Color3.fromRGB(160, 255, 160)
    line.TextSize = 12
    line.Font = Enum.Font.SourceSans
    line.TextXAlignment = Enum.TextXAlignment.Left
    line.Parent = logBox
    logBox.CanvasSize = UDim2.new(0, 0, 0, logLayout.AbsoluteContentSize.Y)
end

local function renderList()
    for _, child in pairs(listBox:GetChildren()) do
        if child:IsA("TextLabel") then child:Destroy() end
    end
    if #items == 0 then
        local empty = Instance.new("TextLabel")
        empty.Size = UDim2.new(1, 0, 0, 22)
        empty.BackgroundTransparency = 1
        empty.Text = "(chưa có)"
        empty.TextColor3 = Color3.fromRGB(100, 100, 130)
        empty.TextSize = 13
        empty.Font = Enum.Font.SourceSans
        empty.TextXAlignment = Enum.TextXAlignment.Center
        empty.Parent = listBox
        listBox.CanvasSize = UDim2.new(0, 0, 0, 22)
        return
    end
    for i, it in ipairs(items) do
        local row = Instance.new("TextLabel")
        row.Size = UDim2.new(1, 0, 0, 22)
        row.BackgroundTransparency = 1
        row.Text = it.name .. " × " .. it.qty .. "   [✕]"
        row.TextColor3 = Color3.fromRGB(240, 240, 255)
        row.TextSize = 13
        row.Font = Enum.Font.SourceSans
        row.TextXAlignment = Enum.TextXAlignment.Left
        row.Parent = listBox
        row.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local x = input.Position.X - row.AbsolutePosition.X
                if x > row.AbsoluteSize.X - 35 then
                    table.remove(items, i)
                    renderList()
                    addLog("Đã xóa một món", Color3.fromRGB(255, 200, 0))
                end
            end
        end)
    end
    listBox.CanvasSize = UDim2.new(0, 0, 0, #items * 24 + 4)
end

-- Thêm item
addBtn.MouseButton1Click:Connect(function()
    local name = nameBox.Text:gsub("^%s*(.-)%s*$", "%1")
    local qty = tonumber(qtyBox.Text)
    if name == "" or not qty or qty <= 0 then
        addLog("⚠️ Tên hoặc SL không hợp lệ", Color3.fromRGB(255, 120, 120))
        return
    end
    for _, it in ipairs(items) do
        if it.name == name then
            it.qty = it.qty + qty
            renderList()
            addLog("➕ Cộng " .. name .. " × " .. qty, Color3.fromRGB(100, 255, 150))
            return
        end
    end
    table.insert(items, {name = name, qty = qty})
    renderList()
    addLog("➕ Thêm " .. name .. " × " .. qty, Color3.fromRGB(100, 255, 150))
    nameBox.Text = ""
    qtyBox.Text = "1"
end)

-- Xóa hết
clearBtn.MouseButton1Click:Connect(function()
    items = {}
    renderList()
    addLog("🗑 Đã xóa danh sách", Color3.fromRGB(255, 200, 0))
end)

-- ========== HÀM GỬI ==========
sendBtn.MouseButton1Click:Connect(function()
    local user = userBox.Text:gsub("^%s*(.-)%s*$", "%1")
    if user == "" then
        addLog("❌ Chưa nhập người nhận", Color3.fromRGB(255, 100, 100))
        return
    end
    if #items == 0 then
        addLog("❌ Danh sách rỗng", Color3.fromRGB(255, 100, 100))
        return
    end

    local ep = endpointBox.Text
    if ep == "" or ep == "/" then ep = "/api/mail/send" end
    if not ep:match("^http") then
        ep = (game:GetService("HttpService"):GetBaseUrl() or "https://growagarden2.com") .. ep
    end

    addLog("🔗 Endpoint: " .. ep, Color3.fromRGB(0, 200, 255))

    -- Tạo flat list các tên
    local flatNames = {}
    for _, it in ipairs(items) do
        for i = 1, it.qty do table.insert(flatNames, it.name) end
    end

    -- Gom nhóm theo tên
    local nameMap = {}
    for _, name in ipairs(flatNames) do
        nameMap[name] = (nameMap[name] or 0) + 1
    end

    -- Chia chunk 20 món
    local chunks = {}
    local chunkItems = {}
    local total = 0
    for name, qty in pairs(nameMap) do
        for i = 1, qty do
            table.insert(chunkItems, name)
            total = total + 1
            if #chunkItems >= 20 then
                local map = {}
                for _, n in ipairs(chunkItems) do map[n] = (map[n] or 0) + 1 end
                local payloadItems = {}
                for n, q in pairs(map) do table.insert(payloadItems, {n, q}) end
                table.insert(chunks, payloadItems)
                chunkItems = {}
            end
        end
    end
    if #chunkItems > 0 then
        local map = {}
        for _, n in ipairs(chunkItems) do map[n] = (map[n] or 0) + 1 end
        local payloadItems = {}
        for n, q in pairs(map) do table.insert(payloadItems, {n, q}) end
        table.insert(chunks, payloadItems)
    end

    addLog("🚀 Bắt đầu gửi đến " .. user, Color3.fromRGB(0, 200, 255))
    addLog("📦 Tổng " .. total .. " món, chia " .. #chunks .. " đợt", Color3.fromRGB(0, 200, 255))

    sendBtn.Text = "⏳ Đang gửi..."
    sendBtn.BackgroundColor3 = Color3.fromRGB(120, 120, 140)

    local success = 0
    local idx = 1

    local function sendNext()
        if idx > #chunks then
            if success == #chunks then
                addLog("🏁 HOÀN THÀNH! " .. success .. "/" .. #chunks .. " đợt", Color3.fromRGB(100, 255, 100))
            else
                addLog("🏁 HOÀN THÀNH: " .. success .. "/" .. #chunks .. " đợt", Color3.fromRGB(255, 200, 0))
            end
            sendBtn.Text = "🚀 GỬI TẤT CẢ (THEO TÊN)"
            sendBtn.BackgroundColor3 = Color3.fromRGB(230, 80, 100)
            return
        end

        local chunk = chunks[idx]
        local payload = { to = user, items = chunk }

        local xhr = syn and syn.request or request or http_request
        if not xhr then
            addLog("❌ Không có request function", Color3.fromRGB(255, 100, 100))
            return
        end

        local headers = { ["Content-Type"] = "application/json" }
        local csrf = syn and syn.cookie or nil
        if csrf then headers["X-CSRF-TOKEN"] = csrf end

        local successReq, resp = pcall(function()
            return xhr({
                Url = ep,
                Method = "POST",
                Headers = headers,
                Body = game:GetService("HttpService"):JSONEncode(payload)
            })
        end)

        if successReq and resp then
            if resp.StatusCode >= 200 and resp.StatusCode < 300 then
                addLog("✅ Đợt " .. idx .. "/" .. #chunks .. " OK (HTTP " .. resp.StatusCode .. ")", Color3.fromRGB(100, 255, 100))
                if resp.Body then addLog("📨 Server: " .. resp.Body, Color3.fromRGB(200, 200, 255)) end
                success = success + 1
            else
                addLog("❌ Đợt " .. idx .. " thất bại: HTTP " .. resp.StatusCode, Color3.fromRGB(255, 100, 100))
                if resp.Body then addLog("📨 Server: " .. resp.Body, Color3.fromRGB(255, 200, 200)) end
            end
        else
            addLog("❌ Đợt " .. idx .. " lỗi kết nối", Color3.fromRGB(255, 100, 100))
        end

        idx = idx + 1
        task.wait(1.5)
        sendNext()
    end

    sendNext()
end)

addLog("✅ UI sẵn sàng – nhập tên vật phẩm (không cần ID)", Color3.fromRGB(0, 255, 0))
addLog("📋 Danh sách có " .. #itemNameDatabase .. " tên vật phẩm", Color3.fromRGB(0, 200, 255))
addLog("💡 Bấm ⚙ để nhập endpoint nếu cần", Color3.fromRGB(255, 200, 0))
