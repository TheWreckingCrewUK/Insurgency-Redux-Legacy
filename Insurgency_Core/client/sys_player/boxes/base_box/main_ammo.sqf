/*
        Different Ammobox v 1.0
        by Demonized.

        1: place a marker named DMZ_DA anywhere you want the players to see their ammobox, all will see their box in same position.
        2: place this in init line of any unit.
                _null = this execVM "DMZ_DA.sqf";
        3: save this script as DMZ_DA.sqf and place it in your mission folder.

        For more classnames on ammoboxes or weapons and magazines go here:
                http://forums.bistudio.com/showthread.php?t=73241&page=2
				edited by FakeMatty
				edited by jayman to make it reload on box close animation.
				This reduces players lag as it no longer fills every 240 seconds.
*/ 

_weapons = [["twc_L5A4_white",1],["twc_L5A4_red",1],["twc_L5A4_green",1]];
_magazines = [["SmokeShell",5], ["SmokeShellYellow",5], ["SmokeShellRed",5], ["SmokeShellGreen",5], ["SmokeShellPurple",5], ["SmokeShellBlue",5], ["SmokeShellOrange",5], ["Chemlight_green",5], ["Chemlight_yellow",5], ["Chemlight_red",5], ["Chemlight_blue",5],["ACE_Chemlight_IR",5]];
_items = [["ItemMap",4],["ACE_EarPlugs",1],["ACE_MapTools",1],["rhsusf_ANPVS_14",1],["ACE_Flashlight_KSF1", 1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5],["ACE_CableTie",20],["ACE_fieldDressing",20],["ACE_morphine",20],["ACE_elasticBandage",20],["ACE_quikclot",20],["ACE_packingBandage",20], ["ACE_tourniquet", 4],["ACE_SpraypaintGreen",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["twc_l5a4_w",25],["twc_l5a4_r",25],["twc_l5a4_g",25]];

_backpacks = [];
_tmp_weapons = [];
_tmp_magazines = [];
_tmp_items = [];
_tmp_backpacks = [];

#include "pol_base.sqf";
#include "ger_base.sqf";
#include "us_army_base.sqf";


if (typeOf vehicle player in ["Modern_UKSF_Squadleader"]) then {
    _tmp_weapons =
    [
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_Kite", 1],
		["rhsusf_ANPVS_15", 1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",5],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC148",1],
		["uk3cb_baf_llm_ir_tan",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["CUP_B_Predator_Radio_MTP",2],
		["twc_mtp_belt",2],
		["TWC_Backpack_UKSF_SL_H",1]
	];
	
};

if (typeOf vehicle player in ["Modern_UKSF_Pointman"]) then {
	_choice = floor (random 2);
	_cqbgun = ["TWC_CUP_smg_MP5A5_flashlight_clean",1];
	_cqbmag = "CUP_30Rnd_9x19_MP5";
	if (_choice == 1) then {
		_cqbgun = ["rhsusf_weap_MP7A2_desert",1];
		_cqbmag = "rhsusf_mag_40Rnd_46x30_FMJ";
	};
	(group player) setvariable ["twc_cqbmag", _cqbmag, true];
    _tmp_weapons =
    [
		["UK3CB_BAF_L128A1_Eotech",1],
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		_cqbgun,
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",20],
		[_cqbmag,25],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["UK3CB_BAF_12G_Pellets",20],
		["UK3CB_BAF_12G_Slugs",30],
		["B_IR_Grenade",2],
		["ACE_M14",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_Kite", 1],
		["rhsusf_ANPVS_15", 1],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["CUP_B_Predator_MTP",2],
		["twc_mtp_belt",2],
		["TWC_Backpack_UKSF_Rifleman",1]
	];
	
};

if (typeOf vehicle player in ["Modern_UKSF_Base"]) then {
    _tmp_weapons =
    [
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		["rhs_weap_m72a7",3],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_Kite", 1],
		["rhsusf_ANPVS_15", 1],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["CUP_B_Predator_MTP",2],
		["twc_mtp_belt",2],
		["TWC_Backpack_UKSF_Rifleman",1]
	];
	
};

if (typeOf vehicle player in ["Modern_UKSF_Grenadier"]) then {
    _tmp_weapons =
    [
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		["rhs_weap_m72a7",3],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_Kite", 1],
		["rhsusf_ANPVS_15", 1],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["CUP_B_Predator_MTP",2],
		["twc_mtp_belt",2],
		["TWC_Backpack_UKSF_Rifleman",1]
	];
	
};

if (typeOf vehicle player in ["Modern_UKSF_2IC"]) then {
    _tmp_weapons =
    [
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		["rhs_weap_m72a7",5],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",80],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",30],
        ["UK3CB_BAF_762_L42A1_20Rnd_T",30],
        ["rhsusf_mag_17Rnd_9x19_JHP",25],
        ["UK3CB_BAF_9_15Rnd",25],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["B_IR_Grenade",2],
		["ACE_M84",3],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_Kite", 1],
		["rhsusf_ANPVS_15", 1],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["twc_mtp_belt",2],
		["TWC_Backpack_UKSF_2IC_H",1]
	];
	
};

if (typeOf vehicle player in ["Modern_UKSF_Marksman"]) then {
    _tmp_weapons =
    [
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		["rhs_weap_m72a7",5],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_762_L42A1_20Rnd",50],
		["UK3CB_BAF_762_L42A1_20Rnd_T",30],
        ["CUP_30Rnd_556x45_Emag",20],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",5],
        ["rhsusf_mag_17Rnd_9x19_JHP",25],
        ["UK3CB_BAF_9_15Rnd",25],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_MaxiKite", 1],
		["rhsusf_ANPVS_15", 1],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["CUP_B_Predator_MTP",2],
		["twc_mtp_belt",2],
		["TWC_Backpack_UKSF_Marksman",1]
	];
	
};

if (typeOf vehicle player in ["Modern_UKSF_Medic"]) then {
    _tmp_weapons =
    [
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",40],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",10],
        ["rhsusf_mag_17Rnd_9x19_JHP",25],
        ["UK3CB_BAF_9_15Rnd",25],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_Kite", 1],
		["rhsusf_ANPVS_15", 1],
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["ACRE_PRC343", 1]
	];
				_tmp_backpacks = 
	[ 
		["TWC_Backpack_UKSF_Medic_H",1]
	];
	
};

if (typeOf vehicle player in ["2000_UKSF_Sectionleader"]) then {
    _tmp_weapons =
    [
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",20],
		["CUP_30Rnd_9x19_MP5",30],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",5],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",1],
		["ACRE_PRC148",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
	_tmp_backpacks = 
	[ 
	];
	
};

if (typeOf vehicle player in ["2000_UKSF_Pointman"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L107A1",1],
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["TWC_CUP_smg_MP5SD6_clean",1],
		["rhs_weap_M590_5RD",1]
    ];

	_tmp_magazines =
    [
        ["rhsusf_5Rnd_00Buck",25],
        ["rhsusf_5Rnd_Slug",25],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag",40],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["ACE_M14",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["twc_oli_belt",1],
		["twc_genbackPack_oli",1]
	];
	
};

if (typeOf vehicle player in ["2000_UKSF_Base"]) then {
    _tmp_weapons =
    [
		["rhs_weap_m72a7",3],
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",20],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["twc_oli_belt",1],
		["twc_genbackPack_oli",1]
	];
	
};

if (typeOf vehicle player in ["2000_UKSF_Grenadier"]) then {
    _tmp_weapons =
    [
		["rhs_weap_m72a7",3],
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",20],
        ["UK3CB_BAF_9_15Rnd",15],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["twc_oli_belt",1],
		["twc_genbackPack_oli",1]
	];
	
};

if (typeOf vehicle player in ["2000_UKSF_2ic"]) then {
    _tmp_weapons =
    [
		["rhs_weap_m72a7",5],
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag",80],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",30],
        ["UK3CB_BAF_9_15Rnd",25],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
	
};

if (typeOf vehicle player in ["2000_UKSF_Medic"]) then {
    _tmp_weapons =
    [
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag",40],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["UK3CB_BAF_9_15Rnd",25],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["ACRE_PRC343", 1]
	];
				_tmp_backpacks = 
	[ 
		["twc_oli_belt",1],
		["twc_genbackPack_oli",1]
	];
	
};

//BAF Section Leader
if (typeOf vehicle player in ["Modern_British_Squadleader", "Modern_British_Squadleader_Light"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC117F",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
	];
	
};

//BAF Rifleman Pointman
 if (typeOf vehicle player in ["Modern_British_Pointman", "Modern_British_Pointman_Light"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L128A1_Eotech",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1],
		["rhs_weap_m72a7",4],
		["rhs_weap_M136_hedp",2],
		["launch_NLAW_F",3],
		["ACE_VMM3",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_12G_Pellets",20],
		["UK3CB_BAF_12G_Slugs",30],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_Eotech",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[ 
	];
};

//BAF Grenadier
 if (typeOf vehicle player in ["Modern_British_Grenadier_COIN", "Modern_British_Grenadier_COIN_Light"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["UK3CB_BAF_9_15Rnd",15],
		["1Rnd_HE_Grenade_shell", 30],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 20],
		["1Rnd_SmokeBlue_Grenade_shell", 10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[ 
	];
};

//BAF Automatic Rifleman
 if (typeOf vehicle player in ["Modern_British_Autorifleman_COIN", "Modern_British_Autorifleman_COIN_Light"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L110A2_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1],
		["rhs_weap_m72a7",4]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd",30],
		["UK3CB_BAF_556_200Rnd_T",10],
		["ACE_SpareBarrel",1],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["UK3CB_BAF_Kite",1],
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[ 
	];
};

//BAF 2IC
 if (typeOf vehicle player in ["Modern_British_2IC_COIN", "Modern_British_2IC_COIN_Light"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1],
		["rhs_weap_m72a7",4]
    ];

    _tmp_magazines =
    [	
    	//Rifleman
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",30],
		//Shotgun
		["UK3CB_BAF_12G_Pellets",20],
		["UK3CB_BAF_12G_Slugs",20],
		//Pistol ammo
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["UK3CB_BAF_9_15Rnd",15],
		//Grenadier
		["1Rnd_HE_Grenade_shell", 40],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 30],
		//Autorifleman
		["UK3CB_BAF_556_200Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",10],
		//GPMG
		["UK3CB_BAF_762_100Rnd_T",20],
		["ACE_SpareBarrel",1],
		//Marksman
        ["UK3CB_BAF_762_L42A1_20Rnd",25],
		["UK3CB_BAF_762_L42A1_20Rnd_T",10],	
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
	];

	_tmp_backpacks = 
	[ 
	];
};

//BAF Machine Gunner
 if (typeOf vehicle player in ["Modern_British_Machinegunner", "Modern_British_Machinegunner_Light"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L7A2",1],
		["UK3CB_BAF_Tripod",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1]
	];
       
    _tmp_magazines =
    [
		["UK3CB_BAF_762_100Rnd_T",30],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["UK3CB_BAF_9_15Rnd",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];
	
	_tmp_items = 
	[
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[ 
	];
};
 
//BAF Marksman
 if (typeOf vehicle player in ["Modern_British_Marksman_COIN", "Modern_British_Marksman_COIN_Light"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L129A1_FGrip_Bipod",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1],
		["launch_NLAW_F",3],
		["rhs_weap_M136_hedp",2]
	];
       
    _tmp_magazines =
    [
        ["UK3CB_BAF_762_L42A1_20Rnd",35],
		["UK3CB_BAF_762_L42A1_20Rnd_T",10],			
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",5]
    ];
		
	_tmp_items = 
	[
		["UK3CB_BAF_TA648_308",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["UK3CB_underbarrel_acc_fgrip_bipod",1],
		["ACRE_PRC343",1]
	];	

	_tmp_backpacks = 
	[ 
	];
};
 if (typeOf vehicle player == "Modern_British_Medic_Mert") then {
    _tmp_weapons =
    [
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1]
	];

    _tmp_magazines =
	[
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["ACRE_PRC343", 1]
	];

	_tmp_backpacks = 
	[ 
	];
};

 if (typeOf vehicle player in ["Modern_British_Medic", "Modern_British_Medic_Light"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L107A1",1],
		["rhsusf_weap_glock17g4",1]
	];

    _tmp_magazines =
	[
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["ACRE_PRC343", 1]
	];

	_tmp_backpacks = 
	[ 
	];
};

 if (typeOf vehicle player in ["Modern_British_Recce_Autorifleman"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L110A2",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",10],
		["ACE_SpareBarrel",1],
        ["rhsusf_mag_17Rnd_9x19_JHP",15]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[ 
		["B_Parachute",1]
	];
};

 if (typeOf vehicle player in ["Modern_British_Recce_Rifleman"]) then {
    _tmp_weapons =
    [
        ["rhs_weap_m72a7",1]
	];

	_tmp_magazines =
   [            
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["rhsusf_mag_17Rnd_9x19_JHP",15]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[ 
		["B_Parachute",1]
	];
};

 if (typeOf vehicle player in ["Modern_British_Recce_Commander"]) then {
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell",10],
		["1Rnd_SmokeBlue_Grenade_shell",10],
		["1Rnd_SmokeGreen_Grenade_shell",10],
		["1Rnd_SmokeRed_Grenade_shell",10]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACE_DAGR",1],
		["ACRE_PRC148",1],
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[ 
		["B_Parachute",1]
	];
};


//BAF Sniper
 if (typeOf vehicle player == "Modern_British_Sniper_coin") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L107A1",1],
		["rhsusf_weap_glock17g4",1]
    ];

    _tmp_magazines =
    [	
		["ACE_10Rnd_338_300gr_HPBT_Mag",50],
		["ACE_10Rnd_338_API526_Mag",10],
		["UK3CB_BAF_9_15Rnd",15],
		["rhsusf_mag_17Rnd_9x19_JHP",15]
	];

	_tmp_items = 
	[
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC343",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",5],
		["UK3CB_BAF_G_Tactical_Black",1],
		["rhsusf_acc_premier_anpvs27",1],
		["ACE_Tripod",1],
		["HandGrenade",5]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Spotter
 if (typeOf vehicle player == "Modern_British_Spotter_coin") then {
    _tmp_weapons =
    [
		["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1]
    ];

    _tmp_magazines =
    [	
		["ACE_10Rnd_338_300gr_HPBT_Mag",50],
		["ACE_10Rnd_338_API526_Mag",10],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_762_L42A1_20Rnd", 50],
		["UK3CB_BAF_762_L42A1_20Rnd_t", 10],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_LLM_IR",1],
		["UK3CB_BAF_Silencer_L115A3",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["UK3CB_BAF_MaxiKite",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
/*
//BAF Bomb Disposal Team Leader
if (g_class == "BAF_EOD_SL") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",0],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DefusalKit",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACRE_PRC117F",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["itemCTAB",1]
    ];
};

//BAF Bomb Disposal Operator
if (g_class == "BAF_EOD_TECH") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",0],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DefusalKit",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_LLM_IR_Black",1]
    ];
};
//BAF Bomb Disposal Team Infantry Escort
 if (g_class == "BAF_EOD_ESC") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L128A1",1],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMM3",1],
		["Binocular",1],
		["rhs_weap_m72a7",4],
		["rhs_weap_M136_hedp",2],
		["launch_NLAW_F",3],
		["UK3CB_BAF_Javelin_Slung_Tube",3]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_12G_Pellets",10],
		["UK3CB_BAF_12G_Slugs",10],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["ACE_MapTools",1],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];
};
*/
//FST Commander
if (typeOf vehicle player == "Modern_British_FSTCommander") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",0],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",5],
        ["UK3CB_BAF_9_15Rnd",5],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];

	_tmp_backpacks = 
	[ 
	];
};

//FST Forward Observer
 if (typeOf vehicle player == "Modern_British_FSTForwardObserver") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
        ["CUP_SOFLAM",1],
		["UK3CB_BAF_L107A1",1],
		["rhsusf_weap_glock17g4",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["rhsusf_mag_17Rnd_9x19_JHP",5],
		["UK3CB_BAF_9_15Rnd",5],
		["1Rnd_HE_Grenade_shell", 20],
		["1Rnd_Smoke_Grenade_shell", 20],
		["1Rnd_SmokeRed_Grenade_shell", 20],
		["1Rnd_SmokeGreen_Grenade_shell", 20],
		["1Rnd_SmokeYellow_Grenade_shell", 20],
		["1Rnd_SmokePurple_Grenade_shell", 20],
		["UGL_FlareWhite_F", 20],
		["1Rnd_SmokeBlue_Grenade_shell", 20],
		["HandGrenade",5],
		["Laserbatteries",1],
		["ACE_HandFlare_White",5],
		["B_IR_Grenade",2]
		
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC343",1],
		["ACRE_PRC152",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_SpottingScope",1]
	];

	_tmp_backpacks = 
	[ 
	];
};

//FST Assistant
 if (typeOf vehicle player == "Modern_British_FSTAssistant") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1],
		["ACE_VMM3",1],
		["UK3CB_BAF_Javelin_Slung_Tube",3],
		["UK3CB_BAF_Javelin_CLU",1],
		["rhs_weap_m72a7",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["rhsusf_mag_17Rnd_9x19_JHP",5],
		["UK3CB_BAF_9_15Rnd",5],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[ 
	];
};

//Fac
 if (typeOf vehicle player == "Modern_British_FAC") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["UK3CB_BAF_L107A1",1],
		["rhs_weap_m72a7",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["rhsusf_mag_17Rnd_9x19_JHP",5],
		["UK3CB_BAF_9_15Rnd",5],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[ 
	];
};
//US Section Leader
/*
//US Sniper
 if (g_class == "US_SN") then {
    _tmp_weapons =
    [
		["rhs_weap_m24sws",1],
		["ACE_Vector",0],
		["rhsusf_weap_m9",1]
    ];

    _tmp_magazines =
    [	
		["rhsusf_5Rnd_762x51_m118_special_Mag",50],
		["rhsusf_mag_15Rnd_9x19_JHP",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC148_ID_1",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["rhsusf_acc_premier",1],
		["ACE_SpottingScope",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1]
	];
};

//US Spotter
 if (g_class == "US_SP") then {
    _tmp_weapons =
    [
		["rhs_weap_m4_carryhandle_pmag",1],
		["ACE_Vector",0],
		["rhsusf_mag_15Rnd_9x19_JHP",1]
    ];

    _tmp_magazines =
    [	
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",50],
		["rhsusf_5Rnd_762x51_m118_special_Mag",50],
		["rhsusf_mag_15Rnd_9x19_JHP",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC148_ID_1",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1],
		["itemCTAB",1]
	];
};
if((typeOf player) in ["1990_RM_British_SectionCommander_Mix","1990_British_SectionCommander_Desert"])
*/
//USMC Squad Leader
 if ((typeOf vehicle player) in ["Modern_USMC_Squadleader", "Modern_USMC_Squadleader_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_m203_acog_lazer",1],
		["rhsusf_weap_m1911a1",1]
    ];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["1Rnd_HE_Grenade_shell", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 20],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15A",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F",1],
		["ACRE_PRC148",1],
		["ACE_IR_Strobe_Item",1]
	];
};
//USMC Team Leader
 if ((typeOf vehicle player) in ["Modern_USMC_Teamleader", "Modern_USMC_Teamleader_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_m203_acog_lazer",1],
        ["rhs_weap_m32",1],
		["rhs_weap_M136_hedp",2],
		["rhsusf_weap_m1911a1",1]
    ];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell", 30],
		["rhsusf_mag_6Rnd_M441_HE", 20],
		["rhsusf_mag_6Rnd_M714_white", 20],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 20],
        ["rhsusf_mag_7x45acp_MHP",15],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_microDAGR",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["rhsusf_assault_eagleaiii_ocp",1],
		["ACRE_PRC148",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_IR_Strobe_Item",1]
		
	];
};

