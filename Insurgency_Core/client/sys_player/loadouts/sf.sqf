



twc_loadout_st6_sl = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform (["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom);
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
	_vest = ["twc_aor1_spc_squadleader", "twc_oli_spc_squadleader", "twc_mtp_spc_squadleader", "rhsusf_plateframe_teamleader", "twc_rhsusf_plateframe_SL_aor1", "CUP_V_B_Armatus_US_MCam", "CUP_V_B_Armatus_OD", "CUP_V_B_Armatus_BB_US_MCam", "CUP_V_B_Armatus_BB_OD", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_MCam", "CUP_V_B_Ciras_Olive", "CUP_V_B_JPC_MCam", "CUP_V_B_JPC_Tan"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	
	
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt_nsw";

	_unit addWeapon "twc_hk416_mag_desert";
	
	_unit addWeapon "rhsusf_weap_glock17g4"; //CUP_hgun_MP7_desert after cup update
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom);
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
	
	_vest = ["twc_aor1_spc_squadleader", "twc_oli_spc_squadleader", "twc_mtp_spc_squadleader", "rhsusf_plateframe_teamleader", "twc_rhsusf_plateframe_SL_aor1", "twc_rhsusf_plateframe_rifleman_aor1"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	
	_unit addVest "twc_rhsusf_plateframe_rifleman_aor1";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt_nsw";

	_unit addWeapon "twc_hk416_mag_desert";
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_MX2A";
	_unit addBackpack "twc_genbackPack_tan";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "CUP_30Rnd_556x45_Emag";};
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "DemoCharge_Remote_Mag";
	_unit addItemToBackpack "ACE_M26_Clacker";
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom);
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
	
	_vest = ["twc_rhsusf_plateframe_pointman_aor1", "twc_rhsusf_plateframe_rifleman_aor1"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsusf_mag_40Rnd_46x30_FMJ";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt_nsw";
	
	_unit addWeapon "rhsusf_weap_MP7A2_desert";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom);
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
	
	_vest = ["twc_rhsusf_plateframe_pointman_aor1", "twc_rhsusf_plateframe_rifleman_aor1"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt_nsw";
	
	_unit addWeapon "twc_hk416_mag_desert";
	
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom);
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
	
	_vest = ["twc_rhsusf_plateframe_grenadier_mtp", "twc_rhsusf_plateframe_rifleman_aor1"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 16 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_unit addHeadgear "rhsusf_opscore_aor1_pelt_nsw";
	
	_unit addWeapon "twc_hk416_mag_desert";
	
	_unit addWeapon "rhs_weap_M320";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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
	["twc_sr25_us_marksman", "rhsusf_20Rnd_762x51_SR25_m993_Mag"], 
	["twc_m2010_scope", "rhsusf_5Rnd_300winmag_xm2010"]
	] call bis_fnc_selectrandom;

	_unit forceAddUniform (["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom);
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
	_unit addHeadgear "rhsusf_opscore_aor1_pelt_nsw";
	
	_unit addWeapon (_wep select 0);
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform "rhs_uniform_g3_m81";
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
	
	_vest = ["twc_rhsusf_mbav_medic_aor1", "twc_aor1_spc_squadleader"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	
	_unit additemtovest "TWC_Item_Medical_SutureKit_20";
	for "_i" from 1 to 8 do {_unit addItemToVest "ACE_tourniquet";};
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_unit addHeadgear "H_HelmetB_light_sand";
	
	_unit addWeapon "twc_hk416_mag_desert";
	_unit addWeapon "rhsusf_weap_glock17g4";
	
	_unit addBackpack "UK3CB_BAF_B_Kitbag_OLI";
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_salineIV_250";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_morphine";};

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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
	_unit addVest "twc_mtp_spc_squadleader";
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
	_unit addVest "twc_rhsusf_mbav_rifleman_mtp";
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
	_unit additemtovest "TWC_Item_Medical_SutureKit_20";
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


twc_loadout_anasf_sl = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	
	_vest = (["rhsusf_mbav_rifleman", "V_PlateCarrier1_blk", "V_I_G_resistanceLeader_F", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom);
	_uniform = (["rhsgref_uniform_woodland", "rhs_uniform_g3_m81"] call bis_fnc_selectrandom);

	_unit forceAddUniform _uniform;
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
	_unit addVest _vest;
	_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	_unit addHeadgear "CUP_H_USArmy_Helmet_ECH1_Black";

	_unit addWeapon "twc_rhs_weap_m4a1_acog_lazer";
	
	_unit addWeapon "rhsusf_weap_m9";
	_unit addWeapon "ACE_Vector";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
};

twc_loadout_anasf_2ic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_uniform = (["rhsgref_uniform_woodland", "rhs_uniform_g3_m81"] call bis_fnc_selectrandom);
	
	_unit forceAddUniform _uniform;
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
	_unit addVest "V_PlateCarrier1_rgr";
	_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	_unit addHeadgear "CUP_H_USArmy_Helmet_ECH1_Black";

	_unit addWeapon "twc_rhs_weap_m4a1_acog_lazer";
	
	_unit addWeapon "rhsusf_weap_m9";
	
	_unit addBackpack "twc_genbackPack_oli";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};



twc_loadout_anasf_pointman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_uniform = (["rhsgref_uniform_woodland", "rhs_uniform_g3_m81"] call bis_fnc_selectrandom);
	
	_vest = (["rhsusf_mbav_rifleman", "V_PlateCarrier1_blk", "V_I_G_resistanceLeader_F", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom);
	
	_unit forceAddUniform _uniform;
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
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	_unit addHeadgear "rhsusf_ach_bare";
	
	_unit addWeapon "twc_rhs_weap_m4a1_acog_lazer";
	
	_unit addWeapon "rhsusf_weap_m9";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};
twc_loadout_anasf_rifleman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_uniform = (["rhsgref_uniform_woodland", "rhs_uniform_g3_m81"] call bis_fnc_selectrandom);
	
	_vest = (["rhsusf_mbav_rifleman", "V_PlateCarrier1_blk", "V_I_G_resistanceLeader_F", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom);
	
	_unit forceAddUniform _uniform;
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
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	_unit addHeadgear "rhsusf_ach_bare";
	
	_unit addWeapon "twc_rhs_weap_m4a1_acog_lazer";
	
	_unit addWeapon "rhsusf_weap_m9";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};


twc_loadout_anasf_grenadier = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_uniform = (["rhsgref_uniform_woodland", "rhs_uniform_g3_m81"] call bis_fnc_selectrandom);
	
	_vest = (["rhsusf_mbav_rifleman", "V_PlateCarrier1_blk", "V_I_G_resistanceLeader_F", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom);
	
	_unit forceAddUniform _uniform;
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
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	for "_i" from 1 to 10 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 10 do {_unit addItemToUniform "1Rnd_HE_Grenade_shell";};
	_unit addHeadgear "rhsusf_ach_bare";
	
	_unit addWeapon "twc_rhs_weap_m4a1_m203_acog_lazer";
	
	_unit addWeapon "rhsusf_weap_m9";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

twc_loadout_anasf_marksman = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_uniform = (["rhsgref_uniform_woodland", "rhs_uniform_g3_m81"] call bis_fnc_selectrandom);
	
	_vest = "rhsusf_mbav_mg";
	
	_unit forceAddUniform _uniform;
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
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_200rnd_556x45_mixed_box";};
	_unit addHeadgear "rhsusf_ach_bare";
	
	_unit addWeapon "twc_rhs_weap_m249_pip_L_mgo_lazer";
	_unit addWeapon "rhsusf_weap_m9";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_200rnd_556x45_mixed_box";};

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	crateBox addMagazineCargo ["rhsusf_200rnd_556x45_mixed_box", 50];
};

twc_loadout_anasf_medic = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_uniform = (["rhsgref_uniform_woodland", "rhs_uniform_g3_m81"] call bis_fnc_selectrandom);
	
	_vest = (["rhsusf_mbav_rifleman", "V_PlateCarrier1_blk", "V_I_G_resistanceLeader_F", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom);
	
	_unit forceAddUniform _uniform;
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
	_unit additemtovest "TWC_Item_Medical_SutureKit_20";
	for "_i" from 1 to 8 do {_unit addItemToVest "ACE_tourniquet";};
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	_unit addHeadgear "rhsusf_ach_bare";
	
	_unit addWeapon "twc_rhs_weap_m4a1_acog_lazer";
	_unit addWeapon "rhsusf_weap_m9";
	
	_unit addBackpack "UK3CB_BAF_B_Kitbag_OLI";
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_salineIV_250";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_morphine";};

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

	_unit forceAddUniform (["rhs_uniform_g3_mc", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_V3_Full", "CUP_U_CRYE_V1_Roll", "CUP_U_CRYE_V2_Roll", "CUP_U_CRYE_V3_Roll"] call bis_fnc_selectrandom);
	
	
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
	_vest = ["rhsusf_spcs_ocp_teamleader", "twc_rhsusf_plateframe_SL_mtp", "twc_mtp_spc_squadleader", "CUP_V_B_Armatus_US_MCam", "CUP_V_B_Armatus_OD", "CUP_V_B_Armatus_BB_US_MCam", "CUP_V_B_Armatus_BB_OD", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_MCam", "CUP_V_B_Ciras_Olive", "CUP_V_B_JPC_MCam", "CUP_V_B_JPC_Tan"] call bis_fnc_selectrandom;
	
	
	
	_unit addVest _vest;
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_headgear = ["rhsusf_opscore_ut_pelt", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "rhsusf_opscore_mc_cover_pelt_cam"] call bis_fnc_selectrandom;
	
	//"CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Tan_SF" after cup update
	
	_unit addHeadgear _headgear;

	_gun = ["twc_m4b2_us_mag", "twc_m4b2_us_spectre", "twc_m4b2_us_eotech", "twc_m4b2_us_shortdot"] call bis_fnc_selectrandom;
	_unit addWeapon _gun;
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	_unit addBackpack "twc_ussf_scoutpack";
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemcTab";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_g3_mc", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_V3_Full", "CUP_U_CRYE_V1_Roll", "CUP_U_CRYE_V2_Roll", "CUP_U_CRYE_V3_Roll"] call bis_fnc_selectrandom);
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
	_vest = ["twc_rhsusf_plateframe_rifleman_mtp", "twc_rhsusf_mbav_rifleman_mtp"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_headgear = ["rhsusf_opscore_ut_pelt", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "rhsusf_opscore_mc_cover_pelt_cam"] call bis_fnc_selectrandom;
	_unit addHeadgear _headgear;

	_gun = ["twc_m4b2_us_mag", "twc_m4b2_us_spectre", "twc_m4b2_us_shortdot"] call bis_fnc_selectrandom;
	_unit addWeapon _gun;
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_MX2A";
	_unit addBackpack "TWC_Backpack_UKSF_2IC";

	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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
	_vest = ["twc_rhsusf_plateframe_rifleman_mtp", "twc_rhsusf_mbav_rifleman_mtp"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_headgear = ["rhsusf_opscore_ut_pelt", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "rhsusf_opscore_mc_cover_pelt_cam"] call bis_fnc_selectrandom;
	_unit addHeadgear _headgear;

	_gun = ["twc_m4b2_us_mag", "twc_m4b2_us_spectre", "twc_m4b2_us_eotech", "twc_m4b2_us_shortdot"] call bis_fnc_selectrandom;
	_unit addWeapon _gun;
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addBackpack "twc_ussf_scoutpack";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_g3_mc", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_V3_Full", "CUP_U_CRYE_V1_Roll", "CUP_U_CRYE_V2_Roll", "CUP_U_CRYE_V3_Roll"] call bis_fnc_selectrandom);
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
	_vest = ["twc_rhsusf_plateframe_rifleman_mtp", "twc_rhsusf_mbav_rifleman_mtp"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_headgear = ["rhsusf_opscore_ut_pelt", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "rhsusf_opscore_mc_cover_pelt_cam"] call bis_fnc_selectrandom;
	_unit addHeadgear _headgear;

	_gun = ["twc_m4b2_us_mag", "twc_m4b2_us_spectre", "twc_m4b2_us_eotech", "twc_m4b2_us_shortdot"] call bis_fnc_selectrandom;
	_unit addWeapon _gun;
	
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addBackpack "twc_ussf_scoutpack";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_g3_mc", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_V3_Full", "CUP_U_CRYE_V1_Roll", "CUP_U_CRYE_V2_Roll", "CUP_U_CRYE_V3_Roll"] call bis_fnc_selectrandom);
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
	_vest = ["rhsusf_plateframe_grenadier", "twc_rhsusf_mbav_grenadier_mtp", "twc_rhsusf_plateframe_grenadier_mtp"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 16 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_headgear = ["rhsusf_opscore_ut_pelt", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "rhsusf_opscore_mc_cover_pelt_cam"] call bis_fnc_selectrandom;
	_unit addHeadgear _headgear;

	_gun = ["twc_m4b2_us_mag", "twc_m4b2_us_spectre", "twc_m4b2_us_eotech", "twc_m4b2_us_shortdot"] call bis_fnc_selectrandom;
	_unit addWeapon _gun;
	
	_unit addWeapon "rhs_weap_M320";
	_unit addBackpack "twc_ussf_scoutpack";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_g3_mc", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_V3_Full", "CUP_U_CRYE_V1_Roll", "CUP_U_CRYE_V2_Roll", "CUP_U_CRYE_V3_Roll"] call bis_fnc_selectrandom);
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
	_vest = ["twc_rhsusf_plateframe_rifleman_mtp", "twc_rhsusf_mbav_rifleman_mtp"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	_unit addItemToVest "ACE_tourniquet";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_headgear = ["rhsusf_opscore_ut_pelt", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "rhsusf_opscore_mc_cover_pelt_cam"] call bis_fnc_selectrandom;
	_unit addHeadgear _headgear;
	
	_unit addWeapon "twc_m4b2_us_marksman";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addBackpack "twc_ussf_scoutpack";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
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

	_unit forceAddUniform (["rhs_uniform_g3_mc", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_V3_Full", "CUP_U_CRYE_V1_Roll", "CUP_U_CRYE_V2_Roll", "CUP_U_CRYE_V3_Roll"] call bis_fnc_selectrandom);
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
	_vest = ["twc_rhsusf_plateframe_rifleman_mtp", "twc_rhsusf_mbav_rifleman_mtp"] call bis_fnc_selectrandom;
	_unit addVest _vest;
	_unit additemtovest "TWC_Item_Medical_SutureKit_20";
	for "_i" from 1 to 8 do {_unit addItemToVest "ACE_tourniquet";};
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Emag";};
	_unit addHeadgear "rhsusf_mich_bare_norotos_arc_alt_tan";

	_gun = ["twc_m4b2_us_mag", "twc_m4b2_us_spectre", "twc_m4b2_us_eotech", "twc_m4b2_us_shortdot"] call bis_fnc_selectrandom;
	_unit addWeapon _gun;
	_unit addWeapon "rhsusf_weap_glock17g4";
	
	_unit addBackpack "UK3CB_BAF_B_Kitbag_TAN";
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_salineIV_250";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_morphine";};
//morphine epi
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if ((daytime > 16) || (daytime < 7)) then {
		_unit linkitem "CUP_NVG_GPNVG_black";
	};
	crateBox addMagazineCargo ["CUP_30Rnd_556x45_Emag", 50];
};


