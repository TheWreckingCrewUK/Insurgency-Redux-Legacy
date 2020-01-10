_action = ["ActionRescuedVIP","Rescue VIP","",{["TWC_Insurgency_adjustPoints", 70] call CBA_fnc_serverEvent; 
_target remoteExecCall ["deleteVehicle",_target];

	_trg2 = _target getvariable ["twchvttrg2", objnull];
	_id = _trg2 getvariable ["twc_vipid", 0];
	twc_activemissions deleteAt (twc_activemissions find _id);
	publicVariable "twc_activemissions";
	
	_objType = _trg2 getvariable ["twc_vipobjtype", "0"];
	["TWC_Insurgency_objCompleted", ["VIP", _objType]] call CBA_fnc_serverEvent;

//Creates the task
_taskID = str (random 1000);
[WEST,[_taskID],["A member of the press was captured by insurgents, and later rescued","Hostage Rescue"],_markerPos,"CREATED",2,true] call BIS_fnc_taskCreate;

	[_taskID,"Succeeded", true] call BIS_fnc_taskSetState;
	


},{(((GetPos player) distance (getMarkerPos "base") < 20) && (alive _target) && ((vehicle _target) == _target))}] call ace_interact_menu_fnc_createAction;

["C_journalist_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;