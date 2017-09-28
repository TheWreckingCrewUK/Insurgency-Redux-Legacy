INS_fnc_spawnIED = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_spawnIED.sqf";
INS_fnc_spawnIEDOnRoad = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_spawnIEDOnRoad.sqf";
INS_fnc_populateIEDs = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_populateIEDs.sqf";
INS_fnc_startIEDPlantLoop = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_startIEDPlantLoop.sqf";

if (isNil "InsP_iedGroup") then {
	InsP_iedGroup = [];
	publicVariable "InsP_iedGroup";
};

if (isNil "InsP_iedMarkerGroup") then {
	InsP_iedMarkerGroup = [];
	publicVariable "InsP_iedMarkerGroup";
};

if (isNil "InsP_iedDestroyed") then {
	InsP_iedDestroyed = 0;
	publicVariable "InsP_iedDestroyed";
};

private _startingIEDCount = (ceil (worldSize / 100)) max 100; // 100 or higher, depending on map size

[_startingIEDCount, ["iedRestrictionZone"]] call INS_fnc_populateIEDs;

// repopulate an IED, start after 10 minutes
[600] call INS_fnc_startIEDPlantLoop;