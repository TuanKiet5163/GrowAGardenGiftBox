-- ============================================================
-- UI GIFT BOX – Grow a Garden 2 – Delta Android
-- Copy toàn bộ và dán vào executor, chạy là có bảng.
-- ============================================================

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui
gui.Name = "GiftBoxUI"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 420)
frame.Position = UDim2.new(1, -330, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(233, 69, 96)
frame.Parent = gui

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "📦 GIFT BOX MASS"
title.TextColor3 = Color3.fromRGB(233, 69, 96)
title.TextSize = 18
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Ô nhập người nhận
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

-- Ô ID
local idBox = Instance.new("TextBox")
idBox.Size = UDim2.new(0, 120, 0, 25)
idBox.Position = UDim2.new(0, 5, 0, 65)
idBox.BackgroundColor3 = Color3.fromRGB(26, 26, 46)
idBox.TextColor3 = Color3.fromRGB(255, 255, 255)
idBox.BorderSizePixel = 1
idBox.BorderColor3 = Color3.fromRGB(51, 51, 51)
idBox.PlaceholderText = "ID"
idBox.Text = ""
idBox.Parent = frame

-- Ô số lượng
local qtyBox = Instance.new("TextBox")
qtyBox.Size = UDim2.new(0, 60, 0, 25)
qtyBox.Position = UDim2.new(0, 130, 0, 65)
qtyBox.BackgroundColor3 = Color3.fromRGB(26, 26, 46)
qtyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
qtyBox.BorderSizePixel = 1
qtyBox.BorderColor3 = Color3.fromRGB(51, 51, 51)
qtyBox.PlaceholderText = "SL"
qtyBox.Text = "1"
qtyBox.Parent = frame

-- Nút thêm
local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 60, 0, 25)
addBtn.Position = UDim2.new(0, 195, 0, 65)
addBtn.BackgroundColor3 = Color3.fromRGB(45, 106, 79)
addBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
addBtn.BorderSizePixel = 0
addBtn.Text = "+ Thêm"
addBtn.Parent = frame

-- Danh sách
local listBox = Instance.new("ScrollingFrame")
listBox.Size = UDim2.new(1, -10, 0, 120)
listBox.Position = UDim2.new(0, 5, 0, 95)
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
sendBtn.Position = UDim2.new(0, 5, 0, 220)
sendBtn.BackgroundColor3 = Color3.fromRGB(233, 69, 96)
sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sendBtn.BorderSizePixel = 0
sendBtn.Text = "🚀 GỬI TẤT CẢ"
sendBtn.Font = Enum.Font.SourceSansBold
sendBtn.TextSize = 14
sendBtn.Parent = frame

-- Nút xóa
local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 80, 0, 25)
clearBtn.Position = UDim2.new(0, 5, 0, 255)
clearBtn.BackgroundColor3 = Color3.fromRGB(92, 46, 46)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 0
clearBtn.Text = "🗑 Xóa hết"
clearBtn.Parent = frame

-- Log
local logBox = Instance.new("ScrollingFrame")
logBox.Size = UDim2.new(1, -10, 0, 80)
logBox.Position = UDim2.new(0, 5, 0, 285)
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
    if user == "" then addLog("❌ Chưa nhập người nhận", Color3.fromRGB(255, 136, 136)) return end
    if #items == 0 then addLog("❌ Danh sách rỗng", Color3.fromRGB(255, 136, 136)) return end

    local ep = "/api/mail/send"  -- Endpoint mặc định, nếu sai thì sửa ở đây

    -- Tạo mảng phẳng
    local flat = {}
    for _, it in ipairs(items) do
        for i = 1, it.qty do table.insert(flat, it.id) end
    end

    local chunks = {}
    for i = 1, #flat, 20 do
        local chunk = {}
        for j = i, math.min(i + 19, #flat) do table.insert(chunk, flat[j]) end
        table.insert(chunks, chunk)
    end

    addLog("🚀 Bắt đầu gửi đến " .. user, Color3.fromRGB(0, 255, 255))
    addLog("📦 Tổng " .. #flat .. " món, chia " .. #chunks .. " đợt", Color3.fromRGB(0, 255, 255))

    sendBtn.Text = "⏳ Đang gửi..."
    sendBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

    local success = 0
    local idx = 1

    local function sendNext()
        if idx > #chunks then
            addLog("🏁 Hoàn thành: " .. success .. "/" .. #chunks .. " đợt", success == #chunks and Color3.fromRGB(136, 255, 136) or Color3.fromRGB(255, 255, 0))
            sendBtn.Text = "🚀 GỬI TẤT CẢ"
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
            addLog("❌ Đợt " .. idx .. " thất bại", Color3.fromRGB(255, 136, 136))
        end

        idx = idx + 1
        task.wait(1.5)
        sendNext()
    end

    sendNext()
end)

addLog("✅ UI đã sẵn sàng", Color3.fromRGB(0, 255, 0))