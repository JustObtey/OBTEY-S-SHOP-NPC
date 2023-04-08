include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

// Créer le texte qui s'affiche au dessus de la tête du NPC
hook.Add("PostDrawOpaqueRenderables", "Baseframe", function()
    for _, ent in pairs (ents.FindByClass("obtey_shop_npc")) do
        if ent:GetPos():Distance(LocalPlayer():GetPos()) < 500 then
            local Ang = ent:GetAngles()

            Ang:RotateAroundAxis( Ang:Forward(), 90)
            Ang:RotateAroundAxis( Ang:Right(), -90)

            cam.Start3D2D(ent:GetPos()+ent:GetUp()*79, Ang, 0.20)
                draw.SimpleText( 'SHOP', "HUDNumber5", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)
            cam.End3D2D()
        end
    end
end)

// Police d'écriture
surface.CreateFont( "beatle", {
	font = "Roboto",
	extended = false,
	size = 15,
	weight = 50,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont("luco24", {
    font = "lucotecia",
    extended = false,
    size = 24,
})

surface.CreateFont("luco18", {
    font = "lucotecia",
    extended = false,
    size = 18,
})



local function Baseframe()



// Frame de base
    local Baseframe = vgui.Create("DFrame")
        Baseframe:SetSize(ScrW()/2, ScrH()/1.5)
        Baseframe:Center()
        Baseframe:MakePopup()
        Baseframe:SetTitle("")
        Baseframe:SetVisible(true)
        Baseframe:SetDraggable(false)
        Baseframe:ShowCloseButton(false)
        Baseframe.Paint = function(self, w, h)
            draw.RoundedBox(5, 0, 0, w, h, Color(15, 15, 15, 200))
        end

// Récuperer les dimensions de la frame
    local x, y = Baseframe:GetSize(x, y)


 -- -- -- -- Header -- -- -- --


// Création du Header de la frame
    local header = vgui.Create("DPanel", Baseframe)
        header:SetSize(x, 30)
        header:SetPos(0, 0)
        header.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

// Création du bouton "Braquage"
    local rob = vgui.Create("DButton", header)
        rob:Dock(LEFT)
        rob:DockMargin(5, 5, 5, 5)
        rob:SetSize(75, y)
        rob:SetFont("luco18")
        rob:SetColor(Color(255, 255, 255))
        rob:SetText("Braquage")
        rob.Paint = function(self, w, h)
            surface.SetDrawColor(255, 50, 50, 155)
            surface.DrawRect(0, 0, w, h)
        end

// Création du bouton "Close"
    local Closebutton = vgui.Create("DImageButton", header)
        Closebutton:SetPos(x-29, 3)
        Closebutton:SetSize(26, 26)
        Closebutton:SetImage("materials/assets/wx.png")
        Closebutton.DoClick = function()
            Baseframe:Close()
        end
        


-- -- -- -- Menu de Nav -- -- -- --


// Création du menu
    local menu = vgui.Create("DPanel", Baseframe)
        menu:SetPos(0, 30)
        menu:SetSize(x, 30)
        menu.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end


// Création de la box du bouton "équipement"
    local boxequipement = vgui.Create("DPanel", menu)
        boxequipement:SetPos(0, 0)
        boxequipement:SetSize(x/4, 30)
        boxequipement.Paint = function(self, w, h)
            surface.SetDrawColor(255, 0, 0)
            surface.DrawRect(0, 0, w , h)
        end

// Création du bouton "équipement"
    local equipement = vgui.Create("DButton", boxequipement)
        equipement:SetPos(5, 0)
        equipement:SetSize(x/4, 30)
        equipement:SetFont("luco18")
        equipement:SetTextColor(Color(255, 255, 255))
        equipement:SetText("Équipements")
        equipement.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end


// Création de la box du bouton "Arme"
    local boxweapon = vgui.Create("DPanel", menu)
        boxweapon:SetPos(x/4, 0)
        boxweapon:SetSize(x/4, 30)
        boxweapon.Paint = function(self, w, h)
            surface.SetDrawColor(0, 4, 255)
            surface.DrawRect(0, 0, w, h)
        end

// Création du bouton "Arme"
    local weapon = vgui.Create("DButton", boxweapon)
        weapon:SetPos(5, 0)
        weapon:SetSize(x/4, 30)
        weapon:SetFont("luco18")
        weapon:SetTextColor(Color(255, 255, 255))
        weapon:SetText("Armes")
        weapon.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end


// Création de la box du bouton "munition"
    local boxammo = vgui.Create("DPanel", menu)
        boxammo:SetPos(x/2, 0)
        boxammo:SetSize(x/4, 30)
        boxammo.Paint = function(self, w, h)
            surface.SetDrawColor(0, 255, 0)
            surface.DrawRect(0, 0, w, h)
        end

// Création du bouton "munition"
    local ammo = vgui.Create("DButton", boxammo)
        ammo:SetPos(5, 0)
        ammo:SetSize(x/4, 30)
        ammo:SetFont("luco18")
        ammo:SetTextColor(Color(255, 255, 255))
        ammo:SetText("Munitions")
        ammo.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end


// Création de la box du bouton "VIP"
    local boxvip = vgui.Create("DPanel", menu)
        boxvip:SetPos(x-x/4, 0)
        boxvip:SetSize(x/4, 30)
        boxvip.Paint = function(self, w, h)
            surface.SetDrawColor(251, 255, 0)
            surface.DrawRect(0, 0, w, h)
        end

// Création du bouton "VIP"
    local vip = vgui.Create("DButton", boxvip)
        vip:SetPos(5, 0)
        vip:SetSize(x/4, 30)
        vip:SetFont("luco18")
        vip:SetTextColor(Color(255, 255, 255))
        vip:SetText("VIP")
        vip.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end


-- -- -- -- Pages du shop -- -- -- --

// Création du parent
    local shoppage = vgui.Create("DPanel", Baseframe)
        shoppage:SetPos(0, 60)
        shoppage:SetSize(x, y-60)
        shoppage.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 0)
            surface.DrawRect(0, 0, w, h)
        end

// Création page équipement
    local pageequipement = vgui.Create("DScrollPanel", shoppage)
        pageequipement:SetPos(0, 0)
        pageequipement:SetSize(x, y-60)
        pageequipement:SetVisible(true)
        pageequipement.Paint = function(self, w, h)
               surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

// Création page arme
    local pageweapon = vgui.Create("DScrollPanel", shoppage)
        pageweapon:SetPos(0, 0)
        pageweapon:SetSize(x, y-60)
        pageweapon:SetVisible(false)
        pageweapon.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

// Création page munition
    local pageammo = vgui.Create("DScrollPanel", shoppage)
        pageammo:SetPos(0, 0)
        pageammo:SetSize(x, y-60)
        pageammo:SetVisible(false)
        pageammo.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

// Création page vip
    local pagevip = vgui.Create("DScrollPanel", shoppage)
        pagevip:SetPos(0, 0)
        pagevip:SetSize(x, y-60)
        pagevip:SetVisible(false)
        pagevip.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end


-- -- -- -- Fonction des boutons -- -- -- --


// Fonction du bouton "équipement"
    function equipement:DoClick()

        pageequipement:SetVisible(true)
        pageweapon:SetVisible(false)
        pageammo:SetVisible(false)
        pagevip:SetVisible(false)

    end

// Fonction du bouton "Armes"
    function weapon:DoClick()
        
        pageequipement:SetVisible(false)
        pageweapon:SetVisible(true)
        pageammo:SetVisible(false)
        pagevip:SetVisible(false)

    end

// Fonction du bouton "Munition"
    function ammo:DoClick()
        
        pageequipement:SetVisible(false)
        pageweapon:SetVisible(false)
        pageammo:SetVisible(true)
        pagevip:SetVisible(false)

    end

// Fonction du bouton "VIP"
    function vip:DoClick()
        
        pageequipement:SetVisible(false)
        pageweapon:SetVisible(false)
        pageammo:SetVisible(false)
        pagevip:SetVisible(true)

    end


    local buybutton -- ne pas toucher



-- -- -- -- Afficher les équipements -- -- -- --

for k, v in pairs(SHOPConfig.equipement) do

    // Créer le rectangle d'une arme
        local weaponback = vgui.Create("DPanel", pageequipement)
            weaponback:Dock(TOP)
            weaponback:SetSize(0, 125)
            weaponback:DockMargin(5, 5, 5, 5)
            weaponback.Paint = function(self, w, h)
                surface.SetDrawColor(25, 25, 25, 150)
                surface.DrawRect(0, 0, w, h)
            end

    wX, wY = weaponback:GetSize(x, y)
    
    // Créer le model de l'arme
        local models = vgui.Create("SpawnIcon", weaponback)
            models:SetPos(5, 5)
            models:SetSize(x/8, 115)
            models:SetModel(v.Model)
            models:SetToolTip(false)
            models:SetDisabled(true)
            function models:PaintOver()
   
            end


    // Créer le texte de l'arme et son prix
        local name = vgui.Create("DLabel", weaponback)
            name:SetPos(x/2.2, wY/3)
            name:SetSize(200, 50)
            name:SetFont("luco24")
            name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))

        
    // Créer le bouton d'achat
        local buybutton = vgui.Create("DButton", weaponback)
            buybutton:Dock(RIGHT)
            buybutton:DockMargin(5, 10, 10, 10)
            buybutton:SetSize(x/9)
            buybutton:SetColor(Color(255, 255, 255))
            buybutton:SetText("Acheter")
            buybutton.Paint = function(self, w, h)
                surface.SetDrawColor(128, 35, 35, 200)
                surface.DrawRect(0, 0, w, h)
            end


    -- Définir un cooldown pour limiter la fréquence des messages
        local lastNetTime = 0
        local netCooldown = 2 -- en secondes

    -- Fonction d'achat de l'objet avec la protection anti-spam
        function buybutton:DoClick()
        -- Récupérer l'heure actuelle
            local currentTime = CurTime()

        -- Vérifier si le temps écoulé depuis le dernier envoi de message est supérieur ou égal au temps de cooldown
            if (currentTime - lastNetTime) >= netCooldown then
            -- Envoyer le message seulement si le cooldown a expiré
                net.Start("PLYgive")
                net.WriteString(v.cmd)
                net.WriteInt(v.Price, 32)
                net.SendToServer()

            -- Mettre à jour le temps du dernier envoi de message
                lastNetTime = currentTime
            end
        end

    // Notification d'erreur
        net.Receive("NotifyError", function(len, ply)
        
           local errormsg = net.ReadString()

           notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
           surface.PlaySound("buttons/button10.wav")

        end)
        

    end -- fin de la boucle




