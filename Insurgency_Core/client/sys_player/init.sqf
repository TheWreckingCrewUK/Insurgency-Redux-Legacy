#include "boxes\init.sqf";
#include "loadouts\init.sqf";

twc_fnc_eodflag = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_player\eodflag.sqf";




	
_condition = {(count (player nearobjects ["rhsusf_M977A4_BKIT_usarmy_d", 20]) > 0) && (this getvariable ["twc_isloaded", 1] == 0)};

	_UKaction = ["Spawncontainer","Load on Truck","",{[this] execvm "insurgency_core\client\sys_player\loadContainer.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_Cargo20_military_green_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
_condition = {(this getvariable ["twc_isloaded", 1] == 1)};

	_UKaction = ["Spawncontainer","Unload","",{[this] execvm "insurgency_core\client\sys_player\unloadContainer.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_Cargo20_military_green_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	
if ((getPlayerUID player) in twc_approvedenemies) then {
	systemchat "You are whitelisted to the enemy switcher. You can use it when you are occupying a blank unit at the bottom of the rolesheet and there are more than 13 people online";
};