/*
* Author(s): [TWC] Bosenator | [TWC] jayman
* Hostile Spawner

* Arguments:
* <Array> Position
* <Array> Radus of two numbers to spawn hostiles between.
* <Array> List of units
*
* Return Value:
* <NONE>
*
* Example:
* [getMarkerPos "spawn",[100,200],p1] spawn twc_fnc_spawnAIUnits;
*
* Public: No
*/

//Recieved Parameters
params ["_pos","_groupradius","_thisList"];

//Selects a direction generally oposite of incoming friendlies
//_dir = (_thisList select 0) getDir _pos;
_dir = random 360;

{ 
	if (_x isKindOf "twc_ana_interpreter") then { 
		twc_terp = _x;
		publicVariable "twc_terp";
	};
} forEach allUnits;

if (!(isnull twc_terp)) then {
	if ((twc_terp distance _pos) < 1000) then {
		execvm "Insurgency_Core\server\sys_terp\fnc_terp_enemy.sqf"
	};
};

_dir1 = _dir - 30;
_dir2 = _dir + 30;

//Calculating total enemies to spawn
_num = 0;
_total = [_pos] call twc_fnc_calculateSpawnAmount;

//Spawning hostiles
_group = createGroup East;
_spawnPos = [_pos,_groupradius,[_dir1,_dir2]] call SHK_pos;

if (isNil "townSpawn") exitWith {};

for "_i" from 1 to _total do {
	_unit = _group createUnit [(selectRandom townSpawn), _spawnPos, [], 5, "NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;

		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_unit setVariable ["unitsHome",_pos,false];
	//_num = _num + 1;
	sleep 0.2;
	
	[_pos, nil, [_unit], 300, 2, true, true] call ace_ai_fnc_garrison;
};
	sleep 5;
	[_pos, nil, units _group, 300, 2, true, false] call ace_ai_fnc_garrison;
	
[_group, (_pos), 40] call CBA_fnc_taskAttack;