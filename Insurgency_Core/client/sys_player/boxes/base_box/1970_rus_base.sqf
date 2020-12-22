

	if((typeOf player) in ["CUP_O_RUS_SpecOps", "CUP_O_RU_Soldier_AR_EMR", "CUP_O_RU_Soldier_AR_VDV_EMR", "CUP_O_RU_Soldier_AT_VDV_EMR", "CUP_O_RU_Soldier_MG_VDV_EMR", "CUP_O_RU_Soldier_EMR", "CUP_O_RU_Crew_VDV_EMR"])then{_magazines = [["rhs_mag_rdg2_white",10], ["CUP_HandGrenade_RGD5",2]];
	_items = [["ACE_EarPlugs",1],["ACE_Flashlight_KSF1", 1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5],["ACE_CableTie",20],["ACE_fieldDressing",20],["ACE_morphine",20],["ACE_elasticBandage",20],["ACE_quikclot",20],["ACE_packingBandage",20], ["ACE_tourniquet", 4],["ACE_SpraypaintGreen",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["twc_l5a4_w",25]];
	
	player removeItem "ACRE_PRC343";
	player removeItem "ACRE_PRC343_ID_1";
};


//crewmen
if((typeOf player) in ["CUP_O_RU_Crew_VDV_EMR"])then{
	_tmp_magazines = [
		["rhs_30Rnd_545x39_7N6_AK",10]
	];
	
};

//pilots
if((typeOf player) in ["CUP_O_RU_Pilot_VDV_EMR", "CUP_O_RU_Pilot_VDV"])then{
	
	_tmp_magazines = [
		["rhs_30Rnd_545x39_7N6_AK",10]
	];
	
};


//section commander, names don't match
if((typeOf player) in ["CUP_O_RUS_SpecOps"])then{
	_tmp_magazines = [
		["rhs_VOG25",20],
		["rhs_GRD40_White",10],
		["rhs_GRD40_Green",10],
		["rhs_GRD40_Red",10],
		["rhs_mag_9x18_8_57N181S",30],
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
    _tmp_items = 
	[
		["ACRE_SEM52SL", 1]
    ];
};

//autorifleman
if((typeOf player) in ["CUP_O_RU_Soldier_AR_EMR"])then{
	_tmp_magazines = [
		["rhs_45Rnd_545X39_AK_Green",30],
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
};


//grenadier
if((typeOf player) in ["CUP_O_RU_Soldier_AR_VDV_EMR"])then{
	_tmp_weapons = [
		["rhs_weap_aks74u",1]
	];
	_tmp_magazines = [
		["rhs_rpg7_PG7V_mag",20],
		["rhs_rpg7_OG7V_mag",20],
		["rhs_mag_9x18_8_57N181S",50],
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
};


//grenadier assistant
if((typeOf player) in ["CUP_O_RU_Soldier_AT_VDV_EMR"])then{
	_tmp_magazines = [
		["rhs_rpg7_PG7V_mag",20],
		["rhs_rpg7_OG7V_mag",20],
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
};


//senior rifleman
if((typeOf player) in ["CUP_O_RU_Soldier_MG_VDV_EMR"])then{
	_tmp_magazines = [
		["rhs_30Rnd_545x39_AK_green",50],
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
	
	
};

//rifleman
if((typeOf player) in ["CUP_O_RU_Soldier_EMR"])then{
	_tmp_magazines = [
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
};

//medic
if((typeOf player) in ["CUP_O_RU_Medic_VDV_EMR"])then{
	_tmp_magazines = [
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
	_tmp_items =
	[
		["ACRE_PRC148",0],
		["TWC_Item_Medical_SutureKit_20",5],
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
		["ACE_bodyBag", 10]
	];
};

