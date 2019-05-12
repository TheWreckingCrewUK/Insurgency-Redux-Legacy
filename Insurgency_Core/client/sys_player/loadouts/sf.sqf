



twc_loadout_ussf_sl = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC343";
	player addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
	player addItemToUniform "ACE_MapTools";
	player addVest "rhsusf_spcs_ocp_teamleader";
	player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	player addHeadgear "rhsusf_opscore_ut_pelt";

	player addWeapon "rhs_weap_mk18";
	player addPrimaryWeaponItem "rhsusf_acc_SF3P556";
	player addPrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F";
	player addPrimaryWeaponItem "RKSL_optic_LDS";
	player addWeapon "rhsusf_weap_glock17g4";
	player addWeapon "ACE_Vector";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemcTab";
};

twc_loadout_ussf_2ic = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC343";
	player addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
	player addItemToUniform "ACE_MapTools";
	player addVest "V_PlateCarrier1_rgr";
	player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	player addHeadgear "rhsusf_opscore_ut_pelt";

	player addWeapon "rhs_weap_mk18";
	player addPrimaryWeaponItem "rhsusf_acc_SF3P556";
	player addPrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F";
	player addPrimaryWeaponItem "RKSL_optic_LDS";
	player addWeapon "rhsusf_weap_glock17g4";
	player addWeapon "ACE_Vector";
	player addBackpack "TWC_Backpack_UKSF_2IC";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};



twc_loadout_ussf_rifleman = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {player addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	player addItemToUniform "ACE_tourniquet";
	player addVest "V_PlateCarrier1_rgr";
	player addItemToVest "ACE_tourniquet";
	player addItemToVest "ACE_MapTools";
	player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855_PMAG";};
	player addHeadgear "rhsusf_opscore_ut_pelt";
//make proper weapon at some point hobbs, don't forget
	player addWeapon "rhs_weap_m4a1_blockII_KAC_d";
	player addPrimaryWeaponItem "rhsusf_acc_SF3P556";
	player addPrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F";
	player addPrimaryWeaponItem "rhsusf_acc_EOTECH";
	player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
	player addWeapon "rhsusf_weap_glock17g4";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};


twc_loadout_ussf_grenadier = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {player addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	player addItemToUniform "ACE_tourniquet";
	player addVest "rhsusf_spcs_ocp_grenadier";
	player addItemToVest "ACE_tourniquet";
	player addItemToVest "ACE_MapTools";
	player addItemToVest "HandGrenade";
	for "_i" from 1 to 6 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855_PMAG";};
	player addHeadgear "rhsusf_opscore_ut_pelt";
//make proper weapon at some point hobbs, don't forget
	player addWeapon "rhs_weap_m4a1_blockII";
	player addPrimaryWeaponItem "rhsusf_acc_SF3P556";
	player addPrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F";
	player addPrimaryWeaponItem "rhsusf_acc_g33_xps3";
	player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
	player addWeapon "rhsusf_weap_glock17g4";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};

twc_loadout_ussf_marksman = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {player addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	player addItemToUniform "ACE_tourniquet";
	player addVest "rhsusf_spcs_ocp_grenadier";
	player addItemToVest "ACE_tourniquet";
	player addItemToVest "ACE_MapTools";
	player addItemToVest "HandGrenade";
	for "_i" from 1 to 6 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {player addItemToVest "rhsusf_5Rnd_300winmag_xm2010";};
	player addHeadgear "rhsusf_opscore_ut_pelt";
//make proper weapon at some point hobbs, don't forget
	player addWeapon "rhs_weap_XM2010_d";
	player addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
	player addPrimaryWeaponItem "RKSL_optic_PMII_312";
	player addWeapon "rhsusf_weap_glock17g4";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};

twc_loadout_ussf_medic = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_g3_mc";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {player addItemToUniform "ACE_CableTie";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	player addItemToUniform "ACE_tourniquet";
	player addVest "rhsusf_spcs_ocp_rifleman";
	player addItemToVest "ACE_tourniquet";
	player addItemToVest "ACE_MapTools";
	player addItemToVest "HandGrenade";
	for "_i" from 1 to 6 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	player addHeadgear "rhsusf_opscore_ut_pelt";
//make proper weapon at some point hobbs, don't forget
	player addWeapon "rhs_weap_mk18_d";
	player addPrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F";
	player addPrimaryWeaponItem "rhsusf_acc_EOTECH";
	player addWeapon "rhsusf_weap_glock17g4";
	
	player addBackpack "TWC_Backpack_USMC2000_Medic";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};
