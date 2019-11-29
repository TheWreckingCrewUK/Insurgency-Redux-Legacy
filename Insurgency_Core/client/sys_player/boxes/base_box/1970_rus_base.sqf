

	if((typeOf player) in ["CUP_O_RUS_SpecOps", "CUP_O_RU_Soldier_AR_EMR", "CUP_O_RU_Soldier_AR_VDV_EMR", "CUP_O_RU_Soldier_AT_VDV_EMR", "CUP_O_RU_Soldier_MG_VDV_EMR", "CUP_O_RU_Soldier_EMR", "CUP_O_RU_Crew_VDV_EMR"])then{_magazines = [["rhs_mag_rdg2_white",10], ["CUP_HandGrenade_RGD5",2]];
	_items = [["ACE_EarPlugs",1],["rhs_1PN138",1],["ACE_Flashlight_KSF1", 1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5],["ACE_CableTie",20],["ACE_fieldDressing",20],["ACE_morphine",20],["ACE_elasticBandage",20],["ACE_quikclot",20],["ACE_packingBandage",20], ["ACE_tourniquet", 4],["ACE_SpraypaintGreen",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["twc_l5a4_w",25]];
	
	player removeItem "ACRE_PRC343";
	player removeItem "ACRE_PRC343_ID_1";
};


//crewmen
if((typeOf player) in ["CUP_O_RU_Crew_VDV_EMR"])then{
	
	_UKaction5 = ["SpawnmedCreate","Spawn MT-LB","",{_veh = "CUP_O_MTLB_pk_WDL_RU" createvehicle (getpos ammoboxspawner); clearweaponcargoglobal _veh;},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn BTR-70","",{_veh = "rhs_btr70_msv" createvehicle (getpos ammoboxspawner); clearweaponcargoglobal _veh;},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn BMP-1","",{_veh = "rhs_bmp1_msv" createvehicle (getpos ammoboxspawner); clearweaponcargoglobal _veh;},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;

	_tmp_magazines = [
		["rhs_30Rnd_545x39_7N6_AK",10]
	];
	
};

//pilots
if((typeOf player) in ["CUP_O_RU_Pilot_VDV_EMR", "CUP_O_RU_Pilot_VDV"])then{
	
	_UKaction5 = ["SpawnmedCreate","Spawn Mi-8","",{["RHS_Mi8T_vvsc"] execvm "Insurgency_Core\client\sys_player\vehicles\heli.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Mi-24","",{["RHS_Mi24P_vvsc"] execvm "Insurgency_Core\client\sys_player\vehicles\heli.sqf"},{(count units group player) >= 2}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;

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
	
	_UKaction5 = ["SpawnmedCreate","Spawn Ammo","",{execvm "Insurgency_Core\client\sys_player\boxes\supply_boxes\smallCraterus70.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
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
	
	
	_UKaction5 = ["SpawnmedCreate","Spawn Ammo","",{execvm "Insurgency_Core\client\sys_player\boxes\supply_boxes\smallCraterus70.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
};

//rifleman
if((typeOf player) in ["CUP_O_RU_Soldier_EMR"])then{
	_tmp_magazines = [
		["rhs_30Rnd_545x39_7N6_AK",50]
	];
};

