if((typeOf player) in ["Modern_pol_commander","Modern_pol_commander_d", "Modern_pol_subcommander","Modern_pol_subcommander_d"])then{

	_UKaction = ["SpawnsmallanaCreate","Spawn Small Polish Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratepol.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction5 = ["SpawnmedCreate","Spawn ZSU GAZ","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_pol.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	
	
			_artaction3 = ["SpawnrepCreate","Spawn Landmines","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\tm62_mines.sqf"},{(count units group player) >= 4}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
			_artaction3 = ["SpawnrepCreate","Spawn Marksman Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\specCratepol_svd.sqf"},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
};


