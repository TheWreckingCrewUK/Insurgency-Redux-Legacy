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


//_spawnPos = [_pos, 50] call CBA_fnc_randPos;
_spawnPos = [0,0,0];
_num = 0;
_total = (([_pos] call twc_fnc_calculateSpawnAmount) * 1) max 10;

sleep 1;

if (!(isnull twc_terp)) then {
if (_total > 0) then {
if ((twc_terp distance _pos) < 1000) then {
[_pos] execvm "Insurgency_Core\server\sys_terp\fnc_terp_enemy.sqf"};
};
};


_group = createGroup East;
for "_i" from 1 to _total do{
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_unit setVariable ["unitsHome",_pos,false];
	_num = _num + 1;
	sleep 0.1;
	
	
};
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";


	[_pos, nil, units _group, 300, 0, false, true] call ace_ai_fnc_garrison;
//_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;

/*
for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit ["CUP_O_TK_INS_Soldier_AA", _pos,[], 25,"NONE"];
};
};
*/

	sleep 5;
	[_pos, nil, units _group, 600, 2, true, false] call ace_ai_fnc_garrison;
	
	_array1 = [];
	_array2 = [];
	
	{if (random 0.5 > 1) then {_array1 pushback _x} else {_array2 pushback _x};} foreach (units _group);
	
	while {alive (units _group select 0)} do {
	
	_randtime = random 120;
	sleep (120 + _randtime);
	
	[_pos, nil, _array1, 600, 2, true, false] call ace_ai_fnc_garrison;
	
	_randtime = random 120;
	sleep (120 + _randtime);
	
	[_pos, nil, _array2, 600, 2, true, false] call ace_ai_fnc_garrison;};
	
	
