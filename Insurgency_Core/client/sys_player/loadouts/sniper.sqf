



twc_loadout_ussniper_shooter = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_cu_ocp_1stcav";
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
	player addVest "rhsusf_spcs_ocp_sniper";
	player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 9 do {player addItemToVest "rhsusf_5Rnd_762x51_m993_Mag";};
	player addHeadgear "rhsusf_ach_bare_tan_headset";

	player addWeapon "twc_m4_acog_lazer";
	player addWeapon "rhsusf_weap_glock17g4";
	player addWeapon "ACE_Vector";
	player addBackpack "TWC_Backpack_Modern_Sectionlead";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
};

twc_loadout_ussniper_spotter = {

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;

	player forceAddUniform "rhs_uniform_cu_ocp_1stcav";
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
	player addVest "rhsusf_spcs_ocp_sniper";
	player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
	player addItemToVest "SmokeShell";
	player addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	for "_i" from 1 to 7 do {player addItemToBackpack "rhsusf_5Rnd_762x51_m993_Mag";};
	player addItemTobackpack "ACRE_PRC148";
	player addItemTobackpack "ACE_ATragMX";
	player addItemTobackpack "ACE_Kestrel4500";
	player addItemTobackpack "ACE_Tripod";
	player addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	player addWeapon "twc_m4_acog_lazer";
	player addWeapon "rhsusf_weap_glock17g4";
	player addWeapon "ACE_Vector";
	player addBackpack "B_Carryall_cbr";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemcTab";
};

