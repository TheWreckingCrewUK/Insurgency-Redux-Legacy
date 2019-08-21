



twc_loadout_ussniper_shooter = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_cu_ocp_1stcav";
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
	_unit addVest "rhsusf_spcs_ocp_sniper";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 37 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m993_Mag";};
	_unit addHeadgear "rhsusf_ach_bare_tan_headset";

	_unit addWeapon "twc_m24_usarmy";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	crateBox addMagazineCargo ["rhsusf_5Rnd_762x51_m993_Mag", 50];
};

twc_loadout_ussniper_spotter = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_cu_ocp_1stcav";
	_unit addBackpack "B_Carryall_cbr";
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
	_unit addVest "rhsusf_spcs_ocp_sniper";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	for "_i" from 1 to 40 do {_unit addItemToBackpack "rhsusf_5Rnd_762x51_m993_Mag";};
	_unit addItemTobackpack "ACRE_PRC148";
	_unit addItemToVest "ACE_ATragMX";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemTobackpack "ACE_Tripod";
	_unit addHeadgear "rhsusf_ach_helmet_ESS_ocp";

	_unit addWeapon "twc_m4_spotter";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	
	crateBox addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_PMAG", 50];
	crateBox addMagazineCargo ["rhsusf_5Rnd_762x51_m993_Mag", 50];
};


twc_loadout_usmcsniper_shooter = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	
	
	if ((missionnamespace getvariable ["twc_wdveh",0]) == 1) then {
		_unit forceAddUniform "rhs_uniform_FROG01_wd";
	} else {
		_unit forceAddUniform "rhs_uniform_FROG01_d";
	};
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
	_unit addVest "rhsusf_mbav_rifleman";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 37 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m993_Mag";};
	
	if ((missionnamespace getvariable ["twc_wdveh",0]) == 1) then {
		_unit addHeadgear "rhsusf_mich_helmet_marpatwd_headset";
	} else {
		_unit addHeadgear "rhsusf_ach_bare_tan_headset";
	};
	

	_unit addWeapon "twc_m40_d_sniper";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	crateBox addMagazineCargo ["rhsusf_5Rnd_762x51_m993_Mag", 50];
};

twc_loadout_usmcsniper_spotter = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	if ((missionnamespace getvariable ["twc_wdveh",0]) == 1) then {
		_unit forceAddUniform "rhs_uniform_FROG01_wd";
	} else {
		_unit forceAddUniform "rhs_uniform_FROG01_d";
	};
	_unit addBackpack "twc_tan_belt_2";
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
	_unit addVest "rhsusf_mbav_rifleman";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	for "_i" from 1 to 40 do {_unit addItemToBackpack "rhsusf_5Rnd_762x51_m993_Mag";};
	_unit addItemTobackpack "ACRE_PRC148";
	_unit addItemToVest "ACE_ATragMX";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemTobackpack "ACE_Tripod";
	if ((missionnamespace getvariable ["twc_wdveh",0]) == 1) then {
		_unit addHeadgear "rhsusf_mich_helmet_marpatwd_headset";
	} else {
		_unit addHeadgear "rhsusf_ach_bare_tan_headset";
	};

	_unit addWeapon "twc_m4_spotter";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	
	crateBox addMagazineCargo ["rhsusf_5Rnd_762x51_m993_Mag", 50];
	crateBox addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_PMAG", 50];
};



twc_loadout_bafsniper_shooter = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	
	
	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	
	_unit addBackpack "twc_mtp_belt";
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
	_unit addVest "UK3CB_BAF_V_Osprey_Rifleman_A";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 9 do {_unit addItemToVest "ACE_10Rnd_338_300gr_HPBT_Mag";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_10Rnd_338_300gr_HPBT_Mag";};
	
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Scrim_A";
	

	_unit addWeapon "twc_l115a3_wd";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

twc_loadout_bafsniper_spotter = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve";
	
	_unit addBackpack "TWC_Backpack_Modern_Spotter_coin";
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
	_unit addVest "UK3CB_BAF_V_Osprey_Marksman_A";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "UK3CB_BAF_762_L42A1_20Rnd_T";};
	_unit addItemToVest "ACE_ATragMX";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemTobackpack "ACE_Tripod";
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Scrim_A";

	_unit addWeapon "twc_l129a1_spotter";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
};

twc_loadout_uksfsniper_shooter = {
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
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "CUP_V_OI_TKI_Jacket4_06";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "SmokeShell";
	for "_i" from 1 to 11 do {_unit addItemToUniform "ACE_7Rnd_408_305gr_Mag";};
	for "_i" from 1 to 11 do {_unit addItemToVest "ACE_7Rnd_408_305gr_Mag";};
	
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	

	_unit addWeapon "srifle_LRR_F";
	_unit addPrimaryweaponitem "RKSL_optic_PMII_525";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "ACE_7Rnd_408_305gr_Mag";
	crateBox addMagazineCargo ["ACE_7Rnd_408_305gr_Mag", 50];
};

twc_loadout_uksfsniper_spotter = {
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
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "CUP_V_O_SLA_M23_1_OD";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	_unit addItemToVest "ACE_ATragMX";
	_unit addItemToVest "ACE_Kestrel4500";
	for "_i" from 1 to 5 do {_unit addItemToUniform "UK3CB_BAF_762_L42A1_20Rnd_T";};
	for "_i" from 1 to 6 do {_unit addItemToVest "UK3CB_BAF_762_L42A1_20Rnd_T";};
	for "_i" from 1 to 8 do {_unit addItemToVest "ACE_7Rnd_408_305gr_Mag";};
	_unit addItemToVest "ACE_Tripod";
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";

	_unit addWeapon "TWC_HK417_scope_bipod";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	
	crateBox addMagazineCargo ["UK3CB_BAF_762_L42A1_20Rnd_T", 50];
	crateBox addMagazineCargo ["ACE_7Rnd_408_305gr_Mag", 50];
};


twc_loadout_cagsniper_shooter = {
	params ["_unit"];

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
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 41 do {_unit addItemToVest "rhsusf_5Rnd_300winmag_xm2010";};
	
	_unit addHeadgear "rhsusf_opscore_ut_pelt";
	

	_unit addWeapon "twc_m2010_scope";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	crateBox addMagazineCargo ["rhsusf_5Rnd_300winmag_xm2010", 50];
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};

twc_loadout_cagsniper_spotter = {
	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_g3_mc";
	
	_unit addBackpack "UK3CB_BAF_B_Kitbag_TAN";
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
	_unit addVest "rhsusf_spcs_ocp_sniper";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";};
	for "_i" from 1 to 40 do {_unit addItemToBackpack "rhsusf_5Rnd_300winmag_xm2010";};
	_unit addItemToVest "ACE_ATragMX";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemTobackpack "ACE_Tripod";
	_unit addItemTobackpack "ACRE_PRC148";
	_unit addHeadgear "rhsusf_opscore_ut_pelt";

	_unit addWeapon "twc_m4b2_us_marksman";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	
	crateBox addMagazineCargo ["rhsusf_5Rnd_300winmag_xm2010", 50];
	crateBox addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red", 50];
	if ((daytime > 16) || (daytime < 7)) then {
		crateBox addItemCargo ["CUP_NVG_GPNVG_black", 1];
	};
};

