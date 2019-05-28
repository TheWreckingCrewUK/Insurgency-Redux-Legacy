


_armourlow = {(( count(allPlayers - entities "HeadlessClient_F")) >= 0)};

_armourhi = {(( count(allPlayers - entities "HeadlessClient_F")) >= 6)};

_a2 = {((count units group player) == 2) || ((count units group player) == 4)};
_a3 = {(count units group player) == 3};
_a4 = {(count units group player) == 4};




if((typeOf player) in ["Modern_British_Platoon_Commander"])then{



	
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;

	_ammoaction = ["ammospawn","Spawn Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	_ammoaction2 = ["ammospawnlight","Light Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_ammoaction3 = ["ammospawnsupport","Support Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_ammoaction4 = ["ammospawnheavy","Heavy Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Patrol WMIK","",{execvm "insurgency_core\client\sys_player\vehicles\patrolwmik.sqf"},{true}] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
		
		
	_action = ["SpawnUKCreate","Spawn Large UK Crate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_action,true] call ace_interact_menu_fnc_addActionToClass;
	
	_action1 = ["SpawnCharlieCreate","Spawn Large US Crate","",{"twc_forwardBase_CharlieAmmoBox" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_action1,true] call ace_interact_menu_fnc_addActionToClass;

	_actionempty = ["SpawnemptyCreate","Spawn Large Empty Crate","",{"TWC_AmmoBox_Other_Pallet_pub" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_actionempty,true] call ace_interact_menu_fnc_addActionToClass;
	

		_UKaction = ["SpawnsmallanaCreate","Spawn Small Polish Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratepol.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;

	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateusmc.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionana = ["SpawnsmallUKCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionana,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateNAC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
		_hfstaction3 = ["spawn50","Spawn Spare Wheels","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\Repairkit.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction5 = ["spawnm6","Spawn M6 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMortarAmmo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	};
	
if((typeOf player) in ["Modern_British_VehicleCommander"])then{



	

//	if (twc_wdveh == 1) then {
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	
/*	} else {

	_vehaction = ["vehiclespawndesert","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	};
*/


	_armouraction1 = ["spawnl111","Spawn M1A2","",{["rhsusf_m1a2sep1tuskiid_usarmy"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3))) && ((count units group player) <= 3) && ((!(["infantry", str (group player)] call BIS_fnc_inString)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Bradley","",{["RHS_M2A3_BUSKIII"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3)) && ((!(["infantry", str (group player)] call BIS_fnc_inString))))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	
	_armouraction1 = ["spawnl111","Spawn Guardian","",{["rhsusf_M1117_D"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(twc_wdveh == 0) && (((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3))) && ((count units group player) <= 3) && ((!(["infantry", str (group player)] call BIS_fnc_inString)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Stryker","",{["CUP_B_M1130_CV_M2_Woodland_Slat"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 2) == (floor ((group player getvariable ["armourcount", 1])/ 2)) && ((!(["infantry", str (group player)] call BIS_fnc_inString))))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	/*	
	_armouraction1 = ["spawnl111","Spawn Rosomak","",{["B_APC_Wheeled_01_cannon_F"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
*/

	_armouraction1 = ["spawnl111","Spawn LAV 25","",{["CUP_B_LAV25_desert_USMC"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3)) && ((!(["infantry", str (group player)] call BIS_fnc_inString))))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Scimitar","",{["ukcw_cvrt_Scim_d"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3))) && ((count units group player) <= 3) && ((!(["infantry", str (group player)] call BIS_fnc_inString)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn AAV","",{["CUP_B_AAV_USMC"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3)) && ((!(["infantry", str (group player)] call BIS_fnc_inString))))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
/*

	_armouraction1 = ["spawnl111","Spawn FV432","",{["ukcw_fv432"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
*/
	
	_armouraction1 = ["spawnl111","Spawn Bulldog (GPMG)","",{["UK3CB_BAF_FV432_Mk3_GPMG_Green"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;

	
	_armouraction1 = ["spawnl111","Spawn Bulldog (RWS)","",{["UK3CB_BAF_FV432_Mk3_RWS_Green"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 2) == (floor ((group player getvariable ["armourcount", 1])/ 2)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn M113","",{["rhsusf_m113d_usarmy_M240"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"}, {((!(["infantry", str (group player)] call BIS_fnc_inString)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Warrior","",{["CUP_B_MCV80_GB_D_SLAT"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	
	};
	
	


if((typeOf player) in ["Modern_British_VehicleCrew"])then{
	
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_armouraction1 = ["spawnl111","Spawn Bulldog (GPMG)","",{["UK3CB_BAF_FV432_Mk3_GPMG_Green"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	};

	

if((typeOf player) in ["1990_British_Tank_Commander_Desert", "2000_British_Vehicle_Commander"])then{



	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;


	_armouraction1 = ["spawnl111","Spawn Bradley","",{["RHS_M2A2_wd"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3)) && ((!(["infantry", str (group player)] call BIS_fnc_inString))))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;


	_armouraction1 = ["spawnl111","Spawn Abrams","",{["rhsusf_m1a1aimwd_usarmy"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3))) && ((count units group player) <= 3) && ((!(["infantry", str (group player)] call BIS_fnc_inString)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;


	_armouraction1 = ["spawnl111","Spawn Scimitar","",{["ukcw_cvrt_Scim_w_L1"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3))) && ((count units group player) <= 3) && ((!(["infantry", str (group player)] call BIS_fnc_inString)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	


	_armouraction1 = ["spawnl111","Spawn Warrior","",{["CUP_B_MCV80_GB_D_SLAT"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 3) == (floor ((group player getvariable ["armourcount", 1])/ 3)))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	

	_armouraction1 = ["spawnl111","Spawn Stryker","",{["CUP_B_M1130_CV_M2_Woodland_Slat"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(((group player getvariable ["armourcount", 1])/ 2) == (floor ((group player getvariable ["armourcount", 1])/ 2)) && ((!(["infantry", str (group player)] call BIS_fnc_inString))))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	};
	
	
	
if((typeOf player) in ["2000_British_Vehicle_Commander", "2000_British_Vehicle_Crew"])then{

	_armouraction1 = ["spawnl111","Spawn Bulldog (GPMG)","",{["UK3CB_BAF_FV432_Mk3_GPMG_Green"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	};
	
	
	
if((typeOf player) in ["1990_British_Tank_Commander_Desert", "1990_British_Tank_Crew_Desert"])then{

	
	_armouraction1 = ["spawnl111","Spawn FV432","",{["ukcw_fv432_gpmg"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	};
	


if((typeOf player) in ["1970_British_Vehicle_Commander", "1970_British_Vehicle_Crew"])then{
	
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_armouraction1 = ["spawnl111","Spawn FV432","",{["ukcw_fv432_gpmg"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	if((typeOf player) in ["1970_British_Vehicle_Commander"]) then {
	
		_armouraction1 = ["spawnl111","Spawn Scorpion","",{["ukcw_Scorpion_w_L1"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(!(["infantry", str (group player)] call BIS_fnc_inString)) && ((count units group player) >= 3)}] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
		
	
		_armouraction1 = ["spawnl111","Spawn Scimitar","",{["ukcw_cvrt_Scim_w_L1"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(!(["infantry", str (group player)] call BIS_fnc_inString)) && ((count units group player) >= 3)}] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
		_armouraction1 = ["spawnl111","Spawn Chieftain","",{["ukcw_ChieftainMK10"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{(!(["infantry", str (group player)] call BIS_fnc_inString)) && ((count units group player) >= 3)}] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
		_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	};
	
};

