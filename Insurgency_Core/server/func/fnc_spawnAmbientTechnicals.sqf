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

_total = _total / 2;

if(_pos distance (getmarkerpos "base") < 1000) exitwith {};


if ((count(_pos nearRoads _radius)) == 0) exitwith {};

for "_i" from 1 to _total do {


	for "_i" from 1 to (_total / 2) do {

	//Spawning hostiles
	_group = createGroup East;


	if (isNil "townSpawn") exitWith {};


	_unit = _group createUnit [(selectRandom townSpawn), [0,0,0], [], 5, "NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;

		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_unit setVariable ["unitsHome",_pos,false];
	
	
	_spawnpos = _pos;


	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	
	
while {((_spawnpos distance (getmarkerpos "base")) < 1000) && (count (_spawnpos nearobjects ['rhs_KORD_high_VMF', 1500]) > 0)} do {
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom)};

	_truck = "CUP_C_Datsun" createvehicle _spawnpos; 
	
	_gun = "rhs_KORD_high_VMF" createvehicle _spawnpos; 
	
	_gun attachto [_truck, [0.2,-1.5,0.4]];
	
	_flag = "rhs_flag_insurgents" createvehicle _spawnpos;
	
	_flag attachto [_truck, [0.6,0.4,1.2]];
	
	_direction = 180;	
	_nearRoads = _spawnpos nearRoads 10;

if(count _nearRoads > 0) then
{
_road = _nearRoads select 0;
_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
};
	
	

	_truck setdir _direction;

	_unit moveIngunner _gun;

	_truck addMPEventHandler ["MPKilled",{
			if (side (_this select 1) == WEST) then{
		["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
			};
		}];
	
	_groupcount = 3 + (random 5);
		_infpos = getpos _truck;
	
_group = createGroup East;
	for "_i" from 1 to _groupcount do {
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _infpos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	

_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;
	
	};

/////////////////////////////////////////////////////////////////////////////////////////

	for "_i" from 1 to (_total / 2) do {

	//Spawning hostiles
	_group = createGroup East;


	if (isNil "townSpawn") exitWith {};


	_unit = _group createUnit [(selectRandom townSpawn), [0,0,0], [], 5, "NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;

		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_unit setVariable ["unitsHome",_pos,false];
	
	
	_spawnpos = _pos;

_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);

while {(_spawnpos distance (getmarkerpos "base")) < 1000 && (count (_spawnpos nearobjects ['CUP_B_SPG9_CDF', 1500]) > 0)} do {
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom)};
	
	_truck = "CUP_C_Datsun" createvehicle _spawnpos; 

	_gun = "CUP_B_SPG9_CDF" createvehicle _spawnpos; 

	_gun attachto [_truck, [-0.2,-1.7,-1.2]];  

	_gun setDir 180;  
	_gun setPos (getpos _gun); 
	
	_flag = "rhs_flag_insurgents" createvehicle _spawnpos;
	
	_flag attachto [_truck, [-0.75,1.7,0.7]];
	
	_direction = 180;
	_nearRoads = _spawnpos nearRoads 10;

if(count _nearRoads > 0) then
{
_road = _nearRoads select 0;
_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
};
	
	

	_truck setdir _direction;

	_truck addMPEventHandler ["MPKilled",{
			if (side (_this select 1) == WEST) then{
		["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
			};
		}];


	_unit moveIngunner _gun;
	
	
		_groupcount = 3 + (random 5);
		_infpos = getpos _truck;
	
_group = createGroup East;
	for "_i" from 1 to _groupcount do {
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _infpos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	

_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;
	
	};
	
	};

};
};
	