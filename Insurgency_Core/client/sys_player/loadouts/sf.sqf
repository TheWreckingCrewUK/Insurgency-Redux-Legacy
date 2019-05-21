



twc_loadout_st6_sl = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "twc_aor1_spcs_SL";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt";

	_unit addWeapon "twc_mk18_us_lds";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};

twc_loadout_st6_2ic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "twc_rhsusf_plateframe_rifleman_aor1";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt";

	_unit addWeapon "twc_mk18_us_lds";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_MX2A";
	_unit addBackpack "twc_genbackPack_tan";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "DemoCharge_Remote_Mag";
	_unit addItemToBackpack "ACE_M26_Clacker";
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};



twc_loadout_st6_pointman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_pointman_aor1";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsusf_mag_40Rnd_46x30_FMJ";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt";
	
	_unit addWeapon "rhsusf_weap_MP7A2_desert";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
	crateBox addMagazineCargo ["rhsusf_mag_40Rnd_46x30_FMJ", 50];
};
twc_loadout_st6_rifleman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_rifleman_mtp";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_MAG";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};


twc_loadout_st6_grenadier = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_rifleman_mtp";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 16 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt";
	
	_unit addWeapon "twc_mk18_us_eotech";
	
	_unit addWeapon "rhs_weap_M320";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};

twc_loadout_st6_marksman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	
	
	_wep = [["twc_mk17_elcan", "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr"], 
	["twc_m4b2_us_marksman", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red"], 
	["twc_m2010_scope", "rhsusf_5Rnd_300winmag_xm2010"]
	] call bis_fnc_selectrandom;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_marskman_aor1";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest (_wep select 1);};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt";
	
	_unit addWeapon (_wep select 0);
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
	crateBox addMagazineCargo [(_wep select 1), 50];
};

twc_loadout_st6_medic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_mbav_medic_aor1";
	_uint additemtovest "TWC_Item_Medical_SutureKit_20";
	for "_i" from 1 to 8 do {_unit addItemToVest "ACE_tourniquet";};
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt";
	
	_unit addWeapon "TWC_UK3CB_ST6_mk18_10_EOTECH";
	_unit addWeapon "rhsusf_weap_glock17g4";
	
	_unit addBackpack "B_Kitbag_tan";
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_salineIV_250";};

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};




twc_loadout_uksf_sl = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "rhsusf_spcs_ocp_teamleader_alt";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt_cam";

	_unit addWeapon "TWC_UK3CB_BAF_L119A2_14_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
};

twc_loadout_uksf_2ic = {
	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "rhsusf_spcs_ocp_medic";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";

	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_MX2A";
	_unit addBackpack "TWC_Backpack_UKSF_2IC";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};



twc_loadout_uksf_pointman = {
	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};
twc_loadout_uksf_rifleman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_14_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};


twc_loadout_uksf_grenadier = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_plateframe_grenadier";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 16 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	
	_unit addWeapon "rhs_weap_M320";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

twc_loadout_uksf_marksman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_HK417_scope_bipod";
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

twc_loadout_uksf_medic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_uint additemtovest "TWC_Item_Medical_SutureKit_20";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	_unit addWeapon "rhsusf_weap_glock17g4";
	
	_unit addBackpack "TWC_Backpack_USMC2000_Medic";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};


twc_loadout_ussf_sl = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "rhsusf_spcs_ocp_teamleader";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_ut_pelt";

	_unit addWeapon "twc_mk18_us_lds";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};

twc_loadout_ussf_2ic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "twc_rhsusf_plateframe_rifleman_mtp";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_ut_pelt";

	_unit addWeapon "twc_mk18_us_lds";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_MX2A";
	_unit addBackpack "TWC_Backpack_UKSF_2IC";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};



twc_loadout_ussf_pointman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_rifleman_mtp";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_ut_pelt";
	
	_unit addWeapon "twc_mk18_us_mag";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};
twc_loadout_ussf_rifleman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_rifleman_mtp";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_ut_pelt";
	
	_unit addWeapon "twc_m4b2_us_eotech";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};


twc_loadout_ussf_grenadier = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_plateframe_grenadier";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 16 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_ut_pelt";
	
	_unit addWeapon "twc_mk18_us_eotech";
	
	_unit addWeapon "rhs_weap_M320";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};

twc_loadout_ussf_marksman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_rifleman_mtp";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_ut_pelt";
	
	_unit addWeapon "twc_m4b2_us_marksman";
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};

twc_loadout_ussf_medic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "twc_rhsusf_plateframe_rifleman_mtp";
	_uint additemtovest "TWC_Item_Medical_SutureKit_20";
	for "_i" from 1 to 8 do {_unit addItemToVest "ACE_tourniquet";};
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_mich_bare_norotos_arc_alt_tan";
	
	_unit addWeapon "twc_mk18_us_eotech";
	_unit addWeapon "rhsusf_weap_glock17g4";
	
	_unit addBackpack "UK3CB_BAF_B_Kitbag_TAN";
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_salineIV_250";};

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
	crateBox addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red", 50];
};




twc_loadout_uksf_sl = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "rhsusf_spcs_ocp_teamleader_alt";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt_cam";

	_unit addWeapon "TWC_UK3CB_BAF_L119A2_14_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
};

twc_loadout_uksf_2ic = {
	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "rhsusf_spcs_ocp_medic";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";

	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_MX2A";
	_unit addBackpack "TWC_Backpack_UKSF_2IC";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};



twc_loadout_uksf_pointman = {
	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};
twc_loadout_uksf_rifleman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_14_LDS";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};


twc_loadout_uksf_grenadier = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_plateframe_grenadier";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 16 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	
	_unit addWeapon "rhs_weap_M320";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

twc_loadout_uksf_marksman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_HK417_scope_bipod";
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

twc_loadout_uksf_medic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_EMAG_Tan";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	
	_unit addWeapon "TWC_UK3CB_BAF_L119A2_10_LDS";
	_unit addWeapon "rhsusf_weap_glock17g4";
	
	_unit addBackpack "TWC_Backpack_USMC2000_Medic";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};
