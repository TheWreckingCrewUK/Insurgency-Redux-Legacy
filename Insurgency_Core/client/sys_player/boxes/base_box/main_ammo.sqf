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

_weapons = [["ACE_Flashlight_Maglite_ML300L",1]];
_magazines = [["UK3CB_BAF_SmokeShell",10], ["UK3CB_BAF_SmokeShellYellow",5], ["UK3CB_BAF_SmokeShellRed",5], ["UK3CB_BAF_SmokeShellGreen",5], ["UK3CB_BAF_SmokeShellPurple",5], ["UK3CB_BAF_SmokeShellBlue",5], ["UK3CB_BAF_SmokeShellOrange",5], ["Chemlight_green",20], ["Chemlight_yellow",20], ["Chemlight_red",20], ["Chemlight_blue",20],["ACE_Chemlight_IR",10],["twc_l5a4_w",15]];
_items = [["ACE_EarPlugs",1],["ACE_MapTools",1],["ACE_Flashlight_KSF1", 1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5],["ACE_CableTie",20],["ACE_fieldDressing",40],["ACE_morphine",20],["ACE_elasticBandage",20],["ACE_quikclot",20], ["ACE_tourniquet", 4],["ACE_SpraypaintGreen",1],["Toolkit",0],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["twc_l5a4_w",25]];
twc_crateweapons = [];
twc_cratemagazines = [];
twc_crateitems = [];
{twc_crateweapons pushback _x} foreach _weapons;
{twc_cratemagazines pushback _x} foreach  _magazines;
{twc_crateitems pushback _x} foreach _items;

if (hasinterface) then {
	if ((!(["70", twc_missionname] call BIS_fnc_inString)) && (!(["90", twc_missionname] call BIS_fnc_inString))) then {
		_items pushback ["CUP_NVG_PVS14",1];
	};
	if ((["90", twc_missionname] call BIS_fnc_inString)) then {
		_items pushback ["CUP_NVG_PVS7",1];
	};
};
_backpacks = [];
_tmp_weapons = [];
_tmp_magazines = [];
_tmp_items = [];
_tmp_backpacks = [];

#include "1970_base.sqf";
#include "1970_rus_base.sqf";
#include "pol_base.sqf";
#include "ger_base.sqf";
#include "us_army_base.sqf";


if (["quartermaster", typeof player] call BIS_fnc_inString) then {
	

    _tmp_weapons = 
	[
		["TWC_CUP_smg_MP5A5_flashlight_clean", 1]
	];

	_tmp_magazines =
    [
        ["CUP_30Rnd_9x19_MP5",50],
        ["CUP_30Rnd_556x45_Emag",50]
    ];
	
    _tmp_items = 
	[
		["itemCTAB", 2],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",5],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",5],
		["ACRE_PRC148",5]
    ];
				_tmp_backpacks = 
	[ 
		["twc_mtp_belt",2],
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",5]
	];
};

