-- ============================================================
-- UI GIFT BOX – Bản sửa dropdown bị che (dùng khung nổi)
-- ============================================================

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "GiftBoxUI_Floating"
gui.Parent = player.PlayerGui

-- ========== KHUNG CHÍNH ==========
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 480)
frame.Position = UDim2.new(1, -430, 0, 40)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 100, 120)
frame.Parent = gui

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 34)
title.BackgroundTransparency = 1
title.Text = "🎁 GIFT BOX – KHÔNG GIỚI HẠN"
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

-- ========== HÀNG NHẬP ==========
local row = Instance.new("Frame")
row.Size = UDim2.new(1, -20, 0, 34)
row.Position = UDim2.new(0, 10, 0, 74)
row.BackgroundTransparency = 1
row.Parent = frame

local idBox = Instance.new("TextBox")
idBox.Size = UDim2.new(0, 100, 0, 30)
idBox.Position = UDim2.new(0, 0, 0, 0)
idBox.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
idBox.TextColor3 = Color3.fromRGB(255, 255, 255)
idBox.BorderSizePixel = 1
idBox.BorderColor3 = Color3.fromRGB(70, 70, 100)
idBox.PlaceholderText = "ID"
idBox.Text = ""
idBox.Font = Enum.Font.SourceSans
idBox.TextSize = 14
idBox.Parent = row

local dropBtn = Instance.new("TextButton")
dropBtn.Size = UDim2.new(0, 32, 0, 30)
dropBtn.Position = UDim2.new(0, 104, 0, 0)
dropBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
dropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
dropBtn.BorderSizePixel = 0
dropBtn.Text = "▼"
dropBtn.Font = Enum.Font.SourceSansBold
dropBtn.TextSize = 16
dropBtn.Parent = row

local qtyBox = Instance.new("TextBox")
qtyBox.Size = UDim2.new(0, 70, 0, 30)
qtyBox.Position = UDim2.new(0, 140, 0, 0)
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
addBtn.Position = UDim2.new(0, 215, 0, 0)
addBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 110)
addBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
addBtn.BorderSizePixel = 0
addBtn.Text = "+ Thêm"
addBtn.Font = Enum.Font.SourceSansBold
addBtn.TextSize = 14
addBtn.Parent = row

-- ========== DANH SÁCH VẬT PHẨM ==========
local itemDatabase = {
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
}

-- ========== DROPDOWN – KHUNG NỔI TRÊN CÙNG ==========
local dropFrame = Instance.new("Frame")
dropFrame.Size = UDim2.new(0, 280, 0, 200)
dropFrame.Position = UDim2.new(0, 10, 0, 115)  -- Đặt ngay dưới hàng nhập
dropFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 45)
dropFrame.BorderSizePixel = 2
dropFrame.BorderColor3 = Color3.fromRGB(200, 150, 170)
dropFrame.Visible = false
dropFrame.ZIndex = 50  -- Nổi trên tất cả
dropFrame.Parent = gui  -- Gắn trực tiếp vào ScreenGui

local dropList = Instance.new("ScrollingFrame")
dropList.Size = UDim2.new(1, -8, 1, -8)
dropList.Position = UDim2.new(0, 4, 0, 4)
dropList.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
dropList.BorderSizePixel = 0
dropList.CanvasSize = UDim2.new(0, 0, 0, 0)
dropList.ScrollBarThickness = 5
dropList.Parent = dropFrame

local dropLayout = Instance.new("UIListLayout")
dropLayout.Parent = dropList
dropLayout.SortOrder = Enum.SortOrder.LayoutOrder
dropLayout.Padding = UDim.new(0, 2)

