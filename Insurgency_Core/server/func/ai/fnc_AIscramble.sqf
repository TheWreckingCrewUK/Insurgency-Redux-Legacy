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
params ["_leader"];
//systemchat "start";
while {!((behaviour _leader) == "combat")} do {
	sleep (10 + (random 10));
};

_group = group _leader;
_group setSpeedMode "full";
_enemy = _leader findnearestenemy _leader;

[(units _group)] call ace_ai_fnc_unGarrison;
{
	[_enemy, _x] spawn {
		params ["_enemy", "_unit"];
		_check = 0;
		_pos = getpos _enemy;
		_radius = 20;
		while {(_check == 0) && (_radius < 250)} do {
			_pos = [_unit, 1, _radius, 10, 0, 20, 0] call BIS_fnc_findSafePos;
			_pos2 = AtlToAsl ([_pos select 0,_pos select 1, (1 + (random 3))]);
			_vis = [objNull, "VIEW"] checkVisibility [(GETPosasl _enemy) vectoradd [0,0,(1 + (random 7))], _pos2];
			//_vis = lineIntersects [(GETPos _enemy) vectoradd [0,0,(1 + (random 3))], (_pos2), _enemy, _unit];
			if (_vis == 0) then {
				_check = 1;
			} else {
				_radius = _radius + 5;
			};
		};
		if (_check == 1) then {
			sleep (random 30);
			_unit enableai "path";
			_unit domove _pos;
			[_unit, _pos] spawn {
				params ["_unit", "_pos"];
				[[_unit]] call ace_ai_fnc_unGarrison;
				sleep 3;
				[[_unit]] call ace_ai_fnc_unGarrison;
				sleep 80;
				if ((random 1) > 0.5) then {
					[[_pos select 0,_pos select 1, 1], nil, [_unit], 10, 1, true, false] call ace_ai_fnc_garrison;
				};
			};
			
			/*
			[_pos] spawn {
				params ["_pos"];
				_arrow = "Sign_Arrow_Large_blue_F" createvehicle _pos;
				//_arrow = "RHS_Ural_Open_Civ_01" createvehicle _pos;
				sleep 30;
				deletevehicle _arrow;
			};
			*/
			//systemchat format ["%1", _radius];
			
		} else {
			if ((leader group _unit) == _unit) then {
				//systemchat "fail";
			};
		};
	};
} foreach units _group;

sleep 100;

if ((count units _group)> 0) then {
	[leader _group] execvm "Insurgency_Core\server\func\ai\fnc_aiscramble.sqf";
};