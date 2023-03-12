execVM "Insurgency_Core\client\sys_logistics\init.sqf";
#include "func\init.sqf";
[player] call twc_fnc_buildmagarray_set;
#include "sys_cleanup\init.sqf";
#include "sys_diary\init.sqf";
#include "sys_forwardBase\init.sqf";
#include "sys_score\init.sqf";
#include "sys_player\init.sqf";
#include "sys_basedefence\init.sqf";
#include "sys_intel\init.sqf";
#include "interactions\init.sqf";
"iedRestrictionZone" setMarkerAlpha 0;

//also run in server init
twc_pubaiuncon = true;

InsP_fnc_deleteMarkers = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fn_deleteMarkers.sqf";
InsP_fnc_deadCache = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fnc_deadCache.sqf";

cutText ["","Black IN",0.001];



twc_endmissionplayer = {
player setvehicleammo 0;
};

if ((count units group player) > 6) then {
	[group player] remoteexec ["twc_hintfullsection"];
};

addMissionEventHandler ["MapSingleClick", {
params ["_units", "_pos", "_alt", "_shift"];
if (!_alt) exitwith {};
_timer = player getvariable ["twc_mapclicktimer", -999]; if (_timer < (time - 3)) exitwith {[] spawn {hint "Circle Creator: Mark set"; sleep 2; hint "";};player setvariable ["twc_mapclickmarkerpos", _pos];player setvariable ["twc_mapclicktimer", time];}; _markerpos = player getvariable ["twc_mapclickmarkerpos", [0,0,0]];_marker1 = createMarkerLocal [(STR (RANDOM 200)), _markerpos]; _meters = _markerpos distance _pos; _marker1 setMarkerShapeLocal "ELLIPSE"; _marker1 setMarkerSizeLocal [_meters, _meters]; _marker1 setMarkerBrushLocal "Border";player setvariable ["twc_mapclicktimer", -999];}];


player addEventHandler ["InventoryOpened", { 
	params ["_unit", "_container"];
	_check = player getvariable ["twc_bodysearch", objnull];
	if (!isnull _check) exitwith {};
	_haschecked = _container getvariable ["twc_bodychecked", false];
	if (_haschecked) exitwith {};
	if ( (_container iskindof "man")) exitwith {
		player setvariable ["twc_bodysearch", _container];
		[] spawn {
			waituntil {dialog};
			closeDialog 602;
			[5, [],{_container = player getvariable ["twc_bodysearch", objnull];player action ["Gear", _container];player setvariable ["twc_bodysearch", objnull];_container setvariable ["twc_bodychecked", true];}, {player setvariable ["twc_bodysearch", objnull];}, "Searching..."] call ace_common_fnc_progressBar;
		};
	}; 
}];




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

