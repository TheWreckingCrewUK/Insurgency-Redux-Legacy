//by hobbs
//example: twc_loadout_usaf_jtac call twc_loadout_switchloadout


twc_loadout_usarmysniper_shooter = [
	//uniform
	(["CUP_U_B_USArmy_ACU_OCP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_USArmy_HelmetACH_OCP",

	//vest
	(["CUP_V_B_IOTV_OCP_Empty_USArmy"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_15Rnd_9x19_M9", 3], ["ACE_RangeCard", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_5Rnd_762x51_M24", 36]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m24_usarmy", ["CUP_optic_AN_PVS_10"]]]],

	//weapons
	[[(["twc_m24_usarmy"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_srifle_M107_LeupoldVX3", 1], ["twc_sr25_us_marksman", 1], ["CUP_hgun_M9", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_127_10Rnd", 50], ["CUP_10Rnd_127x99_m107", 20], ["CUP_10Rnd_127x99_m107", 20], ["CUP_5Rnd_762x51_M24", 50], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["CUP_15Rnd_9x19_M9", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["CUP_optic_AN_PVS_10", 1], [(selectrandom ["CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["UK3CB_BAF_B_Carryall_TAN", 2]]]
];

twc_loadout_usarmysniper_spotter = [
	//uniform
	(["CUP_U_B_USArmy_ACU_OCP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_USArmy_HelmetACH_ESS_OCP",

	//vest
	(["CUP_V_B_IOTV_OCP_Empty_USArmy"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["ACE_RangeCard", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["CUP_15Rnd_9x19_M9", 4], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 6]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_Rifleman_A",

	//backpackitems
	[["CUP_5Rnd_762x51_M24", 20], ["30Rnd_556x45_Stanag", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS14", [["ACE_MX2A", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[(["twc_m4_spotter"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["CUP_hgun_M9", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["CUP_15Rnd_9x19_M9", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["CUP_optic_AN_PVS_10", 1], [(selectrandom ["CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["UK3CB_BAF_B_Carryall_TAN", 2]]]
];

twc_loadout_usmcsniper_shooter = [
	//uniform
	(["CUP_U_B_USMC_FROG1_DMARPAT"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_LWHv2_MARPAT_des",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["9Rnd_45ACP_Mag", 3], ["ACE_RangeCard", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_10Rnd_127x99_m107", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_Rifleman_A",

	//backpackitems
	[["CUP_10Rnd_127x99_m107", 2], ["CUP_10Rnd_127x99_m107", 2]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS15_black", [["cup_optic_an_pas_13c1", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["CUP_srifle_M107_Base", ["CUP_optic_AN_PVS_10"]]]],

	//weapons
	[[(["CUP_srifle_M107_Base"] call bis_fnc_selectrandom), ["CUP_optic_LeupoldMk4_2"]], ["hgun_ACPC2_F", ["cup_acc_cz_m3x"]], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["hgun_ACPC2_F", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_127_10Rnd", 50], ["CUP_10Rnd_127x99_m107", 20], ["CUP_10Rnd_127x99_m107", 20], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["9Rnd_45ACP_Mag", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["CUP_optic_AN_PVS_10", 1], [(selectrandom ["CUP_H_USMC_BOONIE_2_DES", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["CUP_H_USMC_BOONIE_2_DES", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];

twc_loadout_usmcsniper_spotter = [
	//uniform
	(["CUP_U_B_USMC_FROG1_DMARPAT"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_LWHv2_MARPAT_des",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["ACE_RangeCard", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["9Rnd_45ACP_Mag", 4], ["UK3CB_BAF_SmokeShell", 1], ["CUP_5Rnd_762x51_M24", 40]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_Rifleman_A",

	//backpackitems
	[["CUP_10Rnd_127x99_m107", 2], ["CUP_10Rnd_127x99_m107", 2]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS15_black", [["cup_optic_goshawk_ris", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["CUP_srifle_M24_des_LeupoldMk4LRT", ["CUP_optic_AN_PVS_10"]]]],

	//weapons
	[[(["CUP_srifle_M24_des_LeupoldMk4LRT"] call bis_fnc_selectrandom), ["CUP_optic_LeupoldMk4_2_d"]], ["hgun_ACPC2_F", ["cup_acc_cz_m3x"]], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["hgun_ACPC2_F", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_5Rnd_762x51_M24", 50], ["UK3CB_BAF_127_10Rnd", 50], ["CUP_10Rnd_127x99_m107", 20], ["CUP_10Rnd_127x99_m107", 20], ["ACE_20Rnd_762x51_M118LR_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["9Rnd_45ACP_Mag", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["CUP_optic_AN_PVS_10", 1], [(selectrandom ["CUP_H_USMC_BOONIE_2_DES", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["CUP_H_USMC_BOONIE_2_DES", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];



twc_loadout_rangersniper_shooter = [
	//uniform
	(["CUP_U_CRYE_V2_Full"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 3], ["UK3CB_BAF_SmokeShell", 1], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 6], ["ACE_20Rnd_762x51_Mag_Tracer", 3]],

	//backpack
	"CUP_B_AssaultPack_Coyote_mc",

	//backpackitems
	[["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 2], ["ACE_20Rnd_762x51_Mag_Tracer", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS15_black", [["cup_optic_goshawk_ris", 1], ["ACE_MX2A", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["CUP_srifle_M110_ANPVS10", ["CUP_optic_AN_PVS_10", "cup_acc_anpeq_15_flashlight_tan_l", "cup_bipod_harris_1a2_l", "CUP_muzzle_snds_M110"]]]],

	//weapons
	[[(["CUP_srifle_M110_ANPVS10"] call bis_fnc_selectrandom), ["CUP_optic_LeupoldMk4_2_d", "cup_acc_anpeq_15_flashlight_tan_l", "cup_bipod_harris_1a2_l", "CUP_muzzle_snds_M110"]], ["CUP_hgun_Glock17", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_srifle_M24_des_LeupoldMk4LRT", 1], ["CUP_srifle_M107_LeupoldVX3", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_5Rnd_762x51_M24", 50], ["UK3CB_BAF_127_10Rnd", 50], ["CUP_10Rnd_127x99_m107", 20], ["CUP_10Rnd_127x99_m107", 20], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["CUP_optic_AN_PVS_10", 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_USA_Boonie_wdl", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_USA_Boonie_wdl", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], ["ACE_Tripod", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["CUP_B_AlicePack_OD", 2]]]
];

twc_loadout_rangersniper_spotter = [
	//uniform
	(["CUP_U_CRYE_V1_Full"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["ACE_ATragMX", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["CUP_17Rnd_9x19_glock17", 4], ["UK3CB_BAF_SmokeShell", 1], ["CUP_5Rnd_762x51_M24", 40]],

	//backpack
	"CUP_B_AssaultPack_Coyote_mc",

	//backpackitems
	[["ACE_20Rnd_762x51_Mag_Tracer", 4], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS15_black", [["cup_optic_goshawk_ris", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["CUP_srifle_M24_des_LeupoldMk4LRT", ["CUP_optic_AN_PVS_10"]]]],

	//weapons
	[[(["CUP_srifle_M24_des_LeupoldMk4LRT"] call bis_fnc_selectrandom), ["CUP_optic_LeupoldMk4_2_d"]], ["CUP_hgun_Glock17", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_sr25_us_marksman", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_5Rnd_762x51_M24", 50], ["UK3CB_BAF_127_10Rnd", 50], ["CUP_10Rnd_127x99_m107", 20], ["CUP_10Rnd_127x99_m107", 20], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 20], ["ACE_20Rnd_762x51_Mag_Tracer", 10], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["CUP_optic_AN_PVS_10", 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_USA_Boonie_wdl", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_USA_Boonie_wdl", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["CUP_B_AlicePack_OD", 2]]]
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
	[["CUP_17Rnd_9x19_glock17", 3], ["ACE_RangeCard", 1], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_556_30Rnd", 2], ["TWC_5Rnd_338_300gr_HPBT_Mag", 15], ["TWC_5Rnd_338_300gr_HPBT_Mag", 10]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",

	//backpackitems
	[["UK3CB_BAF_L85A3_RIS_ELCAN3D", 1], ["TWC_5Rnd_338_300gr_HPBT_Mag", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM", "CUP_NVG_PVS14", [["cup_optic_an_pas_13c1", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_l115a3_wd_covered", ["CUP_optic_AN_PVS_10"]]]],

	//weapons
	[[(["twc_l115a3_wd_covered"] call bis_fnc_selectrandom), []], ["CUP_hgun_Glock17", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_srifle_M107_LeupoldVX3", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["TWC_5Rnd_338_300gr_HPBT_Mag", 50], ["TWC_5Rnd_338_300gr_HPBT_Mag", 10], ["UK3CB_BAF_127_10Rnd", 5], ["CUP_10Rnd_127x99_m107", 3], ["CUP_10Rnd_127x99_m107", 2], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["CUP_optic_AN_PVS_10", 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1]] + twc_crateitems)],
	
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
	[["ACRE_PRC152", 1], ["ACE_RangeCard", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["CUP_17Rnd_9x19_glock17", 4], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",

	//backpackitems
	[["TWC_5Rnd_338_300gr_HPBT_Mag", 6], ["TWC_5Rnd_338_300gr_HPBT_Mag", 5], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM", "CUP_NVG_PVS14", [["ACE_MX2A", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_l129a1_spotter", ["UK3CB_BAF_MaxiKite"]]]],

	//weapons 
	[[(["twc_l129a1_spotter"] call bis_fnc_selectrandom), []], ["CUP_hgun_Glock17", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_762_L42A1_20Rnd", 50], ["UK3CB_BAF_762_L42A1_20Rnd_T", 10], ["UK3CB_BAF_127_10Rnd", 50], ["CUP_10Rnd_127x99_m107", 20], ["CUP_10Rnd_127x99_m107", 20], ["TWC_5Rnd_338_300gr_HPBT_Mag", 20], ["TWC_5Rnd_338_300gr_HPBT_Mag", 10], ["CUP_17Rnd_9x19_glock17", 10], ["APERSTripMine_Wire_Mag", 2]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["UK3CB_BAF_MaxiKite", 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "UK3CB_BAF_H_Headset_PRR"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];


twc_loadout_uksfsniper_shooter = [
	//uniform
	(["UK3CB_BAF_U_Smock_DPMW_MTP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["CUP_V_B_RRV_Scout2"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 3], ["CUP_H_SLA_BeanieGreen", 1], ["UK3CB_BAF_SmokeShell", 1], ["ACE_10Rnd_338_300gr_HPBT_Mag", 8], ["ACE_10Rnd_338_API526_Mag", 4]],

	//backpack
	"twc_oli_belt",

	//backpackitems
	[["ACE_10Rnd_338_300gr_HPBT_Mag", 6], ["ACE_10Rnd_338_API526_Mag", 4]],
////twc_halfghillie_desert
	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS15_black", [["uk3cb_baf_maxikite", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_l115a3_wd_covered", ["optic_tws", "uk3cb_baf_silencer_l115a3"]]]],

	//weapons
	[[(["twc_l115a3_wd_covered"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []], ["ACE_Yardage450", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_srifle_M107_LeupoldVX3", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["ACE_10Rnd_338_300gr_HPBT_Mag", 50], ["ACE_10Rnd_338_API526_Mag", 5], ["UK3CB_BAF_127_10Rnd", 5], ["CUP_10Rnd_127x99_m107", 3], ["CUP_10Rnd_127x99_m107", 2], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["CUP_optic_AN_PVS_10", 1], ["UK3CB_BAF_H_Beret_SAS_PRR", 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["UK3CB_BAF_B_Bergen_OLI_Rifleman_A", 2], ["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];

twc_loadout_uksfsniper_spotter = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["CUP_V_O_SLA_M23_1_OD"] call bis_fnc_selectrandom),

	//vestitems
	[["ACRE_PRC152", 1], ["CUP_H_SLA_BeanieGreen", 1], ["ACE_ATragMX", 1], ["ACE_Kestrel4500", 1], ["ACE_Tripod", 1], ["CUP_17Rnd_9x19_glock17", 4], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_OLI_Rifleman_A",

	//backpackitems
	[["ACE_10Rnd_338_300gr_HPBT_Mag", 8], ["ACE_10Rnd_338_API526_Mag", 4], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_I_Ghillie_Top", "CUP_NVG_PVS15_black", [["UK3CB_BAF_Soflam_Laserdesignator", 1], ["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_HK417_scope_bipod", ["CUP_optic_AN_PVS_10", "twc_acc_nt4_tan"]]]],

	//weapons
	[[(["TWC_HK417_scope_bipod"] call bis_fnc_selectrandom), ["twc_acc_nt4_tan"]], ["twc_g17_optics_laser", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_hgun_Glock17", 1], ["twc_l115a3_wd_covered", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_762_L42A1_20Rnd", 50], ["UK3CB_BAF_762_L42A1_20Rnd_T", 10], ["ACE_10Rnd_338_300gr_HPBT_Mag", 20], ["ACE_10Rnd_338_API526_Mag", 20], ["UK3CB_BAF_127_10Rnd", 50], ["CUP_10Rnd_127x99_m107", 20], ["CUP_10Rnd_127x99_m107", 20], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, items to add
	
	[["all"], ([["ACE_Tripod", 1], ["UK3CB_BAF_MaxiKite", 1], ["UK3CB_BAF_H_Beret_SAS_PRR", 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1], [(selectrandom ["CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_PMC_Cap_Back_EP_Grey"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]
];
