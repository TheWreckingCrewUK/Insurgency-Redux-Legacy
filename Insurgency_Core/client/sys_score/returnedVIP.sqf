_action = ["ActionRescuedVIP","Rescue VIP","",{["TWC_Insurgency_adjustPoints", 50] call CBA_fnc_serverEvent; 
deleteVehicle _target;

this setVariable ["active",0,true];
//Creates the task
_taskID = str (random 1000);
[WEST,[_taskID],["A member of the press was captured by insurgents, and later rescued","Hostage Rescue"],_markerPos,0,2,true] call BIS_fnc_taskCreate;

	[_taskID,"Succeeded"] call BIS_fnc_taskSetState;
	


},{((GetPos player) distance (getMarkerPos "base") < 20)}] call ace_interact_menu_fnc_createAction;

["C_journalist_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;