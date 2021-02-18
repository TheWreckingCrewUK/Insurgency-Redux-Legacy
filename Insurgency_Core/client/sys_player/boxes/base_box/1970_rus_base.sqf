

	if((typeOf player) in ["CUP_O_RUS_SpecOps", "CUP_O_RU_Soldier_AR_EMR", "CUP_O_RU_Soldier_AR_VDV_EMR", "CUP_O_RU_Soldier_AT_VDV_EMR", "CUP_O_RU_Soldier_MG_VDV_EMR", "CUP_O_RU_Soldier_EMR", "CUP_O_RU_Crew_VDV_EMR"])then{_magazines = [["SmokeShell",10], ["CUP_HandGrenade_RGD5",2]];
	_items = [["ACE_EarPlugs",1],["ACE_Flashlight_KSF1", 1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5],["ACE_CableTie",20],["ACE_fieldDressing",20],["ACE_morphine",20],["ACE_elasticBandage",20],["ACE_quikclot",20],["ACE_packingBandage",20], ["ACE_tourniquet", 4],["ACE_SpraypaintGreen",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["twc_l5a4_w",25]];
	
	player removeItem "ACRE_PRC343";
	player removeItem "ACRE_PRC343_ID_1";
};


//crewmen
if((typeOf player) in ["CUP_O_RU_Crew_VDV_EMR"])then{
	_tmp_magazines = [
		["CUP_30Rnd_545x39_AK74_plum_M",10]
	];
	
};

//pilots
if((typeOf player) in ["CUP_O_RU_Pilot_VDV_EMR", "CUP_O_RU_Pilot_VDV"])then{
	
	_tmp_magazines = [
		["CUP_30Rnd_545x39_AK74_plum_M",10]
	];
	
};


//section commander, names don't match
if((typeOf player) in ["CUP_O_RUS_SpecOps"])then{
	_tmp_magazines = [
		["CUP_1Rnd_HE_GP25_M",20],
		["CUP_1Rnd_SMOKE_GP25_M",10],
		["CUP_1Rnd_SMOKEGREEN_GP25_M",10],
		["CUP_1Rnd_SMOKERED_GP25_M",10],
		["CUP_8Rnd_9x18_Makarov_M",30],
		["CUP_30Rnd_545x39_AK74_plum_M",50]
	];
    _tmp_items = 
	[
		["ACRE_SEM52SL", 1]
    ];
};

//autorifleman
if((typeOf player) in ["CUP_O_RU_Soldier_AR_EMR"])then{
	_tmp_magazines = [
		["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",30],
		["CUP_30Rnd_545x39_AK74_plum_M",50]
	];
};


//grenadier
if((typeOf player) in ["CUP_O_RU_Soldier_AR_VDV_EMR"])then{
	_tmp_weapons = [
		["CUP_arifle_AKS74U",1]
	];
	_tmp_magazines = [
		["CUP_PG7V_M",20],
		["CUP_OG7_M",20],
		["CUP_8Rnd_9x18_Makarov_M",50],
		["CUP_30Rnd_545x39_AK74_plum_M",50]
	];
};


//grenadier assistant
if((typeOf player) in ["CUP_O_RU_Soldier_AT_VDV_EMR"])then{
	_tmp_magazines = [
		["CUP_PG7V_M",20],
		["CUP_OG7_M",20],
		["CUP_30Rnd_545x39_AK74_plum_M",50]
	];
};


//senior rifleman
if((typeOf player) in ["CUP_O_RU_Soldier_MG_VDV_EMR"])then{
	_tmp_magazines = [
		["CUP_30Rnd_TE1_Green_Tracer_545x39_AK74_plum_M",50],
		["CUP_30Rnd_545x39_AK74_plum_M",50]
	];
	
	
};

//rifleman
if((typeOf player) in ["CUP_O_RU_Soldier_EMR"])then{
	_tmp_magazines = [
		["CUP_30Rnd_545x39_AK74_plum_M",50]
	];
};

//medic
if((typeOf player) in ["CUP_O_RU_Medic_VDV_EMR"])then{
	_tmp_magazines = [
		["CUP_30Rnd_545x39_AK74_plum_M",50]
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