-- -- -- -- Afficher les armes -- -- -- --



    for k, v in pairs(SHOPConfig.weapon) do

    // Créer le rectangle d'une arme
        local weaponback = vgui.Create("DPanel", pageweapon)
            weaponback:Dock(TOP)
            weaponback:SetSize(0, 125)
            weaponback:DockMargin(5, 5, 5, 5)
            weaponback.Paint = function(self, w, h)
                surface.SetDrawColor(25, 25, 25, 150)
                surface.DrawRect(0, 0, w, h)
            end

    wX, wY = weaponback:GetSize(x, y)
    
    // Créer le model de l'arme
        local models = vgui.Create("SpawnIcon", weaponback)
            models:SetPos(5, 5)
            models:SetSize(x/8, 115)
            models:SetModel(v.Model)
            models:SetToolTip(false)
            models:SetDisabled(true)
            function models:PaintOver()
   
            end


    // Créer le texte de l'arme et son prix
        local name = vgui.Create("DLabel", weaponback)
            name:SetPos(x/2.2, wY/3)
            name:SetSize(200, 50)
            name:SetFont("luco24")
            name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))

        
    // Créer le bouton d'achat
        local buybutton = vgui.Create("DButton", weaponback)
            buybutton:Dock(RIGHT)
            buybutton:DockMargin(5, 10, 10, 10)
            buybutton:SetSize(x/9)
            buybutton:SetColor(Color(255, 255, 255))
            buybutton:SetText("Acheter")
            buybutton.Paint = function(self, w, h)
                surface.SetDrawColor(128, 35, 35, 200)
                surface.DrawRect(0, 0, w, h)
            end


   -- Définir un cooldown pour limiter la fréquence des messages
        local lastNetTime = 0
        local netCooldown = 2 -- en secondes

    -- Fonction d'achat de l'objet avec la protection anti-spam
        function buybutton:DoClick()
        -- Récupérer l'heure actuelle
            local currentTime = CurTime()

        -- Vérifier si le temps écoulé depuis le dernier envoi de message est supérieur ou égal au temps de cooldown
            if (currentTime - lastNetTime) >= netCooldown then
            -- Envoyer le message seulement si le cooldown a expiré
                net.Start("PLYgive")
                net.WriteString(v.cmd)
                net.WriteInt(v.Price, 32)
                net.SendToServer()

            -- Mettre à jour le temps du dernier envoi de message
                lastNetTime = currentTime
            end
        end


    // Notification d'erreur
        net.Receive("NotifyError", function(len, ply)
        
           local errormsg = net.ReadString()

           notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
           surface.PlaySound("buttons/button10.wav")

        end)
        

    end -- fin de la boucle



    -- -- -- -- Afficher les munitions -- -- -- --

    for k, v in pairs(SHOPConfig.ammo) do

        // Créer le rectangle d'une arme
            local weaponback = vgui.Create("DPanel", pageammo)
                weaponback:Dock(TOP)
                weaponback:SetSize(0, 125)
                weaponback:DockMargin(5, 5, 5, 5)
                weaponback.Paint = function(self, w, h)
                    surface.SetDrawColor(25, 25, 25, 150)
                    surface.DrawRect(0, 0, w, h)
                end
    
        wX, wY = weaponback:GetSize(x, y)
        
        // Créer le model de l'arme
            local models = vgui.Create("SpawnIcon", weaponback)
                models:SetPos(0, 0)
                models:SetSize(x/8, 115)
                models:SetModel(v.Model)
                models:SetToolTip(false)
                models:SetDisabled(true)
                function models:PaintOver()
       
                end
    
    
        // Créer le texte de l'arme et son prix
            local name = vgui.Create("DLabel", weaponback)
                name:SetPos(x/2.2, wY/3)
                name:SetSize(200, 50)
                name:SetFont("luco24")
                name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))
    
            
        // Créer le bouton d'achat
            local buybutton = vgui.Create("DButton", weaponback)
                buybutton:Dock(RIGHT)
                buybutton:DockMargin(5, 10, 10, 10)
                buybutton:SetSize(x/9)
                buybutton:SetColor(Color(255, 255, 255))
                buybutton:SetText("Acheter")
                buybutton.Paint = function(self, w, h)
                    surface.SetDrawColor(128, 35, 35, 200)
                    surface.DrawRect(0, 0, w, h)
                end
    
    
