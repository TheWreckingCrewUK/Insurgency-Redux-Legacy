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
params ["_pos","_total","_radius", "_group"];

//_total = ceil(_total / 2);

if(_pos distance (getmarkerpos "base") < 1000) exitwith {};

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

if ((["70", twc_missionname] call BIS_fnc_inString)) then {

	_technicallist = [
		"t_zu23.sqf",
		"t_kord02.sqf",
		"t_kord01.sqf",
		"t_pkm.sqf",
		"t_spg02.sqf",
		"t_spg01.sqf"
	];
};

for "_i" from 1 to _total do {


	//Spawning hostiles
	//_group = createGroup East;


	if (isNil "townSpawn") exitWith {};


	_spawnpos = _pos;

	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	
	while {((_spawnpos distance (getmarkerpos "base")) < 1000)} do {
	
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	};

	_chosentechnical = "Insurgency_Core\server\func\technicalvariants\" + (_technicallist call bis_fnc_selectrandom);
	
	[_spawnpos, _group, 0] execVM _chosentechnical;

};


