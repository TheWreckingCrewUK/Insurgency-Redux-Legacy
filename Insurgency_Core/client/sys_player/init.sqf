#include "boxes\init.sqf";
#include "loadouts\init.sqf";
#include "enemy\init.sqf";

twc_fnc_eodflag = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_player\eodflag.sqf";





	
if ((getPlayerUID player) in twc_approvedenemies) then {
	systemchat "You are whitelisted to the enemy switcher. You can use it when you are occupying a blank unit at the bottom of the rolesheet and there are more than 13 people online to become an aggressor";
};

_arr = missionnamespace getvariable ["twc_goodeggs", []];
if ((getPlayerUID player) in _arr) then {
	systemchat "You have commanded sections in the past. You can now form attachments without being affected by the total server playercount. Individual attachment size restrictions still apply";
} else {
	systemchat "You have not taken command of a section recently. Players that have done so can form attachments without playercount restrictions";
};