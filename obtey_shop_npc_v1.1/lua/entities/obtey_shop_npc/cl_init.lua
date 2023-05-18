include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

if SHOPConfig.NPCDisplayText then
    -- Create the text that appears above the NPC's
    hook.Add("PostDrawOpaqueRenderables", "Baseframe", function()
        for _, ent in pairs (ents.FindByClass("obtey_shop_npc")) do
            if ent:GetPos():Distance(LocalPlayer():GetPos()) < 500 then
                local Ang = ent:GetAngles()

                Ang:RotateAroundAxis( Ang:Forward(), 90)
                Ang:RotateAroundAxis( Ang:Right(), -90)

                cam.Start3D2D(ent:GetPos()+ent:GetUp()*79, Ang, 0.20)
                    draw.SimpleText( SHOPConfig.NPCText, "HUDNumber5", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                cam.End3D2D()
            end
        end
    end)
end

-- initialization of the fonts
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


    -- Base frame
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

    -- Getting the frame dimensions
    local x, y = Baseframe:GetSize(x, y)


 -- -- -- -- Header -- -- -- --


    -- Creation of the header
    local header = vgui.Create("DPanel", Baseframe)
        header:SetSize(x, 30)
        header:SetPos(0, 0)
        header.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "rob" button
    local rob = vgui.Create("DButton", header)
        rob:Dock(LEFT)
        rob:DockMargin(5, 5, 5, 5)
        rob:SetSize(75, y)
        rob:SetFont("luco18")
        rob:SetColor(Color(255, 255, 255))
        rob:SetText(SHOPConfig.RobButtonText)
        rob.Paint = function(self, w, h)
            surface.SetDrawColor(255, 50, 50, 155)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "Close" button
    local Closebutton = vgui.Create("DImageButton", header)
        Closebutton:SetPos(x-29, 3)
        Closebutton:SetSize(26, 26)
        Closebutton:SetImage("materials/assets/wx.png")
        Closebutton.DoClick = function()
            Baseframe:Close()
        end
        

-- -- -- -- Nav menu -- -- -- --


    -- Creation of the menu
    local menu = vgui.Create("DPanel", Baseframe)
        menu:SetPos(0, 30)
        menu:SetSize(x, 30)
        menu.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "équipement" button box
    local boxequipement = vgui.Create("DPanel", menu)
        boxequipement:SetPos(0, 0)
        boxequipement:SetSize(x/4, 30)
        boxequipement.Paint = function(self, w, h)
            surface.SetDrawColor(255, 0, 0)
            surface.DrawRect(0, 0, w , h)
        end

    -- Creation of the "Equipment" button
    local equipement = vgui.Create("DButton", boxequipement)
        equipement:SetPos(5, 0)
        equipement:SetSize(x/4, 30)
        equipement:SetFont("luco18")
        equipement:SetTextColor(Color(255, 255, 255))
        equipement:SetText("Equipment")
        equipement.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "weapon" button box
    local boxweapon = vgui.Create("DPanel", menu)
        boxweapon:SetPos(x/4, 0)
        boxweapon:SetSize(x/4, 30)
        boxweapon.Paint = function(self, w, h)
            surface.SetDrawColor(0, 4, 255)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "Weapon" button
    local weapon = vgui.Create("DButton", boxweapon)
        weapon:SetPos(5, 0)
        weapon:SetSize(x/4, 30)
        weapon:SetFont("luco18")
        weapon:SetTextColor(Color(255, 255, 255))
        weapon:SetText("Weapon")
        weapon.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "Ammo" button box
    local boxammo = vgui.Create("DPanel", menu)
        boxammo:SetPos(x/2, 0)
        boxammo:SetSize(x/4, 30)
        boxammo.Paint = function(self, w, h)
            surface.SetDrawColor(0, 255, 0)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "Ammo" button
    local ammo = vgui.Create("DButton", boxammo)
        ammo:SetPos(5, 0)
        ammo:SetSize(x/4, 30)
        ammo:SetFont("luco18")
        ammo:SetTextColor(Color(255, 255, 255))
        ammo:SetText("Ammo")
        ammo.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "VIP" button box
    local boxvip = vgui.Create("DPanel", menu)
        boxvip:SetPos(x-x/4, 0)
        boxvip:SetSize(x/4, 30)
        boxvip.Paint = function(self, w, h)
            surface.SetDrawColor(251, 255, 0)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "VIP" button
    local vip = vgui.Create("DButton", boxvip)
        vip:SetPos(5, 0)
        vip:SetSize(x/4, 30)
        vip:SetFont("luco18")
        vip:SetTextColor(Color(255, 255, 255))
        vip:SetText(SHOPConfig.VIPGroup)
        vip.Paint = function(self, w, h)
            surface.SetDrawColor(49, 49, 49)
            surface.DrawRect(0, 0, w, h)
        end


-- -- -- -- SHOP Pages -- -- -- --


    -- Create the parent
    local shoppage = vgui.Create("DPanel", Baseframe)
        shoppage:SetPos(0, 60)
        shoppage:SetSize(x, y-60)
        shoppage.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 0)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "Equipment" page
    local pageequipement = vgui.Create("DScrollPanel", shoppage)
        pageequipement:SetPos(0, 0)
        pageequipement:SetSize(x, y-60)
        pageequipement:SetVisible(true)
        pageequipement.Paint = function(self, w, h)
               surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "Weapon" page
    local pageweapon = vgui.Create("DScrollPanel", shoppage)
        pageweapon:SetPos(0, 0)
        pageweapon:SetSize(x, y-60)
        pageweapon:SetVisible(false)
        pageweapon.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "Ammo" page
    local pageammo = vgui.Create("DScrollPanel", shoppage)
        pageammo:SetPos(0, 0)
        pageammo:SetSize(x, y-60)
        pageammo:SetVisible(false)
        pageammo.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end

    -- Creation of the "VIP" page
    local pagevip = vgui.Create("DScrollPanel", shoppage)
        pagevip:SetPos(0, 0)
        pagevip:SetSize(x, y-60)
        pagevip:SetVisible(false)
        pagevip.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 15)
            surface.DrawRect(0, 0, w, h)
        end


