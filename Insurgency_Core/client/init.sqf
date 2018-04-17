#include "sys_cleanup\init.sqf";
#include "sys_intel\init.sqf";
#include "sys_diary\init.sqf";
#include "sys_forwardBase\init.sqf";
#include "sys_restrict\init.sqf";
#include "sys_score\init.sqf";
#include "sys_player\init.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";
"iedRestrictionZone" setMarkerAlpha 0;

waitUntil {!isNull player};
sleep 30;
//systemchat "terp init";
if (typeOf player == "twc_ana_interpreter") then {
	twc_terp = player;
	publicvariable "twc_terp";
	"You're an interpreter. Read more about this in the diary on your map" remoteExec ["hint",twc_terp];
	
	player CreateDiaryRecord ["Diary",["Interpreter",
	"As an interpreter you can gain access to valuable information regarding enemy activity. As you move through the area you will receive hints regarding cache locations, currently defended towns, IED's and even estimates of stronghold strength. You will only get this information if your PRC152 is set to the correct channel however, and you will need to find the correct channel yourself."
]];

[] spawn {while {true} do {

	publicvariable "twc_terp";
_terpradio = ["ACRE_PRC152", twc_terp] call acre_api_fnc_getRadioByType;  
 if (!(isnil "_terpradio")) then {
terpChannel = [_terpradio] call acre_api_fnc_getRadioChannel;
publicVariable "terpChannel";
 sleep 20; }}}
	
};



/*
player addEventHandler ["Hit", {[] spawn {if !(vehicle player == player) exitwith{};if (stance player == "PRONE") exitwith {};if ((random 1)>1.5) exitwith{}; _this = player; _this setUnconscious true; sleep 0.1; _this setUnconscious false}}]*.