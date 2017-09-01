/*
* Author: [TWC] Bosenator
* Server controller for dynamic objectives.
*
* Public: No
*
*
* STEPS FOR ADDING A NEW OBJECTIVE:
* 1) Add an OBJ ID to the best matched OBJ genre
* 2) Add its can spawn check, both the reference to the file and its check inside TWC_ObjCanSpawn switch statement.
* 3) Add its init TODO
*
*/

// OBJ ID arrays
// Might want to shift to a map-specific config later
// heartsAndMindsObjs = ["CrashedHeli"]; // 1
// searchAndDestroyObjs = ["IEDFactory"]; // 2

// Don't alter, used for OBJ tracking.
// _currentHAMObj = "";
// _currentSADObj = "";
// _currentRANObj = "";

// ["TWC_Insurgency_objCompleted", "CrashedHeli"] call CBA_fnc_serverEvent;

// refer to issue: https://github.com/TheWreckingCrewUK/Insurgency/issues/9

TWC_Obj_canSpawn_CrashedHeli = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_objectives\CrashedHeli\crashedHeli_canSpawn.sqf";

TWC_ObjCanSpawn = {
	params ["_objID"];
	_return = false;
	
	switch (_objID) do {
		case "CrashedHeli": { _return = call TWC_Obj_canSpawn_CrashedHeli; };
		case "IEDFactory": { };
		default { _return = false; };
	};
	
	_return;
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