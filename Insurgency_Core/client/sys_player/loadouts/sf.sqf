//by hobbs
//example: twc_loadout_usaf_jtac call twc_loadout_switchloadout


twc_loadout_ana_sl = [
	//uniform
	(["CUP_U_B_BDUv2_M81", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_Helmet_ECH1_Black",

	//vest
	(["CUP_V_CPC_Fast_coy", "V_PlateCarrier1_blk", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_15Rnd_9x19_M9", 2], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 11]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_M81", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["CUP_arifle_M4A1_ACOG_Laser"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []], ["ACE_Yardage450", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_cco_vfg", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["CUP_B_Bergen_BAF", 2]]]

];

twc_loadout_ana_2ic = [
	//uniform
	(["CUP_U_B_BDUv2_M81", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_Helmet_ECH1_Black",

	//vest
	"CUP_V_B_Ciras_Olive",

	//vestitems

	[["CUP_15Rnd_9x19_M9", 2], ["30Rnd_556x45_Stanag", 7], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 11]],

	//backpack
	"twc_genbackPack_oli",

	//backpackitems

	[["30Rnd_556x45_Stanag", 14], ["ACE_EntrenchingTool", 1], ["DemoCharge_Remote_Mag", 1], ["ACE_M26_Clacker", 1]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_M81", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["CUP_arifle_M4A1_ACOG_Laser"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []], ["ACE_Yardage450", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_cco_vfg", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["UK3CB_BAF_B_Carryall_OLI", 2]]]

];


twc_loadout_ana_pointman = [
	//uniform
	(["CUP_U_B_BDUv2_M81", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_Helmet_ECH1_Black",

	//vest
	(["CUP_V_CPC_Fast_coy", "V_PlateCarrier1_blk", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_15Rnd_9x19_M9", 3], ["30Rnd_556x45_Stanag", 8], ["CUP_HandGrenade_M67", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 11]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_M81", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["CUP_arifle_M4A1_ACOG_Laser"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_cco_vfg", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ana_rifleman = [
	//uniform
	(["CUP_U_B_BDUv2_M81", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_Helmet_ECH1_Black",

	//vest
	(["CUP_V_CPC_Fast_coy", "V_PlateCarrier1_blk", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_15Rnd_9x19_M9", 2], ["30Rnd_556x45_Stanag", 8], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 11]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_M81", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["CUP_arifle_M4A1_ACOG_Laser"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_eotech_vfg_laser", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ana_grenadier = [
	//uniform
	(["CUP_U_B_BDUv2_M81", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_Helmet_ECH1_Black",

	//vest
	(["CUP_V_B_Ciras_Olive"] call bis_fnc_selectrandom),

	//vestitems

	[["30Rnd_556x45_Stanag", 8], ["1Rnd_HE_Grenade_shell", 20], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["1Rnd_SmokeRed_Grenade_shell", 5], ["30Rnd_556x45_Stanag", 11]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_M81", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_m4_203_acog_lazer"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_203_cco", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10], ["1Rnd_HE_Grenade_shell", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ana_marksman = [
	//uniform
	(["CUP_U_B_BDUv2_M81", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_Helmet_ECH1_Black",

	//vest
	(["CUP_V_CPC_Fast_coy", "V_PlateCarrier1_blk", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom),

	//vestitems

	[["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_15Rnd_9x19_M9", 2], ["ACE_30Rnd_556x45_Stanag_Mk262_mag", 15]],

	//backpack
	"",

	//backpackitems

	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_M81", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[("twc_m16_dmr"), []], ["CUP_hgun_M9", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m249_para_acog", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["ACE_30Rnd_556x45_Stanag_Mk262_mag", 50], ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 10], ["CUP_15Rnd_9x19_M9", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


twc_loadout_ana_medic = [
	//uniform
	(["CUP_U_B_BDUv2_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_USArmy_Helmet_ECH1_Black",

	//vest
	(["CUP_V_CPC_Fast_coy", "V_PlateCarrier1_blk", "V_PlateCarrier1_rgr"] call bis_fnc_selectrandom),

	//vestitems

	[["TWC_Item_Medical_SutureKit_20", 1], ["ACE_tourniquet", 3], ["CUP_15Rnd_9x19_M9", 3], ["30Rnd_556x45_Stanag", 15]],

	//backpack
	"UK3CB_BAF_B_Kitbag_OLI",

	//backpackitems

	[["ACE_fieldDressing", 25], ["ACE_packingBandage", 25], ["ACE_elasticBandage", 25], ["ACE_quikclot", 25], ["ACE_salineIV_500", 15], ["ACE_salineIV_250", 10], ["ACE_epinephrine", 10], ["ACE_morphine", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_M81", "CUP_NVG_PVS14", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["CUP_arifle_M4A1_ACOG_Laser"] call bis_fnc_selectrandom), []], ["CUP_hgun_M9", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4_cco_vfg", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 10], ["CUP_40Rnd_46x30_MP7", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_loadout_basicmedicitems + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];
//seals

twc_loadout_st6_sl = [
	//uniform
	(["CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_OpsCore_Covered_MCAM",

	//vest
	(["twc_aor1_spc_squadleader", "twc_oli_spc_squadleader", "twc_mtp_spc_squadleader", "CUP_V_CPC_tl_coy", "CUP_V_CPC_tlbelt_coy", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_MCam", "CUP_V_B_Ciras_Olive", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[["UK3CB_BAF_9_15Rnd", 2], ["30Rnd_556x45_Stanag", 7], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"CUP_B_AssaultPack_Coyote",

	//backpackitems

	[["DemoCharge_Remote_Mag", 2], ["ACE_DefusalKit", 1], ["ACE_M26_Clacker", 1], ["30Rnd_556x45_Stanag", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["UK3CB_BAF_L105A2", ["uk3cb_baf_l105a1_llm_ir_r"]], ["ACE_Vector", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_smg_MP7_desert", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["UK3CB_BAF_9_15Rnd", 10], ["CUP_40Rnd_46x30_MP7", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_Kitbag_tan", 2]]]

];

twc_loadout_st6_2ic = [
	//uniform
	(["CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_OpsCore_Covered_MCAM",

	//vest
	(selectrandom ["CUP_V_CPC_Fastbelt_coy", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc"]),

	//vestitems

	[["UK3CB_BAF_9_15Rnd", 2], ["ItemcTabHCam", 1], ["30Rnd_556x45_Stanag", 4], ["30Rnd_556x45_Stanag_Tracer_Red", 3], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_genbackPack_tan",

	//backpackitems

	[["30Rnd_556x45_Stanag", 10], ["30Rnd_556x45_Stanag_Tracer_Red", 5], ["ACE_EntrenchingTool", 1], ["DemoCharge_Remote_Mag", 1], ["ACE_M26_Clacker", 1], ["ACE_CableTie", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["CUP_smg_MP7_desert", []], ["UK3CB_BAF_L105A2",["uk3cb_baf_l105a1_llm_ir_r", "muzzle_snds_l"]]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["UK3CB_BAF_L105A2", ["uk3cb_baf_l105a1_llm_ir_r"]], ["ACE_MX2A", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_smg_MP7_desert", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["UK3CB_BAF_9_15Rnd", 10], ["CUP_40Rnd_46x30_MP7", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];


twc_loadout_st6_pointman = [
	//uniform
	(["CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_OpsCore_Covered_MCAM",

	//vest
	(["CUP_V_CPC_Fastbelt_coy", "CUP_V_CPC_Fastbelt_coy", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[["UK3CB_BAF_9_15Rnd", 3], ["ItemcTabHCam", 1], ["30Rnd_556x45_Stanag", 5], ["CUP_40Rnd_46x30_MP7", 7], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"CUP_B_AssaultPack_Coyote",

	//backpackitems

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), 1], ["CUP_40Rnd_46x30_MP7", 6]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]], [["CUP_smg_MP7_desert", []], ["UK3CB_BAF_L105A2",["uk3cb_baf_l105a1_llm_ir_r", "muzzle_snds_l"]]]],

	//weapons

	[["CUP_smg_MP7_desert", ["twc_acc_rotex5_grey"]], ["UK3CB_BAF_L105A2", ["uk3cb_baf_l105a1_llm_ir_r"]]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), 1], ["UK3CB_BAF_L105A2", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["UK3CB_BAF_9_15Rnd", 10], ["CUP_40Rnd_46x30_MP7", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_st6_rifleman = [
	//uniform
	(["CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_OpsCore_Covered_MCAM",

	//vest
	(["CUP_V_CPC_Fastbelt_coy", "CUP_V_CPC_Fastbelt_coy", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[["UK3CB_BAF_9_15Rnd", 2], ["30Rnd_556x45_Stanag", 8], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["30Rnd_556x45_Stanag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["UK3CB_BAF_L105A2", ["uk3cb_baf_l105a1_llm_ir_r"]]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_smg_MP7_desert", 1], ["UK3CB_BAF_L105A2", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["UK3CB_BAF_9_15Rnd", 10], ["CUP_40Rnd_46x30_MP7", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_st6_grenadier = [
	//uniform
	(["CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_OpsCore_Covered_MCAM",

	//vest
	(["UK3CB_BAF_V_Osprey_Grenadier_B", "CUP_V_CPC_weaponsbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[["30Rnd_556x45_Stanag", 8], ["1Rnd_HE_Grenade_shell", 15], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_ussf_scoutpack",

	//backpackitems

	[["CUP_1Rnd_Smoke_M203", 5], ["30Rnd_556x45_Stanag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag", "twc_hk416_mag_desert"] call bis_fnc_selectrandom), []], ["", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_smg_MP7_desert", 1], ["UK3CB_BAF_L105A2", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["UK3CB_BAF_9_15Rnd", 10], ["CUP_40Rnd_46x30_MP7", 50], ["1Rnd_HE_Grenade_shell", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_st6_marksman = [
	//uniform
	(["CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_AOR1", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_OpsCore_Covered_MCAM",

	//vest
	(["CUP_V_CPC_Fastbelt_coy"] call bis_fnc_selectrandom),

	//vestitems

	[["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_9_15Rnd", 2], ["30Rnd_556x45_Stanag_Sand_red", 9]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["30Rnd_556x45_Stanag_Tracer_Red", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["CUP_optic_CWS", 1], ["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [[("CUP_arifle_HK416_Desert"), ["CUP_optic_CWS", "cup_acc_anpeq_15_flashlight_tan_l", "cup_muzzle_snds_m16_desert", "cup_bipod_harris_1a2_l"]]]],

	//weapons

	[[("CUP_arifle_HK416_Desert"), ["CUP_optic_LeupoldMk4", "cup_acc_anpeq_15_flashlight_tan_l", "cup_muzzle_snds_m16_desert", "cup_bipod_harris_1a2_l"]], ["UK3CB_BAF_L105A2", ["uk3cb_baf_l105a1_llm_ir_r"]]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_smg_MP7_desert", 1], ["twc_sr25_us_marksman", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag_Sand_red", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_20Rnd_762x51_B_M110", 50], ["CUP_20Rnd_762x51_B_M110", 10], ["UK3CB_BAF_9_15Rnd", 10], ["CUP_40Rnd_46x30_MP7", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_optic_AN_PVS_10", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


twc_loadout_st6_medic = [
	//uniform
	(["CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"H_HelmetB_light_sand",

	//vest
	(["CUP_V_CPC_medicalbelt_coy", "twc_aor1_spc_squadleader", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[["TWC_Item_Medical_SutureKit_20", 1], ["ACE_tourniquet", 3], ["UK3CB_BAF_9_15Rnd", 3], ["30Rnd_556x45_Stanag", 8]],

	//backpack
	"UK3CB_BAF_B_Kitbag_OLI",

	//backpackitems

	[["ACE_fieldDressing", 25], ["ACE_packingBandage", 25], ["ACE_elasticBandage", 25], ["ACE_quikclot", 25], ["ACE_salineIV_500", 15], ["ACE_salineIV_250", 10], ["ACE_epinephrine", 10], ["ACE_morphine", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_hk416_mag_desert", "twc_hk416_mag"] call bis_fnc_selectrandom), []], ["UK3CB_BAF_L105A2", ["uk3cb_baf_l105a1_llm_ir_r"]]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_smg_MP7_desert", 1], ["UK3CB_BAF_L105A2", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["UK3CB_BAF_9_15Rnd", 10], ["CUP_40Rnd_46x30_MP7", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USMC_BOONIE_2_DES", "CUP_H_USMC_BOONIE_2_DES"]), 1]] + twc_loadout_basicmedicitems + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];

///ACE

twc_loadout_ace_sl = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Covered_MCAM_US", "CUP_H_OpsCore_Spray_US", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "H_HelmetB_light"] call bis_fnc_selectrandom),

	//vest
	(["twc_oli_spc_squadleader", "twc_mtp_spc_squadleader", "CUP_V_JPC_tlbelt_mc", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_MCam", "CUP_V_B_Ciras_Olive", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems

	[[(["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan"] call bis_fnc_selectrandom), 1], ["CUP_17Rnd_9x19_glock17", 2], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 4]],

	//backpack
	"CUP_B_AssaultPack_Coyote",

	//backpackitems

	[["DemoCharge_Remote_Mag", 2], ["ACE_DefusalKit", 1], ["ACE_M26_Clacker", 1], ["30Rnd_556x45_Stanag", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m4b2_us_mag",[]]]],

	//weapons

	[[(["twc_m4b2_us_shortdot"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []], ["ACE_Vector", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_spectre", 1], ["twc_m4b2_us_mag", 1], ["twc_g17_optics_laser", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_Kitbag_tan", 2]]]

];

twc_loadout_ace_2ic = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Covered_MCAM_US", "CUP_H_OpsCore_Spray_US", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "H_HelmetB_light"] call bis_fnc_selectrandom),

	//vest
	(selectrandom ["CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"]),

	//vestitems

	[[(["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan"] call bis_fnc_selectrandom), 1], ["CUP_17Rnd_9x19_glock17", 2], ["ItemcTabHCam", 1], ["30Rnd_556x45_Stanag", 7], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_genbackPack_oli",

	//backpackitems

	[["30Rnd_556x45_Stanag_Tracer_Red", 7], ["30Rnd_556x45_Stanag", 7], ["ACE_EntrenchingTool", 1], ["DemoCharge_Remote_Mag", 1], ["ACE_M26_Clacker", 1]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m4b2_us_mag",[]]]],

	//weapons

	[[(["twc_m4b2_us_shortdot"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []], ["ACE_MX2A", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_spectre", 1], ["twc_m4b2_us_mag", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];


twc_loadout_ace_pointman = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Covered_MCAM_US", "CUP_H_OpsCore_Spray_US", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "H_HelmetB_light"] call bis_fnc_selectrandom),

	//vest
	(["CUP_V_B_Ciras_MCam", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems

	[[(["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan"] call bis_fnc_selectrandom), 1], ["CUP_40Rnd_46x30_MP7", 3], ["ItemcTabHCam", 1], ["CUP_17Rnd_9x19_glock17", 3], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 4], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"B_AssaultPack_rgr",

	//backpackitems 

	[["twc_mk18_shortdot", 1], ["CUP_40Rnd_46x30_MP7", 4], ["30Rnd_556x45_Stanag", 2]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]], [["CUP_smg_MP7_desert",[]]]],

	//weapons

	[[(["CUP_smg_MP7_desert"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_spectre", 1], ["twc_m4b2_us_mag", 1], ["CUP_smg_MP7_desert", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10], ["CUP_40Rnd_46x30_MP7", 20]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ace_rifleman = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Covered_MCAM_US", "CUP_H_OpsCore_Spray_US", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "H_HelmetB_light"] call bis_fnc_selectrandom),

	//vest
	(["CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems

	[[(["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan"] call bis_fnc_selectrandom), 1], ["CUP_17Rnd_9x19_glock17", 2], ["30Rnd_556x45_Stanag", 8], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["30Rnd_556x45_Stanag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]], [["twc_m4b2_us_mag",[]]]],

	//weapons

	[[(["twc_m4b2_us_shortdot"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_spectre", 1], ["twc_m4b2_us_mag", 1], ["twc_g17_optics_laser", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ace_grenadier = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Covered_MCAM_US", "CUP_H_OpsCore_Spray_US", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "H_HelmetB_light"] call bis_fnc_selectrandom),

	//vest
	(["UK3CB_BAF_V_Osprey_Grenadier_B", "CUP_V_JPC_weaponsbelt_rngr", "CUP_V_JPC_weaponsbelt_mc", "CUP_V_CPC_weaponsbelt_rngr", "CUP_V_CPC_weaponsbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[[(["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan"] call bis_fnc_selectrandom), 1], ["30Rnd_556x45_Stanag", 8], ["1Rnd_HE_Grenade_shell", 15], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_ussf_scoutpack",

	//backpackitems

	[["CUP_1Rnd_Smoke_M203", 5], ["30Rnd_556x45_Stanag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m4b2_us_mag",[]]]],

	//weapons

	[[(["twc_m4b2_us_shortdot"] call bis_fnc_selectrandom), []], ["", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_spectre", 1], ["twc_m4b2_us_mag", 1], ["CUP_smg_MP7_desert", 1], ["twc_g17_optics_laser", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10], ["CUP_40Rnd_46x30_MP7", 15], ["1Rnd_HE_Grenade_shell", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ace_marksman = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Covered_MCAM_US", "CUP_H_OpsCore_Spray_US", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "H_HelmetB_light"] call bis_fnc_selectrandom),

	//vest
	(["CUP_V_B_Ciras_MCam"] call bis_fnc_selectrandom),

	//vestitems

	[[(["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan"] call bis_fnc_selectrandom), 1], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_17Rnd_9x19_glock17", 2], ["CUP_20Rnd_762x51_B_M110", 9]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["CUP_20Rnd_762x51_B_M110", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_GPNVG_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_sr25_us_marksman",["CUP_optic_CWS"]]]],

	//weapons

	[[("twc_sr25_us_marksman"), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["CUP_smg_MP7_desert", 1], ["twc_m4b2_us_shortdot", 1], ["twc_m4b2_us_mag", 1], ["twc_mk17_elcan", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_20Rnd_762x51_B_SCAR", 50], ["CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR", 10], ["CUP_20Rnd_762x51_B_M110", 50], ["CUP_20Rnd_762x51_B_M110", 10], ["CUP_17Rnd_9x19_glock17", 10], ["CUP_40Rnd_46x30_MP7", 15], ["30Rnd_556x45_Stanag_Sand_red", 10], ["30Rnd_556x45_Stanag", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_optic_AN_PVS_10", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


twc_loadout_ace_medic = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MCAM_US_SF", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Spray_US_SF", "CUP_H_OpsCore_Covered_MCAM_US", "CUP_H_OpsCore_Spray_US", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "H_HelmetB_light"] call bis_fnc_selectrandom),

	//vest
	(["twc_CUP_V_CPC_Fast_coy_mtp", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems

	[[(["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan"] call bis_fnc_selectrandom), 1], ["TWC_Item_Medical_SutureKit_20", 1], ["ACE_tourniquet", 3], ["CUP_17Rnd_9x19_glock17", 3], ["30Rnd_556x45_Stanag", 8]],

	//backpack
	"UK3CB_BAF_B_Kitbag_OLI",

	//backpackitems

	[["ACE_fieldDressing", 25], ["ACE_packingBandage", 25], ["ACE_elasticBandage", 25], ["ACE_quikclot", 25], ["ACE_salineIV_500", 15], ["ACE_salineIV_250", 10], ["ACE_epinephrine", 10], ["ACE_morphine", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["twc_m4b2_us_mag",[]]]],

	//weapons

	[[(["twc_m4b2_us_shortdot"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_spectre", 1], ["twc_m4b2_us_mag", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1]] + twc_loadout_basicmedicitems + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


///Rangers

twc_loadout_ussf_sl = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MTP", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "CUP_H_OpsCore_Spray"] call bis_fnc_selectrandom),

	//vest
	(["twc_oli_spc_squadleader", "twc_mtp_spc_squadleader", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_MCam", "CUP_V_B_Ciras_Olive"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 1], ["ACRE_PRC148", 1], ["CUP_17Rnd_9x19_glock17", 2], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 4]],

	//backpack
	"CUP_B_AssaultPack_Coyote",

	//backpackitems

	[["DemoCharge_Remote_Mag", 2], ["ACE_DefusalKit", 1], ["ACE_M26_Clacker", 1], ["30Rnd_556x45_Stanag", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	[(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom), "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_mk18_specter"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []], ["ACE_Vector", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_mk18_eotech", 1], ["twc_g17_optics_laser", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["DemoCharge_Remote_Mag", 3], ["ACE_M26_Clacker", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USA_Boonie_wdl", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "H_Booniehat_khk"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_Kitbag_tan", 2]]]

];

twc_loadout_ussf_2ic = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MTP", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "CUP_H_OpsCore_Spray"] call bis_fnc_selectrandom),

	//vest
	(selectrandom ["CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"]),

	//vestitems

	[["CUP_17Rnd_9x19_glock17", 2], ["30Rnd_556x45_Stanag", 7], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_genbackPack_oli",

	//backpackitems

	[["30Rnd_556x45_Stanag_Tracer_Red", 7], ["30Rnd_556x45_Stanag", 7], ["ACE_EntrenchingTool", 1], ["DemoCharge_Remote_Mag", 1], ["ACE_M26_Clacker", 1]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	[(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom), "CUP_NVG_PVS15_black", [["CUP_optic_HoloBlack", 1], ["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]]],

	//weapons

	[[(["twc_mk18_shortdot"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []], ["ACE_MX2A", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_mk18_specter", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USA_Boonie_wdl", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "H_Booniehat_khk"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", 2]]]

];


twc_loadout_ussf_pointman = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MTP", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "CUP_H_OpsCore_Spray"] call bis_fnc_selectrandom),

	//vest
	(["CUP_V_B_Ciras_MCam"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_17Rnd_9x19_glock17", 3], ["30Rnd_556x45_Stanag", 10], ["30Rnd_556x45_Stanag_Tracer_Red", 4], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"B_AssaultPack_khk",

	//backpackitems 

	[["CUP_sgun_M1014_Entry_vfg", 1], ["CUP_6Rnd_B_Beneli_74Pellets", 5], ["30Rnd_556x45_Stanag", 3], ["ACE_M84", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	[(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom), "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]]],

	//weapons

	[[(["twc_mk18_eotech"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_eotech", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USA_Boonie_wdl", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "H_Booniehat_khk"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ussf_rifleman = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MTP", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "CUP_H_OpsCore_Spray"] call bis_fnc_selectrandom),

	//vest
	(["CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[["CUP_17Rnd_9x19_glock17", 2], ["30Rnd_556x45_Stanag", 8], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_scoutpack_tan",

	//backpackitems

	[["30Rnd_556x45_Stanag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	[(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom), "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]]],

	//weapons

	[[(["twc_mk18_eotech"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_spectre", 1], ["twc_g17_optics_laser", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USA_Boonie_wdl", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "H_Booniehat_khk"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ussf_grenadier = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MTP", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "CUP_H_OpsCore_Spray"] call bis_fnc_selectrandom),

	//vest
	(["UK3CB_BAF_V_Osprey_Grenadier_B", "CUP_V_JPC_weaponsbelt_rngr", "CUP_V_JPC_weaponsbelt_mc", "CUP_V_CPC_weaponsbelt_rngr", "CUP_V_CPC_weaponsbelt_mc"] call bis_fnc_selectrandom),

	//vestitems

	[["twc_acc_rotex5_grey", 1], ["30Rnd_556x45_Stanag", 8], ["1Rnd_HE_Grenade_shell", 15], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1]],

	//backpack
	"twc_ussf_scoutpack",

	//backpackitems

	[["CUP_1Rnd_Smoke_M203", 5], ["30Rnd_556x45_Stanag", 3]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	[(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom), "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_m4b2_us_eotech"] call bis_fnc_selectrandom), []], ["", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_eotech", 1], ["twc_g17_optics_laser", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10], ["1Rnd_HE_Grenade_shell", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USA_Boonie_wdl", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "H_Booniehat_khk"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];



twc_loadout_ussf_marksman = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MTP", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "CUP_H_OpsCore_Spray"] call bis_fnc_selectrandom),

	//vest
	(["CUP_V_B_Ciras_MCam"] call bis_fnc_selectrandom),

	//vestitems

	[["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_17Rnd_9x19_glock17", 2], ["CUP_20Rnd_762x51_B_M110", 9],["CUP_20Rnd_762x51_B_M110", 10]],

	//backpack
	"twc_ussf_scoutpack",

	//backpackitems

	[["CUP_20Rnd_762x51_B_M110", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	[(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom), "CUP_NVG_PVS15_black", [["CUP_optic_AN_PVS_10", 1], ["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons
	[[("twc_sr25_us_marksman"), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_m4b2_us_shortdot", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_20Rnd_762x51_B_M110", 50], ["CUP_20Rnd_762x51_B_M110", 10], ["30Rnd_556x45_Stanag_Sand_red", 10], ["30Rnd_556x45_Stanag", 30], ["CUP_17Rnd_9x19_glock17", 10]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all", "cup_optic_an_pas_13c1"], ([["CUP_optic_AN_PVS_10", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USA_Boonie_wdl", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "H_Booniehat_khk"]), 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


twc_loadout_ussf_medic = [
	//uniform
	(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet

	(["CUP_H_OpsCore_Covered_MTP", "H_HelmetB_light_snakeskin", "H_HelmetB_light_sand", "H_HelmetB_light_desert", "CUP_H_OpsCore_Spray"] call bis_fnc_selectrandom),

	//vest
	(["CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems

	[["TWC_Item_Medical_SutureKit_20", 1], ["ACE_tourniquet", 3], ["CUP_17Rnd_9x19_glock17", 3], ["30Rnd_556x45_Stanag", 8]],

	//backpack
	"UK3CB_BAF_B_Kitbag_OLI",

	//backpackitems

	[["ACE_fieldDressing", 25], ["ACE_packingBandage", 25], ["ACE_elasticBandage", 25], ["ACE_quikclot", 25], ["ACE_salineIV_500", 15], ["ACE_salineIV_250", 10], ["ACE_epinephrine", 10], ["ACE_morphine", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	[(["CUP_U_CRYEG3_V2", "CUP_U_CRYEG3_V1", "CUP_U_CRYE_V1_Full", "CUP_U_CRYE_V2_Full", "CUP_U_CRYE_G3C_M81"] call bis_fnc_selectrandom), "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]],

	//weapons

	[[(["twc_m4b2_us_eotech"] call bis_fnc_selectrandom), []], ["twc_g17_optics_laser", []]],

	//linkeditems

	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([["twc_mk18_eotech", 1], ["CUP_hgun_Glock17", 1]] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["30Rnd_556x45_Stanag", 50], ["30Rnd_556x45_Stanag_Tracer_Red", 10], ["CUP_17Rnd_9x19_glock17", 10], ["1Rnd_HE_Grenade_shell", 50]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["ACE_SpraypaintGreen", 1], [(selectrandom ["UK3CB_BAF_H_Earphone", "CUP_H_PMC_Cap_EP_Tan", "CUP_H_PMC_Cap_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Grey", "CUP_H_PMC_Cap_Back_EP_Tan", "CUP_H_USA_Boonie_wdl", "CUP_H_USArmy_Boonie_OCP", "H_Booniehat_tan", "H_Booniehat_khk"]), 1]] + twc_loadout_basicmedicitems + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], [["B_TacticalPack_blk", 2]]]

];


///UKSF

twc_loadout_baf_sl = [
	//uniform
	(selectrandom ["CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC_V3", "CUP_U_CRYE_MCAM_NP2_Roll"]),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1], ["ACRE_PRC152", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 2], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 8]],

	//backpack
	"",

	//backpackitems
	[["ACE_fieldDressing", 0]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_UK3CB_BAF_L119A2_14_ACOG_black", ["twc_acc_rotex5_grey", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "UK3CB_BAF_Kite"]]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_14_ACOG_black"] call bis_fnc_selectrandom), ["twc_acc_rotex5_grey"]], ["CUP_hgun_Glock17", ["cup_acc_cz_m3x"]], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems)
];


twc_loadout_baf_2ic = [
	//uniform
	(selectrandom ["CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC_V3", "CUP_U_CRYE_MCAM_NP2_Roll"]),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["twc_CUP_V_CPC_Fast_coy_mtp"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 2], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 8]],

	//backpack
	"TWC_Backpack_UKSF_2IC",

	//backpackitems
	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_UK3CB_BAF_L119A2_14_ACOG_black", ["twc_acc_rotex5_grey", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "UK3CB_BAF_Kite"]]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_14_ACOG_black"] call bis_fnc_selectrandom), ["twc_acc_rotex5_grey"]], ["CUP_hgun_Glock17", ["cup_acc_cz_m3x"]], ["ACE_MX2A", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


twc_loadout_baf_pointman = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM", "U_I_G_Story_Protagonist_F"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["twc_warriorvest_dcs"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 4], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8], ["CUP_6Rnd_B_Beneli_74Pellets", 15]],

	//backpack
	"B_AssaultPack_rgr",

	//backpackitems
	[["CUP_sgun_M1014_Entry_vfg", 1], ["CUP_6Rnd_B_Benelli_74Slug", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3], ["ACE_M84", 3]], [["TWC_UK3CB_BAF_L119A2_10_LDS", ["twc_acc_rotex5_grey", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "UK3CB_BAF_Kite"]]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_10_LDS"] call bis_fnc_selectrandom), ["twc_acc_rotex5_grey"]], ["twc_g17_optics_laser", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_baf_rifleman = [
	//uniform
	(selectrandom ["CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC_V3", "CUP_U_CRYE_MCAM_NP2_Roll"]),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 2], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 8]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_UK3CB_BAF_L119A2_14_ACOG_black", ["twc_acc_rotex5_grey", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "UK3CB_BAF_Kite"]]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_14_ACOG_black"] call bis_fnc_selectrandom), ["twc_acc_rotex5_grey"]], ["twc_g17_optics_laser", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_baf_grenadier = [
	//uniform
	(selectrandom ["CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC_V3", "CUP_U_CRYE_MCAM_NP2_Roll"]),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["UK3CB_BAF_V_Osprey_Grenadier_B", "CUP_V_JPC_weaponsbelt_rngr", "CUP_V_JPC_weaponsbelt_mc", "CUP_V_CPC_weaponsbelt_rngr", "CUP_V_CPC_weaponsbelt_mc"] call bis_fnc_selectrandom),

	//vestitems
	[["1Rnd_HE_Grenade_shell", 16], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_UK3CB_BAF_L119A2_10_LDS", ["twc_acc_rotex5_grey", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "UK3CB_BAF_Kite"]]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_10_LDS"] call bis_fnc_selectrandom), ["twc_acc_rotex5_grey"]], ["", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_baf_marksman = [
	//uniform
	(selectrandom ["CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC_V3", "CUP_U_CRYE_MCAM_NP2_Roll"]),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 2], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["UK3CB_BAF_762_L42A1_20Rnd", 6], ["UK3CB_BAF_762_L42A1_20Rnd_T", 4]],

	//backpack
	"",

	//backpackitems
	[],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_HK417_scope_bipod", ["CUP_optic_AN_PVS_10", "twc_acc_nt4_tan"]]]],

	//weapons
	[[(["TWC_HK417_scope_bipod"] call bis_fnc_selectrandom), []], ["CUP_hgun_Glock17", ["cup_acc_cz_m3x"]]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];

twc_loadout_baf_medic = [
	//uniform
	(selectrandom ["CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC_V3", "CUP_U_CRYE_MCAM_NP2_Roll"]),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Green",

	//vest
	(["CUP_V_JPC_communicationsbelt_mc", "CUP_V_JPC_Fastbelt_mc", "CUP_V_JPC_tlbelt_mc", "CUP_V_JPC_medicalbelt_mc", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_Fastbelt_mc", "CUP_V_CPC_medicalbelt_mc", "CUP_V_CPC_tlbelt_mc", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_communicationsbelt_rngr"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_17Rnd_9x19_glock17", 3], ["TWC_Item_Medical_SutureKit_20", 1], ["UK3CB_BAF_SmokeShell", 1], ["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 8]],

	//backpack
	"TWC_Backpack_USMC2000_Medic",

	//backpackitems
	[["ACE_salineIV_250", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	["CUP_U_CRYE_G3C_BLK", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]], [["TWC_UK3CB_BAF_L119A2_10_LDS", ["twc_acc_rotex5_grey", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "UK3CB_BAF_Kite"]]]],

	//weapons
	[[(["TWC_UK3CB_BAF_L119A2_10_LDS"] call bis_fnc_selectrandom), ["twc_acc_rotex5_grey"]], ["CUP_hgun_Glock17", ["cup_acc_cz_m3x"]]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems)
];


erre_nightkit = ["CUP_U_B_BDUv2_roll2_dirty_CEU", "CUP_NVG_PVS15_black", [["ACE_Flashlight_KSF1", 1],  ["ACE_HandFlare_Red", 3],["ACE_Chemlight_IR", 3], ["Chemlight_red", 3]]];


twc_loadout_1erre_sl = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_15Rnd_9x19_M9", 3], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"UK3CB_BAF_B_Bergen_OLI_SL_A",

	//backpackitems
	[["ACRE_PRC117F", 1], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 7]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1_Rail"] call bis_fnc_selectrandom), [(["CUP_optic_HoloBlack", "cup_optic_compm4"] call bis_fnc_selectrandom )]], ["CUP_hgun_M9", []], ["ACE_Vector", []]],

	//linkeditems
	(["ItemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_25Rnd_556x45_Famas", 50], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 15]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_NVG_PVS15_black", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]
];


twc_loadout_1erre_2ic = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_15Rnd_9x19_M9", 3], ["HandGrenade", 2], ["UK3CB_BAF_SmokeShell", 1], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 7]],

	//backpack
	"UK3CB_BAF_B_Carryall_OLI",

	//backpackitems
	[["CUP_25Rnd_556x45_Famas", 20], ["ACE_EntrenchingTool", 1], ["DemoCharge_Remote_Mag", 2], ["ACE_M26_Clacker", 1]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1_Rail"] call bis_fnc_selectrandom), [(["CUP_optic_HoloBlack", "cup_optic_compm4"] call bis_fnc_selectrandom )]], ["CUP_hgun_M9", []], ["ACE_MX2A", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_25Rnd_556x45_Famas", 50], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 15]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_NVG_PVS15_black", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]
];


twc_loadout_1erre_pointman = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_15Rnd_9x19_M9", 3], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"B_Kitbag_rgr",

	//backpackitems
	[["CUP_sgun_M1014_Entry_vfg", 1], ["CUP_6Rnd_B_Beneli_74Pellets", 25], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 5]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1_Rail"] call bis_fnc_selectrandom), ["CUP_optic_HoloBlack"]], ["CUP_hgun_M9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_25Rnd_556x45_Famas", 50], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 15], ["CUP_6Rnd_B_Benelli_74Slug", 15], ["CUP_6Rnd_B_Beneli_74Pellets", 15]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_NVG_PVS15_black", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]
];


twc_loadout_1erre_rifleman = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_15Rnd_9x19_M9", 3], ["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"B_TacticalPack_blk",

	//backpackitems
	[["CUP_25Rnd_556x45_Famas_Tracer_Red", 9]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1_Rail_Arid"] call bis_fnc_selectrandom), ["rksl_optic_eot552x_c", "cup_acc_llm01_desert_l"]], ["CUP_hgun_M9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_25Rnd_556x45_Famas", 50], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 15]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_NVG_PVS15_black", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]
];


twc_loadout_1erre_grenadier = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["HandGrenade", 1], ["UK3CB_BAF_SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"B_TacticalPack_blk",

	//backpackitems
	[["CUP_25Rnd_556x45_Famas_Tracer_Red", 9],["1Rnd_Smoke_Grenade_shell", 4],["1Rnd_HE_Grenade_shell", 25]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1_Rail"] call bis_fnc_selectrandom), ["CUP_optic_HoloBlack"]], ["", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_25Rnd_556x45_Famas", 50], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 10], ["1Rnd_HE_Grenade_shell", 25], ["1Rnd_Smoke_Grenade_shell", 15]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_NVG_PVS15_black", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]
];

twc_loadout_1erre_marksman = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_20Rnd_762x51_DMR", 3], ["CUP_20Rnd_762x51_DMR", 3], ["CUP_15Rnd_9x19_M9", 3]],

	//backpack
	"UK3CB_BAF_B_Carryall_OLI",

	//backpackitems
	[["CUP_20Rnd_762x51_DMR", 4], ["UK3CB_BAF_SmokeShell", 1]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	erre_nightkit,

	//weapons
	[[(["CUP_srifle_M14_DMR"] call bis_fnc_selectrandom), ["CUP_optic_LeupoldMk4"]], ["CUP_hgun_M9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_20Rnd_762x51_DMR", 50], ["CUP_20Rnd_762x51_DMR", 10], ["CUP_15Rnd_9x19_M9", 15]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_NVG_PVS15_black", 1]] + twc_crateitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]
];


twc_loadout_1erre_medic = [
	//uniform
	(["CUP_U_B_BDUv2_roll2_dirty_CEU"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1]] + twc_loadout_basicuniformitems),

	//helmet
	"CUP_H_OpsCore_Spray",

	//vest
	(["CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems
	[["CUP_15Rnd_9x19_M9", 3], ["UK3CB_BAF_SmokeShell", 1], ["CUP_25Rnd_556x45_Famas", 14]],

	//backpack
	"TWC_Backpack_USMC2000_Medic",

	//backpackitems
	[["ACE_salineIV_250", 10]],

	//night kit: night uniform, nvg class, night items, night weapons if required (can be blank)
	erre_nightkit,

	//weapons
	[[(["CUP_Famas_F1"] call bis_fnc_selectrandom), ["CUP_optic_HoloBlack"]], ["CUP_hgun_M9", []]],

	//linkeditems
	([""] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["CUP_25Rnd_556x45_Famas", 50], ["CUP_25Rnd_556x45_Famas_Tracer_Red", 10], ["CUP_15Rnd_9x19_M9", 15]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["all"], ([["CUP_NVG_PVS15_black", 1]] + twc_crateitems + twc_loadout_basicmedicitems)],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]
];

