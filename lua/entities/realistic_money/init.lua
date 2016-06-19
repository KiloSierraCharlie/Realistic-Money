AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    if(self:Getamount() <= 100)then
      self:SetModel( RM.Hundred )
    elseif(self:Getamount() <= 1000)then
      self:SetModel( RM.Thousand )
    elseif(self:Getamount() <= 5000)then
      self:SetModel( RM.FiveThousand )
    elseif(self:Getamount() <= 10000)then
      self:SetModel( RM.TenThousand )
    elseif(self:Getamount() <= 20000)then
      self:SetModel( RM.TwentyThousand )
    elseif(self:Getamount() <= 1000000) then
      self:SetModel( RM.Million )
    elseif(self:Getamount() > 1000000)then
      self:SetModel( RM.OverMillion )
    end
  self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()
	self.nodupe = true
	self.ShareGravgun = true
    if(IsValid(phys))then
        phys:Wake()
    end
end

function ENT:Use(activator,caller)
	if self.USED or self.hasMerged then return end
	local amount = self:Getamount()
	activator:addMoney(amount or 0)
	DarkRP.notify(activator, 0, 4, DarkRP.getPhrase("found_money", DarkRP.formatMoney(self:Getamount())))
	self:Remove()
end

function ENT:Touch(ent)
	if ent:GetClass() ~= "realistic_money" or ent:GetClass() ~= "spawned_money" or self.USED or ent.USED or self.hasMerged or ent.hasMerged then return end
	ent.USED = true
	ent.hasMerged = true
	ent:Remove()
	self:Setamount(self:Getamount() + ent:Getamount())
end
