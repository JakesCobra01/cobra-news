-- =============================================
--  BLUE HAVEN NEWS — SERVER
-- =============================================

local QBCore = exports['qb-core']:GetCoreObject()

-- Track players who have opted out (source → true)
local optedOut = {}

-- Queue of pending broadcasts { article, broadcastAt }
local broadcastQueue = {}
local queueRunning   = false

-- ── DEDUPLICATION ───────────────────────────────────────────────────────────
-- Tracks recent dispatch events: key = codeName..zoneKey, value = timestamp
-- Prevents the same incident type firing multiple news articles when a
-- shootout or fight generates several dispatch alerts in quick succession.

local recentEvents   = {}
local DEDUP_RADIUS   = 200.0  -- metres — events within this bucket together
local DEDUP_COOLDOWN = 600    -- seconds (10 min) before same zone fires again
local ZONE_BUCKET    = 150.0  -- coord snapping granularity

local function GetZoneKey(street)
    -- Use street name as zone key — good enough without needing coords server-side
    return street and street:lower():gsub('%s+', '_') or 'unknown'
end

local function IsDuplicate(codeName, street)
    local key = codeName .. ':' .. GetZoneKey(street)
    local last = recentEvents[key]
    if last and (os.time() - last) < DEDUP_COOLDOWN then
        return true
    end
    recentEvents[key] = os.time()
    return false
end

-- Periodically clean up old entries so the table doesn't grow forever
CreateThread(function()
    while true do
        Wait(300000) -- every 5 minutes
        local now = os.time()
        for k, t in pairs(recentEvents) do
            if now - t > DEDUP_COOLDOWN then
                recentEvents[k] = nil
            end
        end
    end
end)

-- ── UTILITIES ────────────────────────────────────────────────────────────────

local function RandomRange(min, max)
    if min == 0 and max == 0 then return 0 end
    return math.random(min, max)
end

