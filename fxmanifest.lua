fx_version 'adamant'

game 'gta5'
author 'struzzoxz'
version '1.00'
description 'Negozietti'
lua54 'yes'
shared_script {'@es_extended/imports.lua', '@ox_lib/init.lua'}
client_scripts { 'client.lua', 'config.lua'}
server_scripts {'server.lua', 'config.lua'}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/js/*.js',
    'nui/css/*.css',
    'nui/img/*',
    'nui/fonts/*'
}
