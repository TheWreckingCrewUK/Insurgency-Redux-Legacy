
if(isNil "twc_wdveh") then{
twc_wdveh = 0;
	publicVariable "twc_wdveh";
};


_fstlow = {(( count(allPlayers - entities "HeadlessClient_F")) >= 0)};

_fsthi = {(( count(allPlayers - entities "HeadlessClient_F")) >= 6)};



if((typeOf player) in ["Modern_British_FSTAssistant","Modern_British_Quartermaster","Modern_British_FSTForwardObserver","Modern_British_FSTCommander", "Modern_British_logitech"])then{



	_ammoaction = ["weaponspawn","Spawn Heavy Weapons","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	if (twc_wdveh == 1) then {
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_fstlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	} else {

	_vehaction = ["vehiclespawndesert","Spawn Vehicles","",{},_fstlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	};


	_fstaction1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL111A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction2 = ["spawnl134","Spawn L134 GMG","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL134A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction21 = ["spawnl7","Spawn L7 GPMG","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL7.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction21,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn M6 Mortar","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortar.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn L16 Mortar","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL16.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn Javelin","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn AT4 Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateat4.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	
		_UKaction = ["SpawnsmallanaCreate","Spawn Small Polish Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratepol.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction = ["SpawnsmallanaCreate","Spawn Small German Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateger.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	
	_UKaction1 = ["Spawnheartscrate","Spawn Hearts And Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\heartsminds.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_UKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateusmc.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionana = ["SpawnsmallUKCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateana.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionana,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateNAC.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
		_hfstaction3 = ["spawn50","Spawn Spare Wheels","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\Repairkit.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;

	
	
	
	
	_fstaction5 = ["javtube","Spawn Javelin Tube","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav_tube.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawn60mmas","Spawn 60mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortarAmmo_mix.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawn60mma","HE","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortarAmmo_HE.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy", "spawn60mmas"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawn60mma","Smoke","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortarAmmo_smoke.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy", "spawn60mmas"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawn60mma","Illum","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortarAmmo_illum.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy", "spawn60mmas"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["l16ammo","Spawn 82mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL16_mix.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["l16he","HE","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL16_HE.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy", "l16ammo"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["l16he","Illum","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL16_illum.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy", "l16ammo"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["l16he","Smoke","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL16_smoke.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy", "l16ammo"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote GMG","",{["UK3CB_BAF_Coyote_Logistics_L134A1_W"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},{((((group player) getvariable ["twc_groupcountry", "baf"])) == "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote GMG","",{["UK3CB_BAF_Coyote_Logistics_L134A1_D"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},{((((group player) getvariable ["twc_groupcountry", "baf"])) == "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote HMG","",{["UK3CB_BAF_Coyote_Logistics_L111A1_W"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},{((((group player) getvariable ["twc_groupcountry", "baf"])) == "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote HMG","",{["UK3CB_BAF_Coyote_Logistics_L111A1_D"] execvm "insurgency_core\client\sys_player\vehicles\coyote.sqf"},{((((group player) getvariable ["twc_groupcountry", "baf"])) == "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote HMG","",{execvm "insurgency_core\client\sys_player\vehicles\fstmrap.sqf"},{((((group player) getvariable ["twc_groupcountry", "baf"])) == "us")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction7 = ["SpawnsmallUKCreate","Spawn MRAP CROWS","",{execvm "insurgency_core\client\sys_player\vehicles\fstmrap.sqf"},{((((group player) getvariable ["twc_groupcountry", "baf"])) == "us")}] call ace_interact_menu_fnc_createAction;
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



