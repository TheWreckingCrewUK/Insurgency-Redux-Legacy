InsP_fnc_deleteMarkers = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fn_deleteMarkers.sqf";
InsP_fnc_deadCache = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fnc_deadCache.sqf";
diag_log "hoblog cacheinit 3";
if (isNil "InsP_ammoCaches") then {
	InsP_ammoCaches = 0;
	publicVariable "InsP_ammoCaches";
};

if (isNil "cacheAMarkers") then {
	cacheAMarkers = [];
	publicVariable "cacheAMarkers";
	cacheBMarkers = [];
	publicVariable "cacheBMarkers";
	cacheCMarkers = [];
	publicVariable "cacheCMarkers";
};

execvm "Insurgency_Core\server\sys_cache\cacheSetup.sqf"
//#include "cacheSetup.sqf";