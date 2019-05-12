



twc_loadout_fst_sl = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_cu_ocp_10th";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
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
	player addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	player addWeapon "twc_m4_acog_lazer";
	player addWeapon "rhsusf_weap_glock17g4";
	player addWeapon "ACE_Vector";
	player addBackpack "TWC_Backpack_Modern_Sectionlead";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemcTab";
};

twc_loadout_fst_assistant = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_cu_ocp_10th";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
	player addItemToUniform "ACE_MapTools";
	player addVest "rhsusf_spcs_ocp_saw";
	player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 2 do {player addItemToBackpack "UK3CB_BAF_762_200Rnd_T";};
	player addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	player addWeapon "twc_rhs_weap_m240B_mgo_lazer";
	player addWeapon "rhsusf_weap_glock17g4";
	player addBackpack "B_Carryall_cbr";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};


twc_loadout_fst_observer = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_cu_ocp_10th";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_morphine";
	player addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
	player addItemToUniform "ACE_MapTools";
	player addVest "rhsusf_iotv_ocp_Rifleman";
	player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	for "_i" from 1 to 8 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 6 do {player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";};
	player addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	player addWeapon "twc_rhs_weap_m4a1_m203_acog_lazer";
	player addWeapon "rhsusf_weap_glock17g4";
	player addBackpack "B_Kitbag_mcamo";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};


