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

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

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
	
	[["UK3CB_BAF_Kite"], ([])],
	
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

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

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
	
	[["UK3CB_BAF_Kite"], ([])],
	
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

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 3], ["rhs_mag_30Rnd_556x45_M855_Stanag", 5]],

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
	
	[["UK3CB_BAF_Kite"], ([])],
	
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

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 3], ["rhs_mag_30Rnd_556x45_M855_Stanag", 5]],

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
	
	[["UK3CB_BAF_Kite"], ([])],
	
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

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

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
	
	[["UK3CB_BAF_Kite"], ([])],
	
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

	[["ACRE_PRC148", 1], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["rhs_mag_30Rnd_556x45_M855_Stanag", 2]],

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
	
	[["UK3CB_BAF_Kite"], ([])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];
