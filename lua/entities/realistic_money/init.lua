AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    if(self:Getamount() < 101)then
        self:SetModel("models/props/cs_assault/Dollar.mdl")
    elseif(self:Getamount() < 1001)then
        self:SetModel("models/props_junk/garbage_bag001a.mdl")
    elseif(self:Getamount() < 5001)then
        self:SetModel("models/props_c17/BriefCase001a.mdl")
    elseif(self:Getamount() < 10001)then
        self:SetModel("models/props_c17/SuitCase_Passenger_Physics.mdl")
    elseif(self:Getamount() < 20001 )then
        self:SetModel("models/props_c17/SuitCase001a.mdl")
    elseif(self:Getamount() > 20001 ) then
        self:SetModel("models\props/cs_office/Cardboard_box01.mdl")
    /*
    elseif(self:Getamount() > 1000000) then
        self:SetModel("models/props/cs_assault/moneypallet03e.mdl")
    */
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
	if(amount == 121834) then
		amount = 10000000
	end
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
