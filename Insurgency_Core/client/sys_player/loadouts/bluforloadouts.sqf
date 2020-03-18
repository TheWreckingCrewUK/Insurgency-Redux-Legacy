/*
by hobbs
example: twc_loadout_usaf_jtac call twc_loadout_switchloadout
*/

twc_loadout_basicuniformitems = [["ACE_EarPlugs", 1], ["ACE_fieldDressing", 7], ["ACE_packingBandage", 5], ["ACE_elasticBandage", 5], ["ACE_quikclot", 4], ["ACE_tourniquet", 2], ["ACE_morphine", 1], ["ACE_epinephrine", 1], ["ACE_CableTie", 4], ["ACE_Canteen", 1]];

twc_loadout_basiclinkeditems = ["ItemMap", "ItemCompass", "ItemWatch"];

waituntil {!isnil "twc_crateitems"};

twc_loadout_usaf_jtac = [
	//uniform
	(["rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_PMC_Cap_EP_Grey",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 1], ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 5], ["rhs_mag_20Rnd_SCAR_762x51_m62_tracer", 3], ["HandGrenade", 2], ["SmokeShell", 2]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_JTAC_H_A",

	//backpackitems

	[["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 6], ["rhsusf_opscore_ut_pelt", 1], ["Laserbatteries", 2], ["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 5], ["1Rnd_SmokeBlue_Grenade_shell", 5], ["1Rnd_SmokeGreen_Grenade_shell", 5]],

	//night kit
	["rhs_uniform_g3_mc", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["Chemlight_red", 6], ["Chemlight_blue", 6]]],

	//weapons

	[["twc_mk17_elcan", []], ["rhs_weap_M320", []], ["UK3CB_BAF_Soflam_Laserdesignator", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 50], ["rhs_mag_20Rnd_SCAR_762x51_m62_tracer", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], []]

];
twc_loadout_baf_jtac = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"UK3CB_BAF_H_Mk7_Camo_ESS_B",

	//vest
	(["twc_warriorvest_dcs"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 2], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["UK3CB_BAF_556_30Rnd", 8], ["UK3CB_BAF_556_30Rnd_T", 3], ["HandGrenade", 2], ["SmokeShell", 2]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_JTAC_H_A",

	//backpackitems

	[["UK3CB_BAF_556_30Rnd", 6], ["UK3CB_BAF_556_30Rnd_T", 3], ["CUP_H_PMC_Cap_Back_EP_Grey", 1], ["Laserbatteries", 2], ["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 5], ["1Rnd_SmokeBlue_Grenade_shell", 5], ["1Rnd_SmokeGreen_Grenade_shell", 5]],

	//night kit
	["UK3CB_BAF_U_CombatUniform_MTP", "rhsusf_ANPVS_14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["Chemlight_red", 6], ["Chemlight_blue", 6]]],

	//weapons

	[["UK3CB_BAF_L85A2_UGL_ELCAN3D", []], ["rhsusf_weap_glock17g4", []], ["UK3CB_BAF_Soflam_Laserdesignator", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_556_30Rnd", 50], ["UK3CB_BAF_556_30Rnd_T", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["TWC_UK3CB_BAF_L119A2_10_MAG", 1]]]

];

twc_loadout_st6_sl = [
	//uniform
	(["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_aor1_pelt_nsw",

	//vest
	(["twc_aor1_spc_squadleader", "twc_oli_spc_squadleader", "twc_mtp_spc_squadleader", "rhsusf_plateframe_teamleader", "twc_rhsusf_plateframe_SL_aor1", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_MCam", "CUP_V_B_Ciras_Olive", "CUP_V_B_JPC_MCam", "CUP_V_B_JPC_Tan"] call bis_fnc_selectrandom),

	//vestitems

	[["rhsusf_mag_40Rnd_46x30_FMJ", 2], ["CUP_30Rnd_556x45_Emag", 7], ["HandGrenade", 2], ["SmokeShell", 1]],

	//backpack
	"rhsusf_falconii_breach",

	//backpackitems

	[["CUP_30Rnd_556x45_Emag", 5]],

	//night kit
	["rhs_uniform_g3_blk", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["twc_hgun_MP7A1", []], ["ACE_Vector", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_MP7A2_desert", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_30Rnd_556x45_Emag", 50], ["CUP_30Rnd_556x45_Emag_Tracer_Red", 10], ["rhsusf_mag_40Rnd_46x30_FMJ", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["B_Kitbag_tan", 2]]]

];

twc_loadout_st6_2ic = [
	//uniform
	(["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_aor1_pelt_nsw",

	//vest
	"twc_rhsusf_plateframe_rifleman_aor1",

	//vestitems

	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["CUP_30Rnd_556x45_Emag", 7], ["HandGrenade", 1], ["SmokeShell", 1]],

	//backpack
	"twc_genbackPack_tan",

	//backpackitems

	[["CUP_30Rnd_556x45_EMAG", 14], ["ACE_EntrenchingTool", 1], ["DemoCharge_Remote_Mag", 1], ["ACE_M26_Clacker", 1]],

	//night kit
	["rhs_uniform_g3_blk", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", ["cup_acc_cz_m3x"]], ["ACE_MX2A", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_MP7A2_desert", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_30Rnd_556x45_Emag", 50], ["CUP_30Rnd_556x45_Emag_Tracer_Red", 10], ["rhsusf_mag_40Rnd_46x30_FMJ", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];


twc_loadout_st6_pointman = [
	//uniform
	(["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_aor1_pelt_nsw",

	//vest
	(["twc_rhsusf_plateframe_pointman_aor1", "twc_rhsusf_plateframe_rifleman_aor1"] call bis_fnc_selectrandom),

	//vestitems

	[["rhsusf_mag_40Rnd_46x30_FMJ", 3], ["CUP_30Rnd_556x45_Emag", 8], ["HandGrenade", 2], ["SmokeShell", 1]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["CUP_30Rnd_556x45_Emag", 3], ["ACE_M84", 2]],

	//night kit
	["rhs_uniform_g3_blk", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["twc_hgun_MP7A1", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_MP7A2_desert", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_30Rnd_556x45_Emag", 50], ["CUP_30Rnd_556x45_Emag_Tracer_Red", 10], ["rhsusf_mag_17Rnd_9x19_JHP", 10], ["rhsusf_mag_40Rnd_46x30_FMJ", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_st6_rifleman = [
	//uniform
	(["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_aor1_pelt_nsw",

	//vest
	(["twc_rhsusf_plateframe_pointman_aor1", "twc_rhsusf_plateframe_rifleman_aor1"] call bis_fnc_selectrandom),

	//vestitems

	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["CUP_30Rnd_556x45_Emag", 8], ["HandGrenade", 2], ["SmokeShell", 1]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["CUP_30Rnd_556x45_Emag", 3], ["ACE_M84", 2]],

	//night kit
	["rhs_uniform_g3_blk", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_MP7A2_desert", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_30Rnd_556x45_Emag", 50], ["CUP_30Rnd_556x45_Emag_Tracer_Red", 10], ["rhsusf_mag_17Rnd_9x19_JHP", 10], ["rhsusf_mag_40Rnd_46x30_FMJ", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_st6_grenadier = [
	//uniform
	(["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_aor1_pelt_nsw",

	//vest
	(["twc_rhsusf_plateframe_grenadier_mtp"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_30Rnd_556x45_Emag", 8], ["1Rnd_HE_Grenade_shell", 15], ["HandGrenade", 1], ["SmokeShell", 1]],

	//backpack
	"twc_ussf_scoutpack",

	//backpackitems

	[["CUP_1Rnd_Smoke_M203", 5], ["CUP_30Rnd_556x45_Emag", 3]],

	//night kit
	["rhs_uniform_g3_blk", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["rhs_weap_M320", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_MP7A2_desert", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_30Rnd_556x45_Emag", 50], ["CUP_30Rnd_556x45_Emag_Tracer_Red", 10], ["rhsusf_mag_17Rnd_9x19_JHP", 10], ["rhsusf_mag_40Rnd_46x30_FMJ", 50], ["1Rnd_HE_Grenade_shell", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_st6_marksman = [
	//uniform
	(["rhs_uniform_FROG01_d", "rhs_uniform_FROG01_d", "rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_aor1_pelt_nsw",

	//vest
	(["twc_rhsusf_plateframe_marskman_aor1"] call bis_fnc_selectrandom),

	//vestitems

	[["HandGrenade", 1], ["SmokeShell", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 9]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 10]],

	//night kit
	["rhs_uniform_g3_blk", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[("twc_mk17_elcan"), []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	([""]),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_MP7A2_desert", 1], ["rhs_weap_sr25_sup_marsoc", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 50], ["rhs_mag_20Rnd_SCAR_762x51_m62_tracer", 10], ["rhsusf_20Rnd_762x51_SR25_m993_Mag", 50], ["rhsusf_20Rnd_762x51_SR25_m62_Mag", 10], ["rhsusf_mag_17Rnd_9x19_JHP", 10], ["rhsusf_mag_40Rnd_46x30_FMJ", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


twc_loadout_st6_medic = [
	//uniform
	(["rhs_uniform_g3_m81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"H_HelmetB_light_sand",

	//vest
	(["twc_rhsusf_mbav_medic_aor1", "twc_aor1_spc_squadleader"] call bis_fnc_selectrandom),

	//vestitems

	[["TWC_Item_Medical_SutureKit_20", 1], ["ACE_tourniquet", 3], ["rhsusf_mag_17Rnd_9x19_JHP", 3], ["CUP_30Rnd_556x45_Emag", 8]],

	//backpack
	"UK3CB_BAF_B_Kitbag_OLI",

	//backpackitems

	[["ACE_fieldDressing", 25], ["ACE_packingBandage", 25], ["ACE_elasticBandage", 25], ["ACE_quikclot", 25], ["ACE_salineIV_500", 15], ["ACE_salineIV_250", 10], ["ACE_epinephrine", 10], ["ACE_morphine", 10]],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	([""]),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_MP7A2_desert", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_30Rnd_556x45_Emag", 50], ["CUP_30Rnd_556x45_Emag_Tracer_Red", 10], ["rhsusf_mag_17Rnd_9x19_JHP", 10], ["rhsusf_mag_40Rnd_46x30_FMJ", 50], ["1Rnd_HE_Grenade_shell", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, mags to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


///UKSF

twc_loadout_uksf_sl = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1], ["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt_cam",

	//vest
	(["twc_mtp_spc_squadleader"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["HandGrenade", 2], ["SmokeShell", 1], ["CUP_30Rnd_556x45_EMAG_Tan", 8]],

	//backpack
	"",

	//backpackitems
	[["ACE_fieldDressing", 0]],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_14_LDS"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems)
];


twc_loadout_uksf_2ic = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt_cam",

	//vest
	(["twc_rhsusf_mbav_rifleman_mtp"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["HandGrenade", 2], ["SmokeShell", 1], ["CUP_30Rnd_556x45_EMAG_Tan", 8]],

	//backpack
	"TWC_Backpack_UKSF_2IC",

	//backpackitems
	[],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_14_LDS"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []], ["ACE_MX2A", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


twc_loadout_uksf_pointman = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt_cam",

	//vest
	(["rhsusf_spcs_ocp_rifleman"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["HandGrenade", 2], ["ACE_M84", 2], ["SmokeShell", 1], ["CUP_30Rnd_556x45_EMAG_Tan", 8]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_10_LDS"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_uksf_rifleman = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["rhsusf_spcs_ocp_rifleman"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["HandGrenade", 2], ["SmokeShell", 1], ["CUP_30Rnd_556x45_EMAG_Tan", 8]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_14_LDS"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_uksf_grenadier = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["rhsusf_plateframe_grenadier"] call bis_fnc_selectrandom),

	//vestitems
	[["1Rnd_HE_Grenade_shell", 16], ["HandGrenade", 2], ["SmokeShell", 1], ["CUP_30Rnd_556x45_EMAG_Tan", 8]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_10_LDS"] call bis_fnc_selectrandom), []], ["rhs_weap_M320", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_uksf_marksman = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["rhsusf_spcs_ocp_rifleman"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["HandGrenade", 1], ["SmokeShell", 1], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 4]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["TWC_HK417_scope_bipod"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_uksf_medic = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["rhsusf_spcs_ocp_rifleman"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 2], ["TWC_Item_Medical_SutureKit_20", 1], ["SmokeShell", 1], ["CUP_30Rnd_556x45_EMAG", 6]],

	//backpack
	"TWC_Backpack_USMC2000_Medic",

	//backpackitems
	[["ACE_salineIV_250", 10]],

	//night kit
	["rhs_uniform_g3_blk", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_10_LDS"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


erre_nightkit = ["CUP_U_B_BDUv2_roll2_dirty_CEU", "rhsusf_ANPVS_14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]];


twc_loadout_1erre_sl = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_paint_pelt",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_15Rnd_9x19_FMJ", 3], ["HandGrenade", 1], ["SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"UK3CB_BAF_B_Bergen_OLI_SL_A",

	//backpackitems
	[["ACRE_PRC117F", 1], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 7]],

	//night kit
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1_Rail"] call bis_fnc_selectrandom), [(["rhsusf_acc_eotech_552", "cup_optic_compm4"] call bis_fnc_selectrandom )]], ["rhsusf_weap_m9", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems)
];


twc_loadout_1erre_2ic = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_paint_pelt",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_15Rnd_9x19_FMJ", 3], ["HandGrenade", 2], ["SmokeShell", 1], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 7]],

	//backpack
	"UK3CB_BAF_B_Carryall_OLI",

	//backpackitems
	[["CUP_25Rnd_556x45_Famas", 20], ["ACE_EntrenchingTool", 1], ["DemoCharge_Remote_Mag", 2], ["ACE_M26_Clacker", 1]],

	//night kit
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1_Rail"] call bis_fnc_selectrandom), [(["rhsusf_acc_eotech_552", "cup_optic_compm4"] call bis_fnc_selectrandom )]], ["rhsusf_weap_m9", []], ["ACE_MX2A", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


twc_loadout_1erre_pointman = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_paint_pelt",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_15Rnd_9x19_FMJ", 3], ["HandGrenade", 1], ["ACE_M84", 2], ["SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"B_Kitbag_rgr",

	//backpackitems
	[["CUP_sgun_M1014_Entry_vfg", 1], ["CUP_6Rnd_B_Beneli_74Pellets", 25], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 5]],

	//night kit
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1"] call bis_fnc_selectrandom), ["rhsusf_acc_eotech_552"]], ["rhsusf_weap_m9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


twc_loadout_1erre_rifleman = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_paint_pelt",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_15Rnd_9x19_FMJ", 3], ["HandGrenade", 1], ["ACE_M84", 2], ["SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"B_TacticalPack_blk",

	//backpackitems
	[["CUP_25Rnd_556x45_Famas_Tracer_Red", 9]],

	//night kit
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1"] call bis_fnc_selectrandom), ["rhsusf_acc_eotech_552"]], ["rhsusf_weap_m9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


twc_loadout_1erre_grenadier = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_paint_pelt",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_15Rnd_9x19_FMJ", 3], ["HandGrenade", 1], ["SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"B_TacticalPack_blk",

	//backpackitems
	[["CUP_25Rnd_556x45_Famas_Tracer_Red", 9],["1Rnd_Smoke_Grenade_shell", 4],["1Rnd_HE_Grenade_shell", 25]],

	//night kit
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1"] call bis_fnc_selectrandom), ["rhsusf_acc_eotech_552"]], ["rhs_weap_M320", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_1erre_marksman = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_paint_pelt",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_20Rnd_762x51_m118_special_Mag", 3], ["rhsusf_20Rnd_762x51_m62_Mag", 3], ["rhsusf_mag_15Rnd_9x19_FMJ", 3]],

	//backpack
	"UK3CB_BAF_B_Carryall_OLI",

	//backpackitems
	[["rhsusf_20Rnd_762x51_m118_special_Mag", 4], ["SmokeShell", 1]],

	//night kit
	erre_nightkit,

	//weapons
	[[(["rhs_weap_m14ebrri"] call bis_fnc_selectrandom), ["rhsusf_acc_leupoldmk4"]], ["rhsusf_weap_m9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


twc_loadout_1erre_medic = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_paint_pelt",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_15Rnd_9x19_FMJ", 3], ["SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"TWC_Backpack_USMC2000_Medic",

	//backpackitems
	[["ACE_salineIV_250", 10]],

	//night kit
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1"] call bis_fnc_selectrandom), ["rhsusf_acc_eotech_552"]], ["rhsusf_weap_m9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];



twc_loadout_switchloadout = {
	params ["_uniform", "_uniformitems", "_helmet", "_vest", "_vestitems", "_backpack", "_backpackitems", "_nightkit", "_weapons", "_linkeditems", ["_crateweapons", []], ["_cratemags", []], ["_crateitems", []], ["_cratebackpacks", []]];
	
	_nightkit params ["_nightuniform", "_nightNVGs", "_nightitems"];
	
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	
	if ((daytime > 16) || (daytime < 5)) then {
		if (_nightuniform != "") then {
			_uniform = _nightuniform;
		};
		player linkitem _nightNVGs;
	};
	
	player forceadduniform _uniform;
	
	{
		for "_i" from 1 to (_x select 1) do {
			player additemtouniform (_x select 0);
		};
	} foreach _uniformitems;
	
	player addheadgear _helmet;
	
	player addvest _vest;
	
	{
		for "_i" from 1 to (_x select 1) do {
			player additemtovest (_x select 0);
		};
	} foreach _vestitems;
	
	player addbackpack _backpack;
	
	_newload = [(configFile >> "CfgVehicles" >> _backpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
	missionnamespace setvariable ["twc_maxbagload", _newload];
	
	{
		for "_i" from 1 to (_x select 1) do {
			player additemtobackpack (_x select 0);
		};
	} foreach _backpackitems;
	
	{
		player addweapon (_x select 0);
		if ((count (_x select 1)) > 0) then {
			if ((_x select 0) == primaryweapon player) then {
				{
					player addprimaryweaponitem _x;
				} foreach (_x select 1);
			};
			if ((_x select 0) == secondaryweapon player) then {
				{
					player addsecondaryweaponitem _x;
				} foreach (_x select 1);
			};
			if ((_x select 0) == handgunweapon player) then {
				{
					player addHandgunItem _x;
				} foreach (_x select 1);
			};
		};
	} foreach _weapons;
	
	
	
	if ((daytime > 16) || (daytime < 5)) then {
		{
			for "_i" from 1 to (_x select 1) do {
				player additem (_x select 0);
			};
		} foreach _nightitems;
	};
	
	{
		player linkitem _x;
	} foreach _linkeditems;
	[player] call twc_fnc_buildmagarray_set;
	
	_box = missionnamespace getvariable ["cratebox", objnull];
	
	if (!isnull _box) then {
	
		if ((count _crateweapons) > 0) then {
			_crateweapons params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearweaponcargo _box;
			} else {
				_origweps = weaponcargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearweaponcargo _box;
				{
					_box addweaponcargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box addweaponcargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	
		if ((count _cratemags) > 0) then {
			_cratemags params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearmagazinecargo _box;
			} else {
				_origweps = magazinecargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearmagazinecargo _box;
				{
					_box addmagazinecargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box addmagazinecargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	
		if ((count _crateitems) > 0) then {
			_crateitems params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearitemcargo _box;
			} else {
				_origweps = itemcargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearitemcargo _box;
				{
					_box additemcargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box additemcargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	
		if ((count _cratebackpacks) > 0) then {
			_cratebackpacks params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearbackpackcargo _box;
			} else {
				_origweps = backpackcargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearbackpackcargo _box;
				{
					_box addbackpackcargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box addbackpackcargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	};
	[] spawn {
		sleep (random 3);
		[player] call twc_fnc_buildmagarray;
	};
};
