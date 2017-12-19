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
_weapons = [];
_magazines = [["SmokeShell",5], ["SmokeShellYellow",5], ["SmokeShellRed",5], ["SmokeShellGreen",5], ["SmokeShellPurple",5], ["SmokeShellBlue",5], ["SmokeShellOrange",5], ["Chemlight_green",5], ["Chemlight_yellow",5], ["Chemlight_red",5], ["Chemlight_blue",5],["ACE_Chemlight_IR",5]];
_items = [["ACE_EarPlugs",1],["ACE_MapTools",1],["rhsusf_ANPVS_14",1],["ACE_Flashlight_KSF1", 1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5],["ACE_CableTie",2],["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_elasticBandage",10],["ACE_quikclot",10],["ACE_packingBandage",10], ["ACE_tourniquet", 2],["ACE_SpraypaintGreen",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1]];

_backpacks = [];
_tmp_weapons = [];
_tmp_magazines = [];
_tmp_items = [];
_tmp_backpacks = [];

//BAF Section Leader
if (typeOf vehicle player == "Modern_British_Squadleader") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC117F",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["itemCTAB",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};

//BAF Rifleman Pointman
 if (typeOf vehicle player == "Modern_British_Pointman") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L128A1_Eotech",1],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMH3",1],
		["rhs_weap_m72a7",4],
		["rhs_weap_M136_hedp",2],
		["launch_NLAW_F",3]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["UK3CB_BAF_12G_Pellets",10],
		["UK3CB_BAF_12G_Slugs",10],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
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
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Grenadier
 if (typeOf vehicle player == "Modern_British_Grenadier_COIN") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
        ["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["1Rnd_HE_Grenade_shell", 40],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
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
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Automatic Rifleman
 if (typeOf vehicle player == "Modern_British_Autorifleman_COIN") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L110A2_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["rhs_weap_m72a7",4]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",10],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
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
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF 2IC
 if (typeOf vehicle player == "Modern_British_2IC_COIN") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1],
		["rhs_weap_m72a7",4]
    ];

    _tmp_magazines =
    [	
    	//Rifleman
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		//Shotgun
		["UK3CB_BAF_12G_Pellets",10],
		["UK3CB_BAF_12G_Slugs",10],
		//Pistol ammo
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		//Grenadier
		["1Rnd_HE_Grenade_shell", 40],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
		//Autorifleman
		["UK3CB_BAF_556_200Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",10],
		//GPMG
        ["UK3CB_BAF_762_100Rnd",20],
		["UK3CB_BAF_762_100Rnd_T",10],
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
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Machine Gunner
 if (typeOf vehicle player == "Modern_British_Machinegunner") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L7A2",1],
		["UK3CB_BAF_Tripod",1],
		["rhsusf_weap_glock17g4",1]
	];
       
    _tmp_magazines =
    [
        ["UK3CB_BAF_762_100Rnd",20],
		["UK3CB_BAF_762_100Rnd_T",10],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
	
	_tmp_items = 
	[
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
 
//BAF Marksman
 if (typeOf vehicle player == "Modern_British_Marksman_COIN") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L129A1_Grippod_TA648",1],
		["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1],
		["launch_NLAW_F",3],
		["rhs_weap_M136_hedp",2]
	];
       
    _tmp_magazines =
    [
        ["UK3CB_BAF_762_L42A1_20Rnd",25],
		["UK3CB_BAF_762_L42A1_20Rnd_T",10],			
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
		
	_tmp_items = 
	[
		["UK3CB_BAF_TA648_308",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["UK3CB_underbarrel_acc_fgrip_bipod",1],
		["UK3CB_BAF_MaxiKite",1],
		["ACRE_PRC343",1]
	];	

	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
 if (typeOf vehicle player == "Modern_British_Medic") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS",1],
		["rhsusf_weap_glock17g4",1]
	];

    _tmp_magazines =
	[
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["ACRE_PRC343", 1]
	];

	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Sniper
 if (typeOf vehicle player == "Modern_British_Sniper_coin") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L115A3_DE",1],
		["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_338_5Rnd",50],
		["UK3CB_BAF_338_5Rnd_Tracer",50],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["rhsusf_mag_15Rnd_9x19_JHP",15]
	];

	_tmp_items = 
	[
		
		["RKSL_optic_PMII_525",1],
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["STKR_Predator",1],
		["ACRE_PRC343",1],
		["rhsusf_ANPVS_14",1],
		["ACE_IR_Strobe_Item",5],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_RangeCard",1],
		["UK3CB_BAF_MaxiKite",1],
		["ACE_Tripod",1],
		["HandGrenade",5]
	];

	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Spotter
 if (typeOf vehicle player == "Modern_British_Spotter_coin") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS",1],
		["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_338_5Rnd",50],
		["UK3CB_BAF_338_5Rnd_Tracer",50],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["UK3CB_BAF_762_L42A1_20Rnd", 50],
		["UK3CB_BAF_762_L42A1_20Rnd_t", 50],
		["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_LLM_IR",1],
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
		["ACE_Tripod",1],
		["itemCTAB",1]
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
        ["UK3CB_BAF_L85A2_RIS",1],
        ["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
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
		["DemoCharge_Remote_Mag",1],
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
        ["UK3CB_BAF_L85A2_RIS",1],
        ["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
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
		["DemoCharge_Remote_Mag",1],
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
		["UK3CB_BAF_L85A2_RIS",1],
		["UK3CB_BAF_L128A1",1],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMH3",1],
		["Binocular",1],
		["rhs_weap_m72a7",4],
		["rhs_weap_M136_hedp",2],
		["launch_NLAW_F",3],
		["UK3CB_BAF_Javelin_Slung_Tube",3]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
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
        ["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["rhsusf_mag_17Rnd_9x19_JHP",5],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC117F",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["itemCTAB",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];

	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//FST Forward Observer
 if (typeOf vehicle player == "Modern_British_FSTForwardObserver") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
        ["CUP_SOFLAM",1],
		["rhsusf_weap_glock17g4",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["rhsusf_mag_17Rnd_9x19_JHP",5],
		["1Rnd_HE_Grenade_shell", 40],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
		["1Rnd_SmokeBlue_Grenade_shell", 10],
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
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//FST Assistant
 if (typeOf vehicle player == "Modern_British_FSTAssistant") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["rhsusf_weap_glock17g4",1],
		["ACE_VMH3",1],
		["UK3CB_BAF_Javelin_Slung_Tube",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["rhs_weap_m72a7",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["rhsusf_mag_17Rnd_9x19_JHP",5],
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
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
//US Section Leader
if (typeOf vehicle player == "TWC_Modern_US_Army_SectionCommander") then {
    _tmp_weapons =
    [
		["rhs_weap_m4_carryhandle_pmag",1],
        ["ACE_Vector",1],
		["rhsusf_weap_m9",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
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
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_TA31F",1],
		["rhsusf_acc_anpeq15_bk",1],
		["rhsusf_acc_compm4",1],
		["UK3CB_BAF_Eotech",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F_ID_1",1],
		["rhsusf_assault_eagleaiii_ucp",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACRE_PRC148",1],
		["itemCTAB",1],
		["ACE_wirecutter", 1]
    ];
};

//US Team Leader
if (typeOf vehicle player == "TWC_Modern_US_Army_TeamLeader") then {
    _tmp_weapons =
    [
		["rhs_weap_m4a1_carryhandle_m203",1],
        ["ACE_Vector",1],
		["rhs_weap_M136_hedp",2],
		["rhsusf_weap_m9",1],
		["rhs_weap_m72a7",4]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["rhsusf_mag_15Rnd_9x19_JHP",15],
		["1Rnd_HE_Grenade_shell", 40],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["rhsusf_8Rnd_00Buck",10],
		["rhsusf_8Rnd_Slug",10],
		["rhsusf_100Rnd_556x45_soft_pouch",20],
		["rhsusf_200Rnd_556x45_soft_pouch",10],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_MapTools",1],
		["UK3CB_BAF_TA31F_3D",1],
		["rhsusf_acc_anpeq15_bk",1],
		["UK3CB_BAF_TA31F",1],
		["UK3CB_BAF_Eotech",1],
		["ACE_DAGR",1],
		["rhsusf_assault_eagleaiii_ucp",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["rhsusf_acc_compm4",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_wirecutter", 1]
    ];
};

//US Rifleman
 if (typeOf vehicle player == "TWC_Modern_US_Army_Rifleman") then {
    _tmp_weapons =
    [
        ["rhs_weap_m4a1_carryhandle_grip",1],
		["rhs_weap_M590_8RD",1],
		["ACE_VMH3",1],
		["Binocular",1],
		["rhsusf_weap_m9",1],
		["rhs_weap_M136_hedp",4],
		["CUP_launch_MAAWS",1],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["rhsusf_mag_15Rnd_9x19_JHP",15],
		["rhsusf_8Rnd_00Buck",10],
		["rhsusf_8Rnd_Slug",10],
		["CUP_MAAWS_HEDP_M",2],
		["CUP_MAAWS_HEAT_M",3],
		["HandGrenade",5]
		
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_TA31F",1],
		["UK3CB_BAF_Eotech",1],
		["rhsusf_acc_anpeq15_bkA",1],
		["rhsusf_assault_eagleaiii_ucp",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["CUP_optic_MAAWS_Scope",1],
		["rhsusf_acc_compm4",1]
	];
};

//US Automatic Rifleman
 if (typeOf vehicle player == "TWC_Modern_US_Army_AutomaticRifleman") then {
    _tmp_weapons =
    [
        ["rhs_weap_m249_pip",1],
		["rhs_weap_M136_hedp",2],
		["Binocular",1],
		["rhsusf_weap_m9",1],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [
		["rhsusf_100Rnd_556x45_soft_pouch",20],
		["rhsusf_200Rnd_556x45_soft_pouch",10],
		["rhsusf_mag_15Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ELCAN",1],
		["rhsusf_acc_anpeq15_bkA",1],
		["UK3CB_BAF_Eotech",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["rhsusf_assault_eagleaiii_ucp",1],
		["ACRE_PRC148",1]
	];
};

//US Grenadier
 if (typeOf vehicle player == "TWC_Modern_US_Army_Grenadier") then {
    _tmp_weapons =
    [
        ["rhs_weap_m4a1_carryhandle_m203",1],
		["ACE_Vector",1],
		["rhsusf_weap_m9",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["rhsusf_mag_15Rnd_9x19_JHP",15],
		["1Rnd_HE_Grenade_shell", 40],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["rhsusf_acc_anpeq15_bkA",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_TA31F",1],
		["rhsusf_assault_eagleaiii_ucp",1],
		["rhsusf_acc_compm4",1],
		["ACRE_PRC148",1]
	];
};

//US Marksmen
 if (typeOf vehicle player == "TWC_Modern_US_Army_Marksman") then {
    _tmp_weapons =
    [
        ["rhs_weap_m14ebrri",1],
		["rhs_weap_m4a1_carryhandle_grip",1],
		["rhsusf_weap_m9",1],
		["ACE_Vector",1],
		["rhs_weap_M136_hedp",2],
		["UK3CB_BAF_Javelin_Slung_Tube",3],
		["rhs_weap_m72a7",4]	
	];
       
    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["rhsusf_20Rnd_762x51_m118_special_Mag",25],
        ["rhsusf_mag_15Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
		
	_tmp_items = 
	[
		["ACE_MapTools",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_LEUPOLDMK4",1],
		["rhsusf_acc_anpeq15_bkA",1],
		["rhsusf_assault_eagleaiii_ucp",1],
		["bipod_01_F_blk",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_TA31F",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["rhsusf_acc_anpeq15_bkA",1]
	
	];
};
//US Medic
 if (typeOf vehicle player == "TWC_Modern_US_Army_Medic") then {
    _tmp_weapons =
    [
		["rhs_weap_m4a1_carryhandle_grip",1],
		["Binocular",1],
	    ["rhsusf_weap_m9", 1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["rhsusf_mag_15Rnd_9x19_JHP",15],
        ["CUP_15Rnd_9x19_M9",15],
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
		["ACE_surgicalKit", 50],
		["ACE_tourniquet", 5],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bkA",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["rhsusf_assault_eagleaiii_ucp",1],
		["ACRE_PRC148",1]
	];
};
/*
//US Sniper
 if (g_class == "US_SN") then {
    _tmp_weapons =
    [
		["rhs_weap_m24sws",1],
		["ACE_Vector",1],
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
		["ACE_Vector",1],
		["rhsusf_mag_15Rnd_9x19_JHP",1]
    ];

    _tmp_magazines =
    [	
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
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
*/
//USMC Squad Leader
 if (typeOf vehicle player == "Modern_USMC_Squadleader") then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_m203_acog_lazer",1],
        ["ACE_Vector",1],
		["rhsusf_weap_m1911a1",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["rhsusf_mag_7x45acp_MHP",15],
		["1Rnd_HE_Grenade_shell", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
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
		["rhsusf_assault_eagleaiii_ocp",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F",1],
		["ACRE_PRC148",1],
		["itemCTAB",1],
		["ACE_IR_Strobe_Item",1]
	];
};
//USMC Team Leader
 if (typeOf vehicle player == "Modern_USMC_Teamleader") then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_m203_acog_lazer",1],
        ["ACE_Vector",1],
		["rhs_weap_M136_hedp",2],
		["rhsusf_weap_m1911a1",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
		["1Rnd_HE_Grenade_shell", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
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
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_IR_Strobe_Item",1]
		
	];
};

//USMC Rifleman
 if (typeOf vehicle player == "Modern_USMC_Rifleman") then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],
		["ACE_VMH3",1],
        ["rhsusf_weap_m1911a1",1],
		["UK3CB_BAF_Javelin_Slung_Tube",3],
		["CUP_launch_Mk153Mod0",1],
		["rhs_weap_M590_8RD",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",2]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["rhsusf_8Rnd_00Buck",10],
		["rhsusf_8Rnd_Slug",10],
		["CUP_SMAW_HEAA_M",3],
		["CUP_SMAW_HEDP_M",3],
		["CUP_SMAW_Spotting",8],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ACOG",1],
		["rhsusf_acc_compm4",1],
		["rhsusf_acc_anpeq15_bk_light",1],
		["rhsusf_assault_eagleaiii_ocp",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["CUP_optic_SMAW_Scope",1]
	];
};

//USMC Auto Rifleman
if (typeOf vehicle player == "Modern_USMC_Autorifleman") then {
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
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["rhsusf_mag_7x45acp_MHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ELCAN",1],
		["rhsusf_acc_anpeq15A",1],
		["rhsusf_assault_eagleaiii_ocp",1],
		["bipod_01_F_blk",1],
		["ACRE_PRC148",1]
	];
};

//USMC Auto Rifleman Assistant
if (typeOf vehicle player == "Modern_USMC_AsstAutorifleman") then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],     
		["rhsusf_weap_m1911a1",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
		["rhsusf_100Rnd_556x45_soft_pouch",10],
		["rhsusf_200Rnd_556x45_soft_pouch",10],
        ["rhsusf_mag_7x45acp_MHP",15],
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
if (typeOf vehicle player == "Modern_USMC_MachineGunner") then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m240B_mgo_lazer",1],
		["rhsusf_weap_m1911a1",1]
	];

    _tmp_magazines =
    [
		["rhsusf_100Rnd_762x51",20],
		["rhsusf_100Rnd_762x51_m62_tracer",10],
        ["rhsusf_mag_7x45acp_MHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["rhsusf_acc_ELCAN",1],
		["rhsusf_acc_anpeq15A",1],
		["rhsusf_assault_eagleaiii_ocp",1],
		["ACRE_PRC148",1]
	];
};

//USMC Machine Gunner Assistant
if (typeOf vehicle player == "Modern_USMC_AsstMachineGunner") then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],
		["rhsusf_weap_m1911a1",1],
		["rhs_weap_M136_hedp",2],
		["rhs_weap_m72a7",4]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
		["rhsusf_100Rnd_762x51",10],
		["rhsusf_100Rnd_762x51_m62_tracer",10],
        ["rhsusf_mag_7x45acp_MHP",15],
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

//USMC Medic
 if (typeOf vehicle player == "Modern_USMC_Medic") then {
    _tmp_weapons =
    [
        ["twc_rhs_weap_m4a1_acog_lazer",1],
		["rhsusf_weap_m1911a1",1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["rhsusf_mag_7x45acp_MHP",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_personalAidKit", 1],
		["ACE_morphine",50],
		["ACE_epinephrine",50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
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
		["ACE_Vector",1],
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
		["ACE_Vector",1],
		["rhsusf_mag_15Rnd_9x19_JHP",1]
    ];

    _tmp_magazines =
    [	
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
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
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10]
	];
	_tmp_items = 
	[
		["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
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
		["DemoCharge_Remote_Mag",1],
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
		["ACE_surgicalKit", 50],
		["ACE_tourniquet", 5]
	];
};
*/
//BAF Pilot
 if (typeOf vehicle player == "Modern_British_heliPilot") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",1],
		["rhsusf_ANPVS_14",1],
		["itemCTAB",1],
		["ACE_microDAGR",1],
		["ACRE_PRC117F",1]
	];
};
/*
 //BAF Crew Cheif
 if (g_class == "PLT_CREW") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["rhsusf_mag_17Rnd_9x19_JHP",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC343",1],
		["rhsusf_ANPVS_14",1],
		["ACRE_PRC343",1],
		["rhsusf_ANPVS_14",1],
		["itemCTAB",1],
		["ACE_microDAGR",1],
		["UK3CB_BAF_SUSAT",1]
		
	];
};
*/
//US Pilot
 if (typeOf vehicle player == "TWC_Modern_US_Army_HeliPilot") then {
    _tmp_weapons =
    [
        ["rhs_weap_m4_carryhandle",1],
		["rhsusf_weap_m9",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
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


//90's era kit

 if (typeOf vehicle player == "1990_British_SectionCommander_Desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D_Lazer",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC117F",1],
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Rifleman_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Rifleman_AT_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["rhs_weap_m72a7",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Gunner_desert") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L86A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_2IC_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};


 if (typeOf vehicle player == "1990_British_Medic_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1],
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_bodyBag", 10]
	];
};


 if (typeOf vehicle player == "1990_British_Sniper_desert") then {
    _tmp_weapons =
    [
        ["twc_l96_d",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",30],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
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
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",30],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};


 if (typeOf vehicle player == "1990_British_MachineGunner_Desert") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_Tripod",1],
        ["UK3CB_BAF_L7A2",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd",30],
		["UK3CB_BAF_762_200Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_mg_assistant_Desert") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_Tripod",1],
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd",30],
		["UK3CB_BAF_762_200Rnd_T",20],
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
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
        ["ACE_Vector",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SUSAT_3D",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
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
		["UK3CB_BAF_556_30Rnd_T",50],
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
		["UK3CB_BAF_556_30Rnd_T",50],
		["rhs_mag_maaws_HE",5],
		["rhs_mag_maaws_HEAT",5],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SUSAT_3D",1],
		["rhs_optic_maaws",1],
		["ACRE_PRC343",1]
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
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
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
        ["ACE_Vector",1],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
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
		["DemoCharge_Remote_Mag",1],
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
        ["ACE_Vector",1],
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["rhsusf_weap_glock17g4",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
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

// add in all weapons.
{crateBox addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;

// add in all magazines.
{crateBox addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;

{crateBox addItemCargo [(_x select 0),(_x select 1)]} foreach _items;

{crateBox addbackpackCargo [(_x select 0),(_x select 1)]} foreach _backpacks;

