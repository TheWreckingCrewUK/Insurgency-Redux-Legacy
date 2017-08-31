TWC_fnc_INSspawnIed = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_spawnIed.sqf";
TWC_fnc_INSpopulateIeds = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_ied\fnc_populateIeds.sqf";

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

[100, ["iedRestrictionZone"]] call TWC_fnc_INSpopulateIeds;
