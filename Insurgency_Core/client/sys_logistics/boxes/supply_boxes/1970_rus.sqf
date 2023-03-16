
//crewmen
if((typeOf player) in ["CUP_O_RU_Crew_VDV_EMR"])then{
	
	_UKaction5 = ["SpawnmedCreate","Spawn MT-LB","",{_veh = "CUP_O_MTLB_pk_WDL_RU" createvehicle (getpos ammoboxspawner); clearweaponcargoglobal _veh;},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn BTR-60","",{_veh = "CUP_O_BTR60_Green_RU" createvehicle (getpos ammoboxspawner); clearweaponcargoglobal _veh;},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn BMP-1","",{_veh = "CUP_I_BMP1_TK_GUE" createvehicle (getpos ammoboxspawner); clearweaponcargoglobal _veh;},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Ammo","",{execvm "Insurgency_Core\client\sys_player\boxes\supply_boxes\smallCraterus70.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;

	
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

};


//pilots
if((typeOf player) in ["CUP_O_RU_Pilot_VDV_EMR", "CUP_O_RU_Pilot_VDV"])then{
	
	_UKaction5 = ["SpawnmedCreate","Spawn Mi-8","",{["CUP_O_Mi8_RU"] execvm "Insurgency_Core\client\sys_player\vehicles\heli.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Mi-24","",{["CUP_O_Mi24_P_Dynamic_RU"] execvm "Insurgency_Core\client\sys_player\vehicles\heli.sqf"},{(count units group player) >= 2}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Rus Ammo","",{execvm "Insurgency_Core\client\sys_player\boxes\supply_boxes\smallCraterus70.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction = ["SpawnsmallanaCreate","Spawn ANA Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn", "ammospawnlight"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

//senior rifleman and SL
if((typeOf player) in ["CUP_O_RU_Soldier_MG_VDV_EMR", "CUP_O_RUS_SpecOps"])then{
	_UKaction5 = ["SpawnmedCreate","Spawn Ammo","",{execvm "Insurgency_Core\client\sys_player\boxes\supply_boxes\smallCraterus70.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};