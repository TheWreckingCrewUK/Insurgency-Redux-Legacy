if((typeOf player) in ["1970_British_SectionCommander","1970_British_2IC","1970_British_sniper","1970_British_Spotter"])then{

	_UKaction = ["SpawnsmallanaCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCrateuk70.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction = ["SpawnsmallanaCreate","Spawn SUIT Scope","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCrateSUIT.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
};

