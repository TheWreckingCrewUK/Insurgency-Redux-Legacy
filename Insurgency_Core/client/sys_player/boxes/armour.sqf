


_armourlow = {(( count(allPlayers - entities "HeadlessClient_F")) >= 0)};

_armourhi = {(( count(allPlayers - entities "HeadlessClient_F")) >= 6)};



if((typeOf player) in ["Modern_British_VehicleCommander"])then{



	

//	if (twc_wdveh == 1) then {
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
/*	} else {

	_vehaction = ["vehiclespawndesert","Spawn Vehicles","",{},_armourlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	};
*/


	_armouraction1 = ["spawnl111","Spawn M1A2","",{["rhsusf_m1a2sep1tuskiid_usarmy"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Bradley","",{["RHS_M2A3_BUSKIII"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	
	_armouraction1 = ["spawnl111","Spawn Guardian","",{["rhsusf_M1117_D"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Stryker","",{["CUP_B_M1130_CV_M2_Woodland_Slat"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
		
	_armouraction1 = ["spawnl111","Spawn Rosomak","",{["B_APC_Wheeled_01_cannon_F"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;


	_armouraction1 = ["spawnl111","Spawn LAV 25","",{["CUP_B_LAV25_desert_USMC"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Scimitar","",{["ukcw_cvrt_Scim_d"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn AAV","",{["CUP_B_AAV_USMC"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn FV432","",{["ukcw_fv432"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn M113","",{["rhsusf_m113d_usarmy_M240"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	


	_armouraction1 = ["spawnl111","Spawn Warrior","",{["CUP_B_MCV80_GB_D_SLAT"] execvm "insurgency_core\client\sys_player\vehicles\spawnarmour.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_armouraction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	
	};

	
