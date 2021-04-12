---
-- Version [1.1]
-- Do not edit the script for your own propertie.
-- Respect the authors of the scripts, stealing the work won't insist me to propose new scripts...
-- Author Script  : [Shepard#1395] - https://github.com/ShepXBFR
-- Author WarMenu : https://github.com/warxander
-- Website: https://infinity-area.com
-- Discord: https://discord.gg/mkTztth
---

-----
-- BOUNTY HUNTER Inits
-----
local createdped 	    = {}
local count 			= {}
local launch_bounty 	= false
local mission 			= false

-- Cities
local valentine 		= false
local saintdenis		= false

-----
-- Playercoords & distance Show
-----
function IsPlayerNearCoords(x, y, z)
    local playerx, playery, playerz = table.unpack(GetEntityCoords(GetPlayerPed(), 0))
    local distance = GetDistanceBetweenCoords(playerx, playery, playerz, x, y, z, true)
    if distance < 1.0 then
        return true
    end
end

-----
-- HUNTER Draw TxT
-----
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
	local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
	   SetTextScale(w, h)
	   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	   SetTextCentre(centre)
	   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	   Citizen.InvokeNative(0xADA9255D, 10);
	   DisplayText(str, x, y)
end
   
-----
-- HUNTER Zones Points
-----
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)

        -- Hunter Point [ONE] - Valentine
		if IsPlayerNearCoords(Config.hunter_onex, Config.hunter_oney, Config.hunter_onez) then
			DrawTxt(Config.InfoPoint, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
			if IsControlJustPressed(2, 0xD9D0E1C0) then
                WarMenu.OpenMenu('wanted')
				valentine = true
            end

        -- Hunter Point [TWO] - Saint Denis
        elseif IsPlayerNearCoords(Config.hunter_twox, Config.hunter_twoy, Config.hunter_twoz) then
            DrawTxt(Config.InfoPoint, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            if IsControlJustPressed(2, 0xD9D0E1C0) then
                WarMenu.OpenMenu('wanted')
            end
        end

	end -- CreateThread end
end) -- While end


------
--- HUNT MENU
------
Citizen.CreateThread(function()

    WarMenu.CreateMenu('wanted', Config.MenuHuntTitle)
    WarMenu.SetSubTitle('wanted', 'Que souhaitez vous faire ?')
    WarMenu.CreateSubMenu('gangs', 'wanted', '~e~Wanted ~q~Gangs')
    WarMenu.CreateSubMenu('fugitiv', 'wanted', '~e~Wanted ~q~Outlaw')
    WarMenu.CreateSubMenu('win', 'wanted', 'Quel contrat souhaitez-vous finir ?')

	-- Outlaw Gang 01
	outlawGangName01ID		= 1
	outlawGangName01  		= 'New York Yennes'
	outlawGangGiven01		= 'wantedlawgang01'
	outlawGangGiveCash01 	= 5
	outlawGangGiveExp01		= 2
	-- Outlaw Gang 02
	outlawGangName02ID		= 2
	outlawGangName02  		= 'The Grizzles'
	outlawGangGiven02 		= 'wantedlawgang01'
	outlawGangGiveCash02 	= 15
	outlawGangGiveExp02		= 3

	-- Outlaw Man 01
	outlawMenName01ID		= 50
	outlawName01  			= 'The Lawmen'
	outlawGiven01 			= 'wantedlawmen01'
	outlawGiveCash01 		= 3
	outlawGiveExp01			= 1
	-- Outlaw Man 02
	outlawMenName02ID		= 51
	outlawName02  			= 'Joe Labrute'
	outlawGiven02 			= 'wantedlawmen01'
	outlawGiveCash02 		= 1
	outlawGiveExp02			= 1
	-- Outlaw Man 03
	outlawMenName03ID		= 52
	outlawName03  			= 'L\'équilibriste'
	outlawGiven03 			= 'wantedlawmen01'
	outlawGiveCash03 		= 1
	outlawGiveExp03			= 1

    while true do

        if WarMenu.IsMenuOpened('wanted') then

			if mission == false then
				if WarMenu.MenuButton('Wanted Gangs', 'gangs') then
				end
				if WarMenu.MenuButton('Wanted Fugitifs', 'fugitiv') then
				end
			else
				if WarMenu.Button('Annuler la mission') then 
					mission 		= false
					launch_bounty	= false
					diemission() -- force stop mission
					WarMenu.CloseMenu()
				end
			end
				if WarMenu.MenuButton('Valider mes contrats', 'win') then
				end
        WarMenu.Display()

		elseif WarMenu.IsMenuOpened('win') then

			-- Outlaw Gang 01
			if WarMenu.Button('Contrat '..outlawGangName01) then 
				TriggerServerEvent('infinity_bountyhunter:validcontrat', outlawGangName01, outlawGangGiven01, outlawGangGiveCash01, outlawGangGiveExp01)
				--WarMenu.CloseMenu()
			end
			-- Outlaw Gang 02
			if WarMenu.Button('Contrat '..outlawGangName02) then 
				TriggerServerEvent('infinity_bountyhunter:validcontrat', outlawGangName02, outlawGangGiven02, outlawGangGiveCash02, outlawGangGiveExp02)
				--WarMenu.CloseMenu()
			end
			-- Outlaw Man 01
			if WarMenu.Button('Contrat '..outlawName01) then 
				TriggerServerEvent('infinity_bountyhunter:validcontrat', outlawName01 , outlawGiven01, outlawGiveCash01, outlawGiveExp01)
				--WarMenu.CloseMenu()
			end
			-- Outlaw Man 02
			if WarMenu.Button('Contrat '..outlawName02) then 
				TriggerServerEvent('infinity_bountyhunter:validcontrat', outlawName02 , outlawGiven02, outlawGiveCash02, outlawGiveExp02)
				--WarMenu.CloseMenu()
			end
			-- Outlaw Man 03
			if WarMenu.Button('Contrat '..outlawName03) then 
				TriggerServerEvent('infinity_bountyhunter:validcontrat', outlawName03 , outlawGiven03, outlawGiveCash03, outlawGiveExp03)
				--WarMenu.CloseMenu()
			end
        WarMenu.Display()

        elseif WarMenu.IsMenuOpened('gangs') then

            -- Gang 1
			if valentine == true then
				if WarMenu.Button(outlawGangName01..' - Prime - ~t6~'..outlawGangGiveCash01..'$') then 
					launch_bounty   	= true
					mission 			= true
					stopmanual_mission 	= false
					missionstart(outlawGangName01ID,launch_bounty)
				WarMenu.CloseMenu()
				end
			end

			-- Gang 2
			if valentine == true then
				if WarMenu.Button(outlawGangName02..' - Prime - ~t6~'..outlawGangGiveCash02..'$') then 
					launch_bounty   	= true
					mission 			= true
					stopmanual_mission 	= false
					missionstart(outlawGangName02ID,launch_bounty)
				WarMenu.CloseMenu()
				end
			end

        WarMenu.Display()

        elseif WarMenu.IsMenuOpened('fugitiv') then

			-- Outlaw 01
			if valentine == true then
				if WarMenu.Button(outlawName01..' - Prime - ~t6~'..outlawGiveCash01..'$') then
					launch_bounty   	= true
					mission 			= true
					stopmanual_mission 	= false
					missionstart(outlawMenName01ID,launch_bounty)
				WarMenu.CloseMenu()
				end
			end
			-- Outlaw 02
			if valentine == true then
				if WarMenu.Button(outlawName02..' - Prime - ~t6~'..outlawGiveCash02..'$') then
					launch_bounty   	= true
					mission 			= true
					stopmanual_mission 	= false
					missionstart(outlawMenName02ID,launch_bounty)
				WarMenu.CloseMenu()
				end
			end
			-- Outlaw 03
			if valentine == true then
				if WarMenu.Button(outlawName03..' - Prime - ~t6~'..outlawGiveCash03..'$') then
					launch_bounty   	= true
					mission 			= true
					stopmanual_mission 	= false
					missionstart(outlawMenName03ID,launch_bounty)
				WarMenu.CloseMenu()
				end
			end

        WarMenu.Display()
        end

        Citizen.Wait(0)
    end
end)

------
--- MISSION FINISHED
------
function stopmission()
	launch_bounty   		= false
	mission					= false
end

------
--- MISSION CANCELED
------
function diemission()
	launch_bounty   		= false
	mission					= false
	stopmanual_mission		= true
	TriggerServerEvent('infinity_bountyhunter:canceled', stopmanual_mission)
end

-----
-- START MISSION
-----
function missionstart(type,launch_bounty)
						
	if type then
			-- Random NPC Function
			-- Random NPC Skins
			local modelConfigRandom 	= math.random(1,2)
			local modelRandom 			= Config.models[modelConfigRandom].hash
			local hashe 				= GetHashKey(modelRandom)
			RequestModel(hashe)
			if not HasModelLoaded(hashe) then 
				RequestModel(hashe) 
			end
			while not HasModelLoaded(hashe) do 
				Citizen.Wait(1) 
			end
			-- Random Weapons given npcs
			local  random = math.random(1,3)
			weaponrandom = random
			if weaponrandom == 1 then
				npc_weapon = 0x772C8DD6
			elseif weaponrandom == 2 then
				npc_weapon = 0x169F59F7
			end
			-- Random NPC Function

			-----
			-- GANG ONE
			-----
			if type == outlawGangName01ID then
				gangname		= outlawGangName01
				rewardcontrat 	= "wantedlawgang01"
				wherefindsoluce	= false
				enableblip		= true
				npcs = {
					{hash = hashe, x = -310.58 , y = 777.62, z = 118.72, true, true, true, true},
					{hash = hashe, x = -304.06 , y = 778.62, z = 118.72, true, true, true, true},
					{hash = hashe, x = -306.47 , y = 763.82, z = 118.7, true, true, true, true},
					{hash = hashe, x = -305.97 , y = 768.76, z = 118.72, true, true, true, true},
					{hash = hashe, x = -308.8 , y = 780.31, z = 118.76, true, true, true, true},
					{hash = hashe, x = -307.21 , y = 780.57, z = 118.77, true, true, true, true},
					{hash = hashe, x = -302.43 , y = 773.91, z = 123.05, true, true, true, true},
					{hash = hashe, x = -307.24 , y = 773.18, z = 118.7, true, true, true, true}
				}
				for k,item in pairs(npcs) do
					createdped[k] = CreatePed(item.hash, item.x, item.y, item.z, true, true, true, true)
					Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], false)
					Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
					count[k] = (createdped[k])
					SetPedSeeingRange(createdped[k], 100.0)
					SetPedHearingRange(createdped[k], 80.0)
					SetPedCombatAttributes(createdped[k], 46, 1)
					SetPedFleeAttributes(createdped[k], 0, 0)
					SetPedCombatRange(createdped[k],2)
					SetPedRelationshipGroupHash(createdped[k], GetHashKey(0x06C3F072))
					SetRelationshipBetweenGroups(5,GetHashKey("PLAYER"),GetHashKey("0x06C3F072"))
					SetRelationshipBetweenGroups(5,GetHashKey("0x06C3F072"),GetHashKey("PLAYER"))
					TaskCombatPed(createdped[k], GetPlayerPed(-1), 0, 16)
					SetPedCombatAbility(createdped[k], 100)
					SetPedCombatMovement(createdped[k], 2)
					GiveWeaponToPed_2(createdped[k], npc_weapon, 10, true, true, 1, true, 1.0, 1.0, 1.0, true, 0, 0)
					SetPedAmmo(createdped[k], npc_weapon, 10)
				end
			end

			-----
			-- GANG Two
			-----
			if type == outlawGangName02ID then
				gangname		= outlawGangName02
				rewardcontrat 	= "wantedlawgang01"
				wherefindsoluce	= "De vraies brutes cachées dans les montagnes !"
				enableblip		= true
				npcs = {
					{hash = hashe, x = -946.07 , y = 1521.24, z = 251.74, true, true, true, true},
					{hash = hashe, x = -978.16 , y = 1542.13, z = 238.43, true, true, true, true},
					{hash = hashe, x = -981.57 , y = 1542.27, z = 238.43, true, true, true, true},
					{hash = hashe, x = -1004.46 , y = 1585.97, z = 238.43, true, true, true, true},
					{hash = hashe, x = -984.13 , y = 1659.79, z = 238.43, true, true, true, true},
					{hash = hashe, x = -1017.72 , y = 1686.91, z = 244.16, true, true, true, true},
					{hash = hashe, x = -1022.2 , y = 1695.24, z = 244.31, true, true, true, true}
				}
				for k,item in pairs(npcs) do
					createdped[k] = CreatePed(item.hash, item.x, item.y, item.z, true, true, true, true)
					Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], false)
					Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
					count[k] = (createdped[k])
					SetPedSeeingRange(createdped[k], 100.0)
					SetPedHearingRange(createdped[k], 80.0)
					SetPedCombatAttributes(createdped[k], 46, 1)
					SetPedFleeAttributes(createdped[k], 0, 0)
					SetPedCombatRange(createdped[k],2)
					SetPedRelationshipGroupHash(createdped[k], GetHashKey(0x06C3F072))
					SetRelationshipBetweenGroups(5,GetHashKey("PLAYER"),GetHashKey("0x06C3F072"))
					SetRelationshipBetweenGroups(5,GetHashKey("0x06C3F072"),GetHashKey("PLAYER"))
					TaskCombatPed(createdped[k], GetPlayerPed(-1), 0, 16)
					SetPedCombatAbility(createdped[k], 100)
					SetPedCombatMovement(createdped[k], 2)
					GiveWeaponToPed_2(createdped[k], npc_weapon, 10, true, true, 1, true, 1.0, 1.0, 1.0, true, 0, 0)
					SetPedAmmo(createdped[k], npc_weapon, 10)
				end
			end

			-----
			-- OUTLAW ONE
			-----
			if type == outlawMenName01ID then
				gangname		= outlawName01
				rewardcontrat 	= "wantedlawmen01"
				wherefindsoluce	= "Il se situe dans la ville de Valentine, d'aprés des témoins il attend un train pour s'enfuir!"
				enableblip		= false

				npcs = {
					{hash = hashe, x = -179.63 , y = 616.83, z = 114.03, true, true, true, true}
				}

				for k,item in pairs(npcs) do
					createdped[k] = CreatePed(item.hash, item.x, item.y, item.z, true, true, true, true)
					Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], false)
					if enableblip then
						Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
					end
					count[k] = (createdped[k])
					SetPedSeeingRange(createdped[k], 100.0)
					SetPedHearingRange(createdped[k], 80.0)
					SetPedCombatAttributes(createdped[k], 46, 1)
					SetPedFleeAttributes(createdped[k], 0, 0)
					SetPedCombatRange(createdped[k],2)
					SetPedRelationshipGroupHash(createdped[k], GetHashKey(0x06C3F072))
					SetRelationshipBetweenGroups(5,GetHashKey("PLAYER"),GetHashKey("0x06C3F072"))
					SetRelationshipBetweenGroups(5,GetHashKey("0x06C3F072"),GetHashKey("PLAYER"))
					TaskCombatPed(createdped[k], GetPlayerPed(-1), 0, 16)
					SetPedCombatAbility(createdped[k], 100)
					SetPedCombatMovement(createdped[k], 2)
					GiveWeaponToPed_2(createdped[k], npc_weapon, 10, true, true, 1, true, 1.0, 1.0, 1.0, true, 0, 0)
					SetPedAmmo(createdped[k], npc_weapon, 10)
				end
			end

			-----
			-- OUTLAW TWO
			-----
			if type == outlawMenName02ID then
				gangname		= outlawName02
				rewardcontrat 	= "wantedlawmen01"
				wherefindsoluce	= "Il a été aperçu proche du Saloon de Valentine, il se cache !"
				enableblip		= false

				npcs = {
					{hash = hashe, x = -332.78 , y = 815.96, z = 117.5, true, true, true, true}
				}

				for k,item in pairs(npcs) do
					createdped[k] = CreatePed(item.hash, item.x, item.y, item.z, true, true, true, true)
					Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], false)
					if enableblip then
						Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
					end
					count[k] = (createdped[k])
					SetPedSeeingRange(createdped[k], 100.0)
					SetPedHearingRange(createdped[k], 80.0)
					SetPedCombatAttributes(createdped[k], 46, 1)
					SetPedFleeAttributes(createdped[k], 0, 0)
					SetPedCombatRange(createdped[k],2)
					SetPedRelationshipGroupHash(createdped[k], GetHashKey(0x06C3F072))
					SetRelationshipBetweenGroups(5,GetHashKey("PLAYER"),GetHashKey("0x06C3F072"))
					SetRelationshipBetweenGroups(5,GetHashKey("0x06C3F072"),GetHashKey("PLAYER"))
					TaskCombatPed(createdped[k], GetPlayerPed(-1), 0, 16)
					SetPedCombatAbility(createdped[k], 100)
					SetPedCombatMovement(createdped[k], 2)
					GiveWeaponToPed_2(createdped[k], npc_weapon, 10, true, true, 1, true, 1.0, 1.0, 1.0, true, 0, 0)
					SetPedAmmo(createdped[k], npc_weapon, 10)
				end
			end

			-----
			-- OUTLAW Tree
			-----
			if type == outlawMenName03ID then
				gangname		= outlawName03
				rewardcontrat 	= "wantedlawmen01"
				wherefindsoluce	= "Il a été aperçu proche de Valentine mais ou ? dieu seul sait !"
				enableblip		= false

				npcs = {
					{hash = hashe, x = -231.06 , y = 796.84, z = 134.89, true, true, true, true}
				}

				for k,item in pairs(npcs) do
					createdped[k] = CreatePed(item.hash, item.x, item.y, item.z, true, true, true, true)
					Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], false)
					if enableblip then
						Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
					end
					count[k] = (createdped[k])
					SetPedSeeingRange(createdped[k], 100.0)
					SetPedHearingRange(createdped[k], 80.0)
					SetPedCombatAttributes(createdped[k], 46, 1)
					SetPedFleeAttributes(createdped[k], 0, 0)
					SetPedCombatRange(createdped[k],2)
					SetPedRelationshipGroupHash(createdped[k], GetHashKey(0x06C3F072))
					SetRelationshipBetweenGroups(5,GetHashKey("PLAYER"),GetHashKey("0x06C3F072"))
					SetRelationshipBetweenGroups(5,GetHashKey("0x06C3F072"),GetHashKey("PLAYER"))
					TaskCombatPed(createdped[k], GetPlayerPed(-1), 0, 16)
					SetPedCombatAbility(createdped[k], 100)
					SetPedCombatMovement(createdped[k], 2)
					GiveWeaponToPed_2(createdped[k], npc_weapon, 10, true, true, 1, true, 1.0, 1.0, 1.0, true, 0, 0)
					SetPedAmmo(createdped[k], npc_weapon, 10)
				end
			end


			TriggerServerEvent('infinity_bountyhunter:started', gangname, wherefindsoluce)
		end

		-----
		-- Function Spawn Mission and Kill !
		-----
		Citizen.CreateThread(function()

				local x = #npcs

				while launch_bounty == true and stopmanual_mission == false do
					Citizen.Wait(0)
			
					for k,v in pairs(createdped) do

						if launch_bounty then

							-- if alive and stopmanual is true alors je delete les npcs ...
							if not IsEntityDead(v) and stopmanual_mission == true then
								DeleteEntity(createdped[k])
								print('deleted NPC')
								stopmanual_mission = true
								TriggerEvent('infinity_bountyhunter:cancel', stopmanual_mission)
							end

							-- Entity is alive and mission is started ?
							if IsEntityDead(v) then
								if count[k] ~= nil then
									x = x - 1
									count[k] = nil
									-- Show infos all npc died and reward !
									if x == 0 and stopmanual_mission == false then
										PlaySoundFrontend("UNAFFORDABLE", "Ledger_Sounds",true,  1);
										TriggerServerEvent('infinity_bountyhunter:fugitifdied', gangname, rewardcontrat)
										Citizen.InvokeNative(0x4AD96EF928BD4F9A, hash)
										launch_bounty = false
										stopmission() -- stop mission
										print("mission finished")
										Wait(4000)
										DeleteEntity(createdped[k]) -- delete request models for performance ;)
									end
									-- Show infos died npc -1
									if x >= 1 and stopmanual_mission == false then
										PlaySoundFrontend("UNAFFORDABLE", "Ledger_Sounds",true,  1);
										TriggerServerEvent('infinity_bountyhunter:onedied', x)
									end
								end
							end
					end -- for
				end -- while
			end -- function Creathread
	end)-- Function Started
end -- function type and launched