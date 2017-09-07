_script = execVM "SHK_pos\shk_pos_init.sqf";
waitUntil{scriptDone _script};

badTownArray = ["Airport","harbor","Moray","Pegasus Air Co."];
civilianType = "c_man_1";
[missionNamespace,"base","Main Base"] call BIS_fnc_addRespawnPosition;
execVM "Insurgency_Core\server\init.sqf";