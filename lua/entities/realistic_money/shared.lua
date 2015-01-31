ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Realistic Money"
ENT.Author = "MindfulHacker + FPtje"
ENT.Spawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Int",0,"amount")
end