-- Définir un cooldown pour limiter la fréquence des messages
        local lastNetTime = 0
        local netCooldown = 1 -- en secondes

-- Fonction d'achat de l'objet avec la protection anti-spam
        function buybutton:DoClick()
    
    -- Récupérer l'heure actuelle
        local currentTime = CurTime()

    -- Vérifier si le temps écoulé depuis le dernier envoi de message est supérieur ou égal au temps de cooldown
        if (currentTime - lastNetTime) >= netCooldown then

        -- Envoyer le message seulement si le cooldown a expiré
            net.Start("PLYgive")
            net.WriteString(v.cmd)
            net.WriteInt(v.Price, 32)
            net.SendToServer()

        -- Mettre à jour le temps du dernier envoi de message
            lastNetTime = currentTime
        end
    end
    
        // Notification d'erreur
            net.Receive("NotifyError", function(len, ply)
            
               local errormsg = net.ReadString()
    
               notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
               surface.PlaySound("buttons/button10.wav")
    
            end)
            
    
        end -- fin de la boucle



    -- -- -- -- Afficher le menu VIP -- -- -- --

    for k, v in pairs(SHOPConfig.vip) do

        // Créer le rectangle d'une arme
            local weaponback = vgui.Create("DPanel", pagevip)
                weaponback:Dock(TOP)
                weaponback:SetSize(0, 125)
                weaponback:DockMargin(5, 5, 5, 5)
                weaponback.Paint = function(self, w, h)
                    surface.SetDrawColor(25, 25, 25, 150)
                    surface.DrawRect(0, 0, w, h)
                end
    
        wX, wY = weaponback:GetSize(x, y)
        
        // Créer le model de l'arme
            local models = vgui.Create("SpawnIcon", weaponback)
                models:SetPos(0, 0)
                models:SetSize(x/8, 115)
                models:SetModel(v.Model)
                models:SetToolTip(false)
                models:SetDisabled(true)
                function models:PaintOver()
       
                end
    
    
        // Créer le texte de l'arme et son prix
            local name = vgui.Create("DLabel", weaponback)
                name:SetPos(x/2.2, wY/3)
                name:SetSize(200, 50)
                name:SetFont("luco24")
                name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))
    
            
        // Créer le bouton d'achat
            local buybutton = vgui.Create("DButton", weaponback)
                buybutton:Dock(RIGHT)
                buybutton:DockMargin(5, 10, 10, 10)
                buybutton:SetSize(x/9)
                buybutton:SetColor(Color(255, 255, 255))
                buybutton:SetText("Acheter")
                buybutton.Paint = function(self, w, h)
                    surface.SetDrawColor(128, 35, 35, 200)
                    surface.DrawRect(0, 0, w, h)
                end
    


