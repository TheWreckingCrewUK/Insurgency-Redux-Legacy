/*
* Author(s): [TWC] Hobbs
* Technical Spawner

* Arguments:
* <Array> Position
* <Number> Number of technicals to spawn
* <Number> Radus to spawn technicals between.
*
* Return Value:
* <NONE>
*
* Example:
* [getMarkerPos "spawn",3,300] spawn twc_fnc_spawnTechnicals;
*
* Public: No
*/

//Recieved Parameters
params ["_pos","_total","_radius"];


//if(_pos distance (getmarkerpos "base") < 1000) exitwith {};


if ((count(_pos nearRoads _radius)) == 0) exitwith {};

_technicallist = [
	"t_zu23.sqf",
	"t_kord02.sqf",
	"t_kord01.sqf",
	"t_pkm.sqf",
	"t_btr40.sqf",
	"t_ags30.sqf",
	"t_spg02.sqf",
	"t_spg01.sqf"
];

for "_i" from 1 to _total do {



	if (isNil "townSpawn") exitWith {};
	
	_spawnpos = _pos;
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
while {((_spawnpos distance (getmarkerpos "base")) < 2000)} do {
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	};
if ((_spawnpos distance (getmarkerpos "base")) > 2000) then {

_group = createGroup East;
	_chosentechnical = "Insurgency_Core\server\func\technicalvariants\" + (_technicallist call bis_fnc_selectrandom);
	
	[_spawnpos, _group, 0] execVM _chosentechnical;
	
	_groupcount = 3 + (random 5);
		_infpos = _spawnpos;
	
	for "_i" from 1 to _groupcount do {
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _infpos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_group selectleader _unit;

//[_unit, getpos _unit,150, 2, true] spawn TWC_fnc_Defend;
//[_unit,getpos _unit,150,"LIMITED","COLUMN","SAFE"] call twc_fnc_patrol;
[_group,getpos _unit, 150, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN"] call CBA_fnc_taskPatrol;



	
	};
		[leader _group] spawn TWC_Core_fnc_aiscramble;
};
/////////////////////////////////////////////////////////////////////////////////////////


};