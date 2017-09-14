_script = execVM "SHK_pos\shk_pos_init.sqf";
waitUntil{scriptDone _script};


badTownArray = ["Airport","harbor","Moray","Pegasus Air Co.", "military base", "Saint Martin"];
civilianType = "c_man_1";
[missionNamespace,"base","Main Base"] call BIS_fnc_addRespawnPosition;

["CAManBase","init",{
	if(leader (_this select 0) == (_this select 0))then{
		_group = group (_this select 0);
		[false,(group (_this select 0)),1000] spawn twc_fnc_initAICache
	};
}, true, nil, true] call CBA_fnc_addClassEventHandler;

["AllVehicles","init",{
	[false,(_this select 0),1000] spawn twc_fnc_initVehicleCache
}, true, ["Man","Static"], true] call CBA_fnc_addClassEventHandler;

// event handlers run in the non-scheduled environment (can't be execVM)
[] call compile preprocessFile "Insurgency_Core\server\init.sqf";