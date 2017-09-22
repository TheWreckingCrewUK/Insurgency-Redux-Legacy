TWC_fnc_INSspawnIed = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_spawnIed.sqf";
TWC_fnc_INSpopulateIeds = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_populateIeds.sqf";
twc_fnc_startIEDPlantLoop = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_startIEDPlantLoop.sqf";

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

[_startingIEDCount, ["iedRestrictionZone"]] call TWC_fnc_INSpopulateIeds;

// repopulate an IED, every 300 seconds / 5 minutes
[300] call twc_fnc_startIEDPlantLoop;