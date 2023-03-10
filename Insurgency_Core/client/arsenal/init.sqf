[arsenalAmmoBox,[""],false] call Bis_fnc_addVirtualWeaponCargo;
[arsenalAmmoBox,["ACE_EarPlugs","ACRE_PRC343","ACE_CableTie","ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_quikclot","ACE_morphine","ACE_epinephrine","ACE_tourniquet","ACE_splint","ACE_MapTools","ACE_SpareBarrel_Item","B_IR_Grenade","HandGrenade","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"],false] call BIS_fnc_addVirtualMagazineCargo;
[arsenalAmmoBox,["ItemMap","ItemCompass","ItemWatch","twc_nightvision_gen3"],false] call Bis_fnc_addVirtualItemCargo;

//British Section
if (typeOf vehicle player in ["Modern_British_Squadleader", "Modern_British_Squadleader_Light", "Modern_British_FSTCommander", "Modern_Artillery_Commander"]) then {
	execVM "client\arsenal\BAF_SC.sqf";
};
if (typeOf vehicle player in ["Modern_British_Pointman", "Modern_British_Pointman_Light", "Modern_British_FSTAssistant", "Modern_Artillery_Gunner"]) then {
	execVM "client\arsenal\BAF_PM.sqf";
};
if (typeOf vehicle player in ["Modern_British_Grenadier_COIN", "Modern_British_Grenadier_COIN_Light"]) then {
	execVM "client\arsenal\BAF_Gren.sqf";
};
if (typeOf vehicle player in ["Modern_British_Autorifleman_COIN", "Modern_British_Autorifleman_COIN_Light"]) then {
	execVM "client\arsenal\BAF_AR.sqf";
};
if (typeOf vehicle player in ["Modern_British_Machinegunner", "Modern_British_Machinegunner_Light"]) then {
	execVM "client\arsenal\BAF_MG.sqf";
};
if (typeOf vehicle player in ["Modern_British_Marksman_COIN", "Modern_British_Marksman_COIN_Light"]) then {
	execVM "client\arsenal\BAF_MK.sqf";
};
if (typeOf vehicle player in ["Modern_British_2IC_COIN", "Modern_British_2IC_COIN_Light"]) then {
	execVM "client\arsenal\BAF_2IC.sqf";
};
if (typeOf vehicle player in ["Modern_British_Medic", "Modern_British_Medic_Light"]) then {
	execVM "client\arsenal\BAF_Med.sqf";
};

//ANA Section
if (typeOf vehicle player in ["twc_ana_commander"]) then {
	execVM "client\arsenal\ANA_SC.sqf";
};
if (typeOf vehicle player in ["twc_ana_base", "twc_ana_mg_as"]) then {
	execVM "client\arsenal\ANA_RF.sqf";
};
if (typeOf vehicle player in ["twc_ana_rifleman_at"]) then {
	execVM "client\arsenal\ANA_AT.sqf";
};
if (typeOf vehicle player in ["twc_ana_mg"]) then {
	execVM "client\arsenal\ANA_MG.sqf";
};
if (typeOf vehicle player in ["twc_ana_marksman"]) then {
	execVM "client\arsenal\ANA_MK.sqf";
};
if (typeOf vehicle player in ["twc_ana_subcommander"]) then {
	execVM "client\arsenal\ANA_2IC.sqf";
};
if (typeOf vehicle player in ["twc_ana_interpreter"]) then {
	execVM "client\arsenal\ANA_Terp.sqf";
};
if (typeOf vehicle player in ["twc_ana_medic"]) then {
	execVM "client\arsenal\ANA_Med.sqf";
};

