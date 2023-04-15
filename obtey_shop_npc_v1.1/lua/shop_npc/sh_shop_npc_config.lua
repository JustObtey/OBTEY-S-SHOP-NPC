SHOPConfig = SHOPConfig or {} -- DO NOT TOUCH THIS


SHOPConfig.NPCDisplayText = true                -- Set if yes or no SHOPConfig.NPCText should be displayed on top of the npc head
SHOPConfig.NPCText = "SHOP"                     -- Text to display on top of the npc head
SHOPConfig.NPCModel = "models/mossman.mdl"      -- Define the model of the npc


SHOPConfig.equipement = {
    -- {Name = "Object name", Model = "His model", Entity = "His ID", Price = 100},
}


SHOPConfig.weapon = {
    -- {Name = "Object name", Model = "His model", Entity = "His ID", Price = 100},
}


SHOPConfig.ammo = {
    -- {Name = "Object name", Model = "His model", Entity = "His ID", Price = 100}, 
}


SHOPConfig.vip = {
    -- {Name = "Object name", Model = "His model", Entity = "His ID", Price = 100},
}


SHOPConfig.RobButtonText = "rob"                                                  -- The text to display inside of the "Rob" button

SHOPConfig.BuyButtonText = "Buy"                                                            -- The text to display inside of the "Buy" button

SHOPConfig.VIPGroup = "VIP"                                                                 -- The name of the rank who can buy stuff in the VIP page

SHOPConfig.VIPErrorMsg = "You are not a VIP!"                                               -- The message to send when somebody who aren't allowed try to buy something in the VIP page

SHOPConfig.PurchaseFailedMsg1 = "Purchased failed ! You already have this weapon"           -- The message to send when player try to buy a something he already has

SHOPConfig.PurchaseFailedMsg2 = "Purchased failed ! You do not have enough to buy this"     -- The message to send when player don't have enough money to buy something

SHOPConfig.PurchaseSucceedMsg = "Purchase successful !"                                     -- The message to send when player has buy something
