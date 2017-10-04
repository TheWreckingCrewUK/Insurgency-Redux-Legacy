_action = ["ActionRescuedVIP","Rescue VIP","",{["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent; deleteVehicle _target;},{((GetPos player) distance (getMarkerPos "base") < 20)}] call ace_interact_menu_fnc_createAction;

["C_journalist_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;