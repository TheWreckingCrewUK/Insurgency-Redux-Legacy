

if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	};
	
#include "sys_restrict\init.sqf";

sleep 10;

if ((random 1)< twc_mortarchance) then {[getpos player] remoteExec ["twc_fnc_mortarattack", 2]};
	