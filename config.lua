---
-- Do not edit the script for your own propertie.
-- Respect the authors of the scripts, stealing the work won't insist me to propose new scripts...
-- Author Script  : [Shepard#1395] - https://github.com/ShepXBFR
-- Author WarMenu : https://github.com/warxander
-- Website: https://infinity-area.com
-- Discord: https://discord.gg/mkTztth
---

Config = {}

Config.MenuHuntTitle    = "Wanted"
Config.MenuHuntOne      = "Liste des fugitifs"
Config.InfoPoint		= "Appuyer sur [ESPACE] pour consultez les primes"


-- Hunter Tab [ONE] Valentine
Config.hunter_onex  = -269.65       	-- X
Config.hunter_oney  = 807.18      		-- Y
Config.hunter_onez  = 119.33         	-- Z

-- Hunter Tab [TWO]
Config.hunter_twox  = 2509.94       	-- X
Config.hunter_twoy  = -1318.1      		-- Y
Config.hunter_twoz  = 48.54        	-- Z


-- Vendeurs sur la map
local blips = {
	{ name = 'Bounty', sprite = -242384756 , x = Config.hunter_onex, y = Config.hunter_oney, z = Config.hunter_onez },
	{ name = 'Bounty', sprite = -242384756 , x = Config.hunter_twox, y = Config.hunter_twoy, z = Config.hunter_twoz }
}

-- Blips
Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)

-- Load Random Models
Config.models = {
	{hash = "g_m_m_unicriminals_01"},
	{hash = "g_m_m_unicriminals_01"},
	{hash = "msp_gang2_males_01"},
	{hash = "a_m_m_valcriminals_01"}
}