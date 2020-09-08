
//Polish Section
 if (typeOf vehicle player in ["Modern_ger_Base", "Modern_ger_Base_d"]) then {
    _tmp_weapons =
    [
        ["twc_G36A_acog",0],
        ["rhs_weap_M136_hedp",2]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_G36",50],
		["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",10],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
        ["cup_optic_g36optics15x",1],
        ["cup_optic_g36optics_holo",1],
        ["cup_optic_g36optics",1],
        ["ACE_MapTools",1],
        [(selectrandom [ "CUP_H_Ger_Cap_Grn2", "CUP_H_Ger_Cap_Tan2"]),1],
        ["CUP_H_Ger_Beret_INF_Grn",1],
		["ACRE_PRC148",0],
		["rhsusf_ANPVS_14",1]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_cbr",1]
	];
};


 if (typeOf vehicle player in ["Modern_ger_medic", "Modern_ger_medic_d"]) then {
    _tmp_weapons =
    [
        ["twc_G36A_acog",0]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_G36",30],
		["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",10],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
        ["cup_optic_g36optics15x",1],
        ["cup_optic_g36optics_holo",1],
        ["cup_optic_g36optics",1],
		["ACRE_PRC148",0],
		["TWC_Item_Medical_SutureKit_20", 2],
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_personalAidKit", 1],
        [(selectrandom [ "CUP_H_Ger_Cap_Grn2", "CUP_H_Ger_Cap_Tan2"]),1],
        ["CUP_H_Ger_Beret_INF_Grn",1],
		["ACE_bodyBag", 10]
	];
};



 if (typeOf vehicle player in ["Modern_ger_grenadier", "Modern_ger_grenadier_d"]) then {
    _tmp_weapons =
    [
        ["twc_G36A_AG36_acog",0]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_G36",50],
		["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",10],
		["CUP_1Rnd_HEDP_M203",20],
		["1Rnd_SmokeRed_Grenade_shell",10],
		["1Rnd_Smoke_Grenade_shell",10],
		["1Rnd_SmokeBlue_Grenade_shell",10],
		["1Rnd_SmokeGreen_Grenade_shell",10],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
        ["cup_optic_g36optics15x",1],
        ["cup_optic_g36optics_holo",1],
        ["cup_optic_g36optics",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",0],
        [(selectrandom [ "CUP_H_Ger_Cap_Grn2", "CUP_H_Ger_Cap_Tan2"]),1],
        ["CUP_H_Ger_Beret_INF_Grn",1],
		["rhsusf_ANPVS_14",1]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_cbr",1]
	];
};

 if (typeOf vehicle player in ["Modern_ger_mg", "Modern_ger_mg_d"]) then {
    _tmp_weapons =
    [
        ["twc_HK_MG3",1],
        ["twc_MG36_eotech",1],
        ["twc_MG36_acog",0],
        ["twc_HK_MG4",1]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",60],
        ["CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag",5],
		["UK3CB_BAF_762_200Rnd_T",30],
		["rhs_200rnd_556x45_T_SAW",30],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
        ["cup_optic_g36optics15x",1],
        ["cup_optic_g36optics",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",0],
        [(selectrandom [ "CUP_H_Ger_Cap_Grn2", "CUP_H_Ger_Cap_Tan2"]),1],
        ["CUP_H_Ger_Beret_INF_Grn",1],
		["rhsusf_ANPVS_14",1]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_cbr",1]
	];
};


 if (typeOf vehicle player in ["Modern_ger_rif_AT", "Modern_ger_rif_AT_d"]) then {
    _tmp_weapons =
    [
        ["twc_G36A_acog",0]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_G36",50],
		["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",10],
		["rhs_mag_maaws_HE",6],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
        ["cup_optic_g36optics15x",1],
        ["cup_optic_g36optics_holo",1],
        ["cup_optic_g36optics",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",0],
        [(selectrandom [ "CUP_H_Ger_Cap_Grn2", "CUP_H_Ger_Cap_Tan2"]),1],
        ["CUP_H_Ger_Beret_INF_Grn",1],
		["rhsusf_ANPVS_14",1]
	];
	_tmp_backpacks = 
	[ 
		["B_Carryall_cbr",1]
	];
};

 if (typeOf vehicle player in ["Modern_ger_commander", "Modern_ger_commander_d"]) then {
    _tmp_weapons =
    [
        ["ACE_Vector",1],
        ["twc_G36A_acog",0]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_G36",50],
		["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",10],
		["SmokeShellBlue",5],
		["SmokeShellGreen",5],
		["SmokeShellRed",5],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
        ["cup_optic_g36optics15x",1],
        ["cup_optic_g36optics_holo",1],
        ["cup_optic_g36optics",1],
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC148",0],
		["rhsusf_ANPVS_14",1],
		["ACE_microDAGR",1],
        [(selectrandom [ "CUP_H_Ger_Cap_Grn2", "CUP_H_Ger_Cap_Tan2"]),1],
        ["CUP_H_Ger_Beret_INF_Grn",1],
		["ACRE_PRC117F",1]
	];
};

 if (typeOf vehicle player in ["Modern_ger_subcommander", "Modern_ger_subcommander_d"]) then {
    _tmp_weapons =
    [
        ["ACE_Vector",1],
        ["twc_G36A_acog",0]
    ];

	_tmp_magazines =
    [
        ["CUP_30Rnd_556x45_G36",50],
		["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",10],
		["ACE_SpareBarrel",1],
		["SmokeShellBlue",5],
		["SmokeShellGreen",5],
		["SmokeShellRed",5],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
        ["cup_optic_g36optics15x",1],
        ["cup_optic_g36optics_holo",1],
        ["cup_optic_g36optics",1],
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC148",0],
		["rhsusf_ANPVS_14",1],
        [(selectrandom [ "CUP_H_Ger_Cap_Grn2", "CUP_H_Ger_Cap_Tan2"]),1],
		["ACE_microDAGR",1]
	];
	_tmp_backpacks = 
	[ 
		["rhsgref_hidf_alicepack",1]
	];
};

