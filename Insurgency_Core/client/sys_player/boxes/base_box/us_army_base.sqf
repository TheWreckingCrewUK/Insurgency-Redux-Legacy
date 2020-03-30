
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
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10],
        ["rhsusf_mag_17Rnd_9x19_JHP",40],
        ["rhsusf_mag_15Rnd_9x19_JHP",40],
		["SmokeShellBlue",5],
		["SmokeShellGreen",5],
		["SmokeShellRed",5],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15A",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F",1],
		["twc_acc_nt4_black",0],
		["ACE_IR_Strobe_Item",1]
	];
};
//USMC Team Leader
 if ((typeOf vehicle player) in ["TWC_Modern_US_Army_TeamLeader"]) then {
    _tmp_weapons =
    [
        ["twc_m4_320_lds_lazer",1],
        ["rhs_weap_m32",1],
		["rhs_weap_M136_hedp",2],
        ["rhsusf_weap_m9",1],
		["rhsusf_weap_glock17g4",1]
    ];

    _tmp_magazines =
    [
        ["rhs_mag_30Rnd_556x45_M855A1_PMAG",50],
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell", 30],
		["rhsusf_mag_6Rnd_M441_HE", 20],
		["rhsusf_mag_6Rnd_M714_white", 10],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 20],
        ["rhsusf_mag_17Rnd_9x19_JHP",40],
        ["rhsusf_mag_15Rnd_9x19_JHP",40],
		["SmokeShellBlue",5],
		["SmokeShellGreen",5],
		["SmokeShellRed",5],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_microDAGR",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["twc_acc_nt4_black",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACE_IR_Strobe_Item",1]
		
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
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
		["rhsusf_8Rnd_00Buck",40],
		["rhsusf_8Rnd_Slug",40],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["twc_acc_nt4_black",0]
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
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
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["twc_acc_nt4_black",0]
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
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
        ["rhsusf_100Rnd_556x45_mixed_soft_pouch",50],
		["rhs_200rnd_556x45_T_SAW",20],
		["ACE_SpareBarrel",2],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_anpeq15A",1],
		["twc_acc_nt4_black",0]
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
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
        ["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],
		["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10]
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
		["twc_acc_nt4_black",0]
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};


  if ((typeOf vehicle player) in ["twc_men_1990_us_w_SquadLeader", "twc_men_1990_us_d_SquadLeader"]) then {
    _tmp_weapons =
    [
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["rhsusf_mag_7x45acp_MHP",40],
		["1Rnd_HE_Grenade_shell", 20],
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
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["twc_men_1990_us_w_backpack_squadlead",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F",1],
		["twc_acc_nt4_black",0],
		["ACE_IR_Strobe_Item",1]
	];
};


  if ((typeOf vehicle player) in ["twc_men_1990_us_w_teamleader", "twc_men_1990_us_d_teamleader"]) then {
    _tmp_weapons =
    [
	];

    _tmp_magazines =
    [
		["1Rnd_HE_Grenade_shell", 30],
		["1Rnd_Smoke_Grenade_shell", 20],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1]
	];
};


  if ((typeOf vehicle player) in ["twc_men_1990_us_w_rifleman", "twc_men_1990_us_d_rifleman"]) then {
    _tmp_weapons =
    [
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};


  if ((typeOf vehicle player) in ["twc_men_1990_us_w_rifleman_at", "twc_men_1990_us_d_rifleman_at"]) then {
    _tmp_weapons =
    [
		["rhs_weap_M136",4]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};


  if ((typeOf vehicle player) in ["twc_men_1990_us_w_autorifleman", "twc_men_1990_us_d_autorifleman"]) then {
    _tmp_weapons =
    [
	];

    _tmp_magazines =
    [
        ["ACE_SpareBarrel",1],
        ["rhs_200rnd_556x45_T_SAW",50],
		["rhsusf_100Rnd_556x45_soft_pouch",20]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};

 if((typeOf player) in ["twc_men_1990_us_d_medic","twc_men_1990_us_w_medic"])then{
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",20],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["HandGrenade",2]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0],
		["TWC_Item_Medical_SutureKit_20", 3],
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
		["ACE_salineIV_250",50],
		["ACE_salineIV_500",50],
		["ACE_personalAidKit", 1],
		["ACE_bodyBag", 30]
	];
};



 if((typeOf player) in ["2000_USMC_Squadleader_d"])then{
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
		["CUP_30Rnd_556x45_Stanag",50],
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["ACRE_PRC117F",1],
		["twc_acc_nt4_black",0]
	];
};




 if((typeOf player) in ["2000_USMC_Teamleader_d"])then{
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
		["CUP_30Rnd_556x45_Stanag",80],
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",30],
		["UK3CB_BAF_12G_Slugs",50],
		["UK3CB_BAF_12G_Pellets",50],
		["1Rnd_HE_Grenade_shell",40],
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
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["twc_acc_nt4_black",0]
	];
};




 if((typeOf player) in ["2000_USMC_Breacher_d"])then{
    _tmp_weapons =
    [
        ["CUP_TWC_arifle_M16A4_Grip_clean",1]
	];

	_tmp_magazines =
   [            
		["CUP_30Rnd_556x45_Stanag",50],
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",10],
		["UK3CB_BAF_12G_Slugs",50],
		["UK3CB_BAF_12G_Pellets",50],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};

 if((typeOf player) in ["2000_USMC_Base_d"])then{
    _tmp_weapons =
    [
        ["rhs_weap_M136",1]
	];

	_tmp_magazines =
   [            
		["CUP_30Rnd_556x45_Stanag",50],
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};




 if((typeOf player) in ["2000_USMC_Grenadier_d"])then{
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
		["CUP_30Rnd_556x45_Stanag",50],
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["twc_acc_nt4_black",0]
	];
};




 if((typeOf player) in ["2000_USMC_Autorifleman_d"])then{
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
		["rhs_200rnd_556x45_T_SAW",50],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};

 if((typeOf player) in ["2000_USMC_AsstAutorifleman_d"])then{
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
		["rhs_200rnd_556x45_T_SAW",50],
		["CUP_30Rnd_556x45_Stanag",50],
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",10],
		["ACE_SpareBarrel",1],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};




 if((typeOf player) in ["2000_USMC_Marksman_d"])then{
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",40],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["twc_acc_nt4_black",0]
	];
};




 if((typeOf player) in ["2000_USMC_Medic_d"])then{
    _tmp_weapons =
    [
	];

	_tmp_magazines =
   [            
		["CUP_30Rnd_556x45_Stanag",50],
		["CUP_30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["rhsusf_spc_corpsman",1],
		["twc_acc_nt4_black",0]
	];
};



