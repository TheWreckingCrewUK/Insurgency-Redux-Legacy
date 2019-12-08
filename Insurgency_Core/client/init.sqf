#include "sys_cleanup\init.sqf";
#include "sys_diary\init.sqf";
#include "sys_forwardBase\init.sqf";
#include "sys_score\init.sqf";
#include "sys_player\init.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";
#include "sys_intel\init.sqf";
//#include "sys_ragdoll\init.sqf";
"iedRestrictionZone" setMarkerAlpha 0;

InsP_fnc_deleteMarkers = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fn_deleteMarkers.sqf";
InsP_fnc_deadCache = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fnc_deadCache.sqf";
twc_news = compile preprocessfilelinenumbers "Insurgency_Core\client\news.sqf";
cutText ["","Black IN",0.001];

_alphaaction = ["SpawnsmallAlphaCreate","TWC News","",{call twc_news},{true}] call ace_interact_menu_fnc_createAction;
["TWC_Item_Public_Base_LOCSTAT",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Start Simple CQB Course","",{execvm "Insurgency_Core\client\func\fnc_cqbrange.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Start Complex CQB Course","",{[true] execvm "Insurgency_Core\client\func\fnc_cqbrange.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Reset CQB Course","",{execvm "Insurgency_Core\client\func\fnc_cqbrange_reset.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;



twc_endmissionplayer = {
player setvehicleammo 0;
};

if ((count units group player) > 6) then {
	[group player] remoteexec ["twc_hintfullsection"];
};


twc_firstspawned = 0;
twc_lastspawned = 0;
twc_serstarttime = time + 10000;

twc_pubcamo = 500;
waituntil {!isnil "twc_missionname"};
if (["70", twc_missionname] call BIS_fnc_inString) then {
	twc_pubcamo = 2;
};
if (["90", twc_missionname] call BIS_fnc_inString) then {
	twc_pubcamo = 20;
};

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

if ((!(isnull _corpse)) && ((_corpse distance twc_basepos) < 500)) then {
	[_corpse] spawn {
		params ["_corpse"];
		_corpse setvehicleammo 0;
		clearweaponcargoglobal _corpse;
		clearitemcargoglobal _corpse;
	};
};}];



waitUntil {!isNull player};
cutText ["","Black IN",0.001];
if ((!(forcedMap select 0)) && ((forcedMap select 1))) then {player setdamage 1};