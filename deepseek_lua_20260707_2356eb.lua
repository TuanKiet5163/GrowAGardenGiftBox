-- ============================================================
-- UI GIFT BOX – Grow a Garden 2 (Đã chỉnh lại bố cục)
-- Hỗ trợ gửi KHÔNG GIỚI HẠN (tự động chia chunk 20)
-- Đã xóa vật phẩm không cần thiết, chỉ giữ ID hợp lệ
-- ============================================================

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "GiftBoxUI_Fixed"
gui.Parent = player.PlayerGui

-- Khung chính (dịch lên trên để tránh bị che)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 440, 0, 500)
frame.Position = UDim2.new(1, -450, 0, 5)   -- top = 5 thay vì 10
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(233, 69, 96)
frame.Parent = gui

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "📦 GIFT BOX MASS – KHÔNG GIỚI HẠN"
title.TextColor3 = Color3.fromRGB(233, 69, 96)
title.TextSize = 16
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Ô người nhận
local userBox = Instance.new("TextBox")
userBox.Size = UDim2.new(1, -10, 0, 25)
userBox.Position = UDim2.new(0, 5, 0, 35)
userBox.BackgroundColor3 = Color3.fromRGB(26, 26, 46)
userBox.TextColor3 = Color3.fromRGB(255, 255, 255)
userBox.BorderSizePixel = 1
userBox.BorderColor3 = Color3.fromRGB(51, 51, 51)
userBox.PlaceholderText = "Người nhận (nickname)"
userBox.Text = ""
userBox.Parent = frame

-- ================ HÀNG NGANG: ID | CHỌN | SL | THÊM ================
local rowFrame = Instance.new("Frame")
rowFrame.Size = UDim2.new(1, -10, 0, 30)
rowFrame.Position = UDim2.new(0, 5, 0, 65)
rowFrame.BackgroundTransparency = 1
rowFrame.Parent = frame

-- Ô ID (nhập tay)
local idBox = Instance.new("TextBox")
idBox.Size = UDim2.new(0, 90, 0, 25)
idBox.Position = UDim2.new(0, 0, 0, 0)
idBox.BackgroundColor3 = Color3.fromRGB(26, 26, 46)
idBox.TextColor3 = Color3.fromRGB(255, 255, 255)
idBox.BorderSizePixel = 1
idBox.BorderColor3 = Color3.fromRGB(51, 51, 51)
idBox.PlaceholderText = "ID"
idBox.Text = ""
idBox.Parent = rowFrame

-- Nút mở danh sách vật phẩm (dropdown)
local dropBtn = Instance.new("TextButton")
dropBtn.Size = UDim2.new(0, 30, 0, 25)
dropBtn.Position = UDim2.new(0, 95, 0, 0)
dropBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
dropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
dropBtn.BorderSizePixel = 0
dropBtn.Text = "▼"
dropBtn.Font = Enum.Font.SourceSansBold
dropBtn.TextSize = 14
dropBtn.Parent = rowFrame

-- Ô số lượng
local qtyBox = Instance.new("TextBox")
qtyBox.Size = UDim2.new(0, 60, 0, 25)
qtyBox.Position = UDim2.new(0, 130, 0, 0)
qtyBox.BackgroundColor3 = Color3.fromRGB(26, 26, 46)
qtyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
qtyBox.BorderSizePixel = 1
qtyBox.BorderColor3 = Color3.fromRGB(51, 51, 51)
qtyBox.PlaceholderText = "SL"
qtyBox.Text = "1"
qtyBox.Parent = rowFrame

-- Nút + Thêm
local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 60, 0, 25)
addBtn.Position = UDim2.new(0, 195, 0, 0)
addBtn.BackgroundColor3 = Color3.fromRGB(45, 106, 79)
addBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
addBtn.BorderSizePixel = 0
addBtn.Text = "+ Thêm"
addBtn.Parent = rowFrame

