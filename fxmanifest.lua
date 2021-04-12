---
-- Do not edit the script for your own propertie.
-- Respect the authors of the scripts, stealing the work won't insist me to propose new scripts...
-- Author Script  : [Shepard#1395] - https://github.com/ShepXBFR
-- Author WarMenu : https://github.com/warxander
-- Website: https://infinity-area.com
-- Discord: https://discord.gg/mkTztth
---

fx_version 'adamant'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Shepard INFINITY-AREA.COM'
description 'Mini Framework Hunting gangs and Outlaw for RedM RP'
version '1.0.0'

client_scripts {
    'clients/warmenu.lua',
    'clients/client.lua',
    'config.lua'
}

server_script 'servers/server.lua'

-- Requiered for work (RED:M RP ONLY NO VORP)
dependencies {
    'redem',
    'redem_roleplay',
    'redemrp_inventory',
    'pNotify'
}