local function PickRandom(tbl)
    return tbl[math.random(#tbl)]
end

local function Substitute(str, subs)
    return (str:gsub('{(%w+)}', function(key)
        return subs[key] or ''
    end))
end

local function BuildArticle(templateKey, subs)
    local t = NewsTemplates[templateKey]
    if not t then return nil end
    local title = Substitute(PickRandom(t.titles), subs)
    local body  = Substitute(PickRandom(t.bodies),  subs)
    return { tier = t.tier, title = title, body = body }
end

-- ── BROADCAST ENGINE ─────────────────────────────────────────────────────────

local function PushBroadcast(article)
    if not article then return end
    for _, src in ipairs(GetPlayers()) do
        local s = tonumber(src)
        if not optedOut[s] then
            TriggerClientEvent('paradise-news:client:broadcast', s, article)
        end
    end
end

local function StartQueueProcessor()
    if queueRunning then return end
    queueRunning = true
    CreateThread(function()
        while #broadcastQueue > 0 do
            local now   = os.time()
            local fired = false
            for i = #broadcastQueue, 1, -1 do
                local item = broadcastQueue[i]
                if now >= item.broadcastAt then
                    PushBroadcast(item.article)
                    table.remove(broadcastQueue, i)
                    fired = true
                    break
                end
            end
            Wait(fired and 3000 or 10000)
        end
        queueRunning = false
    end)
end

local function EnqueueBroadcast(templateKey, subs, delayCategory)
    local article = BuildArticle(templateKey, subs)
    if not article then return end
    local range = Config.Delays[delayCategory] or Config.Delays.cityDesk
    local delay = RandomRange(range[1], range[2])
    table.insert(broadcastQueue, {
        article     = article,
        broadcastAt = os.time() + delay
    })
    StartQueueProcessor()
end

-- ── PS-DISPATCH HOOK ─────────────────────────────────────────────────────────
-- ── PS-DISPATCH HOOK ─────────────────────────────────────────────────────────
-- FiveM blocks hooking ps-dispatch net events from other resources on both
-- client and server side. The only clean solution is a one-line shim added
-- to ps-dispatch's own server/main.lua that re-emits a LOCAL server event:
--
--   AddEventHandler('ps-dispatch:server:notify', function(data)
--       TriggerEvent('ps-dispatch:server:localNotify', data)
--   end)
--
-- Add that block anywhere in ps-dispatch/server/main.lua, then our handler
-- below fires for every alert with no net safety issues. See README.

AddEventHandler('ps-dispatch:server:localNotify', function(data)
    if not data or not data.codeName then return end

    local codeName = data.codeName:lower()
    local category = Config.DispatchMap[codeName]
    if not category then return end

    local street = (data.street and data.street ~= '') and data.street or 'an undisclosed location'

    -- Drop duplicate alerts: same incident type in same zone within 10 minutes
    if IsDuplicate(codeName, street) then return end

    local subs = {
        street  = street,
        vehicle = (data.vehicle and data.vehicle ~= '') and data.vehicle or 'a vehicle',
        area    = street,
    }

    if not NewsTemplates[codeName] then return end
    EnqueueBroadcast(codeName, subs, category)
end)

-- ── QB-VEHICLESHOP HOOK ───────────────────────────────────────────────────────

AddEventHandler('qb-vehicleshop:server:buyVehicle', function(source, vehicle, plate, price)
    price = tonumber(price) or 0
    if price < Config.VehiclePriceThreshold then return end
    local vehicleName = vehicle and vehicle:gsub('^%l', string.upper) or 'a luxury vehicle'
    EnqueueBroadcast('vehiclePurchase', { vehicle = vehicleName }, 'lifestyle')
end)

-- ── BCS-HOUSING HOOK ──────────────────────────────────────────────────────────

local function OnPropertyPurchase()
    EnqueueBroadcast('propertyPurchase', {}, 'lifestyle')
end

AddEventHandler('bcs-housing:server:purchaseHouse', OnPropertyPurchase)
AddEventHandler('housing:server:purchaseHouse',     OnPropertyPurchase)
AddEventHandler('bcs-housing:server:buyHouse',      OnPropertyPurchase)

-- ── RENEWED-WEATHER HOOK ──────────────────────────────────────────────────────

local lastWeather = ''
AddEventHandler('renewed:server:setWeather', function(weatherType)
    if not weatherType or weatherType == lastWeather then return end
    lastWeather = weatherType
    local condition = Config.WeatherLabels[weatherType:upper()] or 'changing conditions'
    local article = BuildArticle('weather', { condition = condition })
    if article then
        CreateThread(function()
            Wait(math.random(5000, 20000))
            PushBroadcast(article)
        end)
    end
end)

-- ── FILLER BROADCAST LOOP ────────────────────────────────────────────────────

if Config.FillerInterval and Config.FillerInterval > 0 then
    CreateThread(function()
        Wait(Config.FillerInterval * 1000)
        while true do
            local filler = NewsTemplates.filler[math.random(#NewsTemplates.filler)]
            PushBroadcast({ tier = filler.tier, title = filler.title, body = filler.body })
            Wait(Config.FillerInterval * 1000)
        end
    end)
end

-- ── PLAYER TOGGLE ─────────────────────────────────────────────────────────────

RegisterNetEvent('paradise-news:server:setOptOut')
AddEventHandler('paradise-news:server:setOptOut', function(state)
    local src = source
    optedOut[src] = state or nil
end)

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    local src = Player.PlayerData.source
    local meta = Player.PlayerData.metadata
    if meta and meta['news_optout'] then
        optedOut[src] = true
    end
end)

RegisterNetEvent('paradise-news:server:saveOptOut')
AddEventHandler('paradise-news:server:saveOptOut', function(state)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.SetMetaData('news_optout', state)
end)

AddEventHandler('playerDropped', function()
    optedOut[source] = nil
end)

-- ── ADMIN MANUAL BROADCAST ────────────────────────────────────────────────────
-- Usage: /newssend BREAKING Title Goes Here | Body text goes here.
-- Console (source = 0) bypasses permission check entirely.

RegisterCommand('newssend', function(src, args)
    src = tonumber(src)

    if src and src ~= 0 then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end
        if not QBCore.Functions.HasPermission(src, 'admin') then
            TriggerClientEvent('ox_lib:notify', src, {
                type        = 'error',
                description = 'You do not have permission to send news broadcasts.',
            })
            return
        end
    end

    if not args or #args < 2 then
        print('[paradise-news] Usage: /newssend <TIER> <Title> | <Body>')
        if src and src ~= 0 then
            TriggerClientEvent('ox_lib:notify', src, {
                type        = 'error',
                description = 'Usage: /newssend BREAKING Title | Body text here.',
            })
        end
        return
    end

    local tier = args[1]:upper()
    local rest = table.concat(args, ' ', 2)
    local splitAt = rest:find('|')
    local title, body

    if splitAt then
        title = rest:sub(1, splitAt - 1):match('^%s*(.-)%s*$')
        body  = rest:sub(splitAt + 1):match('^%s*(.-)%s*$')
    else
        title = 'Blue Haven News'
        body  = rest
    end

    if not title or title == '' or not body or body == '' then
        print('[paradise-news] Could not parse broadcast. Use: /newssend BREAKING Title | Body')
        return
    end

    PushBroadcast({ tier = tier, title = title, body = body })
    print('[paradise-news] Broadcast sent: [' .. tier .. '] ' .. title)

    if src and src ~= 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            type        = 'success',
            description = 'Broadcast sent: ' .. title,
        })
    end
end, true)
