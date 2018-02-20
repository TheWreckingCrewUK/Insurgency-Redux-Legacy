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


	_infaction1 = ["clearbox","Clear Boxes","",{execvm "insurgency_core\client\sys_player\boxes\clearboxes.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_infaction1,true] call ace_interact_menu_fnc_addActionToClass;
	

if((typeOf player) in ["Modern_British_HeliPilot","Modern_USMC_HeliPilot"])then{

	_action = ["SpawnUKCreate","Spawn Large UK Crate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
	
	_action1 = ["SpawnCharlieCreate","Spawn Large Charlie Crate","",{"twc_forwardBase_CharlieAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small Charlie Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateUSMC.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	
};

if((typeOf player) in ["Modern_British_Squadleader","Modern_British_2IC_COIN"])then{

	_UKaction = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction1 = ["Spawnheartscrate","Spawn Hearts And Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

if((typeOf player) in ["Modern_USMC_Squadleader","Modern_USMC_Teamleader", "Modern_USMC_Squadleader_d","Modern_USMC_Teamleader_d"])then{

	_charlieaction = ["SpawnsmallcharlieCreate","Spawn Small Charlie Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateUSMC.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_charlieaction1 = ["Spawnheartscrateus","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds_us.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};

if((typeOf player) in ["Modern_Artillery_Commander"])then{

	_artaction = ["SpawnsmallcharlieCreate","Spawn 105mm HE Rounds","",{execvm "insurgency_core\client\sys_player\boxes\105he.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction1 = ["Spawnheartscrateus","Spawn 105mm Smoke Rounds","",{execvm "insurgency_core\client\sys_player\boxes\105smoke.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_artaction2 = ["SpawnmedCreate","Spawn 105mm Illum Rounds","",{execvm "insurgency_core\client\sys_player\boxes\105illum.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction3 = ["SpawnrepCreate","Spawn Vehicle Repair Kit","",{execvm "insurgency_core\client\sys_player\boxes\RepairKit.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction3,true] call ace_interact_menu_fnc_addActionToClass;
	

};


if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin"])then{

	_snaction1 = ["Spawnsnipbox","Spawn Sniper Ammo Box","",{execvm "insurgency_core\client\sys_player\boxes\smallCratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_Medic", "1990_British_Medic", "1990_British_Medic_Desert", "1990_RM_British_Medic_Mix", "Modern_USMC_Medic", "Modern_USMC_Medic_d"])then{

	_medaction = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_medaction,true] call ace_interact_menu_fnc_addActionToClass;
		
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
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
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
	
	
	_action7 = ["Zeus","IDF Siren","",{execVM "insurgency_core\server\sys_basedefence\IDF_Alarm.sqf"
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

	
	_90UKaction = ["Spawnsmall90UKCreate","Spawn Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk90.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90UKaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	
	_90charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};

if((typeOf player) in ["1990_RM_British_2IC_Mix","1990_RM_British_SectionCommander_Mix"])then{

	
	_90rmUKaction = ["Spawnsmall90UKCreate","Spawn Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk90RM.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmUKaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsmindsRM.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmUKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmUKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};