if (typeOf vehicle player in ["Modern_UKSF_Squadleader"]) then {
    _tmp_weapons =
    [
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",15],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["twc_acc_rotex5_grey", 1],
		 
		["CUP_NVG_PVS15_black", 1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",5],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",0],
		["ACRE_PRC148",0],
		 
		["ACE_wirecutter", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
	_cqbgun = ["TWC_CUP_smg_MP5SD6_clean",1];
	
	_cqbmag = "CUP_30Rnd_9x19_MP5";
	(group player) setvariable ["twc_cqbmag", _cqbmag, true];
    _tmp_weapons =
    [
		["CUP_sgun_M1014_Entry_vfg",1],
		([["TWC_UK3CB_BAF_L119A2_10_T1",1], ["TWC_UK3CB_BAF_L119A2_10_EOTECH", 1], ["TWC_UK3CB_BAF_L119A2_10_MAG", 1]] call bis_fnc_selectrandom),
		_cqbgun,
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",15],
		["CUP_30Rnd_9x19_MP5",50],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["CUP_6Rnd_B_Beneli_74Pellets",30],
		["CUP_6Rnd_B_Benelli_74Slug",30],
		["B_IR_Grenade",2],
		["ACE_M14",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["twc_acc_rotex5_grey", 1],
		["CUP_NVG_PVS15_black", 1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
		["CUP_launch_M72A6",3],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",15],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["twc_acc_rotex5_grey", 1],
		["CUP_NVG_PVS15_black", 1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
		["CUP_launch_M72A6",3],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",50],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",15],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		 
		["twc_acc_rotex5_grey", 1],
		["CUP_NVG_PVS15_black", 1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
		["CUP_launch_M72A6",5],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_Emag",80],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",15],
        ["UK3CB_BAF_762_L42A1_20Rnd_T",30],
        ["CUP_17Rnd_9x19_glock17",25],
        ["UK3CB_BAF_9_15Rnd",25],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["B_IR_Grenade",2],
		["ACE_M84",3],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		 
		["twc_acc_rotex5_grey", 1],
		["CUP_NVG_PVS15_black", 1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
		["CUP_launch_M72A6",5],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_762_L42A1_20Rnd",50],
		["UK3CB_BAF_762_L42A1_20Rnd_T",30],
        ["CUP_30Rnd_556x45_Emag",20],
		["CUP_30Rnd_556x45_Emag_Tracer_Red",5],
        ["CUP_17Rnd_9x19_glock17",25],
        ["UK3CB_BAF_9_15Rnd",25],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_MaxiKite", 1],
		["cup_optic_an_pas_13c1", 1],
		["twc_acc_nt4_tan", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		["CUP_NVG_PVS15_black", 1],
		["ACRE_PRC343",0],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
        ["CUP_17Rnd_9x19_glock17",25],
        ["UK3CB_BAF_9_15Rnd",25],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		 
		["CUP_NVG_PVS15_black", 1],
		["twc_acc_rotex5_grey", 1],
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
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
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
		["TWC_L119A1D_cco",1],
		["TWC_CUP_smg_MP5A5_flashlight_clean",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",15],
		["CUP_30Rnd_9x19_MP5",30],
        ["UK3CB_BAF_9_15Rnd",15],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",5],
		["ACE_M26_Clacker",1],
		["twc_l85_suppressor", 1],
		["ACRE_PRC343",0],
		["ACRE_PRC148",0],
		["ACE_wirecutter", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		["UK3CB_BAF_H_Boonie_DDPM_PRR", 1],
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
		["TWC_UK3CB_BAF_L119A1_CQB_ACOG",1],
		["TWC_CUP_smg_MP5SD6_clean",1],
		["TWC_CUP_smg_MP5A5_flashlight_clean",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_9x19_MP5",35],
        ["30Rnd_556x45_Stanag",40],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["ACE_M14",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",0],
		["twc_l85_suppressor", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		["UK3CB_BAF_H_Boonie_DDPM_PRR", 1],
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
		["CUP_launch_M72A6",3],
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["TWC_CUP_smg_MP5A5_flashlight_clean",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",15],
		["CUP_30Rnd_9x19_MP5",30],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",0],
		["twc_l85_suppressor", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		["UK3CB_BAF_H_Boonie_DDPM_PRR", 1],
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
		["CUP_launch_M72A6",3],
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["TWC_CUP_smg_MP5A5_flashlight_clean",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",15],
		["CUP_30Rnd_9x19_MP5",30],
        ["UK3CB_BAF_9_15Rnd",15],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",0],
		["twc_l85_suppressor", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		["UK3CB_BAF_H_Boonie_DDPM_PRR", 1],
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
		["CUP_launch_M72A6",5],
		["TWC_UK3CB_BAF_L119A1_CQB_EOTECH",1],
		["TWC_L119A1D_cco",1],
		["TWC_CUP_smg_MP5A5_flashlight_clean",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",80],
		["30Rnd_556x45_Stanag_Tracer_Red",30],
		["CUP_30Rnd_9x19_MP5",30],
        ["UK3CB_BAF_9_15Rnd",25],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
        ["1Rnd_HE_Grenade_shell",25],
        ["1Rnd_SmokeBlue_Grenade_shell",25],
        ["1Rnd_SmokeRed_Grenade_shell",25],
        ["1Rnd_Smoke_Grenade_shell",25],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["ACRE_PRC343",0],
		["twc_l85_suppressor", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		["UK3CB_BAF_H_Boonie_DDPM_PRR", 1],
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
		["TWC_CUP_smg_MP5A5_flashlight_clean",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",40],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["CUP_30Rnd_9x19_MP5",30],
        ["UK3CB_BAF_9_15Rnd",25],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
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
		["twc_l85_suppressor", 1],
		["UK3CB_BAF_H_Beret_SAS_PRR", 1],
		["UK3CB_BAF_H_Boonie_DDPM_PRR", 1],
		["ACRE_PRC343", 1]
	];
				_tmp_backpacks = 
	[ 
		["twc_oli_belt",1],
		["twc_genbackPack_oli",1]
	];
	
};

//BAF Section Leader
if (typeOf vehicle player in ["TWC_Infantry_2020_COIN_Dismounted_Woodland_SectionCommander", "TWC_Infantry_Modern_COIN_Dismounted_Woodland_SectionCommander"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L85A3_RIS_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["B_IR_Grenade",2],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["ACE_DAGR",1],
		["ACRE_PRC343",0],
		["ACRE_PRC117F",0],
		["UK3CB_BAF_LLM_IR_Black",0],
		["ACE_wirecutter", 1],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
	];
	
};

//BAF Rifleman Pointman
 if (typeOf vehicle player in ["TWC_Infantry_Modern_COIN_Dismounted_Woodland_Pointman", "TWC_Infantry_2020_COIN_Dismounted_Woodland_Pointman"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L85A3_RIS_ELCAN3D",1],
		["TWC_L128A1_Eotech",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_launch_M72A6",4],
		["CUP_launch_M136",2],
		["launch_NLAW_F",3],
		["ACE_VMM3",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_8Rnd_B_Beneli_74Pellets",30],
		["CUP_8Rnd_B_Beneli_74Slug",30],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",2]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["UK3CB_BAF_Eotech",0],
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["UK3CB_BAF_LLM_IR_Black",0]
	];

	_tmp_backpacks = 
	[ 
		[(selectrandom ["CUP_B_AlicePack_OD", "TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A", "CUP_B_Motherlode_MTP", "CUP_B_Predator_MTP"]),1]
	];
};

//BAF Grenadier
 if (typeOf vehicle player in ["TWC_Infantry_Modern_COIN_Dismounted_Woodland_Grenadier", "TWC_Infantry_2020_COIN_Dismounted_Woodland_Grenadier"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_9_15Rnd",15],
		["1Rnd_HE_Grenade_shell", 30],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 20],
		["1Rnd_SmokeBlue_Grenade_shell", 10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["UK3CB_BAF_LLM_IR_Black",0]
	];


	_tmp_backpacks = 
	[ 
		[(selectrandom ["CUP_B_AlicePack_OD", "TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A", "CUP_B_Motherlode_MTP", "CUP_B_Predator_MTP"]),1]
	];
};

//BAF Automatic Rifleman
 if (typeOf vehicle player in ["TWC_Infantry_Modern_COIN_Dismounted_Woodland_Autorifleman"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L110A2_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_launch_M72A6",4]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd",30],
		["UK3CB_BAF_556_200Rnd_T",10],
		["ACE_SpareBarrel",1],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["UK3CB_BAF_LLM_IR_Black",0],
		["UK3CB_BAF_Kite",1],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACRE_PRC343",0]
	];

	_tmp_backpacks = 
	[ 
		[(selectrandom ["CUP_B_AlicePack_OD", "TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A", "CUP_B_Motherlode_MTP", "CUP_B_Predator_MTP"]),1]
	];
};

//BAF 2IC
 if (typeOf vehicle player in ["TWC_Infantry_Modern_COIN_Dismounted_Woodland_2iC", "TWC_Infantry_2020_COIN_Dismounted_Woodland_2iC"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L85A3_RIS_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_launch_M72A6",4]
    ];

    _tmp_magazines =
    [	
    	//Rifleman
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",30],
		//Shotgun
		["CUP_8Rnd_B_Beneli_74Pellets",20],
		["CUP_8Rnd_B_Beneli_74Slug",20],
		//Pistol ammo
		["CUP_17Rnd_9x19_glock17",15],
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
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACRE_PRC343",0],
		["UK3CB_BAF_LLM_IR_Black",0],
		["ACE_wirecutter", 1],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACE_IR_Strobe_Item",1]
	];

	_tmp_backpacks = 
	[ 
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
};

//BAF Machine Gunner
 if (typeOf vehicle player in ["TWC_Infantry_Modern_COIN_Dismounted_Woodland_MG", "TWC_Infantry_2020_COIN_Dismounted_Woodland_MG"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L7A2",1],
		["UK3CB_BAF_Tripod",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1]
	];
       
    _tmp_magazines =
    [
		["UK3CB_BAF_762_100Rnd_T",30],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_9_15Rnd",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];
	
	_tmp_items = 
	[
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1]
	];

	_tmp_backpacks = 
	[ 
		[(selectrandom ["CUP_B_AlicePack_OD", "TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A", "CUP_B_Motherlode_MTP", "CUP_B_Predator_MTP"]),1]
	];
};
 
//BAF Marksman
 if (typeOf vehicle player in ["TWC_Infantry_Modern_COIN_Dismounted_Woodland_Marksman", "TWC_Infantry_2020_COIN_Dismounted_Woodland_Marksman"]) then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L129A1_FGrip_Bipod",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_launch_M136",4]
	];
       
    _tmp_magazines =
    [
        ["UK3CB_BAF_762_L42A1_20Rnd",35],
		["UK3CB_BAF_762_L42A1_20Rnd_T",10],			
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",2]
    ];
		
	_tmp_items = 
	[
		["UK3CB_BAF_TA648_308",1],
		["UK3CB_BAF_MaxiKite",1],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACRE_PRC343",0]
	];	

	_tmp_backpacks = 
	[ 
		[(selectrandom ["CUP_B_AlicePack_OD", "TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A", "CUP_B_Motherlode_MTP", "CUP_B_Predator_MTP"]),1]
	];
};
 if (typeOf vehicle player == "Modern_British_Medic_Mert") then {
    _tmp_weapons =
    [
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1]
	];

    _tmp_magazines =
	[
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
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
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACRE_PRC343", 1]
	];

	_tmp_backpacks = 
	[ 
	];
};

 if (typeOf vehicle player in ["TWC_Infantry_Modern_COIN_Dismounted_Woodland_Platoon_Medic", "TWC_Infantry_2020_COIN_Dismounted_Woodland_Platoon_Medic"]) then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L85A3_RIS_ELCAN3D",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_hgun_Glock17",1]
	];

    _tmp_magazines =
	[
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["UK3CB_BAF_H_Beret_Rifles_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACRE_PRC343", 1]
	];

	_tmp_backpacks = 
	[ 
		[(selectrandom ["CUP_B_AlicePack_OD", "TWC_BAF_B_Bergen_OLI_Rifleman_XL_A", "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A", "CUP_B_Motherlode_MTP", "CUP_B_Predator_MTP"]),1]
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
        ["CUP_17Rnd_9x19_glock17",15]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACE_DAGR",1],
		["ACRE_PRC343",0]
	];

	_tmp_backpacks = 
	[ 
		["B_Parachute",1]
	];
};

 if (typeOf vehicle player in ["Modern_British_Recce_Rifleman"]) then {
    _tmp_weapons =
    [
        ["CUP_launch_M72A6",1]
	];

	_tmp_magazines =
   [            
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_17Rnd_9x19_glock17",15]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACE_DAGR",1],
		["ACRE_PRC343",0]
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
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell",10],
		["1Rnd_SmokeBlue_Grenade_shell",10],
		["1Rnd_SmokeGreen_Grenade_shell",10],
		["1Rnd_SmokeRed_Grenade_shell",10]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACE_DAGR",1],
		["ACRE_PRC148",0],
		["ACRE_PRC343",0]
	];

	_tmp_backpacks = 
	[ 
		["B_Parachute",1]
	];
};


//BAF Sniper
 if (typeOf vehicle player == "TWC_Infantry_Modern_COIN_Woodland_Sniper", "TWC_Infantry_2020_COIN_Woodland_Sniper") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L107A1",1],
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["CUP_hgun_Glock17",1]
    ];

    _tmp_magazines =
    [	
		["ACE_10Rnd_338_300gr_HPBT_Mag",50],
		["ACE_10Rnd_338_API526_Mag",10],
		["UK3CB_BAF_556_30Rnd",10],
		["UK3CB_BAF_9_15Rnd",15],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_127_10Rnd",15]
	];

	_tmp_items = 
	[
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC343",0],
		["ACE_RangeCard",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",5],
		["CUP_optic_AN_PVS_10",1],
		["ACE_Tripod",1],
		["UK3CB_BAF_H_Beret_PWRR_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["HandGrenade",2]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
		["UK3CB_BAF_B_Bergen_OLI_Rifleman_A",1]
	];
};

//BAF Spotter
 if (typeOf vehicle player == "TWC_Infantry_Modern_COIN_Woodland_Spotter", "TWC_Infantry_2020_COIN_Woodland_Spotter") then {
    _tmp_weapons =
    [
		["ACE_Vector",1],
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1]
    ];

    _tmp_magazines =
    [	
		["ACE_10Rnd_338_300gr_HPBT_Mag",50],
		["ACE_10Rnd_338_API526_Mag",10],
		["UK3CB_BAF_556_30Rnd",10],
		["UK3CB_BAF_762_L42A1_20Rnd", 50],
		["UK3CB_BAF_762_L42A1_20Rnd_t", 10],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_9_15Rnd",15],
		["HandGrenade",2]
	];

	_tmp_items = 
	[
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["UK3CB_BAF_Silencer_L115A3",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC343",0],
		["APERSTripMine_Wire_Mag",3],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_MaxiKite",1],
		["UK3CB_BAF_H_Beret_PWRR_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACE_Tripod",1]
	];

	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
/*
//BAF Bomb Disposal Team Leader
if (g_class == "BAF_EOD_SL") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",0],
		["CUP_hgun_Glock17",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["UK3CB_BAF_LLM_IR",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DefusalKit",1],
		["UK3CB_BAF_Eotech",0],
		["STKR_Predator",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACRE_PRC117F",0],
		["UK3CB_BAF_LLM_IR_Black",0],
		["itemCTAB",1]
    ];
};

//BAF Bomb Disposal Operator
if (g_class == "BAF_EOD_TECH") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",0],
		["CUP_hgun_Glock17",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["UK3CB_BAF_LLM_IR",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DefusalKit",1],
		["UK3CB_BAF_Eotech",0],
		["STKR_Predator",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_LLM_IR_Black",0]
    ];
};
//BAF Bomb Disposal Team Infantry Escort
 if (g_class == "BAF_EOD_ESC") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L128A1",1],
		["CUP_hgun_Glock17",1],
		["ACE_VMM3",1],
		["Binocular",1],
		["CUP_launch_M72A6",4],
		["CUP_launch_M136",2],
		["launch_NLAW_F",3],
		["UK3CB_BAF_Javelin_Slung_Tube",3]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_8Rnd_B_Beneli_74Pellets",10],
		["CUP_8Rnd_B_Beneli_74Slug",10],
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
	];

	_tmp_items = 
	[
		["ACE_MapTools",1],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["UK3CB_BAF_LLM_IR",1],
		["UK3CB_BAF_Eotech",0],
		["STKR_Predator",1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["UK3CB_BAF_LLM_IR_Black",0]
	];
};
*/
//FST Commander
if (typeOf vehicle player == "Modern_British_FSTCommander") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",0],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15],
        ["UK3CB_BAF_9_15Rnd",5],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",0],
		["UK3CB_BAF_LLM_IR_Black",0],
		["ACE_wirecutter", 1],
		["UK3CB_BAF_H_Beret_PR_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["ACE_IR_Strobe_Item",1]
    ];

	_tmp_backpacks = 
	[ 
	];
};

//FST Forward Observer
 if (typeOf vehicle player == "TWC_Infantry_Modern_COIN_Woodland_FO" , "TWC_Infantry_2020_COIN_Woodland_FO") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
        ["CUP_SOFLAM",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_hgun_Glock17",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_9_15Rnd",5],
		["1Rnd_HE_Grenade_shell", 20],
		["1Rnd_Smoke_Grenade_shell", 20],
		["1Rnd_SmokeRed_Grenade_shell", 20],
		["1Rnd_SmokeGreen_Grenade_shell", 20],
		["1Rnd_SmokeYellow_Grenade_shell", 20],
		["1Rnd_SmokePurple_Grenade_shell", 20],
		["UGL_FlareWhite_F", 20],
		["1Rnd_SmokeBlue_Grenade_shell", 20],
		["HandGrenade",2],
		["Laserbatteries",2],
		["ACE_HandFlare_White",5],
		["B_IR_Grenade",2]
		
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACRE_PRC343",0],
		["ACRE_PRC152",1],
		["UK3CB_BAF_LLM_IR_Black",0],
		["UK3CB_BAF_H_Beret_PR_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
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
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1],
		["ACE_VMM3",1],
		["UK3CB_BAF_Javelin_Slung_Tube",3],
		["UK3CB_BAF_Javelin_CLU",1],
		["CUP_launch_M72A6",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_9_15Rnd",5],
		["HandGrenade",2]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACRE_PRC343",0],
		["UK3CB_BAF_H_Beret_PR_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["UK3CB_BAF_LLM_IR_Black",0]
	];

	_tmp_backpacks = 
	[ 
	];
};

//Fac
 if (typeOf vehicle player == "TWC_Infantry_Modern_COIN_Woodland_FAC", "TWC_Infantry_2020_COIN_Woodland_FAC") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["UK3CB_BAF_L107A1",1],
		["CUP_launch_M72A6",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_17Rnd_9x19_glock17",15],
		["UK3CB_BAF_SmokeShellBlue",15],
		["UK3CB_BAF_SmokeShellGreen",15],
		["UK3CB_BAF_SmokeShellRed",15],
		["UK3CB_BAF_9_15Rnd",5],
		["HandGrenade",2]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",0],
		["ACRE_PRC148",0],
		["UK3CB_BAF_H_Beret_PR_PRR", 1],
		[(selectrandom ["UK3CB_BAF_H_Boonie_MTP_PRR", "CUP_H_SLA_BeanieGreen", "UK3CB_BAF_H_Headset_PRR", "UK3CB_BAF_H_Headset_PRR"]), 1],
		["UK3CB_BAF_LLM_IR_Black",0]
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
		["CUP_srifle_M24_des",1],
		["ACE_Vector",0],
		["CUP_hgun_M9",1]
    ];

    _tmp_magazines =
    [	
		["CUP_5Rnd_762x51_M24",50],
		["CUP_15Rnd_9x19_M9",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC148_ID_1",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["CUP_optic_LeupoldMk4",1],
		["ACE_SpottingScope",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1]
	];
};

//US Spotter
 if (g_class == "US_SP") then {
    _tmp_weapons =
    [
		["CUP_arifle_M4A1",1],
		["ACE_Vector",0],
		["CUP_15Rnd_9x19_M9",1]
    ];

    _tmp_magazines =
    [	
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
		["CUP_5Rnd_762x51_M24",50],
		["CUP_15Rnd_9x19_M9",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",0],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC148_ID_1",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",0],
		["ACE_ATragMX",1],
		["ACE_Tripod",1],
		["itemCTAB",1]
	];
};
if((typeOf player) in ["1990_RM_British_SectionCommander_Mix","1990_British_SectionCommander_Desert"])
*/
//USMC Squad Leader
 if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_SquadLeader", "TWC_Infantry_USMC_Modern_SquadLeader_W"]) then {
    _tmp_weapons =
    [
        ["twc_CUP_arifle_M4A1_m203_acog_lazer",1],
		["CUP_hgun_Colt1911",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["1Rnd_HE_Grenade_shell", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["UGL_FlareWhite_F", 20],
		["HandGrenade",2]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["ACE_DAGR",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC117F",0],
		["ACRE_PRC148",0],
		["ACE_IR_Strobe_Item",1]
	];
};
//USMC Team Leader
 if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_TeamLeader", "TWC_Infantry_USMC_Modern_TeamLeader_W"]) then {
    _tmp_weapons =
    [
        ["twc_CUP_arifle_M4A1_m203_acog_lazer",1],
        ["CUP_glaunch_M32",1],
		["CUP_launch_M136",2],
		["CUP_hgun_Colt1911",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell", 30],
		["CUP_6Rnd_HE_M203", 20],
		["CUP_6Rnd_Smoke_M203", 20],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["UGL_FlareWhite_F", 20],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",2]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_microDAGR",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_HoloBlack",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["ACRE_PRC148",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACE_IR_Strobe_Item",1]
		
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_khk",1]
	];
};

//USMC breacher
  if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_Breacher", "TWC_Infantry_USMC_Modern_Breacher_W"]) then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],
		["ACE_VMM3",1],
        ["CUP_hgun_Colt1911",1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["CUP_8Rnd_B_Beneli_74Pellets",30],
		["CUP_8Rnd_B_Beneli_74Slug",30],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC148",0]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_khk",1]
	];
};

//USMC Rifleman
  if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_Rifleman", "TWC_Infantry_USMC_Modern_Rifleman_W"]) then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],
		["ACE_VMM3",1],
        ["CUP_hgun_Colt1911",1],
		["CUP_optic_SMAW_Scope",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",2]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["CUP_SMAW_HEDP_M",6],
		["CUP_SMAW_Spotting",2],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC148",0]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_khk",1]
	];
};



//USMC Auto Rifleman
  if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_AutoRifleman", "TWC_Infantry_USMC_Modern_AutoRifleman_W"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m249_pip_L_mgo_lazer",1],
		["twc_rhs_weap_m27iar_grip_acog_lazer",1],
		["CUP_hgun_Colt1911",1]
	];

    _tmp_magazines =
    [
        ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",20],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",10],
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ElcanM145",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["bipod_01_F_blk",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC148",0]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_khk",1]
	];
};

//USMC Auto Rifleman Assistant
  if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_AAR", "TWC_Infantry_USMC_Modern_AAR_W"]) then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],     
		["CUP_hgun_Colt1911",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",10],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC148",0]
	];
};
//USMC Machine Gunner
  if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_MG", "TWC_Infantry_USMC_Modern_MG_W"]) then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m240B_mgo_lazer",1],
		["CUP_hgun_Colt1911",1]
	];

    _tmp_magazines =
    [
		["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",30],
        ["CUP_7Rnd_45ACP_1911",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC148",0]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_khk",1]
	];
};

