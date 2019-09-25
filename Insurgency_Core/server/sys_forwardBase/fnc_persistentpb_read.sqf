/*
by Hobbs
takes the info provided be persistentpb_write and recreates it

*/

_primary = profilenamespace getvariable ["twcpb" + missionname, []];

if ((count _primary) == 0) exitwith {};

_table = objnull;

{
	_type = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_items = _x select 3;
	_weapons = _x select 4;
	_mags = _x select 5;
	_cargo = _x select 6;
	_vivcargo = _x select 7;
	
	//create the object at the defined position but raised up, because setdir is mean)
	_obj = _type createvehicle (_pos vectoradd [0,0, 30 + (random 1000)]);
	
	//if it's the table, mark it to run the pb script on it when we're done
	if (_type == "twc_radiotable") then {
		_table = _obj;
	};
	
	_obj allowdamage false;
	
	//see if it needs anything special from the loadout system, like colours or dynamic loadouts
	[_obj] execVM "Insurgency_Core\client\sys_player\vehicles\persistentpb_primer.sqf";
	
	//set the direction
	
	_obj setdir _dir;
	//set the final position
	_obj setpos (_pos vectoradd [0,0,1]);
	[_obj, _items, _weapons, _mags] spawn {
		params ["_obj", "_items", "_weapons", "_mags"];
		sleep 1;
		//inventory adding
		clearitemcargoglobal _obj;
		clearweaponcargoglobal _obj;
		clearmagazinecargoglobal _obj;
		clearbackpackcargoglobal _obj;
		for "_i" from 0 to ((count (_items select 0)) - 1) do {
			_obj additemcargoglobal [(_items select 0) select _i, (_items select 1) select _i];
		};
		for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
			_obj addweaponcargoglobal [(_weapons select 0) select _i, (_weapons select 1) select _i];
		};
		for "_i" from 0 to ((count (_mags select 0)) - 1) do {
			_obj addmagazinecargoglobal [(_mags select 0) select _i, (_mags select 1) select _i];
		};
		sleep 30;
		_obj allowdamage true;
	};
	//ace cargo
	
	{
		_type = _x select 0;
		_items = (_x select 1) select 0;
		_weapons = (_x select 1) select 1;
		_mags = (_x select 1) select 2;
		
		_cobj = _type createvehicle (_pos vectoradd [0,0,200]);
		
		//inventory adding
		clearitemcargoglobal _cobj;
		clearweaponcargoglobal _cobj;
		clearmagazinecargoglobal _cobj;
		clearbackpackcargoglobal _cobj;
		for "_i" from 0 to ((count (_items select 0)) - 1) do {
			_cobj additemcargoglobal [(_items select 0) select _i, (_items select 1) select _i];
		};
		for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
			_cobj addweaponcargoglobal [(_weapons select 0) select _i, (_weapons select 1) select _i];
		};
		for "_i" from 0 to ((count (_mags select 0)) - 1) do {
			_cobj addmagazinecargoglobal [(_mags select 0) select _i, (_mags select 1) select _i];
		};
		
		[_cobj, _obj, true] call ace_cargo_fnc_loadItem
		
	} foreach _cargo;
	
	//viv cargo
	//example: [["UK3CB_BAF_LandRover_WMIK_GPMG_Green_A",[[[items],[count]],[[weapons],[count]],[["UK3CB_BAF_762_200Rnd_T"],[10]]],[ace cargo]]]
	{
		
		_type = _x select 0;
		_vobj = _type createvehicle (_pos vectoradd [0,0, 30 + random 200]);
		[_vobj] execVM "Insurgency_Core\client\sys_player\vehicles\persistentpb_primer.sqf";
		_items = (_x select 1) select 0;
		_weapons = (_x select 1) select 1;
		_mags = (_x select 1) select 2;
		_cargo = _x select 2;
			
		[_vobj, _items, _weapons, _mags] spawn {
			params ["_vobj", "_items", "_weapons", "_mags"];
			//inventory adding
			clearitemcargoglobal _vobj;
			clearweaponcargoglobal _vobj;
			clearmagazinecargoglobal _vobj;
			clearbackpackcargoglobal _vobj;
			
			for "_i" from 0 to ((count (_items select 0)) - 1) do {
				_vobj additemcargoglobal [(_items select 0) select _i, (_items select 1) select _i];
			};
			for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
				_vobj addweaponcargoglobal [(_weapons select 0) select _i, (_weapons select 1) select _i];
			};
			for "_i" from 0 to ((count (_mags select 0)) - 1) do {
				_vobj addmagazinecargoglobal [(_mags select 0) select _i, (_mags select 1) select _i];
			};
		};
		//ace cargo
		{
			_type = _x select 0;
			_items = (_x select 1) select 0;
			_weapons = (_x select 1) select 1;
			_mags = (_x select 1) select 2;
			
			_cobj = _type createvehicle (_pos vectoradd [0,0,200]);
			
			//inventory adding
			clearitemcargoglobal _cobj;
			clearweaponcargoglobal _cobj;
			clearmagazinecargoglobal _cobj;
			clearbackpackcargoglobal _cobj;
			for "_i" from 0 to ((count (_items select 0)) - 1) do {
				_cobj additemcargoglobal [(_items select 0) select _i, (_items select 1) select _i];
			};
			for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
				_cobj addweaponcargoglobal [(_weapons select 0) select _i, (_weapons select 1) select _i];
			};
			for "_i" from 0 to ((count (_mags select 0)) - 1) do {
				_cobj addmagazinecargoglobal [(_mags select 0) select _i, (_mags select 1) select _i];
			};
			
			[_cobj, _vobj, true] call ace_cargo_fnc_loadItem
			
		} foreach _cargo;
		
		_obj setvehiclecargo _vobj;
	} foreach _vivcargo;
	
} foreach _primary;

[_table] call twc_fnc_setUpForwardBase;