//USMC breacher
  if ((typeOf vehicle player) in ["Modern_USMC_Breacher", "Modern_USMC_Breacher_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],
		["ACE_VMM3",1],
        ["rhsusf_weap_m1911a1",1],
		["rhs_weap_M590_8RD",1]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["rhsusf_8Rnd_00Buck",20],
		["rhsusf_8Rnd_Slug",30],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["ACRE_PRC148",1]
	];
};

//USMC Rifleman
  if ((typeOf vehicle player) in ["Modern_USMC_Rifleman", "Modern_USMC_Rifleman_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],
		["ACE_VMM3",1],
        ["rhsusf_weap_m1911a1",1],
		["rhs_weap_smaw_gr_optic",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",2]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["rhs_mag_smaw_HEDP",6],
		["rhs_mag_smaw_SR",2],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["ACRE_PRC148",1]
	];
};



//USMC Auto Rifleman
  if ((typeOf vehicle player) in ["Modern_USMC_Autorifleman", "Modern_USMC_Autorifleman_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m249_pip_L_mgo_lazer",1],
		["twc_rhs_weap_m27iar_grip_acog_lazer",1],
		["rhsusf_weap_m1911a1",1]
	];

    _tmp_magazines =
    [
        ["rhsusf_100Rnd_556x45_soft_pouch",20],
		["rhsusf_200Rnd_556x45_soft_pouch",10],
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ELCAN",1],
		["rhsusf_acc_anpeq15A",1],
		["bipod_01_F_blk",1],
		["ACRE_PRC148",1]
	];
};

