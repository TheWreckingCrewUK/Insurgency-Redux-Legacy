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
_spawn_Blank = compile preprocessFileLineNumbers (_ROOT + "Blank\Blank_spawn.sqf");

_canSpawn_CrashedHeli = compile preprocessFileLineNumbers (_ROOT + "CrashedHeli\crashedHeli_canSpawn.sqf");
_spawn_CrashedHeli = compile preprocessFileLineNumbers (_ROOT + "CrashedHeli\crashedHeli_spawn.sqf");

_canSpawn_HVT = compile preprocessFileLineNumbers (_ROOT + "HVT\HVT_canSpawn.sqf");
_spawn_HVT = compile preprocessFileLineNumbers (_ROOT + "HVT\HVT_spawn.sqf");

_canSpawn_CarBomb = compile preprocessFileLineNumbers (_ROOT + "CarBomb\CarBomb_canSpawn.sqf");
_spawn_CarBomb = compile preprocessFileLineNumbers (_ROOT + "CarBomb\CarBomb_spawn.sqf");

_canSpawn_VIP = compile preprocessFileLineNumbers (_ROOT + "VIP\VIP_canSpawn.sqf");
_spawn_VIP = compile preprocessFileLineNumbers (_ROOT + "VIP\VIP_spawn.sqf");

//_canSpawn_IEDFactory = compile preprocessFileLineNumbers (_ROOT + "IEDFactory\IEDFactory_canSpawn.sqf");
//_spawn_IEDFactory = compile preprocessFileLineNumbers (_ROOT + "IEDFactory\IEDFactory_spawn.sqf");

heartsAndMindsObjs = [
	["Blank", _canSpawn_Blank, _spawn_Blank],
	["CrashedHeli", _canSpawn_CrashedHeli, _spawn_CrashedHeli],
	["CarBomb", _canSpawn_CarBomb, _spawn_CarBomb],
	["VIP", _canSpawn_CarBomb, _spawn_CarBomb]
];

searchAndDestroyObjs = [
	["Blank", _canSpawn_Blank, _spawn_Blank],
	["HVT", _canSpawn_HVT, _spawn_HVT]
	// ["IEDFactory", _canSpawn_IEDFactory, _spawn_IEDFactory]
];

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
	params ["_objID", ["_objType", -1]];
	
	if (_objType == -1) then {
		{
			if ((_x select 0) == _objID) then {
				[] spawn (_x select 2);
				systemChat format ["TWC_ObjSpawn called HAM %1", (_x select 0)];
			};
		} forEach heartsAndMindsObjs;

		{
			if ((_x select 0) == _objID) then {
				[] spawn (_x select 2);
				systemChat format ["TWC_ObjSpawn called SAD %1", (_x select 0)];
			};
		} forEach searchAndDestroyObjs;
	} else {
		_done = false;
		{
			if ((_x select 0) == _objID) then {
				[_objType] spawn (_x select 2);
				systemChat format ["TWC_ObjSpawn called HAM %1 with _objType %2", (_x select 0), _objType];
				_done = true;
			};
		} forEach heartsAndMindsObjs;

		if !(_done) then {
			{
				if ((_x select 0) == _objID) then {
					[_objType] spawn (_x select 2);
					systemChat format ["TWC_ObjSpawn called SAD %1 with _objType %2", (_x select 0), _objType];
				};
			} forEach searchAndDestroyObjs;
		};
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
		_currentSelectedObj = ([_objType] call TWC_ObjSelect);
	};

	_currentSelectedObj
};

// Global, other scripts can now poll this (might be needed for canSpawns for example)
currentHAMObj = "";
currentSADObj = "";
currentRANObj = "";

["TWC_Insurgency_objCompleted", {
	params [["_objID", "Blank"], ["_objType", -1]];
	
	if (currentHAMObj == _objID && (_objType == -1 || _objType == 1)) then {
		currentHAMObj = [1] call TWC_ObjSelect;
		
		if (currentHAMObj != "Blank") then {
			[currentHAMObj] call TWC_ObjSpawn;
		} else {
			[currentHAMObj, 1] call TWC_ObjSpawn;
		};
	};
	
	if (currentSADObj == _objID && (_objType == -1 || _objType == 2)) then {
		currentSADObj = [2] call TWC_ObjSelect;
		
		if (currentSADObj != "Blank") then {
			[currentSADObj] call TWC_ObjSpawn;
		} else {
			[currentSADObj, 2] call TWC_ObjSpawn;
		};
	};
	
	if (currentRANObj == _objID && (_objType == -1 || _objType == 0)) then {
		currentRANObj = [0] call TWC_ObjSelect;
		
		if (currentRANObj != "Blank") then {
			[currentRANObj] call TWC_ObjSpawn;
		} else {
			[currentRANObj, 0] call TWC_ObjSpawn;
		};
	};
	
	systemChat format ["objCompleted, objs are now: %1 - %2 - %3", str currentHAMObj, str currentSADObj, str currentRANObj];
}] call CBA_fnc_addEventHandler;

// Mission Start, let's get crackin'
currentHAMObj = "Blank";
["Blank", 1] call TWC_ObjSpawn;
currentSADObj = "Blank";
["Blank", 2] call TWC_ObjSpawn;
currentRANObj = "Blank";
["Blank", 0] call TWC_ObjSpawn;