
 if ((typeOf vehicle player) in ["TWC_Infantry_USA_Modern_SquadLeader"]) then {
    _tmp_weapons =
    [
        ["twc_m4_acog_lazer",1],
        ["ACE_Vector",1],
        ["CUP_hgun_M9",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_15Rnd_9x19_M9",40],
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
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["ACE_DAGR",1],
		["CUP_H_USArmy_Boonie_OCP",1],
		["ACRE_PRC117F",1],
		["twc_acc_nt4_black",0],
		["ACE_IR_Strobe_Item",1]
	];
};
//US Army Team Leader
 if ((typeOf vehicle player) in ["TWC_Infantry_USA_Modern_TeamLeader"]) then {
    _tmp_weapons =
    [
        ["twc_m4_320_lds_lazer",1],
		["CUP_launch_M136",2],
        ["CUP_hgun_M9",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 20],
        ["CUP_15Rnd_9x19_M9",40],
		["SmokeShellBlue",5],
		["SmokeShellGreen",5],
		["SmokeShellRed",5],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_microDAGR",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["twc_acc_nt4_black",0],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",3],
		["ACE_M26_Clacker",1],
		["CUP_H_USArmy_Boonie_OCP",1],
		["ACE_IR_Strobe_Item",1]
		
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//USMC breacher
  if ((typeOf vehicle player) in ["TWC_Infantry_USA_Modern_Rifleman"]) then {
    _tmp_weapons =
    [
        ["twc_m4_acog_lazer",1],
		["ACE_VMM3",1],
		["CUP_launch_M72A6",2]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USArmy_Boonie_OCP",1],
		["twc_acc_nt4_black",0]
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//USMC Rifleman
  if ((typeOf vehicle player) in ["TWC_Infantry_USA_Modern_Grenadier"]) then {
    _tmp_weapons =
    [
        ["twc_m4_203_acog_lazer",1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["1Rnd_HE_Grenade_shell",30],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USArmy_Boonie_OCP",1],
		["twc_acc_nt4_black",0]
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};



//USMC Auto Rifleman
  if ((typeOf vehicle player) in ["TWC_Infantry_USA_Modern_AutoRifleman"]) then {
    _tmp_weapons =
    [
        ["twc_m249_mgo_lazer",1]
	];

    _tmp_magazines =
    [
        ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",50],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",20],
		["ACE_SpareBarrel",2],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["CUP_H_USArmy_Boonie_OCP",1],
		["twc_acc_nt4_black",0]
	];
	_tmp_backpacks = 
	[ 
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//USMC Medic
  if ((typeOf vehicle player) in ["TWC_Infantry_USA_Modern_Medic"]) then {
    _tmp_weapons =
    [
        ["twc_m4_acog_lazer",1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",30],
		["30Rnd_556x45_Stanag_Tracer_Red",10]
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
		["CUP_optic_ACOG",0],
		["CUP_optic_CompM4",1],
		["CUP_optic_HoloBlack",1],
		["CUP_acc_ANPEQ_15_Flashlight_Black_L",1],
		["CUP_H_USArmy_Boonie_OCP",1],
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
        ["CUP_7Rnd_45ACP_1911",40],
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
		["CUP_launch_M136",4]
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
        ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",50],
		["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",20]
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
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["30Rnd_556x45_Stanag",80],
		["30Rnd_556x45_Stanag_Tracer_Red",30],
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
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
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
        ["CUP_launch_M136",1]
	];

	_tmp_magazines =
   [            
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",50],
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
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",50],
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["ACE_30Rnd_556x45_Stanag_Mk262_mag_Pull",40],
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
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["CUP_V_B_IOTV_UCP_Medic_USArmy",1],
		["twc_acc_nt4_black",0]
	];
};