//USMC Auto Rifleman Assistant
  if ((typeOf vehicle player) in ["Modern_USMC_AsstAutorifleman", "Modern_USMC_AsstAutorifleman_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],     
		["rhsusf_weap_m1911a1",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["rhsusf_100Rnd_556x45_soft_pouch",10],
		["rhsusf_200Rnd_556x45_soft_pouch",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["rhsusf_assault_eagleaiii_ocp",1],
		["ACRE_PRC148",1]
	];
};
//USMC Machine Gunner
  if ((typeOf vehicle player) in ["Modern_USMC_MachineGunner", "Modern_USMC_MachineGunner_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m240B_mgo_lazer",1],
		["rhsusf_weap_m1911a1",1]
	];

    _tmp_magazines =
    [
		["rhsusf_100Rnd_762x51_m62_tracer",30],
        ["rhsusf_mag_7x45acp_MHP",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ELCAN",1],
		["rhsusf_acc_anpeq15A",1],
		["ACRE_PRC148",1]
	];
};

//USMC Machine Gunner Assistant
  if ((typeOf vehicle player) in ["Modern_USMC_AsstMachineGunner", "Modern_USMC_AsstMachineGunner_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],
		["rhsusf_weap_m1911a1",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["rhsusf_100Rnd_762x51_m62_tracer",30],
        ["rhsusf_mag_7x45acp_MHP",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["ACRE_PRC148",1]
	];
};

//USMC Medic
  if ((typeOf vehicle player) in ["Modern_USMC_Medic", "Modern_USMC_Medic_d"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],
		["rhsusf_weap_m1911a1",1]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_personalAidKit", 1],
		["ACE_morphine",50],
		["ACE_epinephrine",50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
		["ACE_salineIV_500",50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag",10],
		["ACE_tourniquet", 5],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["rhsusf_assault_eagleaiii_ocp",1],
		["ACRE_PRC148",1]
	];
};
/*

//USMC Sniper
 if (g_class == "USMC_SN") then {
    _tmp_weapons =
    [
		["CUP_srifle_M40A3",1],
		["ACE_Vector",0],
		["rhsusf_weap_m9",1]
    ];

    _tmp_magazines =
    [	
		["rhsusf_10Rnd_762x51_m118_special_Mag",50],
		["rhsusf_mag_15Rnd_9x19_JHP",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC148_ID_1",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["rhsusf_acc_premier",1],
		["ACE_SpottingScope",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1]
	];
};

//USMC Spotter
 if (g_class == "US_SP") then {
    _tmp_weapons =
    [
        ["rhs_weap_m16a4_grip",1],
		["rhs_weap_m4_carryhandle_pmag",1],
		["ACE_Vector",0],
		["rhsusf_mag_15Rnd_9x19_JHP",1]
    ];

    _tmp_magazines =
    [	
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",50],
		["rhsusf_10Rnd_762x51_m118_special_Mag",50],
		["rhsusf_mag_15Rnd_9x19_JHP",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC148_ID_1",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1],
		["itemCTAB",1]
	];
};


//ANA Section Leader
if (g_class == "ANA_SL") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1],
		["binocular",1]
	];
	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10]
	];
	_tmp_items = 
	[
		["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_SpraypaintBlack",1],
		["ACE_SpraypaintRed",1],
		["ACE_SpraypaintGreen",1],
		["ACE_SpraypaintBlue",1]
	];
};

//ANA Team Leader
if (g_class == "ANA_TL") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1],
		["binocular",1]
	];
	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10]
	];
	_tmp_items = 
	[
		["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_SpraypaintBlack",1],
		["ACE_SpraypaintRed",1],
		["ACE_SpraypaintGreen",1],
		["ACE_SpraypaintBlue",1]
	];
};

//ANA Rifleman
 if (g_class == "ANA_RF") then {
    _tmp_weapons =
    [
		["CUP_arifle_M16A2",1]
    ];
	_tmp_magazines =
    [
		["rhs_mag_30Rnd_556x45_M855_Stanag",50]
	];
	_tmp_items = 
	[
		["ACE_MapTools",1]
	];
};

//ANA Grenadier
 if (g_class == "ANA_GRN") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1],
		["CUP_launch_RPG7V",1]
	];
	_tmp_magazines =
    [
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["CUP_PG7V_M",15]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Grenadier Assistant
 if (g_class == "ANA_GRNASS") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1]
	];
	_tmp_magazines =
    [
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["CUP_PG7V_M",15]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Machine Gunner
 if (g_class == "ANA_MG") then {
    _tmp_weapons =
    [
        ["CUP_lmg_PKM",1]
	];
	_tmp_magazines =
    [
		["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",10]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Machine Gunner Assistant
 if (g_class == "ANA_MGASS") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1]
	];
	_tmp_magazines =
    [
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",10]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Medic
 if (g_class == "ANA_MED") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1]
	];
	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_personalAidKit", 50],
		["ACE_morphine",50],
		["ACE_epinephrine",50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
		["ACE_bodyBag",10],
		["TWC_Item_Medical_SutureKit_20", 50],
		["ACE_tourniquet", 5]
	];
};
*/

//Redux ANA

if (typeOf vehicle player == "twc_ana_commander") then {
    _tmp_weapons =
    [
        ["rhs_weap_akm",1],
        ["rhs_weap_makarov_pm",1],
        ["binocular",1]
    ];
	
	



	_tmp_magazines =
    [
        ["rhs_30Rnd_762x39mm",50],
        ["rhs_30Rnd_762x39mm_tracer",5],
        ["rhs_mag_9x18_8_57N181S",5],
		["HandGrenade",5]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855_Stanag",50];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10];
		};
		};
		
    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC148",1],
		["ACRE_PRC117F",1],
		["ACE_morphine", 20],
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_wirecutter", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};


if (typeOf vehicle player == "twc_ana_base") then {
    _tmp_weapons =
    [
        ["rhs_weap_akm",1]
    ];

	_tmp_magazines =
    [
        ["rhs_30Rnd_762x39mm",50],
        ["rhs_30Rnd_762x39mm_tracer",5],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855_Stanag",50];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10];
		};
		};
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};


if (typeOf vehicle player == "twc_ana_subcommander") then {
    _tmp_weapons =
    [
        ["rhs_weap_akm",1],
        ["rhs_weap_makarov_pm",1]
    ];

	_tmp_magazines =
    [
        ["rhs_30Rnd_762x39mm",50],
        ["rhs_30Rnd_762x39mm_tracer",5],
        ["rhs_mag_9x18_8_57N181S",5],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855_Stanag",50];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10];
		};
		};
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};



if (typeOf vehicle player == "twc_ana_rifleman_at") then {
    _tmp_weapons =
    [
        ["rhs_weap_akm",1]
    ];

	_tmp_magazines =
    [
        ["rhs_30Rnd_762x39mm",50],
        ["rhs_30Rnd_762x39mm_tracer",5],
        ["rhs_rpg7_PG7V_mag",5],
        ["rhs_rpg7_OG7V_mag",20],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855_Stanag",50];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10];
		};
		};
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};


if (typeOf vehicle player == "twc_ana_mg") then {
    _tmp_weapons =
    [
        ["CUP_arifle_RPK74",1]
    ];

	_tmp_magazines =
    [
        ["rhs_100Rnd_762x54mmR_green",50],
        ["rhs_30Rnd_762x39mm_tracer",50],
        ["rhs_75Rnd_762x39mm_tracer",5],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_wirecutter", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};



if (typeOf vehicle player == "twc_ana_mg_as") then {
    _tmp_weapons =
    [
        ["rhs_weap_akm",1]
    ];

	_tmp_magazines =
    [
        ["rhs_30Rnd_762x39mm",50],
        ["rhs_30Rnd_762x39mm_tracer",25],
        ["rhs_100Rnd_762x54mmR_green",50],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855_Stanag",50];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10];
		};
		};
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};



if (typeOf vehicle player == "twc_ana_marksman") then {
    _tmp_weapons =
    [
 //       ["rhs_weap_akm",1]
    ];

	_tmp_magazines =
    [
        ["rhs_10Rnd_762x54mmR_7N1",50],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_wirecutter", 1]
    ];
	
		if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["rhs_weap_m24sws_blk_ana",1];
		_tmp_magazines pushback ["rhsusf_5Rnd_762x51_m993_Mag",50];
		};
		};
	
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};


if (typeOf vehicle player == "twc_ana_medic") then {
    _tmp_weapons =
    [
        ["rhs_weap_akm",1]
    ];

	_tmp_magazines =
    [
        ["rhs_30Rnd_762x39mm",50],
        ["rhs_30Rnd_762x39mm_tracer",5],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["rhsgref_helmet_pasgt_olive",1],
		["ACE_fieldDressing",45],
		["ACE_morphine", 20],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACRE_PRC148",1],
		["ACE_wirecutter", 1],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_personalAidKit", 1],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855_Stanag",50];
		_tmp_magazines pushback ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10];
		};
		};
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};

