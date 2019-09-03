



twc_loadout_fstus_sl = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_cu_ocp_10th";
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
	_unit addVest "rhsusf_spcs_ocp_teamleader";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	_unit addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	_unit addWeapon "twc_m4_acog_lazer";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";
	_unit addBackpack "UK3CB_BAF_B_Bergen_TAN_SL_A";
	for "_i" from 1 to 7 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	_unit addItemToBackpack "ACRE_PRC117F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
};

twc_loadout_fstus_assistant = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_cu_ocp_10th";
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
	_unit addVest "rhsusf_spcs_ocp_saw";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	//for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	//_unit addItemToVest "SmokeShell";
	//_unit addItemToVest "UK3CB_BAF_762_200Rnd_T";
	//_unit addItemToVest "B_IR_Grenade";
	_unit addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	_unit addBackpack "B_Carryall_cbr";
	_unit addItemToVest "UK3CB_BAF_762_200Rnd_T";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "UK3CB_BAF_762_200Rnd_T";};
	_unit addWeapon "twc_rhs_weap_m240B_mgo_lazer";
	_unit addWeapon "rhsusf_weap_glock17g4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};


twc_loadout_fstus_observer = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_cu_ocp_10th";
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
	_unit addVest "rhsusf_iotv_ocp_Rifleman";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";};
	_unit addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	_unit addWeapon "twc_rhs_weap_m4a1_m203_acog_lazer";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addBackpack "B_Kitbag_mcamo";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};




twc_loadout_fstbaf_sl = {params ["_unit"];

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
	_unit addVest "UK3CB_BAF_V_Osprey_Lite";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "UK3CB_BAF_556_30Rnd";};
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Net_D";

	_unit addWeapon "UK3CB_BAF_L85A2_RIS_ELCAN3D";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";
	_unit addBackpack "TWC_Backpack_Modern_Sectionlead";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
};

twc_loadout_fstbaf_assistant = {params ["_unit"];

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
	_unit addVest "UK3CB_BAF_V_Osprey_Lite";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "UK3CB_BAF_556_30Rnd";};
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Net_D";

	_unit addWeapon "UK3CB_BAF_L85A2_RIS_ELCAN3D";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addBackpack "UK3CB_BAF_B_Carryall_MTP";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};


twc_loadout_fstbaf_observer = {params ["_unit"];

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
	_unit addVest "UK3CB_BAF_V_Osprey_Grenadier_A";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "Laserbatteries";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BAF_556_30Rnd";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";};
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Net_D";

	_unit addWeapon "UK3CB_BAF_L85A2_UGL_ELCAN3D";
	_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addBackpack "TWC_Backpack_Modern_FSTForwardObserver";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};


