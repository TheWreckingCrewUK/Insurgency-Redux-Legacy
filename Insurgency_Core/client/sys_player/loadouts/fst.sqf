
twc_loadout_baf_fstsl = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"UK3CB_BAF_H_Mk7_Camo_B",

	//vest
	(["twc_warriorvest_dcs"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_17Rnd_9x19_glock17", 2], ["CUP_H_PMC_EP_Headset", 1], ["HandGrenade", 1], ["SmokeShell", 2], ["SmokeShellRed", 2], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_SL_L_A",

	//backpackitems

	[["ACRE_PRC117F", 1], ["1Rnd_HE_Grenade_shell", 15], ["1Rnd_SmokeRed_Grenade_shell", 10], ["1Rnd_SmokeBlue_Grenade_shell", 10], ["1Rnd_SmokeGreen_Grenade_shell", 10]],

	//night kit
	["UK3CB_BAF_U_Smock_MTP", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["UK3CB_BAF_L85A2_UGL_ELCAN3D"] call bis_fnc_selectrandom), []], ["CUP_hgun_Glock17_tan", []], ["ACE_Vector", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["CUP_B_Bergen_BAF", 2]]]

];


twc_loadout_baf_fstassistant = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP", "UK3CB_BAF_U_CombatUniform_MTP", "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM", "U_B_CombatUniform_mcam_tshirt"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"UK3CB_BAF_H_Mk7_Camo_D",

	//vest
	(["UK3CB_BAF_V_Osprey_MG_B"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_17Rnd_9x19_glock17", 2], ["CUP_H_PMC_EP_Headset", 1], ["HandGrenade", 1], ["SmokeShell", 2], ["30Rnd_556x45_Stanag", 6], ["30Rnd_556x45_Stanag_Tracer_Red", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_Engineer_L_A",

	//backpackitems

	[["ACE_EntrenchingTool", 1], ["ACE_wirecutter", 1], ["30Rnd_556x45_Stanag", 4]],

	//night kit
	["UK3CB_BAF_U_Smock_MTP", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["UK3CB_BAF_L85A2_RIS_ELCAN3D"] call bis_fnc_selectrandom), []], ["CUP_hgun_Glock17_tan", []]],

	//linkeditems

	([] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];

twc_loadout_baf_fstobserver = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP", "UK3CB_BAF_U_CombatUniform_MTP", "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM", "U_B_CombatUniform_mcam_tshirt"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"UK3CB_BAF_H_Mk7_Camo_B",

	//vest
	(["twc_warriorvest_dcs"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_17Rnd_9x19_glock17", 2], ["CUP_H_PMC_EP_Headset", 1], ["HandGrenade", 1], ["SmokeShell", 2], ["SmokeShellRed", 2], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 3]],

	//backpack
	"CUP_B_Motherlode_MTP",

	//backpackitems

	[["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 10], ["1Rnd_SmokeBlue_Grenade_shell", 10], ["1Rnd_SmokeGreen_Grenade_shell", 10]],

	//night kit
	["UK3CB_BAF_U_Smock_MTP", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["UK3CB_BAF_L85A2_UGL_ELCAN3D"] call bis_fnc_selectrandom), []], ["CUP_hgun_Glock17_tan", []], ["ACE_Vector", []]],

	//linkeditems

	([] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "CUP_H_PMC_EP_Headset"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];



twc_loadout_us_fstsl = [
	//uniform
	(["CUP_U_B_USArmy_ACU_OCP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_HelmetACH_ESS_Headset_OCP",

	//vest
	(["CUP_V_B_Ciras_MCam"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_15Rnd_9x19_M9", 2], ["HandGrenade", 1], ["SmokeShell", 2], ["SmokeShellRed", 2], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 3]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_SL_A",

	//backpackitems

	[["ACRE_PRC117F", 1], ["1Rnd_HE_Grenade_shell", 15], ["1Rnd_SmokeRed_Grenade_shell", 10], ["1Rnd_SmokeBlue_Grenade_shell", 10], ["1Rnd_SmokeGreen_Grenade_shell", 10]],

	//night kit
	["CUP_U_B_USArmy_ACU_OCP", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_CUP_arifle_M4A1_m203_acog_lazer"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9A1", []], ["ACE_Vector", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_cco_vfg", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "H_Cap_usblack", "H_Cap_tan_specops_US"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];


twc_loadout_us_fstassistant = [
	//uniform
	(["CUP_U_B_USArmy_ACU_OCP", "CUP_U_B_USArmy_ACU_OCP", "U_I_G_Story_Protagonist_F", "U_B_CombatUniform_mcam_tshirt"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_HelmetACH_ESS_Headset_OCP",

	//vest
	(["CUP_V_B_IOTV_OCP_SAW_USArmy"] call bis_fnc_selectrandom),

	//vestitems

	[["UK3CB_BAF_762_200Rnd_T", 1], ["CUP_15Rnd_9x19_M9", 2]],

	//backpack
	"B_Carryall_cbr",

	//backpackitems

	[["ACE_EntrenchingTool", 1], ["ACE_wirecutter", 1], ["UK3CB_BAF_762_200Rnd_T", 4]],

	//night kit
	["CUP_U_B_USArmy_ACU_OCP", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_rhs_weap_m240B_mgo_lazer"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9A1", []]],

	//linkeditems

	([] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_cco_vfg", 1], ["twc_m14_ebr_lazer_bipod", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["ACE_20Rnd_762x51_M993_AP_Mag", 30], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "H_Cap_usblack", "H_Cap_tan_specops_US"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];

twc_loadout_us_fstobserver = [
	//uniform
	(["CUP_U_B_USArmy_ACU_OCP", "CUP_U_B_USArmy_ACU_OCP", "U_I_G_Story_Protagonist_F", "U_B_CombatUniform_mcam_tshirt"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_HelmetACH_ESS_Headset_OCP",

	//vest
	(["CUP_V_B_Ciras_MCam"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_15Rnd_9x19_M9", 2], ["HandGrenade", 1], ["SmokeShell", 2], ["SmokeShellRed", 2], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 3]],

	//backpack
	"CUP_B_US_IIID_OCP",

	//backpackitems

	[["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 10], ["1Rnd_SmokeBlue_Grenade_shell", 10], ["1Rnd_SmokeGreen_Grenade_shell", 10]],

	//night kit
	["CUP_U_B_USArmy_ACU_OCP", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_CUP_arifle_M4A1_m203_acog_lazer"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9A1", []], ["ACE_Vector", []]],

	//linkeditems

	([] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_cco_vfg", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "CUP_H_PMC_Beanie_Khaki", "H_Cap_usblack", "H_Cap_tan_specops_US"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];

