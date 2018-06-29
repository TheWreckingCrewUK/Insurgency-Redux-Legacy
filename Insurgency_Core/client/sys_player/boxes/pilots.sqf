
_attackcond = {( count(allPlayers - entities "HeadlessClient_F")) >= 8};

_attackcond2 = {( count(allPlayers - entities "HeadlessClient_F")) >= 10};

_utilitycond = {( count(allPlayers - entities "HeadlessClient_F")) >= 3};

_transportcond1 = {( count(allPlayers - entities "HeadlessClient_F")) >= 4};

_transportcond2 = {( count(allPlayers - entities "HeadlessClient_F")) >= 5};

_cascond = {( count(allPlayers - entities "HeadlessClient_F")) >= 7};

_planecondlow = {( count(allPlayers - entities "HeadlessClient_F")) >= 6};

_planecondmid = {( count(allPlayers - entities "HeadlessClient_F")) >= 8};

_planecondhi = {( count(allPlayers - entities "HeadlessClient_F")) >= 12};

/*
playercount = 0;
_planecondlow = {playercount >= 5};

_planecondmid = {playercount >= 7};

_planecondhi = {playercount >= 9};

_attackcond = {true};

_utilitycond = {true};

_transportcond = {true};

_transportcond1 = {true};

_transportcond2 = {true};

_cascond = {true};
*/

twc_planetime=0;
publicVariable "twc_planetime";

twc_planetime_amount=600;
publicVariable "twc_planetime_amount";

twc_utilplanetime=0;
publicVariable "twc_utilplanetime";

twc_utilplanetime_amount=60;
publicVariable "twc_utilplanetime_amount";

twc_casplanetime=0;
publicVariable "twc_casplanetime";

twc_casplanetime_amount=240;
publicVariable "twc_casplanetime_amount";

twc_helitime=0;
publicVariable "twc_helitime";

twc_helitime_amount=3600;
publicVariable "twc_helitime_amount";

twc_Transporthelitime=0;
publicVariable "twc_Transporthelitime";

twc_Transporthelitime_amount=60;
publicVariable "twc_Transporthelitime_amount";

twc_utilhelitime=0;
publicVariable "twc_utilhelitime";

twc_utilhelitime_amount=60;
publicVariable "twc_utilhelitime_amount";

twc_attackhelitime=0;
publicVariable "twc_attackhelitime";

twc_attackhelitime_amount=48;
publicVariable "twc_attackhelitime_amount";

twc_cashelitime=0;
publicVariable "twc_cashelitime";

twc_cashelitime_amount=120;
publicVariable "twc_cashelitime_amount";