-- =============== DANH SÁCH DROPDOWN (vật phẩm) ===============
-- Chỉ giữ lại các vật phẩm có thể gift (ID đúng theo game)
local itemDatabase = {
    -- Seeds
    {id = 1, name = "Carrot Seed"},
    {id = 2, name = "Strawberry Seed"},
    {id = 3, name = "Blueberry Seed"},
    {id = 4, name = "Tulip Seed"},
    {id = 5, name = "Tomato Seed"},
    {id = 6, name = "Apple Seed"},
    {id = 7, name = "Bamboo Seed"},
    {id = 8, name = "Corn Seed"},
    {id = 9, name = "Cactus Seed"},
    {id = 10, name = "Pineapple Seed"},
    {id = 11, name = "Mushroom Seed"},
    {id = 12, name = "Green Bean Seed"},
    {id = 13, name = "Banana Seed"},
    {id = 14, name = "Grape Seed"},
    {id = 15, name = "Coconut Seed"},
    {id = 16, name = "Mango Seed"},
    {id = 17, name = "Dragon Fruit Seed"},
    {id = 18, name = "Acorn Seed"},
    {id = 19, name = "Cherry Seed"},
    {id = 20, name = "Sunflower Seed"},
    {id = 21, name = "Venus Fly Trap Seed"},
    {id = 22, name = "Pomegranate Seed"},
    {id = 23, name = "Poison Apple Seed"},
    {id = 24, name = "Venom Spitter Seed"},
    {id = 25, name = "Moon Bloom Seed"},
    {id = 26, name = "Dragon's Breath Seed"},
    {id = 27, name = "Ghost Pepper Seed"},
    {id = 28, name = "Baby Cactus Seed"},
    {id = 29, name = "Horned Melon Seed"},
    {id = 30, name = "Glow Mushroom Seed"},
    {id = 31, name = "Poison Ivy Seed"},
    -- Gears
    {id = 101, name = "Common Watering Can"},
    {id = 102, name = "Common Sprinkler"},
    {id = 103, name = "Sign"},
    {id = 104, name = "Uncommon Sprinkler"},
    {id = 105, name = "Trowel"},
    {id = 106, name = "Rare Sprinkler"},
    {id = 107, name = "Jump Mushroom"},
    {id = 108, name = "Speed Mushroom"},
    {id = 109, name = "Lantern"},
    {id = 110, name = "Shrink Mushroom"},
    {id = 111, name = "Supersize Mushroom"},
    {id = 112, name = "Gnome"},
    {id = 113, name = "Flashbang"},
    {id = 114, name = "Basic Pot"},
    {id = 115, name = "Legendary Sprinkler"},
    {id = 116, name = "Invisibility Mushroom"},
    {id = 117, name = "Teleporter"},
    {id = 118, name = "Wheelbarrow"},
    {id = 119, name = "Super Watering Can"},
    {id = 120, name = "Super Sprinkler"},
    {id = 121, name = "Player Magnet"},
    {id = 122, name = "Pet Server Teleporter"},
    {id = 123, name = "Megaphone"},
    {id = 124, name = "Freeze Ray"},
    {id = 125, name = "Vine Wrapper"},
    {id = 126, name = "Rainbow Carpet"},
    -- Others
    {id = 201, name = "Fertilizer"},
    {id = 202, name = "Golden Shovel"},
    {id = 203, name = "Diamond Hoe"},
    {id = 204, name = "Gold Bar"},
    {id = 205, name = "Emerald"},
    {id = 206, name = "Treasure Chest"},
    {id = 207, name = "Golden Key"},
    {id = 208, name = "Phoenix Feather"},
}

-- Dropdown list
local dropList = Instance.new("ScrollingFrame")
dropList.Size = UDim2.new(0, 220, 0, 150)
dropList.Position = UDim2.new(0, 5, 0, 100)  -- nằm dưới hàng nhập
dropList.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
dropList.BorderSizePixel = 1
dropList.BorderColor3 = Color3.fromRGB(80, 80, 120)
dropList.Visible = false
dropList.CanvasSize = UDim2.new(0, 0, 0, 0)
dropList.ScrollBarThickness = 4
dropList.Parent = frame

local dropLayout = Instance.new("UIListLayout")
dropLayout.Parent = dropList
dropLayout.SortOrder = Enum.SortOrder.LayoutOrder
dropLayout.Padding = UDim.new(0, 2)

-- Tạo danh sách thả xuống
local function buildDropList()
    for _, child in pairs(dropList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, data in ipairs(itemDatabase) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -4, 0, 22)
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BorderSizePixel = 0
        btn.Text = data.id .. " - " .. data.name
        btn.TextSize = 11
        btn.Font = Enum.Font.SourceSans
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = dropList
        btn.MouseButton1Click:Connect(function()
            idBox.Text = tostring(data.id)
            dropList.Visible = false
        end)
    end
    dropList.CanvasSize = UDim2.new(0, 0, 0, #itemDatabase * 24 + 4)
end
buildDropList()

-- Mở/đóng dropdown
dropBtn.MouseButton1Click:Connect(function()
    dropList.Visible = not dropList.Visible
    if dropList.Visible then buildDropList() end
end)

-- =============== DANH SÁCH ĐÃ CHỌN ===============
local listBox = Instance.new("ScrollingFrame")
listBox.Size = UDim2.new(1, -10, 0, 120)
listBox.Position = UDim2.new(0, 5, 0, 135)
listBox.BackgroundColor3 = Color3.fromRGB(10, 10, 21)
listBox.BorderSizePixel = 1
listBox.BorderColor3 = Color3.fromRGB(34, 34, 34)
listBox.CanvasSize = UDim2.new(0, 0, 0, 0)
listBox.ScrollBarThickness = 4
listBox.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = listBox
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 2)

