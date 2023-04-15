if SERVER then

    print("\n\n")
    print("/////////////////////")
    print("/   OBTEY'S ADDONS  /")
    print("/   SHOP NPC v1.1   /")
    print("/////////////////////")
    print("\n\n")


    -- Adding all the network messages
    util.AddNetworkString("NotifyError")
    util.AddNetworkString("PLYgiveEquipment")
    util.AddNetworkString("PLYgiveWeapon")
    util.AddNetworkString("PLYgiveAmmo")
    util.AddNetworkString("PLYgiveVip")


    -- Called when player click on purchased button
    net.Receive("PLYgiveEquipment", function(len, ply)

        -- Getting the table infos to avoid free items exploit
        local ID = net.ReadInt(32)
        local itemData = SHOPConfig.equipement[ID]

        -- Checking if player has enough money and if he already have the item
        local canAfford = ply:canAfford(itemData.Price)
        local hasWeapon = ply:HasWeapon(itemData.cmd)

        -- Stoping the net if he has already the item
        if hasWeapon then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg1)
            return
        end

        -- If player can't afford, print an error message in the chat
        if not canAfford then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg2)
            return
        end

        -- If player have enough money and doesn't already have the item, we are taking the money and giving the item
        ply:addMoney(-itemData.Price)
        ply:Give(itemData.Entity)
        ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseSucceedMsg)
        
    end) -- end of net.Receive


    -- same shit for weapons
    net.Receive("PLYgiveWeapon", function(len, ply)

        local ID = net.ReadInt(32)
        local itemData = SHOPConfig.weapon[ID]

        local canAfford = ply:canAfford(itemData.Price)
        local hasWeapon = ply:HasWeapon(itemData.cmd)

        
        if hasWeapon then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg1)
            return
        end

        if not canAfford then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg2)
        end

        
        ply:addMoney(-itemData.Price)
        ply:Give(itemData.Entity)
        ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseSucceedMsg)
        
    end)
    

    -- same shit for ammos
    net.Receive("PLYgiveAmmo", function(len, ply)

        local ID = net.ReadInt(32)
        local itemData = SHOPConfig.ammo[ID]

        local canAfford = ply:canAfford(itemData.Price)
        local hasWeapon = ply:HasWeapon(itemData.cmd)

        
        if hasWeapon then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg1)
            return
        end

        if not canAfford then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg2)
        end

        
        ply:addMoney(-itemData.Price)
        ply:Give(itemData.Entity)
        ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseSucceedMsg)
        
    end)


    -- same shit for vip's item
    net.Receive("PLYgiveVip", function(len, ply)

        local ID = net.ReadInt(32)
        local itemData = SHOPConfig.vip[ID]

        local canAfford = ply:canAfford(itemData.Price)
        local hasWeapon = ply:HasWeapon(itemData.cmd)

        
        if hasWeapon then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg1)
            return
        end

        if not canAfford then
            ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseFailedMsg2)
        end

        
        ply:addMoney(-itemData.Price)
        ply:Give(itemData.Entity)
        ply:ChatPrint("[SHOP] : " .. SHOPConfig.PurchaseSucceedMsg)
        
    end)

end


if CLIENT then

    print("\n\n")
    print("/////////////////////")
    print("/   OBTEY'S ADDONS  /")
    print("/   SHOP NPC v1.1   /")
    print("/////////////////////")
    print("\n\n")

    AddCSLuaFile("entities/obtey_shop_npc/shared.lua")

end
