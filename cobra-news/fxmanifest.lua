fx_version 'cerulean'
game 'gta5'

name 'cobra-news'
description 'Blue Haven News - Live City Broadcasting System'
author 'Cobra Development'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/templates.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

lua54 'yes'