//USMC Machine Gunner Assistant
  if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_AMG", "TWC_Infantry_USMC_Modern_AMG_W"]) then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],
		["CUP_hgun_Colt1911",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",30],
        ["CUP_7Rnd_45ACP_1911",15],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC148",0]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_khk",1]
	];
};

//USMC Medic
  if ((typeOf vehicle player) in ["TWC_Infantry_USMC_Modern_Medic", "TWC_Infantry_USMC_Modern_Medic_W"]) then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],
		["CUP_hgun_Colt1911",1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
		["ACE_personalAidKit", 1],
		["ACE_morphine",50],
		["ACE_epinephrine",50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
		["ACE_salineIV_500",50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag",10],
		["ACE_tourniquet", 5],
		["CUP_optic_ACOG",0],
		["CUP_optic_HoloBlack",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USMC_BOONIE_2_DES",1],
		["ACRE_PRC148",0]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_khk",1]
	];
};
/*

//USMC Sniper
 if (g_class == "USMC_SN") then {
    _tmp_weapons =
    [
		["CUP_srifle_M40A3",1],
		["ACE_Vector",0],
		["CUP_hgun_M9",1]
    ];

    _tmp_magazines =
    [	
		["	",50],
		["CUP_15Rnd_9x19_M9",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC148_ID_1",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["CUP_optic_LeupoldMk4",1],
		["ACE_SpottingScope",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1]
	];
};

//USMC Spotter
 if (g_class == "US_SP") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A4_Grip",1],
		["CUP_arifle_M4A1",1],
		["ACE_Vector",0],
		["CUP_15Rnd_9x19_M9",1]
    ];

    _tmp_magazines =
    [	
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
		["	",50],
		["CUP_15Rnd_9x19_M9",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",0],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC148_ID_1",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",0],
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
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10]
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
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10]
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
		["30Rnd_556x45_Stanag",50]
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
		["30Rnd_556x45_Stanag",50],
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
		["30Rnd_556x45_Stanag",50],
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
		["30Rnd_556x45_Stanag",50],
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
        ["30Rnd_556x45_Stanag",50],
		["HandGrenade",2]
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
        ["CUP_arifle_AKS",1],
        ["CUP_hgun_Makarov",1],
        ["binocular",1]
    ];
	
	



	_tmp_magazines =
    [
        ["CUP_30Rnd_762x39_AK47_M",50],
        ["CUP_30Rnd_762x39_AK47_M",5],
        ["CUP_8Rnd_9x18_Makarov_M",5],
		["HandGrenade",2]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["70", twc_missionname] call BIS_fnc_inString))) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag",50];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag_Tracer_Red",10];
		};
		if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
			_tmp_items pushback ["ACRE_PRC343",0];
		};
	};
		
    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC148",0],
		["ACRE_PRC117F",0],
		["ACE_morphine", 20],
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
        ["CUP_arifle_AKS",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_762x39_AK47_M",50],
        ["CUP_30Rnd_762x39_AK47_M",5],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["70", twc_missionname] call BIS_fnc_inString))) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag",50];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag_Tracer_Red",10];
		};
		if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
			_tmp_items pushback ["ACRE_PRC343",0];
		};
		
	};
	_tmp_backpacks = 
	[
		["CUP_B_AlicePack_Khaki",1]
	];
	
};


if (typeOf vehicle player == "twc_ana_subcommander") then {
    _tmp_weapons =
    [
        ["CUP_arifle_AKS",1],
        ["CUP_hgun_Makarov",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_762x39_AK47_M",50],
        ["CUP_30Rnd_762x39_AK47_M",5],
        ["CUP_1Rnd_SMOKE_GP25_M",15],
        ["CUP_1Rnd_SMOKERED_GP25_M",15],
        ["CUP_1Rnd_SMOKEGREEN_GP25_M",15],
        ["CUP_1Rnd_HE_GP25_M",15],
        ["CUP_8Rnd_9x18_Makarov_M",5],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["70", twc_missionname] call BIS_fnc_inString))) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag",50];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag_Tracer_Red",10];
			};
		
		if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
			_tmp_items pushback ["ACRE_PRC343",0];
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
        ["CUP_arifle_AKS",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_762x39_AK47_M",50],
        ["CUP_30Rnd_762x39_AK47_M",5],
        ["CUP_PG7V_M",5],
        ["CUP_OG7_M",20],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["70", twc_missionname] call BIS_fnc_inString))) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag",50];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag_Tracer_Red",10];
		};
	};
	
	_tmp_backpacks = 
	[
		["CUP_B_AlicePack_Khaki",1]
	];
	
	if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_items pushback ["ACRE_PRC343",0];
	};
};


if (typeOf vehicle player == "twc_ana_mg") then {
    _tmp_weapons =
    [
        ["CUP_arifle_RPK74",1]
    ];

	_tmp_magazines =
    [
        ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",50],
        ["CUP_30Rnd_762x39_AK47_M",50],
        ["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",5],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["ACE_wirecutter", 1]
    ];
	
	_tmp_backpacks = 
	[
		["CUP_B_AlicePack_Khaki",1]
	];
	
	if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_items pushback ["ACRE_PRC343",0];
	};
};



if (typeOf vehicle player == "twc_ana_mg_as") then {
    _tmp_weapons =
    [
        ["CUP_arifle_AKS",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_762x39_AK47_M",50],
        ["CUP_30Rnd_762x39_AK47_M",10],
        ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",50],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["ACE_wirecutter", 1]
    ];
	
	if (!(isnil "twc_missionname")) then {
		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["70", twc_missionname] call BIS_fnc_inString))) then {
		_tmp_weapons pushback ["twc_ana_m16a4",1];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag",50];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag_Tracer_Red",10];
		};
		if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
			_tmp_items pushback ["ACRE_PRC343",0];
		};
	};
	
	_tmp_backpacks = 
	[
		["CUP_B_AlicePack_Khaki",1]
	];
	
};



if (typeOf vehicle player == "twc_ana_marksman") then {
    _tmp_weapons =
    [
 //       ["CUP_arifle_AKM",1]
    ];

	_tmp_magazines =
    [
        ["CUP_10Rnd_762x54_SVD_M",50],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["CUP_H_PASGTv2_OD",1],
		["ACE_wirecutter", 1]
    ];
	
		if (!(isnil "twc_missionname")) then {
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_weapons pushback ["CUP_srifle_M24_des_blk_ana",1];
		_tmp_magazines pushback ["CUP_5Rnd_762x51_M24",50];
			};
		if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
			_tmp_items pushback ["ACRE_PRC343",0];
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
        ["CUP_arifle_AKS",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_762x39_AK47_M",50],
        ["CUP_30Rnd_762x39_AK47_M",5],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",45],
		["ACE_morphine", 20],
		["TWC_Item_Medical_SutureKit_20", 1],
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
		_tmp_magazines pushback ["30Rnd_556x45_Stanag",50];
		_tmp_magazines pushback ["30Rnd_556x45_Stanag_Tracer_Red",10];
			};
		if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
			_tmp_items pushback ["ACRE_PRC343",0];
		};
	};
	
	_tmp_backpacks = 
	[
		["CUP_B_AlicePack_Khaki",1]
	];
	
};

if (typeOf vehicle player == "twc_ana_interpreter") then {
    _tmp_weapons =
    [
        ["CUP_hgun_Makarov",1],
        ["CUP_arifle_AKS",1]
    ];

	_tmp_magazines =
    [
        ["CUP_8Rnd_9x18_Makarov_M",2],
        ["CUP_30Rnd_762x39_AK47_M",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["ACRE_PRC152", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
	if (!(["70", twc_missionname] call BIS_fnc_inString)) then {
		_tmp_items pushback ["ACRE_PRC343",0];
	};
};

//colombian army


if (typeOf vehicle player == "twc_nac_commander") then {
    _tmp_weapons =
    [
        ["CUP_hgun_M9",1],
        ["binocular",1]
    ];

	_tmp_magazines =
    [
        ["CUP_15Rnd_9x19_M9",50],
        ["CUP_15Rnd_9x19_M9",50],
        ["30Rnd_556x45_Stanag",50],
        ["30Rnd_556x45_Stanag_Tracer_Red",50],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC148",0],
		["ACRE_PRC117F",0],
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
        ["CUP_srifle_M24_blk",1]
    ];

	_tmp_magazines =
    [
        ["CUP_5Rnd_762x51_M24",50],
        ["CUP_5Rnd_762x51_M24",50],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
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
        ["CUP_hgun_M9",1]
    ];

	_tmp_magazines =
    [
        ["CUP_15Rnd_9x19_M9",50],
        ["CUP_15Rnd_9x19_M9",50],
        ["30Rnd_556x45_Stanag",50],
        ["30Rnd_556x45_Stanag_Tracer_Red",50],
        ["CUP_5Rnd_762x51_M24",50],
        ["CUP_5Rnd_762x51_M24",50],
        ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",50],
        ["1Rnd_HE_Grenade_shell",50],
        ["ACE_HuntIR_M203",50],
        ["1Rnd_Smoke_Grenade_shell",50],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
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
  //      ["CUP_arifle_AKM",1]
    ];

	_tmp_magazines =
    [
        ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",50],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
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
        ["CUP_srifle_M24_blk",1]
    ];

	_tmp_magazines =
    [
        ["CUP_5Rnd_762x51_M24",50],
        ["CUP_5Rnd_762x51_M24",50],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",45],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["TWC_Item_Medical_SutureKit_20", 2],
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
        ["CUP_hgun_M9",1],
        ["CUP_srifle_M24_blk_fold",1]
    ];

	_tmp_magazines =
    [
        ["CUP_15Rnd_9x19_M9",50],
        ["CUP_15Rnd_9x19_M9",50],
        ["CUP_5Rnd_762x51_M24",50],
        ["CUP_5Rnd_762x51_M24",50]
    ];

    _tmp_items = 
	[
		["ACE_fieldDressing",25],
		["ACE_morphine", 20],
		["ACRE_PRC148",0],
		["ACRE_PRC343",0],
		["ACRE_PRC152", 1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};




//BAF PilotTWC_Infantry_2020_Regular_Woodland_Helicopter_Pilot
 if (typeOf vehicle player == "TWC_Infantry_Modern_Regular_Woodland_Helicopter_Pilot", "TWC_Infantry_2020_Regular_Woodland_Helicopter_Pilot") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",3],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
    ];
	_tmp_items =
	[
		["amp_slingload_CargoSling",2],
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["CUP_NVG_PVS14",1],
		["ACE_microDAGR",1]
	];
};

 if (typeOf vehicle player == "Modern_British_MERT_HeliPilot") then {
    _tmp_weapons =
    [
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
    ];
	_tmp_items =
	[
		["amp_slingload_CargoSling",2],
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",0],
		["ACRE_PRC343",0],
		["CUP_NVG_PVS14",1],
		["itemCTAB",1],
		["ACE_microDAGR",1]
	];
};




 //BAF Crew Cheif
 if (typeOf vehicle player == "Modern_British_crewchief") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",5],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["CUP_NVG_PVS14",1]
		
	];
};


if (typeOf vehicle player == "Modern_British_Logitech") then {
    _tmp_weapons =
    [
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",5],
        ["CUP_17Rnd_9x19_glock17",15],
		["B_IR_Grenade",2]
    ];

    _tmp_items = 
	[
		["ACE_DAGR",1],
		["ACRE_PRC343",0],
		["ACRE_PRC148",0],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[ 
	];
	
};

//BAF Armour
 if (typeOf vehicle player == "TWC_Infantry_Modern_Regular_Woodland_Vehicle_Crew" , "TWC_Infantry_2020_Regular_Woodland_Vehicle_Crew") then {
    _tmp_weapons =
    [
		["CUP_hgun_Glock17",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",5],
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0],
		["UK3CB_BAF_LLM_IR_Black",0]
	];

	_tmp_backpacks = 
	[
	];
};

//BAF Armour
 if (typeOf vehicle player == "TWC_Infantry_Modern_Regular_Woodland_Vehicle_Commander", "TWC_Infantry_2020_Regular_Woodland_Vehicle_Commander") then {
    _tmp_weapons =
    [
        ["ACE_Vector",0],
		["CUP_hgun_Glock17",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",5],
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0],
		["UK3CB_BAF_LLM_IR_Black",0]
	];

	_tmp_backpacks = 
	[
	];
};

//US Pilot
 if (typeOf vehicle player == "TWC_Modern_US_Army_HeliPilot") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1",1],
		["CUP_hgun_M9",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
        ["CUP_15Rnd_9x19_M9",15],
		["HandGrenade",2]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",0],
		["CUP_NVG_PVS14",1],
		["itemCTAB",1],
		["CUP_NVG_PVS14",1],
		["UK3CB_BAF_Eotech",0]
		
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
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC117F",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",0]
	];
};

 if((typeOf player) in ["1990_British_Rifleman","1990_British_Rifleman_Desert","1990_RM_British_Rifleman_Mix"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["CUP_launch_M72A6",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
};

 if((typeOf player) in ["1990_British_Rifleman_AT","1990_British_Rifleman_AT_Desert","1990_RM_British_Rifleman_AT_Mix"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["CUP_launch_M72A6",5]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_OLI_Rifleman_A",1]
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
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_OLI_Rifleman_A",1]
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
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
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
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0],
		["ACE_fieldDressing", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
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
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
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
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
};

if ("1990_RM_British" in (typeOf player)) then {
	_tmp_items pushback ["UK3CB_BAF_H_Beret_RM_Bootneck_PRR",1];
};

 if (typeOf vehicle player == "1990_British_Sniper_desert") then {
    _tmp_weapons =
    [
        ["TWC_Weapon_L96_Desert",1],
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["twc_rhs_weap_M107",1],
        ["UK3CB_BAF_L9A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_127_10Rnd",20],
		["CUP_10Rnd_127x99_m107",3],
		["UK3CB_BAF_556_30Rnd",10],
		["UK3CB_BAF_9_13Rnd",10]
    ];

	_tmp_items =
	[
		["ACE_Tripod",1],
		["cup_optic_an_pvs_4",1],
		["ACE_SpottingScope",1],
		["UK3CB_BAF_H_Beret_PWRR_PRR",1],
		["ACRE_PRC343",0]
	];

	_tmp_backpacks =
	[
		["twc_AlicePack_tan",1]
	];
};

 if (typeOf vehicle player == "1990_British_Spotter_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["TWC_Weapon_L96_Desert",1],
        ["ACE_Yardage450",1],
        ["Binocular",1],
        ["UK3CB_BAF_L9A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_127_10Rnd",20],
		["CUP_10Rnd_127x99_m107",3],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["UK3CB_BAF_9_13Rnd",10]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0],
		["ACE_Tripod",1],
		["cup_optic_an_pvs_4",2],
		["APERSTripMine_Wire_Mag",3],
		["ACE_SpottingScope",1],
		["ACE_RangeCard",1],
		["UK3CB_BAF_H_Beret_PWRR_PRR",1],
		["ACRE_PRC117F",0]
	];

	_tmp_backpacks =
	[
		["TWC_Backpack_1990_spotter_L",1]
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
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_H_Beret_PR_PRR",1],
		["ACRE_PRC343",0]
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
		["UK3CB_BAF_556_30Rnd_T",10],
		["ACE_SpareBarrel",1],
		["UK3CB_BAF_H_Beret_PR_PRR",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",0]
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
		["UK3CB_BAF_556_30Rnd_T",10],
		["UK3CB_BAF_9_13Rnd",10],
		["HandGrenade",2]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SUSAT_3D",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",0],
		["ACRE_PRC117F",0],
		["ACE_wirecutter", 1],
		["UK3CB_BAF_H_Beret_PR_PRR",1],
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
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",2],
		["Laserbatteries",10],
		["ACE_HandFlare_White",5],
		["B_IR_Grenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SUSAT_3D",1],
		["ACRE_PRC343",0],
		["ACRE_PRC152",1],
		["UK3CB_BAF_H_Beret_PR_PRR",1],
		["ACE_SpottingScope",1]
	];
};

//FST Assistant (90's)
 if((typeOf player) in ["1990_British_FSTAssistant", "1990_British_FSTAssistant_Desert"]) then{
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A1_SUSAT3D",1],
		["CUP_launch_MAAWS",1],
		["CUP_launch_M72A6",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_MAAWS_HEDP_M",6],
		["HandGrenade",2]
	];

	_tmp_items = 
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["CUP_optic_MAAWS_Scope",1],
		["UK3CB_BAF_H_Beret_PR_PRR",1],
		["ACRE_PRC343",0]
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
		["UK3CB_BAF_556_30Rnd_T",10],
		["UK3CB_BAF_9_15Rnd",20],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACE_M26_Clacker",1],
		["ACRE_PRC117F",0],
		["ACRE_PRC343",0]
	];
};



 if((typeOf player) in ["2000_British_Rifleman_Desert","2000_British_Rifleman","2000_British_Rifleman_Desert_light","2000_British_Rifleman_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_SUSAT",1],
		["CUP_launch_M72A6",5]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
};



 if((typeOf player) in ["2000_British_Marksman_Desert"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L86A1_SUSAT3D",1],
		["CUP_launch_M72A6",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",30],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["UK3CB_BAF_9_13Rnd",20],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
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
		["UK3CB_BAF_556_30Rnd_T",10],
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
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
};



 if((typeOf player) in ["2000_British_Gunner","2000_British_Gunner_Desert","2000_British_Gunner_light","2000_British_Gunner_Desert_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L107A1",1],
        ["TWC_UK3CB_BAF_L110A2_SUSAT",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd_T",50],
		["UK3CB_BAF_9_15Rnd",20],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
};



 if((typeOf player) in ["2000_British_2IC_Desert","2000_British_2IC","2000_British_2IC_Desert_light","2000_British_2IC_light"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_SUSAT",1],
		["CUP_launch_M72A6",1],
        ["UK3CB_BAF_L107A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["UK3CB_BAF_9_15Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",20],
		["UK3CB_BAF_762_200Rnd_T",20],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
	];
};



 if((typeOf player) in ["2000_British_MachineGunner_Desert","2000_British_MachineGunner"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L107A1",1],
        ["UK3CB_BAF_L7A2",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd_T",40],
		["UK3CB_BAF_9_15Rnd",20],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
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
		["UK3CB_BAF_556_30Rnd_T",10],
		["UK3CB_BAF_762_200Rnd_T",30],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343",0]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
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
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
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
		["UK3CB_BAF_H_Beret_Mer_PRR",1],
		["ACRE_PRC343", 1]
	];
	_tmp_backpacks = 
	[
		["TWC_BAF_B_Bergen_OLI_Rifleman_XL_A",1]
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
		["ACRE_PRC148",0]
	];
};




 if((typeOf player) in ["2000_British_Sniper","2000_British_Sniper_desert"])then{
    _tmp_weapons =
    [
		["TWC_Weapon_L96_Desert",1],
		["ACE_Yardage450",1],
		["UK3CB_BAF_L85A2_SUSAT",1],
        ["twc_rhs_weap_M107",1],
		["UK3CB_BAF_L107A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_9_15Rnd",20],
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_762_L42A1_10Rnd_T",30],
		["UK3CB_BAF_127_10Rnd",20],
		["CUP_10Rnd_127x99_m107",3]
    ];

	_tmp_items =
	[
		["CUP_optic_AN_PVS_10",1],
		["ACE_Tripod",1],
		["UK3CB_BAF_H_Beret_PWRR_PRR",1],
		["ACRE_PRC343",0]
	];
};


 if((typeOf player) in ["2000_British_Spotter", "2000_British_Spotter_desert"])then{
    _tmp_weapons =
    [
		["TWC_Weapon_L96_Desert",1],
		["ACE_Yardage450",1],
		["UK3CB_BAF_L85A2_SUSAT",1],
		["UK3CB_BAF_L107A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd_T",30],
		["UK3CB_BAF_762_L42A1_10Rnd",50],
		["UK3CB_BAF_127_10Rnd",20],
		["CUP_10Rnd_127x99_m107",3],
		["UK3CB_BAF_9_15Rnd",20],
		["UK3CB_BAF_556_30Rnd",50]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",0],
		["CUP_optic_AN_PVS_10",1],
		["APERSTripMine_Wire_Mag",3],
		["ACE_RangeCard",1],
		["UK3CB_BAF_H_Beret_PWRR_PRR",1],
		["ACRE_PRC343",0]
	];
};



 if((typeOf player) in ["2000_British_Vehicle_Commander"])then{
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",10]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",0],
		["ACRE_PRC343",0]
	];
};



 if((typeOf player) in ["2000_British_Vehicle_Crew"])then{
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",10]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",0],
		["ACRE_PRC343",0]
	];
};


///////////////////////////////////////////////////////////
/////2000 US Army Kit
///////////////////////////////////////



 if((typeOf player) in ["TWC_2000_US_Army_SectionCommander"])then{
    _tmp_weapons =
    [
        ["CUP_hgun_M9",1],
        ["CUP_arifle_M4A1_Aim",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_15Rnd_9x19_M9",50],
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["optic_MRCO",1],
		["ACRE_PRC117F",0],
		["CUP_optic_HoloBlack",1],
		["ACRE_PRC148",0]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_TeamLeader"])then{
    _tmp_weapons =
    [
        ["CUP_hgun_M9",1],
        ["twc_m4_203_cco",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_15Rnd_9x19_M9",50],
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
		["UK3CB_BAF_SmokeShellBlue",5],
		["UK3CB_BAF_SmokeShellGreen",5],
		["UK3CB_BAF_SmokeShellRed",5],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["optic_MRCO",1],
		["ACE_M26_Clacker",1],
		["CUP_V_B_IOTV_UCP_SL_USArmy",1],
		["CUP_optic_HoloBlack",1],
		["ACRE_PRC148",0]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_Rifleman"])then{
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_Aim",1],
        ["CUP_launch_M136",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",0],
		["CUP_V_B_IOTV_UCP_Rifleman_USArmy",1],
		["CUP_optic_HoloBlack",1],
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
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["optic_MRCO",1],
		["CUP_optic_HoloBlack",1],
		["ACRE_PRC148",0]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_AutomaticRifleman"])then{
    _tmp_weapons =
    [
        ["twc_m249_para_acog",1]
	];

	_tmp_magazines =
   [            
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",30],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",20],
		["ACE_SpareBarrel",1],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["CUP_V_B_IOTV_UCP_SAW_USArmy",1],
		["ACRE_PRC148",0]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_Marksman"])then{
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_Aim",1]
	];

	_tmp_magazines =
   [            
		["ACE_30Rnd_556x45_Stanag_Mk262_mag_Pull",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACRE_PRC148",0]
	];
};




 if((typeOf player) in ["TWC_2000_US_Army_Medic"])then{
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_Aim",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["optic_MRCO",1],
		["CUP_optic_HoloBlack",1],
		["CUP_V_B_IOTV_UCP_Medic_USArmy",1],
		["ACRE_PRC148",0]
	];
};


if (["Medic", typeof player] call BIS_fnc_inString) then {
	{_tmp_items pushback _x} foreach
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 2],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1]
	];
};


/*
 //US Crew Cheif
 if (g_class == "USPLT_CREW") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1",1],
		["CUP_hgun_M9",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
        ["CUP_15Rnd_9x19_M9",15],
		["HandGrenade",2]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",0],
		["CUP_NVG_PVS14",1],
		["ACRE_PRC117F",0],
		["itemCTAB",1],
		["CUP_NVG_PVS14",1],
		["UK3CB_BAF_Eotech",0]
		
	];
};

//BAF Armour Commander
 if (g_class == "ARMR_CO") then {
    _tmp_weapons =
	[
        ["UK3CB_BAF_L22A2",1],
        ["ACE_Vector",0],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15]
    ];
	_tmp_items =
	[
        ["ACE_MapTools",1],
        ["ACE_fieldDressing",20],
        ["ACE_morphine",10],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC343",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		["UK3CB_BAF_LLM_IR",1],
		["itemCTAB",1],
		["CUP_NVG_PVS14",1]
	];
};

//BAF Armour Crew
 if (g_class == "ARMR_CREW") then {
    _tmp_weapons =
	[
        ["UK3CB_BAF_L22A2",1],
        ["ACE_Vector",0],
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1],
        ["ACE_fieldDressing",20],
        ["ACE_morphine",10],
		["ACRE_PRC148",0],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		["UK3CB_BAF_LLM_IR",1],
		["ACRE_PRC343",0],
		["CUP_NVG_PVS14",1]
	];
};
*/

_tmp_items pushback [(headgear player), 1];

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


// add in all weapons.
{crateBox addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;



{
	crateBox addMagazineCargo [(_x select 0),(_x select 1)];
} foreach _magazines;

{crateBox addItemCargo [(_x select 0),(_x select 1)]} foreach _items;

{crateBox addBackpackCargo [(_x select 0),(_x select 1)]} foreach _backpacks;

[player] call twc_fnc_buildmagarray;