if((typeOf player) in ["Modern_British_JetPilot"])then{

	_ammoaction = ["ammospawn","Spawn Ammo","",{},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	_ammoaction2 = ["ammospawnlight","Light Ammo","",{},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_ammoaction3 = ["ammospawnsupport","Support Ammo","",{},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_ammoaction4 = ["ammospawnheavy","Heavy Ammo","",{},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_vehaction = ["vehiclespawn","Spawn Aircraft","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	
};	



//second check to incorporate the logistics crew without giving them the ability to spawn helis
if((typeOf player) in ["Modern_British_HeliPilot","Modern_British_crewchief","2000_British_HeliPilot_Desert","2000_British_HeliPilot", "Modern_British_logitech"])then{




	_ammoaction = ["ammospawn","Spawn Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	_ammoaction2 = ["ammospawnlight","Light Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_ammoaction3 = ["ammospawnsupport","Support Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_ammoaction4 = ["ammospawnheavy","Heavy Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","ammospawn"],_ammoaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	
if((typeOf player) in ["Modern_British_HeliPilot","Modern_British_crewchief","2000_British_HeliPilot_Desert","2000_British_HeliPilot"])then{
	
	_vehaction = ["vehiclespawn","Spawn Helicopters","",{},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_vehaction1 = ["vehiclespawnattack","Attack Helicopters","",{},_attackcond] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","vehiclespawn"],_vehaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_vehaction2 = ["vehiclespawnutility","Utility Helicopters","",{},_utilitycond] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","vehiclespawn"],_vehaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_vehaction3 = ["vehiclespawntransport","Transport Helicopters","",{},_transportcond1] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","vehiclespawn"],_vehaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_vehaction4 = ["vehiclespawncas","CAS Helicopters","",{},_cascond] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions","vehiclespawn"],_vehaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
};	
};
	
if((typeOf player) in ["Modern_British_JetPilot"])then{


	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Hercules","",{
	
	["TWC_Vehicle_Generic_Hercules_RAF"] execvm "insurgency_core\client\sys_player\vehicles\utilityplane.sqf"
	
	},_planecondlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Hercules VIV","",{
	
	["CUP_B_C130J_Cargo_GB"] execvm "insurgency_core\client\sys_player\vehicles\utilityplane.sqf"
	
	},_planecondlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;
	

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Harrier","",{
	
	["CUP_B_GR9_DYN_GB"] execvm "insurgency_core\client\sys_player\vehicles\casplane.sqf"
	
	},_planecondmid] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn A-10","",{
	
	["CUP_B_A10_DYN_USA"] execvm "insurgency_core\client\sys_player\vehicles\casplane.sqf"
	
	},_planecondhi] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;
	

	
	////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////

	

	_action = ["SpawnUKCreate","Spawn Large UK Crate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_action,true] call ace_interact_menu_fnc_addActionToClass;
	
	_action1 = ["SpawnCharlieCreate","Spawn Large US Crate","",{"twc_forwardBase_CharlieAmmoBox" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_action1,true] call ace_interact_menu_fnc_addActionToClass;

	_actionempty = ["SpawnemptyCreate","Spawn Large Empty Crate","",{"TWC_AmmoBox_Other_Pallet_pub" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_actionempty,true] call ace_interact_menu_fnc_addActionToClass;
	


	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateusmc.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_hUKactionana = ["SpawnsmallUKCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionana,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateNAC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn Spare Wheels","",{execvm "insurgency_core\client\sys_player\boxes\Repairkit.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction5 = ["spawnm6","Spawn M6 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\smallMortarAmmo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\40ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	/*
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateumcs.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_hUKactionana = ["SpawnsmallUKCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hUKactionana,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateNAC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction5 = ["spawnm6","Spawn M6 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\smallMortarAmmo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\40ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	*/
	
	

	
};
	
	
if((typeOf player) in ["Modern_British_HeliPilot","Modern_British_crewchief", "Modern_British_logitech"])then{


	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Gazelle","",{
	
	["ukcw_Gazelle"] execvm "insurgency_core\client\sys_player\vehicles\utilityheli.sqf"
	
	},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawnutility"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Merlin","",{
	
	["UK3CB_BAF_Merlin_HC3_18_GPMG"] execvm "insurgency_core\client\sys_player\vehicles\utilityheli.sqf"
	
	},_transportcond2] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawnutility"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;
	

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Huey","",{
	
	["CUP_O_UH1H_TKA"] execvm "insurgency_core\client\sys_player\vehicles\utilityheli.sqf"
	
	},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawnutility"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;



	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Apache","",{
	
	["RHS_AH64D"] execvm "insurgency_core\client\sys_player\vehicles\attackheli.sqf"
	
	},_attackcond2] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawnattack"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Cobra","",{
	
	["RHS_AH1Z"] execvm "insurgency_core\client\sys_player\vehicles\attackheli.sqf"
	
	},_attackcond2] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawnattack"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;


	

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Chinook","",{
	
	["CUP_B_CH47F_GB"] execvm "insurgency_core\client\sys_player\vehicles\transheli.sqf"
	
	},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawntransport"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Mi-8","",{
	
	["CUP_O_Mi8_CHDKZ"] execvm "insurgency_core\client\sys_player\vehicles\transheli.sqf"
	
	},_transportcond2] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawntransport"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;
	

	
	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Blackhawk","",{
	
	["RHS_UH60M"] execvm "insurgency_core\client\sys_player\vehicles\transheli.sqf"
	
	},_transportcond2] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawntransport"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;
	

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Wildcat","",{
	
	["UK3CB_BAF_Wildcat_AH1_CAS_8B"] execvm "insurgency_core\client\sys_player\vehicles\casheli.sqf"
	
	},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawncas"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;

	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Venom","",{
	
	["RHS_UH1Y_d"] execvm "insurgency_core\client\sys_player\vehicles\casheli.sqf"
	
	},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawncas"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_helispawn1 = ["SpawnsmallcharlieCreate","Spawn Hind","",{
	
	["rhsgref_cdf_b_Mi24D_Early"] execvm "insurgency_core\client\sys_player\vehicles\casheli.sqf"
	
	},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawn", "vehiclespawncas"],_helispawn1,true] call ace_interact_menu_fnc_addActionToClass;

	
	
	////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////

	

	_action = ["SpawnUKCreate","Spawn Large UK Crate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_action,true] call ace_interact_menu_fnc_addActionToClass;
	
	_action1 = ["SpawnCharlieCreate","Spawn Large US Crate","",{"twc_forwardBase_CharlieAmmoBox" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_action1,true] call ace_interact_menu_fnc_addActionToClass;

	_actionempty = ["SpawnemptyCreate","Spawn Large Empty Crate","",{"TWC_AmmoBox_Other_Pallet_pub" createVehicle (getPos AmmoBoxSpawner)},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_actionempty,true] call ace_interact_menu_fnc_addActionToClass;
	



	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateusmc.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionana = ["SpawnsmallUKCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionana,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateNAC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
		_hfstaction3 = ["spawn50","Spawn Spare Wheels","",{execvm "insurgency_core\client\sys_player\boxes\Repairkit.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction5 = ["spawnm6","Spawn M6 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\smallMortarAmmo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\40ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	/*
	
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateumcs.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_hUKactionana = ["SpawnsmallUKCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hUKactionana,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateNAC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction5 = ["spawnm6","Spawn M6 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\smallMortarAmmo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\40ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	*/
	
	

	
};
	


if((typeOf player) in ["2000_British_HeliPilot_Desert","2000_British_HeliPilot"])then{


	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn US Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateUS2000.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk2000.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
		_hUKactionana = ["SpawnsmallUKCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	

	
};


