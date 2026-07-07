-- ============================================================
-- GIFT MAIL FIX – DÙNG CHO GROW A GARDEN 2
-- SỬA CÁC BIẾN BÊN DƯỚI TRƯỚC KHI CHẠY
-- ============================================================

-- 👇 THAY ĐỔI THÔNG TIN Ở ĐÂY
local RECIPIENT = "kietta5163"        -- Tên người nhận
local ITEMS = {                       -- Danh sách vật phẩm: {tên hoặc ID, số lượng}
    {"Carrot", 4},                    -- gửi 4 củ cà rốt (dùng tên)
    -- {"Golden Shovel", 1},          -- hoặc dùng ID: {101, 1}
    -- {"Super Sprinkler", 2},
}
local USE_ID = false                  -- true = gửi theo ID, false = gửi theo tên
-- ============================================================

local xhr = syn and syn.request or request or http_request
if not xhr then
    print("❌ Không tìm thấy hàm request – thoát")
    return
end

local http = game:GetService("HttpService")
local baseUrl = http:GetBaseUrl() or "https://growagarden2.com"

-- Danh sách endpoint thử
local endpoints = {
    "/api/mail/send",
    "/gift/send",
    "/mail/send",
    "/api/gift/send",
    "/api/mail",
}

-- Chuyển danh sách items thành mảng payload
local function buildPayloadItems(itemList, useId)
    local result = {}
    for _, entry in ipairs(itemList) do
        local nameOrId = entry[1]
        local qty = entry[2] or 1
        if useId then
            -- Nếu dùng ID, giả định entry[1] là số
            table.insert(result, {tonumber(nameOrId), qty})
        else
            -- Nếu dùng tên, giữ nguyên chuỗi
            table.insert(result, {tostring(nameOrId), qty})
        end
    end
    return result
end

local payloadItems = buildPayloadItems(ITEMS, USE_ID)

-- Hàm gửi thử với một endpoint
local function trySend(endpoint)
    local url = baseUrl .. endpoint
    local payload = {
        to = RECIPIENT,
        items = payloadItems
    }
    local body = http:JSONEncode(payload)
    print("🔗 Đang thử: " .. url)
    local success, resp = pcall(function()
        return xhr({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                -- Nếu cần thêm token, thêm vào đây
                -- ["X-CSRF-TOKEN"] = "your_token",
            },
            Body = body
        })
    end)
    if success and resp then
        print("📡 Status: " .. resp.StatusCode)
        if resp.Body then
            print("📨 Response: " .. resp.Body)
        end
        if resp.StatusCode >= 200 and resp.StatusCode < 300 then
            print("✅ Thành công với endpoint: " .. endpoint)
            return true
        else
            print("❌ Lỗi HTTP " .. resp.StatusCode)
            return false
        end
    else
        print("❌ Lỗi kết nối hoặc timeout")
        return false
    end
end

-- Bắt đầu thử
print("🚀 Bắt đầu gửi mail đến " .. RECIPIENT)
print("📦 Số loại vật phẩm: " .. #ITEMS)
local success = false
for _, ep in ipairs(endpoints) do
    if trySend(ep) then
        success = true
        break
    end
    task.wait(1)
end

if not success then
    print("❌ Không có endpoint nào hoạt động. Hãy kiểm tra lại tên vật phẩm hoặc ID.")
    print("💡 Nếu dùng tên, hãy thử chuyển USE_ID = true và dùng ID số.")
    print("💡 Để lấy ID: gửi 1 vật phẩm thủ công, bắt gói tin xem payload.")
end