-- Définir un cooldown pour limiter la fréquence des messages
        local lastNetTime = 0
        local netCooldown = 1 -- en secondes

-- Fonction d'achat de l'objet avec la protection anti-spam
        function buybutton:DoClick()
    
    -- Récupérer l'heure actuelle
        local currentTime = CurTime()

    -- Vérifier si le temps écoulé depuis le dernier envoi de message est supérieur ou égal au temps de cooldown
        if (currentTime - lastNetTime) >= netCooldown then

        -- Envoyer le message seulement si le cooldown a expiré puis vérifier si le joueur est vip
            if LocalPlayer():IsUserGroup(SHOPConfig.VIPGroup) then
                        
                net.Start("PLYgive")

                net.WriteString(v.cmd)
                net.WriteInt(v.Price, 32)

                net.SendToServer()

            else

                notification.AddLegacy(SHOPConfig.VIPErrorMsg, NOTIFY_ERROR, 3)
                surface.PlaySound("buttons/button10.wav")
                
            end

        -- Mettre à jour le temps du dernier envoi de message
            lastNetTime = currentTime
        end
    end

        // Fonction d'achat de l'objet
            function buybutton:DoClick()
                if LocalPlayer():IsUserGroup(SHOPConfig.VIPGroup) then
                    
                    net.Start("PLYgive")
        
                    net.WriteString(v.cmd)
                    net.WriteInt(v.Price, 32)
        
                    net.SendToServer()

                else

                    notification.AddLegacy(SHOPConfig.VIPErrorMsg, NOTIFY_ERROR, 3)
                    surface.PlaySound("buttons/button10.wav")
                    
                end
            end
    
        // Notification d'erreur
            net.Receive("NotifyError", function(len, ply)
            
               local errormsg = net.ReadString()
    
               notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
               surface.PlaySound("buttons/button10.wav")
    
            end)
            
    
        end -- fin de la boucle

    


   -- Définir un cooldown pour limiter la fréquence des messages
        local lastNetTime = 0
        local netCooldown = 2 -- en secondes

    -- Fonction d'achat de l'objet avec la protection anti-spam
        function rob:DoClick()
        -- Récupérer l'heure actuelle
            local currentTime = CurTime()

        -- Vérifier si le temps écoulé depuis le dernier envoi de message est supérieur ou égal au temps de cooldown
            if (currentTime - lastNetTime) >= netCooldown then
            -- Envoyer le message seulement si le cooldown a expiré
                notification.AddLegacy("Fonction disponible dans la prochaine mise à jour!", NOTIFY_GENERIC, 5)
                surface.PlaySound("buttons/button16.wav")

            -- Mettre à jour le temps du dernier envoi de message
                lastNetTime = currentTime
            end
        end
    

end // ne rien mettre après cette ligne


net.Receive("Baseframe", Baseframe) 