



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
	_unit addVest "rhsusf_spcs_ocp_rifleman";
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	_unit addHeadgear "rhsusf_opscore_ut_pelt";
	
	_unit addWeapon "twc_mk18_us_eotech";
	_unit addWeapon "rhsusf_weap_glock17g4";
	
	_unit addBackpack "TWC_Backpack_USMC2000_Medic";

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
