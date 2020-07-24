



	_twc_repveh = ["prepveh","Prep Supplies","",{[_target, player, 2] call twc_fnc_genericfillvehicle;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{(getNumber (configFile >> "CfgVehicles" >> (typeof (_target)) >> "maximumload") > 0) && (alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["prepvehm","Prep Magazines Only","",{[_target, player, 2, true, false] call twc_fnc_genericfillvehicle;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{(alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "prepveh"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["prepvehi","Prep Items Only","",{[_target, player, 2, false, true] call twc_fnc_genericfillvehicle;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{(alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "prepveh"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_twc_repveh = ["clearsupplies","Clear Supplies","",{},{(alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20) && ((["lead", typeof player] call BIS_fnc_inString) || (["command", typeof player] call BIS_fnc_inString) || (["2ic", typeof player] call BIS_fnc_inString) || (["pilot", typeof player] call BIS_fnc_inString) || (["crew", typeof player] call BIS_fnc_inString) || ((count units group player) < 3))}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesweps","Clear Weapons","",{clearweaponcargoglobal _target;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{((count (weaponcargo _target)) > 0)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesweps2","Clear Specific Weapon","",{player setvariable ["twc_isclearingvehicleweaponcargo", time];playSound3D ["A3\missions_f\data\sounds\click.wss", player];hint "The next weapon you put in or take from the vehicle within 20 seconds will be completely removed from the vehicle";},{true}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies", "clearsuppliesweps"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesitems","Clear All Items","",{clearitemcargoglobal _target;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{((count (itemcargo _target)) > 0)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesiweps","Clear Specific Item","",{player setvariable ["twc_isclearingvehicleitemcargo", time];playSound3D ["A3\missions_f\data\sounds\click.wss", player];hint "The next item you put in or take from the vehicle within 20 seconds will be completely removed from the vehicle";},{true}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies", "clearsuppliesitems"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesmags","Clear All Magazines","",{clearmagazinecargoglobal _target;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{((count (magazinecargo _target)) > 0)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesiweps","Clear Specific Magazine","",{player setvariable ["twc_isclearingvehiclemagcargo", time];playSound3D ["A3\missions_f\data\sounds\click.wss", player]; hint "The next magazine you put in or take from the vehicle within 20 seconds will be completely removed from the vehicle";},{true}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies", "clearsuppliesmags"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	
player addEventHandler ["Put", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehiclemagcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehiclemagcargo", -999];
	hint "Magazines removed";
	if (_unit != player) exitwith {};
	_magcargo = magazinecargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not a magazine";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearmagazinecargoglobal _veh;
	{
		_veh addmagazinecargoglobal [_x, 1];
	} foreach _magcargo;
}];

player addEventHandler ["Put", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleitemcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleitemcargo", -999];
	hint "Items removed";
	
	if (_unit != player) exitwith {};
	_magcargo = itemcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearitemcargoglobal _veh;
	{
		_veh additemcargoglobal [_x, 1];
	} foreach _magcargo;
}];

player addEventHandler ["Put", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleweaponcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleweaponcargo", -999];
	hint "Weapons removed";
	
	if (_unit != player) exitwith {};
	_magcargo = weaponcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item or only one in cargo";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearweaponcargoglobal _veh;
	{
		_veh addweaponcargoglobal [_x, 1];
	} foreach _magcargo;
	
}];
player addEventHandler ["Take", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehiclemagcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehiclemagcargo", -999];
	hint "Magazines removed";
	if (_unit != player) exitwith {};
	_magcargo = magazinecargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not a magazine";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearmagazinecargoglobal _veh;
	{
		_veh addmagazinecargoglobal [_x, 1];
	} foreach _magcargo;
	player removeitem _item;
}];

player addEventHandler ["Take", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleitemcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleitemcargo", -999];
	hint "Items removed";
	
	if (_unit != player) exitwith {};
	_magcargo = itemcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearitemcargoglobal _veh;
	{
		_veh additemcargoglobal [_x, 1];
	} foreach _magcargo;
	player removeitem _item;
}];

player addEventHandler ["Take", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleweaponcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleweaponcargo", -999];
	hint "Weapons removed";
	
	if (_unit != player) exitwith {};
	_magcargo = weaponcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item or only one in cargo";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearweaponcargoglobal _veh;
	{
		_veh addweaponcargoglobal [_x, 1];
	} foreach _magcargo;
	if (_item in (items player)) then {
		player removeitem _item;
	} else {
		player removeweapon _item;
	};
}];
	