
if(isNil "twc_wdveh") then{
twc_wdveh = 0;
	publicVariable "twc_wdveh";
};


_fstlow = {(( count(allPlayers - entities "HeadlessClient_F")) >= 0)};

_fsthi = {(( count(allPlayers - entities "HeadlessClient_F")) >= 6)};



if((typeOf player) in ["Modern_British_FSTAssistant","Modern_British_Quartermaster","Modern_British_FSTForwardObserver","Modern_British_FSTCommander", "Modern_British_logitech"])then{



	_ammoaction = ["weaponspawn","Spawn Heavy Weapons","",{},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	_ammoaction = ["ammospawn","Spawn Ammo","",{},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	if (twc_wdveh == 1) then {
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_fstlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	} else {

	_vehaction = ["vehiclespawndesert","Spawn Vehicles","",{},_fstlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	};



	_fstaction1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL111A1.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction2 = ["spawnl134","Spawn L134 GMG","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL134A1.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction21 = ["spawnl7","Spawn L7 GPMG","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL7.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction21,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_fstaction5 = ["spawnm6","Spawn M6 Mortar","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortar.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","Spawn Sniper Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	

	_fstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn M6 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortarAmmo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_actionempty = ["SpawnemptyCreate","Spawn Large Empty Crate","",{"TWC_AmmoBox_Other_Pallet_pub" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_actionempty,true] call ace_interact_menu_fnc_addActionToClass;
	
		_hfstaction3 = ["spawn50","Spawn Spare Wheels","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\Repairkit.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote GMG","",{["UK3CB_BAF_Coyote_Logistics_L134A1_W"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote GMG","",{["UK3CB_BAF_Coyote_Logistics_L134A1_D"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote HMG","",{["UK3CB_BAF_Coyote_Logistics_L111A1_W"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote HMG","",{["UK3CB_BAF_Coyote_Logistics_L111A1_D"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	
	};

	
	
if((typeOf player) in ["Modern_British_logitech"])then{
	_UKaction = ["Spawncontainer","Spawn Large Container","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\Container.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Quad Bike","",{["B_Quadbike_01_F"] execvm "insurgency_core\client\sys_player\vehicles\quadbike.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction7 = ["SpawnsmallUKCreate","Spawn Quad Bike","",{["B_Quadbike_01_F"] execvm "insurgency_core\client\sys_player\vehicles\quadbike.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
	
};