if (typeOf vehicle player == "twc_ana_interpreter") then {
    _tmp_weapons =
    [
        ["rhs_weap_makarov_pm",1],
        ["rhs_weap_aks74u_folded",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_9x18_8_57N181S",2],
        ["rhs_30Rnd_545x39_7N22_AK",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["ACRE_PRC343",1],
		["ACRE_PRC152", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};

//colombian army


if (typeOf vehicle player == "twc_nac_commander") then {
    _tmp_weapons =
    [
        ["rhsusf_weap_m9",1],
        ["binocular",1]
    ];

	_tmp_magazines =
    [
        ["rhsusf_mag_15Rnd_9x19_JHP",50],
        ["rhsusf_mag_15Rnd_9x19_FMJ",50],
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",50],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC148",1],
		["ACRE_PRC117F",1],
		["ACE_morphine", 20],
		["ACE_wirecutter", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};


if (typeOf vehicle player == "twc_nac_base") then {
    _tmp_weapons =
    [
        ["rhs_weap_m21a",1]
    ];

	_tmp_magazines =
    [
        ["rhsgref_30rnd_556x45_m21",50],
        ["rhsgref_30rnd_556x45_m21_t",50],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["ACE_wirecutter", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};


if (typeOf vehicle player == "twc_nac_subcommander") then {
    _tmp_weapons =
    [
        ["rhsusf_weap_m9",1]
    ];

	_tmp_magazines =
    [
        ["rhsusf_mag_15Rnd_9x19_JHP",50],
        ["rhsusf_mag_15Rnd_9x19_FMJ",50],
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",50],
        ["rhsgref_30rnd_556x45_m21",50],
        ["rhsgref_30rnd_556x45_m21_t",50],
        ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",50],
        ["1Rnd_HE_Grenade_shell",50],
        ["ACE_HuntIR_M203",50],
        ["1Rnd_Smoke_Grenade_shell",50],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["ACE_wirecutter", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};



if (typeOf vehicle player == "twc_nac_mg") then {
    _tmp_weapons =
    [
  //      ["rhs_weap_akm",1]
    ];

	_tmp_magazines =
    [
        ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",50],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["ACE_wirecutter", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};


if (typeOf vehicle player == "twc_nac_medic") then {
    _tmp_weapons =
    [
        ["rhs_weap_m21a",1]
    ];

	_tmp_magazines =
    [
        ["rhsgref_30rnd_556x45_m21",50],
        ["rhsgref_30rnd_556x45_m21_T",50],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",45],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_wirecutter", 1],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_personalAidKit", 1],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};

if (typeOf vehicle player == "twc_nac_interpreter") then {
    _tmp_weapons =
    [
        ["rhsusf_weap_m9",1],
        ["rhs_weap_m21a_fold",1]
    ];

	_tmp_magazines =
    [
        ["rhsusf_mag_15Rnd_9x19_JHP",50],
        ["rhsusf_mag_15Rnd_9x19_FMJ",50],
        ["rhsgref_30rnd_556x45_m21",50],
        ["rhsgref_30rnd_556x45_m21_T",50]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",1],
		["ACRE_PRC343",1],
		["ACRE_PRC152", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};




//BAF Pilot
 if (typeOf vehicle player == "Modern_British_heliPilot") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",3],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["rhsusf_ANPVS_14",1],
		["ACE_microDAGR",1]
	];
};

 if (typeOf vehicle player == "Modern_British_MERT_HeliPilot") then {
    _tmp_weapons =
    [
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",1],
		["ACRE_PRC343",1],
		["rhsusf_ANPVS_14",1],
		["itemCTAB",1],
		["ACE_microDAGR",1]
	];
};




 //BAF Crew Cheif
 if (typeOf vehicle player == "Modern_British_crewchief") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",5],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["rhsusf_ANPVS_14",1]
		
	];
};


if (typeOf vehicle player == "Modern_British_Logitech") then {
    _tmp_weapons =
    [
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",5],
        ["rhsusf_mag_17Rnd_9x19_JHP",5],
		["B_IR_Grenade",2]
    ];

    _tmp_items = 
	[
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC148",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
	];
	
};

//BAF Armour
 if (typeOf vehicle player == "Modern_British_VehicleCrew") then {
    _tmp_weapons =
    [
		["rhsusf_weap_glock17g4",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",5],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[
	];
};

//BAF Armour
 if (typeOf vehicle player == "Modern_British_VehicleCommander") then {
    _tmp_weapons =
    [
        ["ACE_Vector",0],
		["rhsusf_weap_glock17g4",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",5],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[
	];
};

//US Pilot
 if (typeOf vehicle player == "TWC_Modern_US_Army_HeliPilot") then {
    _tmp_weapons =
    [
        ["rhs_weap_m4_carryhandle",1],
		["rhsusf_weap_m9",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",50],
        ["rhsusf_mag_15Rnd_9x19_FMJ",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",1],
		["rhsusf_ANPVS_14",1],
		["itemCTAB",1],
		["rhsusf_ANPVS_14",1],
		["UK3CB_BAF_Eotech",1]
		
	];
};


//90's era kit
if((typeOf player) in ["1990_RM_British_SectionCommander_Mix","1990_British_SectionCommander","1990_British_SectionCommander_Desert"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D_Lazer",1],
        ["UK3CB_BAF_L9A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["UK3CB_BAF_9_13Rnd",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC117F",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",1]
	];
};

 if((typeOf player) in ["1990_British_Rifleman","1990_British_Rifleman_Desert","1990_RM_British_Rifleman_Mix"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["rhs_weap_m72a7",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if((typeOf player) in ["1990_British_Rifleman_AT","1990_British_Rifleman_AT_Desert","1990_RM_British_Rifleman_AT_Mix"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["rhs_weap_m72a7",5]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 
 if((typeOf player) in ["1990_British_Gunner","1990_British_Gunner_Desert","1990_RM_British_Marksman_Mix"])then{
    _tmp_weapons =
    [
		["UK3CB_BAF_L86A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};


 if((typeOf player) in ["1990_British_2IC","1990_British_2IC_Desert","1990_RM_British_2IC_Mix"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["UK3CB_BAF_L9A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",30],
		["UK3CB_BAF_9_13Rnd",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["1990_British_Medic","1990_British_Medic_Desert","1990_RM_British_Medic_Mix"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1],
		["ACE_fieldDressing", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_personalAidKit", 1],
		["ACE_bodyBag", 10]
	];
};


 if (typeOf vehicle player == "1990_RM_British_Gunner_Mix") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L110A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd_T",40],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Sniper_desert") then {
    _tmp_weapons =
    [
        ["twc_l96_d",1],
        ["UK3CB_BAF_L9A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_9_13Rnd",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Spotter_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["UK3CB_BAF_L9A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_9_13Rnd",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1],
		["ACE_RangeCard",1],
		["ACRE_PRC117F",1]
	];
};


 if (typeOf vehicle player in ["1990_British_MachineGunner","1990_British_MachineGunner_Desert"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_Tripod",1],
        ["UK3CB_BAF_L7A2",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd_T",30],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player in ["1990_British_mg_assistant","1990_British_mg_assistant_Desert"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_Tripod",1],
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd_T",30],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

//FST Commander (90's)
 if((typeOf player) in ["1990_British_FSTCommander", "1990_British_FSTCommander_Desert"])then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["binocular",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_9_13Rnd",10],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SUSAT_3D",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC117F",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
};

//FST Forward Observer (90's)
 if((typeOf player) in ["1990_British_FSTForwardObserver", "1990_British_FSTForwardObserver_Desert"]) then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["CUP_SOFLAM",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5],
		["Laserbatteries",1],
		["ACE_HandFlare_White",5],
		["B_IR_Grenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SUSAT_3D",1],
		["ACRE_PRC343",1],
		["ACRE_PRC152",1],
		["ACE_SpottingScope",1]
	];
};

//FST Assistant (90's)
 if((typeOf player) in ["1990_British_FSTAssistant", "1990_British_FSTAssistant_Desert"]) then{
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A1_SUSAT3D",1],
		["rhs_weap_maaws",1],
		["rhs_weap_m72a7",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["rhs_mag_maaws_HE",6],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["rhs_optic_maaws",1],
		["ACRE_PRC343",1]
	];
};


//////////////////////////////////
///2000 era kit
//////////////////////////////////

 if((typeOf player) in ["2000_British_SectionCommander_Desert","2000_British_SectionCommander","2000_British_SectionCommander_Desert_light","2000_British_SectionCommander_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_SUSAT",1],
        ["UK3CB_BAF_L107A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_9_15Rnd",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC117F",1],
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_Rifleman_Desert","2000_British_Rifleman","2000_British_Rifleman_Desert_light","2000_British_Rifleman_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_SUSAT",1],
		["rhs_weap_m72a7",5]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_Marksman_Desert"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L86A1_SUSAT3D",1],
		["rhs_weap_m72a7",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",30],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_9_13Rnd",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_Grenadier_Desert","2000_British_Grenadier","2000_British_Grenadier_Desert_light","2000_British_Grenadier_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_SUSAT",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["1Rnd_HE_Grenade_shell",30],
		["UGL_FlareGreen_F",20],
		["UGL_FlareRed_F",20],
		["UGL_FlareWhite_F",20],
		["UGL_FlareYellow_F",20],
		["1Rnd_SmokeBlue_Grenade_shell",20],
		["1Rnd_SmokeGreen_Grenade_shell",20],
		["1Rnd_SmokeOrange_Grenade_shell",20],
		["1Rnd_SmokePurple_Grenade_shell",20],
		["1Rnd_SmokeRed_Grenade_shell",20],
		["1Rnd_Smoke_Grenade_shell",20],
		["1Rnd_SmokeYellow_Grenade_shell",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_Gunner","2000_British_Gunner_Desert","2000_British_Gunner_light","2000_British_Gunner_Desert_light"])then{
    _tmp_weapons =
    [
        ["TWC_UK3CB_BAF_L110A2_SUSAT",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd_T",50],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_2IC_Desert","2000_British_2IC","2000_British_2IC_Desert_light","2000_British_2IC_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_SUSAT",1],
		["rhs_weap_m72a7",1],
        ["UK3CB_BAF_L9A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_9_13Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",20],
		["UK3CB_BAF_762_200Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_MachineGunner_Desert","2000_British_MachineGunner"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L7A2",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd_T",40],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_mg_assistant_Desert","2000_British_mg_assistant"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_SUSAT",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["UK3CB_BAF_762_200Rnd_T",30],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_Medic_Desert","2000_British_Medic","2000_British_Medic_Desert_light","2000_British_Medic_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_SUSAT",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["ACRE_PRC343", 1]
	];
};



 if((typeOf player) in ["2000_British_HeliPilot_Desert","2000_British_HeliPilot"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L107A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_9_15Rnd",10]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",1]
	];
};




 if((typeOf player) in ["2000_British_Sniper","2000_British_Sniper_desert"])then{
    _tmp_weapons =
    [
		["twc_l96_d",1],
		["ACE_Yardage450",1],
		["UK3CB_BAF_L85A2_SUSAT",1],
		["UK3CB_BAF_L107A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_762_L42A1_10Rnd_T",30]
    ];

	_tmp_items =
	[
		["ACE_Tripod",1],
		["ACRE_PRC343",1]
	];
};


 if((typeOf player) in ["2000_British_Spotter", "2000_British_Spotter_desert"])then{
    _tmp_weapons =
    [
		["twc_l96_d",1],
		["ACE_Yardage450",1],
		["UK3CB_BAF_L85A2_SUSAT",1],
		["UK3CB_BAF_L107A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd_T",30],
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_556_30Rnd",50]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",1],
		["ACE_RangeCard",1],
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_Vehicle_Commander"])then{
    _tmp_weapons =
    [
        ["rhs_weap_m4",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",10]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",1],
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["2000_British_Vehicle_Crew"])then{
    _tmp_weapons =
    [
        ["rhs_weap_m4",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",10]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",1],
		["ACRE_PRC343",1]
	];
};


///////////////////////////////////////////////////////////
/////2000 US Army Kit
///////////////////////////////////////



 if((typeOf player) in ["TWC_2000_US_Army_SectionCommander"])then{
    _tmp_weapons =
    [
        ["rhs_m4_compm4",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["optic_MRCO",1],
		["ACRE_PRC117F",1],
		["ACRE_PRC148",1]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_TeamLeader"])then{
    _tmp_weapons =
    [
        ["twc_m4_203_cco",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell",20],
		["UGL_FlareGreen_F",20],
		["UGL_FlareRed_F",20],
		["UGL_FlareWhite_F",20],
		["UGL_FlareYellow_F",20],
		["optic_MRCO",1],
		["1Rnd_SmokeBlue_Grenade_shell",20],
		["1Rnd_SmokeGreen_Grenade_shell",20],
		["1Rnd_SmokeOrange_Grenade_shell",20],
		["1Rnd_SmokePurple_Grenade_shell",20],
		["1Rnd_SmokeRed_Grenade_shell",20],
		["1Rnd_Smoke_Grenade_shell",20],
		["1Rnd_SmokeYellow_Grenade_shell",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["rhsusf_spc_teamleader",1],
		["ACRE_PRC148",1]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_Rifleman"])then{
    _tmp_weapons =
    [
        ["rhs_m4_compm4",1],
        ["rhs_weap_M136",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",1],
		["rhsusf_spc_rifleman",1],
		["optic_MRCO",1]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_Grenadier"])then{
    _tmp_weapons =
    [
        ["twc_m4_203_cco",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell",20],
		["UGL_FlareGreen_F",20],
		["UGL_FlareRed_F",20],
		["UGL_FlareWhite_F",20],
		["UGL_FlareYellow_F",20],
		["1Rnd_SmokeBlue_Grenade_shell",20],
		["1Rnd_SmokeGreen_Grenade_shell",20],
		["1Rnd_SmokeOrange_Grenade_shell",20],
		["1Rnd_SmokePurple_Grenade_shell",20],
		["1Rnd_SmokeRed_Grenade_shell",20],
		["1Rnd_Smoke_Grenade_shell",20],
		["1Rnd_SmokeYellow_Grenade_shell",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["optic_MRCO",1],
		["ACRE_PRC148",1]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_AutomaticRifleman"])then{
    _tmp_weapons =
    [
        ["twc_m249_para_acog",1]
	];

	_tmp_magazines =
   [            
		["rhs_200rnd_556x45_B_SAW",30],
		["rhs_200rnd_556x45_T_SAW",20],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["rhsusf_spc_mg",1],
		["ACRE_PRC148",1]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_Marksman"])then{
    _tmp_weapons =
    [
        ["rhs_m4_compm4",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",1]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_Medic"])then{
    _tmp_weapons =
    [
        ["rhs_m4_compm4",1]
	];

	_tmp_magazines =
   [            
		["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 5],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["optic_MRCO",1],
		["rhsusf_spc_corpsman",1],
		["ACRE_PRC148",1]
	];
};






/*
 //US Crew Cheif
 if (g_class == "USPLT_CREW") then {
    _tmp_weapons =
    [
        ["rhs_weap_m4_carryhandle",1],
		["rhsusf_weap_m9",1]
    ];

	_tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855_Stanag",50],
		["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",50],
        ["rhsusf_mag_15Rnd_9x19_FMJ",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",1],
		["rhsusf_ANPVS_14",1],
		["ACRE_PRC117F",1],
		["itemCTAB",1],
		["rhsusf_ANPVS_14",1],
		["UK3CB_BAF_Eotech",1]
		
	];
};

//BAF Armour Commander
 if (g_class == "ARMR_CO") then {
    _tmp_weapons =
	[
        ["UK3CB_BAF_L22A2",1],
        ["ACE_Vector",0],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15]
    ];
	_tmp_items =
	[
        ["ACE_MapTools",1],
        ["ACE_fieldDressing",20],
        ["ACE_morphine",10],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC343",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		["UK3CB_BAF_LLM_IR",1],
		["itemCTAB",1],
		["rhsusf_ANPVS_14",1]
	];
};

//BAF Armour Crew
 if (g_class == "ARMR_CREW") then {
    _tmp_weapons =
	[
        ["UK3CB_BAF_L22A2",1],
        ["ACE_Vector",0],
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1],
        ["ACE_fieldDressing",20],
        ["ACE_morphine",10],
		["ACRE_PRC148",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		["UK3CB_BAF_LLM_IR",1],
		["ACRE_PRC343",1],
		["rhsusf_ANPVS_14",1]
	];
};
*/

{
        _weapons set [count _weapons, _x];
} forEach _tmp_weapons;
{
        _magazines set [count _magazines, _x];
} forEach _tmp_magazines;

{
        _items set [count _items, _x];
} forEach _tmp_items;

{
        _backpacks set [count _backpacks, _x];
} forEach _tmp_backpacks;

// empty it.
clearWeaponCargo crateBox;
clearMagazineCargo crateBox;
clearItemCargo crateBox;
clearbackPackCargo crateBox;


_spawnweps = [(configFile >> "CfgVehicles" >> (typeOf player)), "weapons", "none"] call BIS_fnc_returnConfigEntry;
 
{
_spawnweps pushback (_x select 0);
} foreach _tmp_weapons;


_spawnitems = [(configFile >> "CfgVehicles" >> (typeOf player)), "weapons", "none"] call BIS_fnc_returnConfigEntry;
 
{
_spawnweps pushback (_x select 0);
} foreach _tmp_items;

_checkweps = (player getvariable ["twc_allowedweapons", []]);
if (count _checkweps == 0) then {player setvariable ["twc_allowedweapons", _spawnweps]};

if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin","Modern_Artillery_Commander","Modern_Artillery_Gunner"]) then {

if (( count(allPlayers - entities "HeadlessClient_F"))>=0) then {// add in all weapons.
{crateBox addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;

// add in all magazines.
{crateBox addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;

{crateBox addItemCargo [(_x select 0),(_x select 1)]} foreach _items;

{crateBox addBackpackCargo [(_x select 0),(_x select 1)]} foreach _backpacks;
}
else
{
[2] execVM "Insurgency_Core\client\sys_restrict\restrictedkit.sqf";};

} else {

// add in all weapons.
{crateBox addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;

// add in all magazines.
{crateBox addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;

{crateBox addItemCargo [(_x select 0),(_x select 1)]} foreach _items;

{crateBox addBackpackCargo [(_x select 0),(_x select 1)]} foreach _backpacks;

};