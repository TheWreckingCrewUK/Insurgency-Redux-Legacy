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

// Don't alter, used for OBJ tracking.
_currentHAMObj = "";
_currentSADObj = "";
_currentRANObj = "";

TWC_ObjCanSpawn = {
	params ["_objID"];
	_return = false;
	
	{
		if ((_x select 0) == _objID) then {
			_return = call (_x select 1);
		};
	} forEach heartsAndMindsObjs;
	
	if (!(_return)) then {
		{
			if ((_x select 0) == _objID) then {
				_return = call (_x select 1);
			};
		} forEach searchAndDestroyObjs;
	};
	
	_return
};

TWC_ObjSpawn = {
	params ["_objID"];
	_return = false;
	
	{
		if ((_x select 0) == _objID) then {
			_return = call (_x select 2);
		};
	} forEach heartsAndMindsObjs;
	
	if (!(_return)) then {
		{
			if ((_x select 0) == _objID) then {
				_return = call (_x select 2);
			};
		} forEach searchAndDestroyObjs;
	};
	
	_return
};

TWC_ObjSelect = {
	params ["_objType"];

	_currentSelectedObj = "";
	_currentObjectiveType = _objType;

	if (_currentObjectiveType == 0) then { _currentObjectiveType = 1 + (floor(random 1)); };

	switch (_currentObjectiveType) do {
		case 1: { _currentSelectedObj = selectRandom heartsAndMindsObjs; };
		case 2: { _currentSelectedObj = selectRandom searchAndDestroyObjs; };
		default { _currentSelectedObj = selectRandom heartsAndMindsObjs; }; // should never fire
	};
	
	// recursive call if bad-select
	if (!([_currentSelectedObj] call TWC_ObjCanSpawn)) then {
		_currentSelectedObj = (_objType call TWC_ObjSelect);
	};
	
	_currentSelectedObj
};

["TWC_Insurgency_objCompleted", {
	params [["_objID", "Blank"]];
	
	_finishedObjType = "_currentRANObj";
	
	if (_currentHAMObj == _objID) then {
		_currentHAMObj = [_finishedObjType] call TWC_ObjSelect;
		[_currentHAMObj] call TWC_ObjSpawn;
	};
	
	if (_currentSADObj == _objID) then {
		_currentSADObj = [_finishedObjType] call TWC_ObjSelect;
		[_currentSADObj] call TWC_ObjSpawn;
	};
	
	if (_currentRANObj == _objID) then {
		_currentRANObj = [_finishedObjType] call TWC_ObjSelect;
		[_currentRANObj] call TWC_ObjSpawn;
	};
}] call CBA_fnc_addEventHandler;