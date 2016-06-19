if( !IsValid( RM ) )then
  RM = {}
end

hook.Add( "InitPostEntity", "MapStartTrigger", function()
    if( !IsValid( RM.Hundred ) )then
      RM.Hundred = "models/props/cs_assault/Dollar.mdl"
    elseif( !IsValid( RM.Thousand ) )then
      RM.Thousand = "models/props_junk/garbage_bag001a.mdl"
    elseif( !IsValid( RM.FiveThousand ) )then
      RM.FiveThousand = "models/props_c17/BriefCase001a.mdl"
    elseif( !IsValid( RM.TenThousand ) )then
      RM.TenThousand = "models/props_c17/SuitCase_Passenger_Physics.mdl"
    elseif( !IsValid( RM.TwentyThousand ) )then
      RM.TwentyThousand = "models/props_c17/SuitCase001a.mdl"
    elseif( !IsValid( RM.Million ) )then
      RM.Million = "models/props/cs_office/Cardboard_box01.mdl"
    elseif( !IsValid( RM.OverMillion ) )then
      RM.OverMillion = "models/items/cs_gift.mdl"
    end
end )