-- -- -- -- All buttons function (i'm not stupid) -- -- -- --


    -- "Equipment" button function
    function equipement:DoClick()
		
        pageequipement:SetVisible(true)		-- Wait, this actually work ?!
        pageweapon:SetVisible(false)
        pageammo:SetVisible(false)
        pagevip:SetVisible(false)

    end

    -- "Weapon" button function
    function weapon:DoClick()
        
        pageequipement:SetVisible(false)
        pageweapon:SetVisible(true)
        pageammo:SetVisible(false)
        pagevip:SetVisible(false)

    end

    -- "Ammo" button function
    function ammo:DoClick()
        
        pageequipement:SetVisible(false)
        pageweapon:SetVisible(false)
        pageammo:SetVisible(true)
        pagevip:SetVisible(false)

    end

    -- "VIP" button function
    function vip:DoClick()
        
        pageequipement:SetVisible(false)
        pageweapon:SetVisible(false)
        pageammo:SetVisible(false)
        pagevip:SetVisible(true)

    end


    local buybutton -- DO NOT REMOVE ! (I don't know why but all this shit doesn't work without this)


-- -- -- -- Show Equipments -- -- -- --

    for k, v in pairs(SHOPConfig.equipement) do

        -- Create the rect of the object
        local weaponback = vgui.Create("DPanel", pageequipement)
            weaponback:Dock(TOP)
            weaponback:SetSize(0, 125)
            weaponback:DockMargin(5, 5, 5, 5)
            weaponback.Paint = function(self, w, h)
                surface.SetDrawColor(25, 25, 25, 150)
                surface.DrawRect(0, 0, w, h)
            end

        wX, wY = weaponback:GetSize(x, y)
    
        -- Create the model of the object
        local models = vgui.Create("SpawnIcon", weaponback)
            models:SetPos(5, 5)
            models:SetSize(x/8, 115)
            models:SetModel(v.Model or "models/error.mdl")
            models:SetToolTip(false)
            models:SetDisabled(true)
            function models:PaintOver() end

        -- Show the object name and price
        local name = vgui.Create("DLabel", weaponback)
            name:SetPos(x/2.2, wY/3)
            name:SetSize(200, 50)
            name:SetFont("luco24")
            name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))

        -- Create the "Buy" button
        local buybutton = vgui.Create("DButton", weaponback)
            buybutton:Dock(RIGHT)
            buybutton:DockMargin(5, 10, 10, 10)
            buybutton:SetSize(x/9)
            buybutton:SetColor(Color(255, 255, 255))
            buybutton:SetText(SHOPConfig.BuyButtonText)
            buybutton.Paint = function(self, w, h)
                surface.SetDrawColor(128, 35, 35, 200)
                surface.DrawRect(0, 0, w, h)
            end


        -- All this stuff is to init a cooldown to avoid network and notification spamming
        local lastNetTime = 0
        local netCooldown = 2 -- cooldown in seconds

        -- "Buy" button function
        function buybutton:DoClick()

            -- Getting actual time
            local currentTime = CurTime()

            -- Check if the time elapsed since the last message sent is greater than or equal to the cooldown time
            if (currentTime - lastNetTime) >= netCooldown then

                -- Send the message only if the cooldown is down
                net.Start("PLYgiveEquipment")
                net.WriteInt(k, 32)
                net.SendToServer()

                -- Update the time of the last message sent
                lastNetTime = currentTime
            end
        end -- end of "buybutton" function

        -- Error notification
        net.Receive("NotifyError", function(len, ply)
        
           local errormsg = net.ReadString()

           notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
           surface.PlaySound("buttons/button10.wav")

        end)
        

    end -- end of the "Show Equipment" loop