-- Nút gửi
local sendBtn = Instance.new("TextButton")
sendBtn.Size = UDim2.new(1, -10, 0, 30)
sendBtn.Position = UDim2.new(0, 5, 0, 265)
sendBtn.BackgroundColor3 = Color3.fromRGB(233, 69, 96)
sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sendBtn.BorderSizePixel = 0
sendBtn.Text = "🚀 GỬI TẤT CẢ (KHÔNG GIỚI HẠN)"
sendBtn.Font = Enum.Font.SourceSansBold
sendBtn.TextSize = 13
sendBtn.Parent = frame

-- Nút xóa và đóng (cùng hàng)
local actionRow = Instance.new("Frame")
actionRow.Size = UDim2.new(1, -10, 0, 30)
actionRow.Position = UDim2.new(0, 5, 0, 300)
actionRow.BackgroundTransparency = 1
actionRow.Parent = frame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 90, 0, 25)
clearBtn.Position = UDim2.new(0, 0, 0, 0)
clearBtn.BackgroundColor3 = Color3.fromRGB(92, 46, 46)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 0
clearBtn.Text = "🗑 Xóa hết"
clearBtn.Parent = actionRow

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 70, 0, 25)
closeBtn.Position = UDim2.new(0, 100, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✖ Đóng"
closeBtn.Parent = actionRow
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Log
local logBox = Instance.new("ScrollingFrame")
logBox.Size = UDim2.new(1, -10, 0, 120)
logBox.Position = UDim2.new(0, 5, 0, 335)
logBox.BackgroundColor3 = Color3.fromRGB(10, 10, 21)
logBox.BorderSizePixel = 1
logBox.BorderColor3 = Color3.fromRGB(34, 34, 34)
logBox.CanvasSize = UDim2.new(0, 0, 0, 0)
logBox.ScrollBarThickness = 4
logBox.Parent = frame

local logLayout = Instance.new("UIListLayout")
logLayout.Parent = logBox
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Padding = UDim.new(0, 1)

-- Biến
local items = {}

-- Hàm log
local function addLog(msg, color)
    local line = Instance.new("TextLabel")
    line.Size = UDim2.new(1, 0, 0, 16)
    line.BackgroundTransparency = 1
    line.Text = "[" .. os.date("%H:%M:%S") .. "] " .. msg
    line.TextColor3 = color or Color3.fromRGB(136, 255, 136)
    line.TextSize = 11
    line.Font = Enum.Font.SourceSans
    line.TextXAlignment = Enum.TextXAlignment.Left
    line.Parent = logBox
    logBox.CanvasSize = UDim2.new(0, 0, 0, logLayout.AbsoluteContentSize.Y)
end

-- Hàm render danh sách
local function renderList()
    for _, child in pairs(listBox:GetChildren()) do
        if child:IsA("TextLabel") then child:Destroy() end
    end
    if #items == 0 then
        local empty = Instance.new("TextLabel")
        empty.Size = UDim2.new(1, 0, 0, 20)
        empty.BackgroundTransparency = 1
        empty.Text = "(chưa có)"
        empty.TextColor3 = Color3.fromRGB(85, 85, 85)
        empty.TextSize = 12
        empty.Font = Enum.Font.SourceSans
        empty.TextXAlignment = Enum.TextXAlignment.Center
        empty.Parent = listBox
        listBox.CanvasSize = UDim2.new(0, 0, 0, 20)
        return
    end
    for i, it in ipairs(items) do
        local row = Instance.new("TextLabel")
        row.Size = UDim2.new(1, 0, 0, 20)
        row.BackgroundTransparency = 1
        row.Text = "ID " .. it.id .. " × " .. it.qty .. "   [✕]"
        row.TextColor3 = Color3.fromRGB(255, 255, 255)
        row.TextSize = 12
        row.Font = Enum.Font.SourceSans
        row.TextXAlignment = Enum.TextXAlignment.Left
        row.Parent = listBox
        row.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local x = input.Position.X - row.AbsolutePosition.X
                if x > row.AbsoluteSize.X - 30 then
                    table.remove(items, i)
                    renderList()
                    addLog("Đã xóa một món", Color3.fromRGB(255, 255, 0))
                end
            end
        end)
    end
    listBox.CanvasSize = UDim2.new(0, 0, 0, #items * 22 + 4)
end

-- Thêm item
addBtn.MouseButton1Click:Connect(function()
    local id = tonumber(idBox.Text)
    local qty = tonumber(qtyBox.Text)
    if not id or id <= 0 or not qty or qty <= 0 then
        addLog("⚠️ ID hoặc SL không hợp lệ", Color3.fromRGB(255, 136, 136))
        return
    end
    for _, it in ipairs(items) do
        if it.id == id then
            it.qty = it.qty + qty
            renderList()
            addLog("➕ Cộng ID " .. id .. " × " .. qty, Color3.fromRGB(136, 255, 136))
            return
        end
    end
    table.insert(items, {id = id, qty = qty})
    renderList()
    addLog("➕ Thêm ID " .. id .. " × " .. qty, Color3.fromRGB(136, 255, 136))
    idBox.Text = ""
    qtyBox.Text = "1"
    dropList.Visible = false
end)

-- Xóa hết
clearBtn.MouseButton1Click:Connect(function()
    items = {}
    renderList()
    addLog("🗑 Đã xóa danh sách", Color3.fromRGB(255, 255, 0))
end)

-- Gửi
sendBtn.MouseButton1Click:Connect(function()
    local user = userBox.Text:gsub("^%s*(.-)%s*$", "%1")
    if user == "" then
        addLog("❌ Chưa nhập người nhận", Color3.fromRGB(255, 136, 136))
        return
    end
    if #items == 0 then
        addLog("❌ Danh sách rỗng", Color3.fromRGB(255, 136, 136))
        return
    end

    local ep = "/api/mail/send"

    local flat = {}
    for _, it in ipairs(items) do
        for i = 1, it.qty do
            table.insert(flat, it.id)
        end
    end

    local chunks = {}
    for i = 1, #flat, 20 do
        local chunk = {}
        for j = i, math.min(i + 19, #flat) do
            table.insert(chunk, flat[j])
        end
        table.insert(chunks, chunk)
    end

    addLog("🚀 Bắt đầu gửi đến " .. user, Color3.fromRGB(0, 255, 255))
    addLog("📦 Tổng " .. #flat .. " món, chia " .. #chunks .. " đợt (20 món/đợt)", Color3.fromRGB(0, 255, 255))

    sendBtn.Text = "⏳ Đang gửi..."
    sendBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

    local success = 0
    local idx = 1

    local function sendNext()
        if idx > #chunks then
            if success == #chunks then
                addLog("🏁 HOÀN THÀNH! Đã gửi " .. success .. "/" .. #chunks .. " đợt", Color3.fromRGB(136, 255, 136))
            else
                addLog("🏁 HOÀN THÀNH: " .. success .. "/" .. #chunks .. " đợt thành công", Color3.fromRGB(255, 255, 0))
            end
            sendBtn.Text = "🚀 GỬI TẤT CẢ (KHÔNG GIỚI HẠN)"
            sendBtn.BackgroundColor3 = Color3.fromRGB(233, 69, 96)
            return
        end

        local chunk = chunks[idx]
        local map = {}
        for _, id in ipairs(chunk) do
            map[id] = (map[id] or 0) + 1
        end
        local payload = {
            to = user,
            items = {}
        }
        for k, v in pairs(map) do
            table.insert(payload.items, {tonumber(k), v})
        end

        local xhr = syn and syn.request or request or http_request
        if not xhr then
            addLog("❌ Không tìm thấy hàm request", Color3.fromRGB(255, 136, 136))
            return
        end

        local url = (game:GetService("HttpService"):GetBaseUrl() or "https://growagarden2.com") .. ep
        local successReq, resp = pcall(function()
            return xhr({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = game:GetService("HttpService"):JSONEncode(payload)
            })
        end)

        if successReq and resp and resp.StatusCode >= 200 and resp.StatusCode < 300 then
            addLog("✅ Đợt " .. idx .. "/" .. #chunks .. " OK", Color3.fromRGB(136, 255, 136))
            success = success + 1
        else
            local errMsg = "Lỗi không xác định"
            if resp and resp.StatusCode then
                errMsg = "HTTP " .. resp.StatusCode
            end
            addLog("❌ Đợt " .. idx .. " thất bại: " .. errMsg, Color3.fromRGB(255, 136, 136))
        end

        idx = idx + 1
        task.wait(1.5)
        sendNext()
    end

    sendNext()
end)

addLog("✅ UI đã sẵn sàng – KHÔNG GIỚI HẠN số lượng gửi", Color3.fromRGB(0, 255, 0))
addLog("📋 Danh sách có " .. #itemDatabase .. " vật phẩm", Color3.fromRGB(0, 255, 255))
