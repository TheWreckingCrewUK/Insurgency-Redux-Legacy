/*
* Author(s): [TWC] Hobbs
* AI insurgency code

* Arguments:
* <object> Insurgent group leader
*CQB variant, to keep things moving in close quarters
* Return Value:
* <NONE>
*
* Example:
* [leader _group] spawn twc_fnc_aiscramble;
*
* Public: No
*/

//Recieved Parameters
params ["_unit", ["_inittime", time], "_enemy"];

//systemchat "startcqb1";


_ogroup = group _unit;

//_npos = [_unit, 50, 150, 0, 0, 20, 0] call BIS_fnc_findSafePos;



_check = 0;
_npos = getpos _enemy;
_radius = 10;
while {(_check == 0) && (_radius < 100)} do {
	_npos = [_unit, 1, _radius, 5, 0, 20, 0] call BIS_fnc_findSafePos;
	_npos2 = AtlToAsl ([_npos select 0,_npos select 1, (7 + (random 3))]);
	_vis = [objNull, "VIEW"] checkVisibility [(GETPosasl _enemy) vectoradd [0,0,(7 + (random 7))], _npos2];
	//_vis = lineIntersects [(GETPos _enemy) vectoradd [0,0,(1 + (random 3))], (_npos2), _enemy, _unit];
	if (_vis == 0) then {
		_check = 1;
	} else {
		_radius = _radius + 2;
	};
};
//systemchat "running1";
if (_check == 0) exitwith {_unit setvariable ["twc_aisuppression", 0];};


_unit domove _npos;
_unit domove _npos;
_unit setspeedmode "full";
sleep (4 + random 10);
_unit setspeedmode "auto";
_unit reveal [_enemy, 1.5];
if ((random 1) > 0.5) then {
	[[_npos select 0,_npos select 1, 1], nil, [_unit], 10, 1, false, false] call ace_ai_fnc_garrison;
};



sleep 10;

[_unit, _inittime] execvm "Insurgency_Core\server\func\ai\fnc_aisuppress.sqf";
