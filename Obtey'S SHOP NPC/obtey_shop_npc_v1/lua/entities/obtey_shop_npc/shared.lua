include("shop_npc/sh_shop_npc_config.lua")

ENT.Base 			= "base_ai"
ENT.Type		 	= "ai"
ENT.PrintName		= "NPC Shop"
ENT.Author			= "Obtey'S"
ENT.Category		= "Obtey's"
ENT.Contact			= "N/A"
ENT.Purpose			= "N/A" 
ENT.Instructions	= "Appuyer sur E"
ENT.Spawnable		= true
ENT.AdminSpawnable  = true
ENT.AutomaticFrameAdvance = false

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end