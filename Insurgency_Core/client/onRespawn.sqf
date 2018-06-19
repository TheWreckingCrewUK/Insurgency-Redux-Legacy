//systemchat "terp init";
if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	};
	
#include "sys_restrict\init.sqf";