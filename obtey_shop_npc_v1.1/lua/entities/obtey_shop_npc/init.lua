AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("shop_npc/sh_shop_npc_config.lua")
include("shared.lua")


function ENT:Initialize()

	self:SetModel(SHOPConfig.NPCModel)
	self:SetHullType(HULL_HUMAN)
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()

end

function ENT:OnTakeDamage()
	return false
end

util.AddNetworkString("Baseframe")

function ENT:Use(act, ply)
	if IsValid(ply) and ply:IsPlayer() then
		net.Start("Baseframe")
		net.Send(ply)
	end
end