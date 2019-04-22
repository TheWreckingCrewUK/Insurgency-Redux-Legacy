twc_fnc_getDisplayName = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_getDisplayName.sqf";
twc_fnc_showSandBagItems = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_showSandBagItems.sqf";
twc_fnc_startcqbrangeserver = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_cqbrange_server.sqf";

twc_fnc_campaignserver = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_campaignserver.sqf";

twc_fnc_stopcivs = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_stopcivs.sqf";

//execVM "Insurgency_Core\client\func\fnc_gasattack.sqf";

player addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];
	
	if ((side _entity) == east) then {
		_entity setVariable ["twc_isenemy",1];
		//systemchat "enemy placed";
	};
	if ((side _entity) == civilian) then {
		_entity setVariable ["twc_isenemy",0,true];
		systemchat "civ placed";
	};
}];