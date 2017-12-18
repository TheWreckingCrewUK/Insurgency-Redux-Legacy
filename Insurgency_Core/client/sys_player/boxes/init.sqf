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

	_action = ["SpawnAlphaCreate","Spawn Large Alpha Crate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
	
	_action1 = ["SpawnCharlieCreate","Spawn Large Charlie Crate","",{"twc_forwardBase_CharlieAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small Charlie Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateUSMC.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_halphaaction3 = ["SpawnsmallAlphaCreate","Spawn Small Alpha Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_halphaaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_Squadleader","Modern_British_2IC_COIN"])then{

	_alphaaction = ["SpawnsmallAlphaCreate","Spawn Small Alpha Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction1 = ["Spawnheartscrate","Spawn Hearts And Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
		_alphaaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_alphaaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction4,true] call ace_interact_menu_fnc_addActionToClass;

};

if((typeOf player) in ["Modern_USMC_Squadleader","Modern_USMC_Teamleader"])then{

	_charlieaction = ["SpawnsmallcharlieCreate","Spawn Small Charlie Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateUSMC.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_charlieaction1 = ["Spawnheartscrateus","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds_us.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction1,true] call ace_interact_menu_fnc_addActionToClass;

};

if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_spotter_coin"])then{

	_snaction1 = ["Spawnsnipbox","Spawn Sniper Ammo Box","",{execvm "insurgency_core\client\sys_player\boxes\smallCratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_FSTAssistant","Modern_British_Quartermaster","Modern_British_FSTForwardObserver","Modern_British_FSTCommander"])then{

	_fstaction1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "insurgency_core\client\sys_player\boxes\staticL111A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction2 = ["spawnl134","Spawn L134 GMG","",{execvm "insurgency_core\client\sys_player\boxes\staticL134A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction21 = ["spawnl7","Spawn L7 GPMG","",{execvm "insurgency_core\client\sys_player\boxes\staticL7.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction21,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn M6","",{execvm "insurgency_core\client\sys_player\boxes\smallMortar.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallAlphaCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_Quartermaster","1990_British_quartermaster_Desert"])then{
execVM "insurgency_core\client\zeus\camera.sqf";

	_action2 = ["Zeus","Spectator On","",{execVM "insurgency_core\client\zeus\spectator_on.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action2] call ace_interact_menu_fnc_addActionToObject;
	_action3 = ["Zeus","Spectator Off","",{execVM "insurgency_core\client\zeus\spectator_off.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action3] call ace_interact_menu_fnc_addActionToObject;
	_action4 = ["Zeus","Basemode On","",{execVM "insurgency_core\client\zeus\basemode_on.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action4] call ace_interact_menu_fnc_addActionToObject;
	_action5 = ["Zeus","Basemode Off","",{execVM "insurgency_core\client\zeus\basemode_off.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action5] call ace_interact_menu_fnc_addActionToObject;
	
	_action6 = ["Zeus","Enemy Siren","",{execVM "insurgency_core\server\sys_basedefence\INF_Alarm.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action6] call ace_interact_menu_fnc_addActionToObject;
	
	
	_action7 = ["Zeus","IDF Siren","",{{
	[_x, "TWC_sound_idfsiren"] call CBA_fnc_globalSay3d;
} forEach sirenlist;
},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action7] call ace_interact_menu_fnc_addActionToObject;
	
	_action8 = ["Zeus","Clear Siren","",{execVM "insurgency_core\server\sys_basedefence\INF_Alarmclear.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action8] call ace_interact_menu_fnc_addActionToObject;

};


if((typeOf player) in ["1990_British_quartermaster_Desert"])then{

	_qm90action1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "insurgency_core\client\sys_player\boxes\staticL111A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_qm90action3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action3,true] call ace_interact_menu_fnc_addActionToClass;

	_qm90action4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action4,true] call ace_interact_menu_fnc_addActionToClass;

};

if((typeOf player) in ["1990_British_mg_assistant_Desert"])then{

	_mgaction = ["Spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_mgaction,true] call ace_interact_menu_fnc_addActionToClass;
	
};

if((typeOf player) in ["1990_British_2IC_Desert","1990_British_SectionCommander_Desert"])then{

	
	_90alphaaction = ["SpawnsmallAlphaCreate","Spawn Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk90.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90alphaaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90alphaaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90alphaaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90alphaaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90alphaaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90alphaaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90alphaaction4,true] call ace_interact_menu_fnc_addActionToClass;

};
