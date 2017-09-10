/*
* Created by [TWC] jayman Using code form [TWC] WiredTiger
*
* Pre-Compiled as twc_spawnAIUnits
*
* Description:
* twc_townSetup passes along the marker waves and group radius which then has the morale
* added to the waves before spawning in the group. Unfortunently waves are predefined here.
*/

//Recieved Parameters
params ["_pos","_waves","_groupradius","_thisList"];

_dir = (_thisList select 0) getDir _pos;
_dir1 = _dir - 30;
_dir2 = _dir + 30;

_playerCount = count (allPlayers - entities "HeadlessClient_F");

_num = 0;
_total = round(3 * (_playerCount * (TWC_insMorale / 100)));
_group = createGroup East;
_spawnPos = [_pos,_groupradius,[_dir1,_dir2]] call SHK_pos;
for "_i" from 1 to _total do{
	_unit = _group createUnit [(townSpawn select _num), _spawnPos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
	}];
	_unit setVariable ["unitsHome",_pos,false];
	_num = _num + 1;
	sleep 0.2;
};
[_group, (_pos), 40] call CBA_fnc_taskAttack;