

if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	};
	
#include "sys_restrict\init.sqf";

sleep 10;

if ((random 1)< twc_mortarchance) then {

["twc_event_remoteFireMortar", [getpos player], twc_mortar] call CBA_fnc_targetEvent;
};
	