twc_loadout_usaf_helipilot = [
	//uniform
	(["rhs_uniform_cu_ocp_1stcav"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_hgu56p_visor_green",

	//vest
	(["CUP_V_B_PilotVest"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["amp_slingload_CargoSling", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["rhs_uniform_cu_ocp_1stcav", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["rhs_weap_m4a1", []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855_Stanag", 5], ["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["amp_slingload_CargoSling", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];
twc_loadout_usaf_crewchief = [
	//uniform
	(["rhs_uniform_cu_ocp_1stcav"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_hgu56p_visor_mask_green",

	//vest
	(["CUP_V_B_PilotVest"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["amp_slingload_CargoSling", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["rhs_uniform_cu_ocp_1stcav", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["rhs_weap_m4a1", []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855_Stanag", 5], ["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["amp_slingload_CargoSling", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_soar_helipilot = [
	//uniform
	(["rhs_uniform_cu_ocp_1stcav"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_hgu56p_black",

	//vest
	(["CUP_V_B_Ciras_Olive3"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["amp_slingload_CargoSling", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 3], ["rhs_mag_30Rnd_556x45_M855_Stanag", 5]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["rhs_uniform_cu_ocp_1stcav", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["rhs_weap_m4a1", []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855_Stanag", 5], ["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["amp_slingload_CargoSling", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_soar_crewchief = [
	//uniform
	(["rhs_uniform_cu_ocp_1stcav"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_hgu56p_visor_mask_black",

	//vest
	(["CUP_V_B_Ciras_Olive3"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["amp_slingload_CargoSling", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 3], ["rhs_mag_30Rnd_556x45_M855_Stanag", 5]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["rhs_uniform_cu_ocp_1stcav", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["rhs_weap_m4a1", []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855_Stanag", 5], ["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["amp_slingload_CargoSling", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_baf_helipilot = [
	//uniform
	(["UK3CB_BAF_U_RolledUniform_MTP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_hgu56p",

	//vest
	(["UK3CB_BAF_V_Pilot_A"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["amp_slingload_CargoSling", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["UK3CB_BAF_U_Smock_MTP", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["TWC_BAF_L22A2_SUSAT", []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855_Stanag", 5], ["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["amp_slingload_CargoSling", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_baf_crewchief = [
	//uniform
	(["UK3CB_BAF_U_RolledUniform_MTP"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_hgu56p_visor_mask",

	//vest
	(["UK3CB_BAF_V_Pilot_A"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["amp_slingload_CargoSling", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["UK3CB_BAF_U_Smock_MTP", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["TWC_BAF_L22A2_SUSAT", []], ["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855_Stanag", 5], ["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["amp_slingload_CargoSling", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_baf_jetpilot = [
	//uniform
	(["UK3CB_BAF_U_HeliPilotCoveralls_Army"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"H_PilotHelmetFighter_B",

	//vest
	(["CUP_V_B_PilotVest"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["UK3CB_BAF_U_HeliPilotCoveralls_Army", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([])],
	
	//backpacks to remove from crate, backpacks to add
	
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

	[["ACRE_PRC152", 2], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["UK3CB_BAF_556_30Rnd", 8], ["UK3CB_BAF_556_30Rnd_T", 3], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 2]],

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
	
	[["all"], [[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_EP_Tan"]), 1], [(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_EP_Tan"]), 1]] + twc_crateitems],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];



twc_loadout_usaf_jetpilot = [
	//uniform
	(["U_I_pilotCoveralls"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"RHS_jetpilot_usaf",

	//vest
	(["CUP_V_CDF_CrewBelt"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["UK3CB_BAF_U_HeliPilotCoveralls_Army", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["rhsusf_weap_glock17g4", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_mag_17Rnd_9x19_JHP", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];


twc_loadout_usaf_jtac = [
	//uniform
	(["rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_ut_pelt",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 1], ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 5], ["rhs_mag_20Rnd_SCAR_762x51_m62_tracer", 3], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 2]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_JTAC_H_A",

	//backpackitems

	[["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 6], ["CUP_H_PMC_Cap_EP_Grey", 1], ["Laserbatteries", 2], ["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 5], ["1Rnd_SmokeBlue_Grenade_shell", 5], ["1Rnd_SmokeGreen_Grenade_shell", 5]],

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
	
	[["all"], [[(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_EP_Tan"]), 1], [(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_EP_Tan"]), 1]] + twc_crateitems],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_usasoc_jetpilot = twc_loadout_usaf_jetpilot;


twc_loadout_usasoc_jtac = [
	//uniform
	(["CUP_U_CRYEG3_V1"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_mc_cover_pelt",

	//vest
	(["twc_rhsusf_plateframe_SL_mtp"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 1], ["ItemcTabHCam", 1], ["rhsusf_acc_eotech", 1], ["rhs_mag_30Rnd_556x45_M855A1_PMAG", 5], ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", 3], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 2]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_JTAC_H_A",

	//backpackitems

	[["rhs_mag_30Rnd_556x45_M855A1_PMAG", 6], ["CUP_H_PMC_Cap_EP_Grey", 1], ["Laserbatteries", 2], ["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 5], ["1Rnd_SmokeBlue_Grenade_shell", 5], ["1Rnd_SmokeGreen_Grenade_shell", 5]],

	//night kit
	["CUP_U_CRYEG3_V1", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["Chemlight_red", 6], ["Chemlight_blue", 6]]],

	//weapons

	[["twc_m4b2_us_shortdot", []], ["rhs_weap_M320", []], ["UK3CB_BAF_Soflam_Laserdesignator", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855A1_PMAG", 50], ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], [[(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_EP_Tan"]), 1], [(selectrandom ["rhs_Booniehat_ocp", "H_Booniehat_tan", "CUP_H_PMC_EP_Headset", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_EP_Tan"]), 1]] + twc_crateitems],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_ana_jetpilot = [
	//uniform
	(["CUP_U_B_CZ_Pilot_WDL"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhs_zsh7a_mike",

	//vest
	(["rhs_vest_commander"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC148", 1], ["rhsusf_mag_15Rnd_9x19_FMJ", 2]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit
	["CUP_U_B_CZ_Pilot_WDL", "rhsusf_ANPVS_14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["B_IR_Grenade", 6]]],

	//weapons

	[["rhsusf_weap_m9", []]],

	//linkeditems

	(["ItemAndroid"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhsusf_mag_15Rnd_9x19_FMJ", 5]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];

twc_loadout_ana_jtac = [
	//uniform
	(["CUP_U_B_BDUv2_roll_dirty_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"rhsusf_opscore_paint_pelt",

	//vest
	(["twc_oli_spc_squadleader"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 1], ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 5], ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red", 3], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 2]],

	//backpack
	"UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",

	//backpackitems

	[["CUP_H_PMC_Cap_EP_Tan", 1], ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 6], ["Laserbatteries", 2], ["rhsusf_mag_15Rnd_9x19_FMJ", 2], ["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 5], ["1Rnd_SmokeBlue_Grenade_shell", 5], ["1Rnd_SmokeGreen_Grenade_shell", 5]],

	//night kit
	["CUP_U_B_BDUv2_roll_dirty_M81", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["Chemlight_red", 6], ["Chemlight_blue", 6]]],

	//weapons

	[["twc_rhs_weap_m4a1_m203_acog_lazer", []], ["rhsusf_weap_m9", []], ["UK3CB_BAF_Soflam_Laserdesignator", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_30Rnd_556x45_M855A1_Stanag", 50], ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red", 10], ["rhsusf_mag_15Rnd_9x19_FMJ", 30], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], [[] + twc_crateitems]],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];