local function buildDropList()
    for _, child in pairs(dropList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, data in ipairs(itemDatabase) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -6, 0, 26)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
        btn.TextColor3 = Color3.fromRGB(230, 230, 250)
        btn.BorderSizePixel = 0
        btn.Text = data.id .. " - " .. data.name
        btn.TextSize = 12
        btn.Font = Enum.Font.SourceSans
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.ZIndex = 51
        btn.Parent = dropList
        btn.MouseButton1Click:Connect(function()
            idBox.Text = tostring(data.id)
            dropFrame.Visible = false
        end)
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 110)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
        end)
    end
    dropList.CanvasSize = UDim2.new(0, 0, 0, #itemDatabase * 28 + 6)
end
buildDropList()

-- Mở/đóng dropdown
dropBtn.MouseButton1Click:Connect(function()
    dropFrame.Visible = not dropFrame.Visible
    if dropFrame.Visible then
        buildDropList()
        -- Đưa lên trên cùng
        dropFrame.ZIndex = 100
        -- Đặt lại vị trí theo tọa độ tuyệt đối của nút dropdown
        local absPos = dropBtn.AbsolutePosition
        dropFrame.Position = UDim2.new(0, absPos.X - gui.AbsolutePosition.X, 0, absPos.Y - gui.AbsolutePosition.Y + 34)
    end
end)

-- Ẩn dropdown khi bấm ra ngoài (xử lý bằng cách bắt sự kiện trên toàn bộ gui)
local function hideDropdown()
    dropFrame.Visible = false
end
-- Khi bấm vào bất kỳ đâu trên gui (trừ dropdown) sẽ ẩn, nhưng ta sẽ dùng cách đơn giản: khi bấm nút thêm, xóa, gửi thì ẩn.

-- ========== DANH SÁCH ĐÃ CHỌN ==========
local listBox = Instance.new("ScrollingFrame")
listBox.Size = UDim2.new(1, -20, 0, 100)
listBox.Position = UDim2.new(0, 10, 0, 120)
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
sendBtn.Position = UDim2.new(0, 10, 0, 230)
sendBtn.BackgroundColor3 = Color3.fromRGB(230, 80, 100)
sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sendBtn.BorderSizePixel = 0
sendBtn.Text = "🚀 GỬI TẤT CẢ (KHÔNG GIỚI HẠN)"
sendBtn.Font = Enum.Font.SourceSansBold
sendBtn.TextSize = 15
sendBtn.Parent = frame

-- ========== HÀNG XÓA + ĐÓNG ==========
local actionRow = Instance.new("Frame")
actionRow.Size = UDim2.new(1, -20, 0, 30)
actionRow.Position = UDim2.new(0, 10, 0, 270)
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
logBox.Size = UDim2.new(1, -20, 0, 110)
logBox.Position = UDim2.new(0, 10, 0, 310)
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
local items = {}

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
        row.Text = "ID " .. it.id .. " × " .. it.qty .. "   [✕]"
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
    local id = tonumber(idBox.Text)
    local qty = tonumber(qtyBox.Text)
    if not id or id <= 0 or not qty or qty <= 0 then
        addLog("⚠️ ID hoặc SL không hợp lệ", Color3.fromRGB(255, 120, 120))
        return
    end
    for _, it in ipairs(items) do
        if it.id == id then
            it.qty = it.qty + qty
            renderList()
            addLog("➕ Cộng ID " .. id .. " × " .. qty, Color3.fromRGB(100, 255, 150))
            dropFrame.Visible = false
            return
        end
    end
    table.insert(items, {id = id, qty = qty})
    renderList()
    addLog("➕ Thêm ID " .. id .. " × " .. qty, Color3.fromRGB(100, 255, 150))
    idBox.Text = ""
    qtyBox.Text = "1"
    dropFrame.Visible = false
end)

-- Xóa hết
clearBtn.MouseButton1Click:Connect(function()
    items = {}
    renderList()
    addLog("🗑 Đã xóa danh sách", Color3.fromRGB(255, 200, 0))
    dropFrame.Visible = false
end)

-- Gửi
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
    dropFrame.Visible = false

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

    addLog("🚀 Bắt đầu gửi đến " .. user, Color3.fromRGB(0, 200, 255))
    addLog("📦 Tổng " .. #flat .. " món, chia " .. #chunks .. " đợt", Color3.fromRGB(0, 200, 255))

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
            sendBtn.Text = "🚀 GỬI TẤT CẢ (KHÔNG GIỚI HẠN)"
            sendBtn.BackgroundColor3 = Color3.fromRGB(230, 80, 100)
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
            addLog("❌ Không tìm thấy hàm request", Color3.fromRGB(255, 100, 100))
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
            addLog("✅ Đợt " .. idx .. "/" .. #chunks .. " OK", Color3.fromRGB(100, 255, 100))
            success = success + 1
        else
            local errMsg = "Lỗi"
            if resp and resp.StatusCode then
                errMsg = "HTTP " .. resp.StatusCode
            end
            addLog("❌ Đợt " .. idx .. " thất bại: " .. errMsg, Color3.fromRGB(255, 100, 100))
        end

        idx = idx + 1
        task.wait(1.5)
        sendNext()
    end

    sendNext()
end)

addLog("✅ UI đã sẵn sàng – KHÔNG GIỚI HẠN", Color3.fromRGB(0, 255, 0))
addLog("📋 Danh sách có " .. #itemDatabase .. " vật phẩm", Color3.fromRGB(0, 200, 255))