-- -- -- -- Show Weapons -- -- -- --


    for k, v in pairs(SHOPConfig.weapon) do

        local weaponback = vgui.Create("DPanel", pageweapon)
            weaponback:Dock(TOP)
            weaponback:SetSize(0, 125)
            weaponback:DockMargin(5, 5, 5, 5)
            weaponback.Paint = function(self, w, h)
                surface.SetDrawColor(25, 25, 25, 150)
                surface.DrawRect(0, 0, w, h)
            end

        wX, wY = weaponback:GetSize(x, y)
    
        local models = vgui.Create("SpawnIcon", weaponback)
            models:SetPos(5, 5)
            models:SetSize(x/8, 115)
            models:SetModel(v.Model or "models/error.mdl")
            models:SetToolTip(false)
            models:SetDisabled(true)
            function models:PaintOver() end

        local name = vgui.Create("DLabel", weaponback)
            name:SetPos(x/2.2, wY/3)
            name:SetSize(200, 50)
            name:SetFont("luco24")
            name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))
        
        local buybutton = vgui.Create("DButton", weaponback)
            buybutton:Dock(RIGHT)
            buybutton:DockMargin(5, 10, 10, 10)
            buybutton:SetSize(x/9)
            buybutton:SetColor(Color(255, 255, 255))
            buybutton:SetText(SHOPConfig.BuyButtonText)
            buybutton.Paint = function(self, w, h)
                surface.SetDrawColor(128, 35, 35, 200)
                surface.DrawRect(0, 0, w, h)
            end


        local lastNetTime = 0
        local netCooldown = 2

        function buybutton:DoClick()
			
            local currentTime = CurTime()

            if (currentTime - lastNetTime) >= netCooldown then
				
                net.Start("PLYgiveWeapon")
                net.WriteInt(k, 32)
                net.SendToServer()

                lastNetTime = currentTime
            end
        end


        net.Receive("NotifyError", function(len, ply)
        
           local errormsg = net.ReadString()

           notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
           surface.PlaySound("buttons/button10.wav")

        end)
        

    end



    -- -- -- -- Show Ammos -- -- -- --

    for k, v in pairs(SHOPConfig.ammo) do

        local weaponback = vgui.Create("DPanel", pageammo)
            weaponback:Dock(TOP)
            weaponback:SetSize(0, 125)
            weaponback:DockMargin(5, 5, 5, 5)
            weaponback.Paint = function(self, w, h)
                surface.SetDrawColor(25, 25, 25, 150)
                surface.DrawRect(0, 0, w, h)
            end
    
        wX, wY = weaponback:GetSize(x, y)
        
        local models = vgui.Create("SpawnIcon", weaponback)
            models:SetPos(0, 0)
            models:SetSize(x/8, 115)
            models:SetModel(v.Model or "models/error.mdl")
            models:SetToolTip(false)
            models:SetDisabled(true)
            function models:PaintOver() end

        local name = vgui.Create("DLabel", weaponback)
            name:SetPos(x/2.2, wY/3)
            name:SetSize(200, 50)
            name:SetFont("luco24")
            name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))
        
        local buybutton = vgui.Create("DButton", weaponback)
            buybutton:Dock(RIGHT)
            buybutton:DockMargin(5, 10, 10, 10)
            buybutton:SetSize(x/9)
            buybutton:SetColor(Color(255, 255, 255))
            buybutton:SetText(SHOPConfig.BuyButtonText)
            buybutton.Paint = function(self, w, h)
                surface.SetDrawColor(128, 35, 35, 200)
                surface.DrawRect(0, 0, w, h)
            end
    
    
        local lastNetTime = 0
        local netCooldown = 1

        function buybutton:DoClick()
    
            local currentTime = CurTime()

            if (currentTime - lastNetTime) >= netCooldown then

                net.Start("PLYgiveAmmo")
                net.WriteInt(k, 32)
                net.SendToServer()

                lastNetTime = currentTime
            end
        end
    

        net.Receive("NotifyError", function(len, ply)
        
            local errormsg = net.ReadString()

            notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
            surface.PlaySound("buttons/button10.wav")

        end)
            
    
    end


    -- -- -- -- Show VIPs Menu -- -- -- --


    for k, v in pairs(SHOPConfig.vip) do

        local weaponback = vgui.Create("DPanel", pagevip)
            weaponback:Dock(TOP)
            weaponback:SetSize(0, 125)
            weaponback:DockMargin(5, 5, 5, 5)
            weaponback.Paint = function(self, w, h)
                surface.SetDrawColor(25, 25, 25, 150)
                surface.DrawRect(0, 0, w, h)
            end
    
        wX, wY = weaponback:GetSize(x, y)
        
        local models = vgui.Create("SpawnIcon", weaponback)
            models:SetPos(0, 0)
            models:SetSize(x/8, 115)
            models:SetModel(v.Model or "models/error.mdl")
            models:SetToolTip(false)
            models:SetDisabled(true)
            function models:PaintOver() end

        local name = vgui.Create("DLabel", weaponback)
            name:SetPos(x/2.2, wY/3)
            name:SetSize(200, 50)
            name:SetFont("luco24")
            name:SetText(v.Name .. "\n" .. DarkRP.formatMoney(v.Price))
        
        local buybutton = vgui.Create("DButton", weaponback)
            buybutton:Dock(RIGHT)
            buybutton:DockMargin(5, 10, 10, 10)
            buybutton:SetSize(x/9)
            buybutton:SetColor(Color(255, 255, 255))
            buybutton:SetText(SHOPConfig.BuyButtonText)
            buybutton.Paint = function(self, w, h)
                surface.SetDrawColor(128, 35, 35, 200)
                surface.DrawRect(0, 0, w, h)
            end
    

        local lastNetTime = 0
        local netCooldown = 1

        function buybutton:DoClick()
    
            local currentTime = CurTime()

            if (currentTime - lastNetTime) >= netCooldown then

                if LocalPlayer():IsUserGroup(SHOPConfig.VIPGroup) then
                            
                    net.Start("PLYgiveVip")
                    net.WriteInt(k, 32)
                    net.SendToServer()

                else

                    notification.AddLegacy(SHOPConfig.VIPErrorMsg, NOTIFY_ERROR, 3)
                    surface.PlaySound("buttons/button10.wav")
                    
                end

                lastNetTime = currentTime
            end
        end

    
        net.Receive("NotifyError", function(len, ply)
        
            local errormsg = net.ReadString()

            notification.AddLegacy(errormsg, NOTIFY_ERROR, 3)
            surface.PlaySound("buttons/button10.wav")

        end)
            
    
    end

    

    -- "Rob" button function
    local lastNetTime = 0
    local netCooldown = 2

    function rob:DoClick()
    
        local currentTime = CurTime()

        if (currentTime - lastNetTime) >= netCooldown then
        
            notification.AddLegacy("This features is not available for the moment", NOTIFY_GENERIC, 5)
            surface.PlaySound("buttons/button16.wav")

            lastNetTime = currentTime
        end
    end
    

end -- Do not put anything after this line exept if you know what you are doing


net.Receive("OBTEYSHOPBaseframe", Baseframe) 
