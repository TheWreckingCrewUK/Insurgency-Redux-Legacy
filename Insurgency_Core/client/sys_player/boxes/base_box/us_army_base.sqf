
 if ((typeOf vehicle player) in ["TWC_Modern_US_Army_SectionCommander"]) then {
    _tmp_weapons =
    [
        ["twc_m4_acog_lazer",1],
        ["ACE_Vector",1],
        ["rhsusf_weap_m9",1],
		["rhsusf_weap_glock17g4",1]
    ];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_PMAG",50],
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",20],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["rhsusf_mag_15Rnd_9x19_JHP",15],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15A",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F",1],
		["ACRE_PRC148",1],
		["itemCTAB",1],
		["ACE_IR_Strobe_Item",1]
	];
};
//USMC Team Leader
 if ((typeOf vehicle player) in ["TWC_Modern_US_Army_TeamLeader"]) then {
    _tmp_weapons =
    [
        ["twc_m4_320_lds_lazer",1],
        ["CUP_glaunch_M32",1],
        ["ACE_Vector",1],
		["rhs_weap_M136_hedp",2],
        ["rhsusf_weap_m9",1],
		["rhsusf_weap_glock17g4",1]
    ];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_PMAG",50],
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",20],
		["1Rnd_HE_Grenade_shell", 30],
		["rhs_mag_M397_HET", 30],
		["CUP_6Rnd_HE_M203", 30],
		["CUP_6Rnd_Smoke_M203", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
        ["rhsusf_mag_15Rnd_9x19_JHP",15],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_microDAGR",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["ACRE_PRC148",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_IR_Strobe_Item",1]
		
	];
};

//USMC breacher
  if ((typeOf vehicle player) in ["TWC_Modern_US_Army_Rifleman"]) then {
    _tmp_weapons =
    [
        ["twc_m4_acog_lazer",1],
		["ACE_VMM3",1],
		["rhs_weap_M590_8RD",1],
		["rhs_weap_m72a7",2]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_PMAG",50],
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10],
		["rhsusf_8Rnd_00Buck",10],
		["rhsusf_8Rnd_Slug",10],
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
  if ((typeOf vehicle player) in ["TWC_Modern_US_Army_Grenadier"]) then {
    _tmp_weapons =
    [
        ["twc_m4_203_acog_lazer",1]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_PMAG",50],
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell",30],
		["rhs_mag_M397_HET",30],
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
  if ((typeOf vehicle player) in ["TWC_Modern_US_Army_AutomaticRifleman"]) then {
    _tmp_weapons =
    [
        ["twc_m249_mgo_lazer",1]
	];

    _tmp_magazines =
    [
        ["rhsusf_100Rnd_556x45_mixed_soft_pouch",20],
		["rhs_200rnd_556x45_T_SAW",10],
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

//USMC Medic
  if ((typeOf vehicle player) in ["TWC_Modern_US_Army_Medic"]) then {
    _tmp_weapons =
    [
        ["twc_m4_acog_lazer",1]
	];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_PMAG",50],
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",20]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["TWC_Item_Medical_SutureKit_20", 1],
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
		["ACRE_PRC148",1]
	];
};