-- =============================================
--  BLUE HAVEN NEWS — CLIENT
-- =============================================

local QBCore = exports['qb-core']:GetCoreObject()

local newsEnabled  = true
local isDisplaying = false

-- ── RESTORE PREFERENCE ───────────────────────────────────────────────────────

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local Player = QBCore.Functions.GetPlayerData()
    if Player.metadata and Player.metadata['news_optout'] then
        newsEnabled = false
    else
        newsEnabled = true
    end
end)

-- ── RECEIVE BROADCAST ────────────────────────────────────────────────────────

RegisterNetEvent('paradise-news:client:broadcast')
AddEventHandler('paradise-news:client:broadcast', function(article)
    if not newsEnabled then return end
    if isDisplaying then return end
    ShowNewsUI(article)
end)

-- ── UI DISPLAY ───────────────────────────────────────────────────────────────

function ShowNewsUI(article)
    isDisplaying = true
    SetNuiFocus(false, false)

    SendNUIMessage({
        action   = 'show',
        tier     = article.tier  or 'CITY NEWS',
        title    = article.title or 'Blue Haven News',
        body     = article.body  or '',
        duration = Config.DisplayTime * 1000
    })

    CreateThread(function()
        Wait((Config.DisplayTime + 1) * 1000)
        isDisplaying = false
    end)
end

-- ── NUI CALLBACKS ─────────────────────────────────────────────────────────────

RegisterNUICallback('close', function(_, cb)
    isDisplaying = false
    cb('ok')
end)

-- ── TOGGLE COMMAND ────────────────────────────────────────────────────────────

RegisterCommand('newsalerts', function()
    newsEnabled = not newsEnabled

    TriggerServerEvent('paradise-news:server:setOptOut', not newsEnabled)
    TriggerServerEvent('paradise-news:server:saveOptOut', not newsEnabled)

    lib.notify({
        title       = 'Blue Haven News',
        description = newsEnabled and 'News alerts enabled.' or 'News alerts disabled.',
        type        = newsEnabled and 'success' or 'inform',
        duration    = 4000,
        icon        = 'newspaper',
        iconColor   = newsEnabled and '#1a6cbf' or '#888888',
    })
end, false)

RegisterKeyMapping('newsalerts', 'Toggle Blue Haven News Alerts', 'keyboard', '')

-- ── CHAT SUGGESTIONS ──────────────────────────────────────────────────────────

TriggerEvent('chat:addSuggestion', '/newsalerts', 'Toggle Blue Haven News alerts on or off.')

TriggerEvent('chat:addSuggestion', '/newssend', 'Send a manual Blue Haven News broadcast. (Admin only) Format: /newssend <TIER> <Title> | <Body>', {
    { name = 'tier',  help = 'BREAKING  |  DEVELOPING  |  CITY NEWS' },
    { name = 'title', help = 'Headline text — e.g. Fire Breaks Out Downtown' },
    { name = '|',     help = 'Required separator between title and body' },
    { name = 'body',  help = 'Full article body — e.g. Crews are responding to a blaze near Maze Bank.' },
})
