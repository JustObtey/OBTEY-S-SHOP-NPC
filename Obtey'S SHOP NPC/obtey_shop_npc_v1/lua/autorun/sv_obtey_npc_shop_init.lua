if SERVER then
    print("\n\n")
    print("/////////////////////")
    print("/   OBTEY'S ADDONS  /")
    print("/   SHOP NPC v1.2   /")
    print("/////////////////////")
    print("\n\n")


    util.AddNetworkString("NotifyError")
    util.AddNetworkString("PLYgive")

    net.Receive("PLYgive", function(len, ply)

        local weapon = net.ReadString()
        local price = net.ReadInt(32)
        local money = ply:getDarkRPVar("money")
    
        // Vérification que le joueur existe
        if IsValid(ply) then
            if ply:IsPlayer() then
            // Vérifier que le joueur a assez d'argent
                if money >= price then
                    
                // Donne l'arme au joueur
                    ply:Give(weapon, false)
                    ply:addMoney(-price)

                else
                // Sinon envoi une notification d'erreur
                    net.Start("NotifyError")
                    net.WriteString("Vous n'avez pas assez d'argent!")
                    net.Send(ply)

                    return false

                end
            end
        end
        
    end) -- fin du net.Receive

end -- fin du if SERVER

if CLIENT then
    print("\n\n")
    print("/////////////////////")
    print("/   OBTEY'S ADDONS  /")
    print("/   SHOP NPC v1.2   /")
    print("/////////////////////")
    print("\n\n")

    AddCSLuaFile("entities/obtey_shop_npc/shared.lua")
end