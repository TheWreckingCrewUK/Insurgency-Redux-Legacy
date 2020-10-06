//by hobbs
//example: twc_loadout_usaf_jtac call twc_loadout_switchloadout


twc_loadout_usarmysniper_shooter = [
	//uniform
	(["rhs_uniform_cu_ocp_1stcav"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_ach_bare_tan_headset",

	//vest
	(["rhsusf_spcs_ocp_sniper"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_15Rnd_9x19_FMJ", 3], ["UK3CB_BAF_SmokeShell", 1], ["rhsusf_5Rnd_762x51_m993_Mag", 36]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m24_usarmy", ["rhsusf_acc_premier_anpvs27"]]]],

	//weapons
	[[(["twc_m24_usarmy"] call bis_fnc_selectrandom), []], ["rhsusf_weap_m9", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_rhs_weap_M107", 1], ["twc_sr25_us_marksman", 1], ["rhsusf_weap_m9", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_mag_10Rnd_STD_50BMG_M33", 50], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 20], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 20], ["rhsusf_5Rnd_762x51_m993_Mag", 50], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["rhsusf_mag_15Rnd_9x19_FMJ", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["rhsusf_acc_premier_anpvs27", 1], [(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["UK3CB_BAF_B_Carryall_TAN", 2]]]
];

twc_loadout_usarmysniper_spotter = [
	//uniform
	(["rhs_uniform_cu_ocp_1stcav"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_ach_helmet_ESS_ocp",

	//vest
	(["rhsusf_spcs_ocp_sniper"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["ACE_ATragMX", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["rhsusf_mag_15Rnd_9x19_FMJ", 4], ["UK3CB_BAF_SmokeShell", 1], ["rhs_mag_30Rnd_556x45_M855A1_PMAG", 6]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_Rifleman_A",

	//backpackitems
	[["rhsusf_5Rnd_762x51_m993_Mag", 20], ["rhs_mag_30Rnd_556x45_M855A1_PMAG", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_14", [["ACE_MX2A", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["twc_m4_spotter"] call bis_fnc_selectrandom), []], ["rhsusf_weap_m9", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["rhsusf_weap_m9", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855A1_PMAG", 50], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["rhsusf_mag_15Rnd_9x19_FMJ", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["rhsusf_acc_premier_anpvs27", 1], [(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["UK3CB_BAF_B_Carryall_TAN", 2]]]
];

twc_loadout_usmcsniper_shooter = [
	//uniform
	(["rhs_uniform_FROG01_d"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_mich_bare_norotos_arc_alt_tan",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["9Rnd_45ACP_Mag", 3], ["UK3CB_BAF_SmokeShell", 1], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_Rifleman_A",

	//backpackitems
	[["rhsusf_mag_10Rnd_STD_50BMG_mk211", 2], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 2]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_15", [["cup_optic_an_pas_13c1", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["rhs_weap_M107_d", ["rhsusf_acc_premier_anpvs27"]]]],

	//weapons
	[[(["rhs_weap_M107_d"] call bis_fnc_selectrandom), ["rhsusf_acc_leupoldmk4_2"]], ["hgun_ACPC2_F", ["cup_acc_cz_m3x"]], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["hgun_ACPC2_F", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_mag_10Rnd_STD_50BMG_M33", 50], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 20], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 20], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["9Rnd_45ACP_Mag", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["rhsusf_acc_premier_anpvs27", 1], [(selectrandom ["rhs_booniehat2_marpatd", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["rhs_booniehat2_marpatd", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];

twc_loadout_usmcsniper_spotter = [
	//uniform
	(["rhs_uniform_FROG01_d"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_mich_bare_norotos_arc_alt_tan",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["ACE_ATragMX", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["9Rnd_45ACP_Mag", 4], ["UK3CB_BAF_SmokeShell", 1], ["rhsusf_5Rnd_300winmag_xm2010", 40]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_Rifleman_A",

	//backpackitems
	[["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 2], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 2]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_15", [["cup_optic_goshawk_ris", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m2010_scope", ["rhsusf_acc_premier_anpvs27"]]]],

	//weapons
	[[(["twc_m2010_scope"] call bis_fnc_selectrandom), ["rhsusf_acc_leupoldmk4_2_d"]], ["hgun_ACPC2_F", ["cup_acc_cz_m3x"]], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["hgun_ACPC2_F", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_5Rnd_300winmag_xm2010", 50], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 50], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 20], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 20], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["9Rnd_45ACP_Mag", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["rhsusf_acc_premier_anpvs27", 1], [(selectrandom ["rhs_booniehat2_marpatd", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["rhs_booniehat2_marpatd", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];



twc_loadout_rangersniper_shooter = [
	//uniform
	(["CUP_U_CRYE_V2_Full"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 3], ["UK3CB_BAF_SmokeShell", 1], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 6], ["ACE_20Rnd_762x51_Mag_Tracer", 3]],

	//backpack
	"rhsusf_falconii_mc",

	//backpackitems
	[["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 2], ["ACE_20Rnd_762x51_Mag_Tracer", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_15", [["cup_optic_goshawk_ris", 1], ["ACE_MX2A", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["rhs_weap_sr25_ec_d", ["rhsusf_acc_premier_anpvs27", "cup_acc_anpeq_15_flashlight_tan_l", "cup_bipod_harris_1a2_l", "rhsgref_sdn6_suppressor"]]]],

	//weapons
	[[(["rhs_weap_sr25_ec_d"] call bis_fnc_selectrandom), ["rhsusf_acc_leupoldmk4_2_d", "cup_acc_anpeq_15_flashlight_tan_l", "cup_bipod_harris_1a2_l", "rhsgref_sdn6_suppressor"]], ["rhsusf_weap_glock17g4", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m2010_scope", 1], ["twc_rhs_weap_M107", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_5Rnd_300winmag_xm2010", 50], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 50], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 20], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 20], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["rhsusf_mag_17Rnd_9x19_JHP", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["rhsusf_acc_premier_anpvs27", 1], [(selectrandom ["rhs_beanie_green", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "rhs_Booniehat_m81", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["rhs_beanie_green", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "rhs_Booniehat_m81", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], ["ACE_Tripod", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["rhsgref_hidf_alicepack", 2]]]
];

twc_loadout_rangersniper_spotter = [
	//uniform
	(["CUP_U_CRYE_V1_Full"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["ACE_ATragMX", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 4], ["UK3CB_BAF_SmokeShell", 1], ["rhsusf_5Rnd_300winmag_xm2010", 40]],

	//backpack
	"rhsusf_falconii_mc",

	//backpackitems
	[["ACE_20Rnd_762x51_Mag_Tracer", 4], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_15", [["cup_optic_goshawk_ris", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m2010_scope", ["rhsusf_acc_premier_anpvs27"]]]],

	//weapons
	[[(["twc_m2010_scope"] call bis_fnc_selectrandom), ["rhsusf_acc_leupoldmk4_2_d"]], ["rhsusf_weap_glock17g4", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_5Rnd_300winmag_xm2010", 50], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 50], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 20], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 20], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["rhsusf_mag_17Rnd_9x19_JHP", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["rhsusf_acc_premier_anpvs27", 1], [(selectrandom ["rhs_beanie_green", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "rhs_Booniehat_m81", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["rhs_beanie_green", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "rhs_Booniehat_m81", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["rhsgref_hidf_alicepack", 2]]]
];



twc_loadout_baf_shooter = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"UK3CB_BAF_H_Mk7_Camo_D",

	//vest
	(["twc_warriorvest_dcs"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_FMJ", 3], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_556_30Rnd", 2], ["TWC_5Rnd_338_300gr_HPBT_Mag", 15], ["TWC_5Rnd_338_300gr_HPBT_Mag", 10]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",

	//backpackitems
	[["UK3CB_BAF_L85A3_RIS_ELCAN3D", 1], ["TWC_5Rnd_338_300gr_HPBT_Mag", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM", "rhsusf_ANPVS_14", [["cup_optic_an_pas_13c1", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_l115a3_wd_covered", ["rhsusf_acc_premier_anpvs27"]]]],

	//weapons
	[[(["twc_l115a3_wd_covered"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_rhs_weap_M107", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["TWC_5Rnd_338_300gr_HPBT_Mag", 50], ["TWC_5Rnd_338_300gr_HPBT_Mag", 10], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 5], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 3], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 2], ["rhsusf_mag_17Rnd_9x19_FMJ", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["rhsusf_acc_premier_anpvs27", 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];

twc_loadout_baf_spotter = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"UK3CB_BAF_H_Mk7_Camo_D",

	//vest
	(["twc_warriorvest_dcs"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["ACE_ATragMX", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["rhsusf_mag_17Rnd_9x19_FMJ", 4], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",

	//backpackitems
	[["TWC_5Rnd_338_300gr_HPBT_Mag", 6], ["TWC_5Rnd_338_300gr_HPBT_Mag", 5], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM", "rhsusf_ANPVS_14", [["ACE_MX2A", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_l129a1_spotter", ["UK3CB_BAF_MaxiKite"]]]],

	//weapons 
	[[(["twc_l129a1_spotter"] call bis_fnc_selectrandom), []], ["rhsusf_weap_glock17g4", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_762_L42A1_20Rnd", 50], ["UK3CB_BAF_762_L42A1_20Rnd_T", 10], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 50], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 20], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 20], ["TWC_5Rnd_338_300gr_HPBT_Mag", 20], ["TWC_5Rnd_338_300gr_HPBT_Mag", 10], ["rhsusf_mag_17Rnd_9x19_FMJ", 10], ["APERSTripMine_Wire_Mag", 2]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["UK3CB_BAF_MaxiKite", 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];


twc_loadout_uksfsniper_shooter = [
	//uniform
	(["UK3CB_BAF_U_Smock_DPMW_MTP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["twc_rhs_6sh92_dpm"] call bis_fnc_selectrandom),

	//vestitems
	[["rhsusf_mag_17Rnd_9x19_JHP", 3], ["rhs_beanie_green", 1], ["UK3CB_BAF_SmokeShell", 1], ["ACE_10Rnd_338_300gr_HPBT_Mag", 8], ["ACE_10Rnd_338_API526_Mag", 4]],

	//backpack
	"twc_oli_belt",

	//backpackitems
	[["ACE_10Rnd_338_300gr_HPBT_Mag", 6], ["ACE_10Rnd_338_API526_Mag", 4]],
////twc_halfghillie_desert
	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_15", [["uk3cb_baf_maxikite", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["UK3CB_BAF_L115_pub_Base", ["optic_tws", "uk3cb_baf_silencer_l115a3"]]]],

	//weapons
	[[(["twc_l115a3_wd_covered"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_rhs_weap_M107", 1], ["rhsusf_weap_glock17g4", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["ACE_10Rnd_338_300gr_HPBT_Mag", 50], ["ACE_10Rnd_338_API526_Mag", 5], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 5], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 3], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 2], ["rhsusf_mag_17Rnd_9x19_JHP", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["rhsusf_acc_premier_anpvs27", 1], ["UK3CB_BAF_H_Beret_SAS_PRR", 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["UK3CB_BAF_B_Bergen_OLI_Rifleman_A", 2], ["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];

twc_loadout_uksfsniper_spotter = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["CUP_V_O_SLA_M23_1_OD"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["rhs_beanie_green", 1], ["ACE_ATragMX", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 4], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_OLI_Rifleman_A",

	//backpackitems
	[["ACE_10Rnd_338_300gr_HPBT_Mag", 8], ["ACE_10Rnd_338_API526_Mag", 4], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "rhsusf_ANPVS_15", [["UK3CB_BAF_Soflam_Laserdesignator", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_HK417_scope_bipod", ["rhsusf_acc_premier_anpvs27", "twc_acc_nt4_tan"]]]],

	//weapons
	[[(["TWC_HK417_scope_bipod"] call bis_fnc_selectrandom), ["twc_acc_nt4_tan"]], ["twc_g17_optics_laser", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["rhsusf_weap_glock17g4", 1], ["twc_l115a3_wd_covered", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_762_L42A1_20Rnd", 50], ["UK3CB_BAF_762_L42A1_20Rnd_T", 10], ["ACE_10Rnd_338_300gr_HPBT_Mag", 20], ["ACE_10Rnd_338_API526_Mag", 20], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 50], ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 20], ["rhsusf_mag_10Rnd_STD_50BMG_AMAX", 20], ["rhsusf_mag_17Rnd_9x19_JHP", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["UK3CB_BAF_MaxiKite", 1], ["UK3CB_BAF_H_Beret_SAS_PRR", 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1], [(selectrandom ["rhs_beanie_green", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];
