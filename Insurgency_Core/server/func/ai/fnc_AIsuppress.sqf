/*
* Author(s): [TWC] Hobbs
* AI insurgency code

* Arguments:
* <object> Insurgent group leader
*
* Return Value:
* <NONE>
*
* Example:
* [leader _group] spawn twc_fnc_aiscramble;
*
* Public: No
*/

//Recieved Parameters
params ["_unit", ["_inittime", time]];

//systemchat "start";

_unit setvariable ["twc_aisuppression", 1];


if (_inittime < (time - 600)) exitwith {_unit setvariable ["twc_aisuppression", 0];};



while {((getSuppression _unit) < 0.2) && (alive _unit)} do {
	sleep 2;
};
if (!(alive _unit)) exitwith {};

_enemy = _unit findnearestenemy _unit;
if ((_enemy distance _unit) < 50) exitwith {
	[_unit, _inittime, _enemy] execvm "Insurgency_Core\server\func\ai\fnc_aisuppresscqb.sqf";
};

//systemchat format ["%1", typeof _unit];

_ogroup = group _unit;
_ngroup = creategroup [east, true];

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
[_unit] joinsilent _ngroup;
_unit domove _npos;
//_unit setUnitPos "UP";
_unit disableai "target";
_unit disableai "autotarget";
_unit disableai "checkvisible";
{_unit forgetTarget _x} foreach allplayers;
_unit domove _npos;
_unit setspeedmode "full";
(group _unit) setBehaviour "careless";
sleep (4 + random 10);
[_unit] joinsilent _ogroup;
//_unit setunitpos "auto";
_unit enableai "target";
_unit enableai "autotarget";
_unit enableai "checkvisible";
_unit setspeedmode "auto";
(group _unit) setBehaviour "combat";
if ((random 1) > 0.5) then {
	[[_npos select 0,_npos select 1, 1], nil, [_unit], 10, 1, false, false] call ace_ai_fnc_garrison;
};



sleep 10;

[_unit, _inittime] execvm "Insurgency_Core\server\func\ai\fnc_aisuppress.sqf";
