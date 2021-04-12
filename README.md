# infinity_bountyhunts
This is my first script and share in github.

Easy System to make hunts gangs and outlaw
Optimised script 0.3ms 

# EASY CONFIGURE your Own ideas
- Enable or Disable Blips
- Set Cash, Exp and Items rewarded
- Set How much npc is spawn, just one or infinite
- Change language file
- Add Soluces for find npc is not show in the map
- Auto remove npc models after cancel, died or playerdied after 6s for performances
- Npcs Randoms and Weapons
- Enables multiples areas hunting in the map

# Demo Movie
https://www.youtube.com/watch?v=FaDqPrvUzZk

# Version
Alpha 1.0

# Bugs
- Mission cancel, the next spawn outlaw is instant finish, i work for this ;)

# Installation
1. Clone this repository.
2. Extract the zip.
3. Put infinity_bountyhunts to your resource folder.
4. Add "ensure infinity_bountyhunts" in your "server.cfg".
5. Enjoy

# Configuration


# 1. Add in your config.lua (redemrp_inventory)

Config.Items = {

    ["wantedlawgang01"] =
    {
        label = "Contrat Wanted du gang des New York Yennes",
        description = "Votre récompense pour avoir décimé un gang entier, retournez voir le sheriff pour obtenir votre dû!",
        weight = 0.01,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/document_bounty_poster.png",
        type = "item_standard",
    },

    ["wantedlawmen01"] =
    {
        label = "Contrat Wanted de Law Men",
        description = "Votre récompense pour avoir éliminé un fugitif recherché, retournez voir le sheriff pour obtenir votre dû!",
        weight = 0.01,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/document_arthur_has_poster_2.png",
        type = "item_standard",
    }
}

# 2. Add in your themes.css in pNotify

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

# Requierements
- redem
- redem_roleplay
- redemrp_inventory
- pNotify (or your own system, adapt the script)

# Owner and scripting
- [Shepard#1395] - https://github.com/ShepXBFR - https://discord.gg/mkTztth
- Warmenu : https://github.com/warxander


# Thanks 
Buy me a Big Beer <3 https://www.paypal.com/pools/c/8nVb126x7u