//Bundeswehr Section
if (typeOf vehicle player in ["Modern_ger_commander", "Modern_ger_commander_d"]) then {
	execVM "client\arsenal\GER_SC.sqf";
};
if (typeOf vehicle player in ["Modern_ger_Base", "Modern_ger_Base_d"]) then {
	execVM "client\arsenal\GER_RF.sqf";
};
if (typeOf vehicle player in ["Modern_ger_grenadier", "Modern_ger_grenadier_d"]) then {
	execVM "client\arsenal\GER_Gren.sqf";
};
if (typeOf vehicle player in ["Modern_ger_rif_AT", "Modern_ger_rif_AT_d"]) then {
	execVM "client\arsenal\GER_AT.sqf";
};
if (typeOf vehicle player in ["Modern_ger_mg", "Modern_ger_mg_d"]) then {
	execVM "client\arsenal\GER_MG.sqf";
};
if (typeOf vehicle player in ["Modern_ger_subcommander", "Modern_ger_subcommander_d"]) then {
	execVM "client\arsenal\GER_2IC.sqf";
};
if (typeOf vehicle player in ["Modern_ger_medic", "Modern_ger_medic_d"]) then {
	execVM "client\arsenal\GER_Med.sqf";
	
//US Army
if (typeOf vehicle player in ["TWC_Modern_US_Army_SectionCommander"]) then {
	execVM "client\arsenal\US_SC.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Rifleman"]) then {
	execVM "client\arsenal\US_RF.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Grenadier"]) then {
	execVM "client\arsenal\US_Gren.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_AutomaticRifleman"]) then {
	execVM "client\arsenal\US_AR.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Marksman"]) then {
	execVM "client\arsenal\US_MK.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_TeamLeader"]) then {
	execVM "client\arsenal\US_2IC.sqf";
};
if (typeOf vehicle player in ["TWC_Modern_US_Army_Medic"]) then {
	execVM "client\arsenal\US_Med.sqf";

//USMC Squad
if (typeOf vehicle player in ["Modern_USMC_Squadleader", "Modern_USMC_Squadleader_d"]) then {
	execVM "client\arsenal\USMC_SC.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Rifleman", "Modern_USMC_Rifleman_d", "Modern_USMC_AsstAutorifleman", "Modern_USMC_AsstAutorifleman_d", "Modern_USMC_AsstMachineGunner", "Modern_USMC_AsstMachineGunner"]) then {
	execVM "client\arsenal\USMC_RF.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Breacher", "Modern_USMC_Breacher_d"]) then {
	execVM "client\arsenal\USMC_PM.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Autorifleman", "Modern_USMC_Autorifleman_d"]) then {
	execVM "client\arsenal\USMC_AR.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_MachineGunner", "Modern_USMC_MachineGunner_d"]) then {
	execVM "client\arsenal\USMC_MG.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Teamleader", "Modern_USMC_Teamleader_d"]) then {
	execVM "client\arsenal\USMC_2IC.sqf";
};
if (typeOf vehicle player in ["Modern_USMC_Medic", "Modern_USMC_Medic_d"]) then {
	execVM "client\arsenal\USMC_Med.sqf";

//Polish Land Forces Squad
if (typeOf vehicle player in ["Modern_pol_commander", "Modern_pol_commander_d"]) then {
	execVM "client\arsenal\POL_SC.sqf";
};
if (typeOf vehicle player in ["Modern_pol_Base", "Modern_pol_Base_d"]) then {
	execVM "client\arsenal\POL_RF.sqf";
};
if (typeOf vehicle player in ["Modern_pol_rifleman_at", "Modern_pol_rifleman_at_d"]) then {
	execVM "client\arsenal\POL_AT.sqf";
};
if (typeOf vehicle player in ["Modern_pol_grenadier", "Modern_pol_grenadier_d"]) then {
	execVM "client\arsenal\POL_Gren.sqf";
};
if (typeOf vehicle player in ["Modern_pol_mg", "Modern_pol_mg_d"]) then {
	execVM "client\arsenal\POL_MG.sqf";
};
if (typeOf vehicle player in ["Modern_pol_subcommander", "Modern_pol_subcommander_d"]) then {
	execVM "client\arsenal\POL_2IC.sqf";
};
if (typeOf vehicle player in ["Modern_pol_medic", "Modern_pol_medic_d"]) then {
	execVM "client\arsenal\POL_Med.sqf";
};

//Attachments

if (typeOf vehicle player in ["Modern_British_HeliPilot", "Modern_British_crewchief", "Modern_British_JetPilot"]) then {
	execVM "client\arsenal\BAF_Pil.sqf";
};
if (typeOf vehicle player in ["Modern_British_Sniper", "Modern_British_Spotter"]) then {
	execVM "client\arsenal\BAF_Snip.sqf";
};
if (typeOf vehicle player in ["Modern_British_FAC", "Modern_British_FSTForwardObserver"]) then {
	execVM "client\arsenal\BAF_FAC.sqf";
};
if (typeOf vehicle player in ["Modern_British_VehicleCrew"]) then {
	execVM "client\arsenal\BAF_FAC.sqf";
};
if (typeOf vehicle player in ["Modern_British_VehicleCommander"]) then {
	execVM "client\arsenal\BAF_FAC.sqf";
};
