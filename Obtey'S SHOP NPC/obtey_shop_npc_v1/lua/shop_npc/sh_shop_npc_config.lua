SHOPConfig = SHOPConfig or {}

SHOPConfig.equipement = {
    {Name = "Petit Kevlar", Model = "models/combine_vests/bluevest.mdl", cmd = "light kevlar armor", Price = 5000},
    {Name = "Moyen Kevlar", Model = "models/combine_vests/prisonvest.mdl", cmd = "medium kevlar armor", Price = 7500},
    {Name = "Lockpick", Model = "models/weapons/w_crowbar.mdl", cmd = "lockpick", Price = 5000},
    {Name = "Keypad Cracker", Model = "models/weapons/w_c4_planted.mdl", cmd = "keypad_cracker", Price = 10000},
    {Name = "Extincteur", Model = "models/weapons/w_fire_extinguisher.mdl", cmd = "weapon_extinguisher", Price = 1000}
}


SHOPConfig.weapon = {
    {Name = "Batte de Baseball", Model = "models/weapons/w_bat.mdl", cmd = "weapon_bat", Price = 1000},
    {Name = "Masse", Model = "models/weapons/w_sledgehammer.mdl", cmd = "weapon_sledgehammer", Price = 1000},
    {Name = "Hache", Model = "models/props/cs_militia/axe.mdl", cmd = "weapon_axe", Price = 3000},
    {Name = "Machette", Model = "models/weapons/w_machete.mdl", cmd = "m9k_machete", Price = 5000},
    {Name = "Couteau", Model = "models/weapons/v_knife_bayonet_inspect.mdl", cmd = "arccw_go_melee_knife", Price = 2500},
    {Name = "Couteau à jeter", Model = "models/weapons/arccw_go/w_eq_throwingknife_thrown.mdl", cmd = "arccw_go_nade_knife", Price = 3000}
}


SHOPConfig.ammo = {
    {Name = "Munition de Pistolet", Model = "models/items/arccw/pistol_ammo.mdl", cmd = "arccw_ammo_pistol", Price = 200},
    {Name = "Munition d'Assaut", Model = "models/items/arccw/rifle_ammo.mdl", cmd = "arccw_ammo_ar2", Price = 500},
    {Name = "Munition de SMG", Model = "models/items/arccw/smg_ammo.mdl", cmd = "arccw_ammo_smg1", Price = 300},
    {Name = "Munition de Pompe", Model = "models/items/arccw/shotgun_ammo.mdl", cmd = "arccw_ammo_buckshot", Price = 600},
    {Name = "Munition .357", Model = "models/items/arccw/magnum_ammo_closed.mdl", cmd = "arccw_ammo_357", Price = 600},
    {Name = "Munition de Sniper", Model = "models/items/arccw/sniper_ammo.mdl", cmd = "arccw_ammo_sniper", Price = 1000}
}


SHOPConfig.vip = {
    {Name = "Grand Kevlar", Model = "models/weapons/w_eq_assault_suit.mdl", cmd = "heavy kevlar armor", Price = 10000},
    {Name = "Katana", Model = "models/weapons/w_katana.mdl", cmd = "weapon_katana", Price = 8000},
    {Name = "Cocktail Molotov", Model = "models/weapons/w_eq_molotov.mdl", cmd = "arccw_go_nade_molotov", Price = 15000},
}


SHOPConfig.VIPGroup = "VIP"
SHOPConfig.VIPErrorMsg = "Vous n'êtes pas VIP!"