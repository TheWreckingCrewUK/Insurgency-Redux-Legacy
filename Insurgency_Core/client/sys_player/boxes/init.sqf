/*
* Written by [TWC] jayman
*
* Creates the ammo box with an an event handler. This should decrease lag
* while always keeping the box full. Basically it reloads as soon as you close it
*/
_marker = "crate";  // marker used to spawn.
_boxType = "CUP_BAF_VehicleBox";  // the type of ammobox used.

// create and fill the box.
crateBox = _boxType createVehicleLocal (getMarkerPos _marker);
crateBox setPosATL (getMarkerPos _marker);
crateBox allowDamage false;

[crateBox] execVM "Insurgency_Core\client\sys_player\boxes\main_ammo.sqf";

player addEventHandler ["InventoryClosed", {
	if((_this select 1) == crateBox)then{
		[_this select 1]execVM "Insurgency_Core\client\sys_player\boxes\main_ammo.sqf";
	};
}];

if((typeOf player) in ["Modern_British_HeliPilot","Modern_USMC_HeliPilot"])then{

	_action = ["SpawnAlphaCreate","Spawn Alpha Crate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
	
	_action = ["SpawnCharlieCreate","Spawn Charlie Crate","",{"twc_forwardBase_CharlieAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;

};
if((typeOf player) in ["Modern_British_Quartermaster"])then{
execVM "insurgency_core\client\zeus\camera.sqf";

	_action2 = ["Zeus","Spectator On","",{execVM "insurgency_core\client\zeus\spectator_on.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action2] call ace_interact_menu_fnc_addActionToObject;
	_action3 = ["Zeus","Spectator Off","",{execVM "insurgency_core\client\zeus\spectator_off.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action3] call ace_interact_menu_fnc_addActionToObject;
	_action4 = ["Zeus","Basemode On","",{execVM "insurgency_core\client\zeus\basemode_on.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action4] call ace_interact_menu_fnc_addActionToObject;
	_action5 = ["Zeus","Basemode Off","",{execVM "insurgency_core\client\zeus\basemode_off.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action5] call ace_interact_menu_fnc_addActionToObject;
	

	
	_action7 = ["Zeus","IDF Siren","",{[idfalarm, "TWC_sound_idfsiren"] call CBA_fnc_globalSay3d;},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action7] call ace_interact_menu_fnc_addActionToObject;
	
	_action8 = ["Zeus","Clear Siren","",{[idfalarm, "TWC_sound_idfclear"] call CBA_fnc_globalSay3d;},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action8] call ace_interact_menu_fnc_addActionToObject;
	
	
	
	
	
};