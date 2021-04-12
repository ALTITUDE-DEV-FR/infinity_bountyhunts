---
-- Do not edit the script for your own propertie.
-- Respect the authors of the scripts, stealing the work won't insist me to propose new scripts...
-- Author Script  : [Shepard#1395] - https://github.com/ShepXBFR
-- Author WarMenu : https://github.com/warxander
-- Website: https://infinity-area.com
-- Discord: https://discord.gg/mkTztth
---
data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

-- TIPS FOR pNotify classes css, you need to add this in " themes.css " for beautiful design !
--[[
.noty_theme__gta.noty_type__rdr2,
.noty_theme__gta.noty_type__information {
    background-color: #202639;
    border: 2px solid #202639;
    color: #fff;
    padding:15px;
    font-size: 12px!important;
    list-height:10px;
    letter-spacing: 1px;
    font-weight: 300;
}
.noty_theme__gta.noty_type__oups,
.noty_theme__gta.noty_type__information {
    background-color: #9a2119;
    border: 2px solid #9a2119;
    color: #fff;
    padding:15px;
    font-size: 12px!important;
    list-height:10px;
    letter-spacing: 1px;
    font-weight: 300;
}
]]


-----
-- HUNTER Give contrat
-----
RegisterServerEvent('infinity_bountyhunter:fugitifdied')
AddEventHandler('infinity_bountyhunter:fugitifdied', function(gangname, rewardcontrat) 
	local _source = source

	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local ItemData = data.getItem(_source, rewardcontrat)
        ItemData.AddItem(1)
		TriggerClientEvent("pNotify:SendNotification", _source , {
				text = "<b>"..gangname.." Décimé !</b><br><br> Retournez au tableau des primes pour obtenir votre récompense en finalisant votre contrat !",
				type = "rdr2",
				timeout = math.random(3000, 6000),
				layout = "CenterRight",
				theme  = "gta",
				queue  = "right",
				animation = {
					open = "gta_effects_fade_in",
					close = "gta_effects_fade_out"
				}
		})
    end)
end)

-----
-- HUNTER Trade contrat for cash/exp
-----
RegisterServerEvent('infinity_bountyhunter:validcontrat')
AddEventHandler('infinity_bountyhunter:validcontrat', function(gangname, rewardcontrat, rewardcash, rewardxp) 
	local _source = source
	
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)

		local Item = data.getItem(_source, rewardcontrat)
		if Item.ItemAmount >= 1 then
				Item.RemoveItem(1)
				user.addMoney(rewardcash)        
				user.addXP(rewardxp) 
			TriggerClientEvent("pNotify:SendNotification", _source , {
					text = "<b>Prime terminée:</b><br><br>Vous avez validé le contrat <b>"..gangname.." pour "..rewardcash.."$ et "..rewardxp.."EXP</b> !",
					type = "rdr2",
					timeout = math.random(3000, 6000),
					layout = "CenterRight",
					theme  = "gta",
					queue  = "right",
					animation = {
						open = "gta_effects_fade_in",
						close = "gta_effects_fade_out"
					}
			})
		else
			TriggerClientEvent("pNotify:SendNotification", _source , {
				text = "<b>Bien essayé</b><br><br> Vous n'avez pas validé le contrat !",
				type = "oups",
				timeout = math.random(3000, 6000),
				layout = "CenterRight",
				theme  = "gta",
				queue  = "right",
				animation = {
					open = "gta_effects_fade_in",
					close = "gta_effects_fade_out"
				}
			})
		end

    end)
end)

-----
-- HUNTER Notifications npc died
-----
RegisterServerEvent('infinity_bountyhunter:onedied')
AddEventHandler('infinity_bountyhunter:onedied', function(x) 
	local _source = source

	TriggerClientEvent("pNotify:SendNotification", _source , {
		text = "<b>Gang</b><br> un membre du gang a été éliminé, il reste <b>"..x.."</b> membre actif recherché !",
		type = "rdr2",
		timeout = math.random(3000, 6000),
		layout = "CenterRight",
		theme  = "gta",
		queue  = "right",
		animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}
	})
end)

-----
-- HUNTER Notifications Started Mission
-----
RegisterServerEvent('infinity_bountyhunter:started')
AddEventHandler('infinity_bountyhunter:started', function(gangname, wherefindsoluce) 
	local _source = source

	if wherefindsoluce == false then
		TriggerClientEvent("pNotify:SendNotification", _source , {
			text = "<b>"..gangname.."</b><br> Aperçu dans cette zone !",
			type = "rdr2",
			timeout = math.random(3000, 5000),
			layout = "CenterRight",
			theme  = "gta",
			queue  = "right",
			animation = {
				open = "gta_effects_fade_in",
				close = "gta_effects_fade_out"
			}
		})
	else
		TriggerClientEvent("pNotify:SendNotification", _source , {
			text = "<b>"..gangname.."</b><br><br> <b>Astuces</b><br> "..wherefindsoluce,
			type = "rdr2",
			timeout = math.random(5000, 9000),
			layout = "CenterRight",
			theme  = "gta",
			queue  = "right",
			animation = {
				open = "gta_effects_fade_in",
				close = "gta_effects_fade_out"
			}
		})
	end
end)

-----
-- HUNTER Notifications Failed Mission (playerdie)
-----
RegisterServerEvent('infinity_bountyhunter:failed')
AddEventHandler('infinity_bountyhunter:failed', function() 
	local _source = source

	TriggerClientEvent("pNotify:SendNotification", _source , {
		text = "<br>ECHEC!</br><br> le gang vous à décimé, la prime est perdue !",
		type = "oups",
		timeout = math.random(3000, 5000),
		layout = "CenterRight",
		theme  = "gta",
		queue  = "right",
		animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}
	})
end)

-----
-- HUNTER Notifications Cancel Mission
-----
RegisterServerEvent('infinity_bountyhunter:canceled')
AddEventHandler('infinity_bountyhunter:canceled', function(canceled) 
	local _source = source

	local stopmanual_mission = canceled

	TriggerClientEvent("pNotify:SendNotification", _source , {
		text = "<b>Prime Annulée !</b><br> Vous avez annuler cette prime !",
		type = "oups",
		timeout = math.random(3000, 5000),
		layout = "CenterRight",
		theme  = "gta",
		queue  = "right",
		animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}
	})

	TriggerClientEvent('infinity_bountyhunter:cancel', _source, stopmanual_mission)

end)
