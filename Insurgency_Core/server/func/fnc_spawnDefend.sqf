/*
* Details:
* 
* Creates a enemy squad to defend around a given marker
*
* Required parameters:
*
* 0 - String     Marker name
*
* Example:
*
*["bastam"] spawn twc_SpawnDefend
*
* Author: [TWC] Fakematty / [TWC] Jayman
*/

params["_pos"];


//if ([_pos,200] call twc_fnc_posNearPlayers) exitwith {};


_spawnPos = _pos;
//_spawnpos = [_pos, 20, 250, 3, true] call twc_fnc_findsneakypos;

_num = 0;
_total = (([_pos] call twc_fnc_calculateSpawnAmount) * 1) max 10;

_spawnposarray = [];
_buildings = nearestObjects [_pos, ["House"], 800];
/*
{
	_check = [];
	if ((count _spawnposarray) < (_total * 2)) then {
		_check = [_x] call BIS_fnc_buildingPositions;
		if ((count _check) > 0) then {
			_potential = [getpos _x, 2, 50, 2, true] call twc_fnc_findsneakypos;
			if (((str _potential) != (str _x))) then {
				_spawnposarray pushback _potential;
			};
		};
	};
} foreach _buildings;
*/
//if ((count _spawnposarray) == 0) exitwith {
if ((count _buildings) == 0) exitwith {
	//systemchat "no potential, defend exiting";
	twc_lastcompletion = time;
};

if (_total > 0) then {
	_side = "east";
	[_pos, (str _side)] execvm "Insurgency_Core\server\sys_terp\fnc_terp_enemy.sqf";
};


_group = createGroup East;
for "_i" from 1 to (_total min (count _buildings)) do{
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), ([getpos (_buildings call bis_fnc_selectrandom), 2, 50, 2, true] call twc_fnc_findsneakypos),[], 0,"NONE"];
	_spawnpos = [_pos, 20, 250, 3, true] call twc_fnc_findsneakypos;
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_unit setVariable ["unitsHome",_pos,false];
	_unit setVariable ["twc_isenemy",1];
	_num = _num + 1;
	//sleep 0.1;
	
	
};
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";

[leader _group] spawn TWC_fnc_aiscramble;

_gopos = [_pos select 0, _pos select 1, 0];

	//[_pos, nil, units _group, 300, 0, false, true] call ace_ai_fnc_garrison;
	/*
	_rem = [];
	_rem = [_gopos, nil, units _group, 300, 0, false, true] call ace_ai_fnc_garrison;
	
	if (isnil "_rem") then {
		_rem = units _group;
	};
	
	{
		deletevehicle _x;
	} foreach _rem;
	*/
	
{
	[_x] call twc_fnc_aispreadout;
} foreach units _group;
//_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;

/*
for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit ["CUP_O_TK_INS_Soldier_AA", _pos,[], 25,"NONE"];
};
};
*/

	sleep 5;
	//[_gopos, nil, units _group, 600, 2, true, false] call ace_ai_fnc_garrison;
{
	[_x] call twc_fnc_aispreadout;
} foreach units _group;
	
	_array1 = [];
	_array2 = [];
	
	{if (random 0.5 > 1) then {_array1 pushback _x} else {_array2 pushback _x};} foreach (units _group);
	
	while {alive (units _group select 0)} do {
	
	_randtime = random 120;
	sleep (120 + _randtime);
	
	//[_gopos, nil, , 600, 2, true, false] call ace_ai_fnc_garrison;
{
	[_x] call twc_fnc_aispreadout;
} foreach _array1;
	
	_randtime = random 120;
	sleep (120 + _randtime);
	
	//[_gopos, nil, _array2, 600, 2, true, false] call ace_ai_fnc_garrison;
{
	[_x] call twc_fnc_aispreadout;
} foreach _array2;
	};
	
	
