/*
* Author: [TWC] Bosenator
* Server controller for dynamic objectives.
*
* Public: No
*
* // ["TWC_Insurgency_objCompleted", "CrashedHeli"] call CBA_fnc_serverEvent;
*/

_ROOT = "Insurgency_Core\server\sys_objectives\";

if (!isServer) exitWith {};

_canSpawn_Blank = compile preprocessFileLineNumbers (_ROOT + "Blank\Blank_canSpawn.sqf");
_spawn_Blank = compile preprocessFileLineNumbers (_ROOT + "Blank\Blank_canSpawn.sqf");

_canSpawn_CrashedHeli = compile preprocessFileLineNumbers (_ROOT + "CrashedHeli\crashedHeli_canSpawn.sqf");
_spawn_CrashedHeli = compile preprocessFileLineNumbers (_ROOT + "CrashedHeli\crashedHeli_spawn.sqf");

heartsAndMindsObjs = [
	["Blank", _canSpawn_Blank, _spawn_Blank],
	["CrashedHeli", _canSpawn_CrashedHeli, _spawn_CrashedHeli]
];

searchAndDestroyObjs = [
	["Blank", _canSpawn_Blank, _spawn_Blank]
	// ["IEDFactory", _canSpawn_IEDFactory, _spawn_IEDFactory]
];

// KRAKENS BELOW, BEWARE (don't edit pls)
_currentHAMObj = "";
_currentSADObj = "";
_currentRANObj = "";

// Mission Start, let's get crackin'
systemChat "sys_objectives init...";
_currentHAMObj = [1] call TWC_ObjSelect;
[_currentHAMObj] call TWC_ObjSpawn;
_currentSADObj = [2] call TWC_ObjSelect;
[_currentSADObj] call TWC_ObjSpawn;
_currentRANObj = [0] call TWC_ObjSelect;
[_currentRANObj] call TWC_ObjSpawn;

TWC_ObjCanSpawn = {
	params ["_objID"];
	_return = false;
	
	{
		if ((_x select 0) == _objID) then {
			_return = call (_x select 1);
			systemChat format ["TWC_ObjCanSpawn matched HAM %1 and returned %2", _objID, _return];
		};
	} forEach heartsAndMindsObjs;
	
	if (!(_return)) then {
		{
			if ((_x select 0) == _objID) then {
				_return = call (_x select 1);
				systemChat format ["TWC_ObjCanSpawn matched SAD %1 and returned %2", _objID, _return];
			};
		} forEach searchAndDestroyObjs;
	};
	
	_return
};

TWC_ObjSpawn = {
	params ["_objID"];
	
	{
		if ((_x select 0) == _objID) then {
			call (_x select 2);
			systemChat format ["TWC_ObjSpawn called HAM %1", (_x select 0)];
		};
	} forEach heartsAndMindsObjs;
	
	if (!(_return)) then {
		{
			if ((_x select 0) == _objID) then {
				call (_x select 2);
				systemChat format ["TWC_ObjSpawn called SAD %1", (_x select 0)];
			};
		} forEach searchAndDestroyObjs;
	};
};

TWC_ObjSelect = {
	params [["_objType", 0]];

	_currentSelectedObj = "";
	_currentObjectiveType = _objType;

	if (_currentObjectiveType == 0) then { _currentObjectiveType = 1 + (floor(random 1)); };

	switch (_currentObjectiveType) do {
		case 1: { _currentSelectedObj = (selectRandom heartsAndMindsObjs) select 0; };
		case 2: { _currentSelectedObj = (selectRandom searchAndDestroyObjs) select 0; };
		default { _currentSelectedObj = (selectRandom heartsAndMindsObjs) select 0; }; // should never fire
	};
	
	// recursive call if bad-select
	if (!([_currentSelectedObj] call TWC_ObjCanSpawn)) then {
		systemChat format ["Couldn't spawn %1, searching again...", _currentSelectedObj];
		_currentSelectedObj = (_objType call TWC_ObjSelect);
	};
	
	_currentSelectedObj
};

["TWC_Insurgency_objCompleted", {
	params [["_objID", "Blank"]];
	
	if (_currentHAMObj == _objID) then {
		_currentHAMObj = [1] call TWC_ObjSelect;
		[_currentHAMObj] call TWC_ObjSpawn;
	};
	
	if (_currentSADObj == _objID) then {
		_currentSADObj = [2] call TWC_ObjSelect;
		[_currentSADObj] call TWC_ObjSpawn;
	};
	
	if (_currentRANObj == _objID) then {
		_currentRANObj = [0] call TWC_ObjSelect;
		[_currentRANObj] call TWC_ObjSpawn;
	};
}] call CBA_fnc_addEventHandler;