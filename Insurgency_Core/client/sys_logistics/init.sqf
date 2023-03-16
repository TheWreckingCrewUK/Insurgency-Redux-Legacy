//Generic Items, available to every role

[arsenalAmmoBox,[""],false] call Bis_fnc_addVirtualWeaponCargo;
[arsenalAmmoBox,["ACE_EarPlugs","ACE_CableTie","ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_quikclot","ACE_morphine","ACE_epinephrine","ACE_tourniquet","ACE_splint","ACE_MapTools","ACE_SpareBarrel_Item","B_IR_Grenade","HandGrenade","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"],false] call BIS_fnc_addVirtualMagazineCargo;
[arsenalAmmoBox,["ItemMap","ItemCompass","ItemWatch","twc_nightvision_gen3"],false] call Bis_fnc_addVirtualItemCargo;

//Role specific items, defined in .sqf files e.g BAF_SC.sqf. Crates that can be spawned by each role are also defined here.

//British Section
if (typeOf vehicle player in ["Modern_British_Squadleader", "Modern_British_Squadleader_Light", "Modern_British_FSTCommander", "Modern_Artillery_Commander"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_SC.sqf";
	_UKaction = ["SpawnsmallUKCrate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCrateUK.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};
if (typeOf vehicle player in ["Modern_British_Pointman", "Modern_British_Pointman_Light", "Modern_British_FSTAssistant", "Modern_Artillery_Gunner"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_PM.sqf";
};
if (typeOf vehicle player in ["Modern_British_Grenadier_COIN", "Modern_British_Grenadier_COIN_Light"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_Gren.sqf";
};
if (typeOf vehicle player in ["Modern_British_Autorifleman_COIN", "Modern_British_Autorifleman_COIN_Light"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_AR.sqf";
};
if (typeOf vehicle player in ["Modern_British_Machinegunner", "Modern_British_Machinegunner_Light"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_MG.sqf";
};
if (typeOf vehicle player in ["Modern_British_Marksman_COIN", "Modern_British_Marksman_COIN_Light"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_MK.sqf";
};
if (typeOf vehicle player in ["Modern_British_2IC_COIN", "Modern_British_2IC_COIN_Light"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_2IC.sqf";
	_UKaction = ["SpawnsmallUKCrate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCrateUK.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction5 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction6 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};
if (typeOf vehicle player in ["Modern_British_Medic", "Modern_British_Medic_Light"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_Med.sqf";
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

//ANA Section
if (typeOf vehicle player in ["twc_ana_commander"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_SC.sqf";
	_UKaction = ["SpawnsmallanaCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
};
if (typeOf vehicle player in ["twc_ana_base"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_Rfl.sqf";
};
if (typeOf vehicle player in ["twc_ana_rifleman_at"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_AT.sqf";
};
if (typeOf vehicle player in ["twc_ana_mg"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_MG.sqf";
};
if (typeOf vehicle player in ["twc_ana_mg_as"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_MG_Ass.sqf";
};
if (typeOf vehicle player in ["twc_ana_subcommander"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_2IC.sqf";
	_UKaction = ["SpawnsmallanaCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnsupport"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
};
if (typeOf vehicle player in ["twc_ana_interpreter"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_Terp.sqf";
};
if (typeOf vehicle player in ["twc_ana_medic"]) then {
	execVM "Insurgency_Core\client\sys_logistics\ANA_2010s\ANA_Med.sqf";
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

//Bundeswehr Section
if (typeOf vehicle player in ["Modern_ger_commander", "Modern_ger_commander_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Germany_2010s\GER_SC.sqf";
	_UKaction = ["SpawnsmallGerCrate","Spawn Small German Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateger.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction5 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction6 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};
if (typeOf vehicle player in ["Modern_ger_Base", "Modern_ger_Base_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Germany_2010s\GER_Rfl.sqf";
};
if (typeOf vehicle player in ["Modern_ger_grenadier", "Modern_ger_grenadier_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Germany_2010s\GER_Gren.sqf";
};
if (typeOf vehicle player in ["Modern_ger_rif_AT", "Modern_ger_rif_AT_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Germany_2010s\GER_AT.sqf";
};
if (typeOf vehicle player in ["Modern_ger_mg", "Modern_ger_mg_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Germany_2010s\GER_MG.sqf";
};
if (typeOf vehicle player in ["Modern_ger_subcommander", "Modern_ger_subcommander_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Germany_2010s\GER_2IC.sqf";
	_UKaction = ["SpawnsmallGerCrate","Spawn Small German Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateger.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction5 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction6 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};
if (typeOf vehicle player in ["Modern_ger_medic", "Modern_ger_medic_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Germany_2010s\GER_Med.sqf";
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};
//US Army
if (typeOf vehicle player in ["TWC_Modern_US_Army_SectionCommander"]) then {
	execVM "Insurgency_Core\client\sys_logistics\US_Army_2010s\US_SC.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Rifleman"]) then {
	execVM "Insurgency_Core\client\sys_logistics\US_Army_2010s\US_Rfl.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Grenadier"]) then {
	execVM "Insurgency_Core\client\sys_logistics\US_Army_2010s\US_Gren.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_AutomaticRifleman"]) then {
	execVM "Insurgency_Core\client\sys_logistics\US_Army_2010s\US_AR.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Marksman"]) then {
	execVM "Insurgency_Core\client\sys_logistics\US_Army_2010s\US_MK.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_TeamLeader"]) then {
	execVM "Insurgency_Core\client\sys_logistics\US_Army_2010s\US_2IC.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Medic"]) then {
	execVM "Insurgency_Core\client\sys_logistics\US_Army_2010s\US_Med.sqf";
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};
//USMC Squad
if (typeOf vehicle player in ["Modern_USMC_Squadleader", "Modern_USMC_Squadleader_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\USMC_2010s\USMC_SC.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Rifleman", "Modern_USMC_Rifleman_d", "Modern_USMC_AsstAutorifleman", "Modern_USMC_AsstAutorifleman_d", "Modern_USMC_AsstMachineGunner", "Modern_USMC_AsstMachineGunner"]) then {
	execVM "Insurgency_Core\client\sys_logistics\USMC_2010s\USMC_Rfl.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Breacher", "Modern_USMC_Breacher_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\USMC_2010s\USMC_PM.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Autorifleman", "Modern_USMC_Autorifleman_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\USMC_2010s\USMC_AR.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_MachineGunner", "Modern_USMC_MachineGunner_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\USMC_2010s\USMC_MG.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Teamleader", "Modern_USMC_Teamleader_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\USMC_2010s\USMC_2IC.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Medic", "Modern_USMC_Medic_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\USMC_2010s\USMC_Med.sqf";
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};
//Polish Land Forces Squad
if (typeOf vehicle player in ["Modern_pol_commander", "Modern_pol_commander_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\POL_SC.sqf";
	_UKaction = ["SpawnsmallPolCreate","Spawn Small Polish Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratepol.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction5 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnheavy"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;
	_UKaction6 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
};
if (typeOf vehicle player in ["Modern_pol_Base", "Modern_pol_Base_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Poland_2010s\POL_Rfl.sqf";
};
if (typeOf vehicle player in ["Modern_pol_rifleman_at", "Modern_pol_rifleman_at_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Poland_2010s\POL_AT.sqf";
};
if (typeOf vehicle player in ["Modern_pol_grenadier", "Modern_pol_grenadier_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Poland_2010s\POL_Gren.sqf";
};
if (typeOf vehicle player in ["Modern_pol_mg", "Modern_pol_mg_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Poland_2010s\POL_MG.sqf";
};
if (typeOf vehicle player in ["Modern_pol_subcommander", "Modern_pol_subcommander_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Poland_2010s\POL_2IC.sqf";
};
if (typeOf vehicle player in ["Modern_pol_medic", "Modern_pol_medic_d"]) then {
	execVM "Insurgency_Core\client\sys_logistics\Poland_2010s\POL_Med.sqf";
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

//Attachments

if (typeOf vehicle player in ["Modern_British_HeliPilot", "Modern_British_crewchief", "Modern_British_JetPilot"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_Pil.sqf";
};
if (typeOf vehicle player in ["Modern_British_Sniper", "Modern_British_Spotter"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_Snip.sqf";
};
if (typeOf vehicle player in ["Modern_British_FAC", "Modern_British_FSTForwardObserver"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_FAC.sqf";
};
if (typeOf vehicle player in ["Modern_British_VehicleCrew"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_VCrew.sqf";
};
if (typeOf vehicle player in ["Modern_British_VehicleCommander"]) then {
	execVM "Insurgency_Core\client\sys_logistics\BAF_2010s\BAF_VComm.sqf";
};
