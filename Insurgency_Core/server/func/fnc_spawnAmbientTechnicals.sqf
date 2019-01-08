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

//if(_pos distance (getmarkerpos "base") < 1000) exitwith {};


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
	_unit setVariable ["twc_isenemy",1];
	
	_spawnpos = _pos;


	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	
	
while {((_spawnpos distance (getmarkerpos "base")) < 2000) && (count (_spawnpos nearobjects ['rhs_KORD_high_MSV', 1500]) > 0)} do {
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	};
if ((_spawnpos distance (getmarkerpos "base")) > 2000) then {
	_truck = "CUP_C_Datsun" createvehicle _spawnpos; 
	
	_truck setVehicleLock "LOCKEDPLAYER";
	_guntype = ["rhs_KORD_high_MSV", "twc_KORD_high_20mm"] call bis_fnc_selectrandom;
	_gun = _guntype createvehicle _spawnpos; 
	
	_gun setVehicleLock "LOCKEDPLAYER";
	
	_gun attachto [_truck, [0.2,-1.5,0.4]];
	_gun addEventHandler ["Fired", {
		[_this select 1, _this select 6, _this select 7] call twc_fnc_gunwalk;  }];
	
	_flag = "rhs_flag_insurgents" createvehicle _spawnpos;
	
	_flag attachto [_truck, [0.6,0.4,1.2]];
	
	_direction = 180;	
	_nearRoads = _spawnpos nearRoads 10;
	
	_truck addEventHandler ["Killed", {[50] call twc_fnc_deadasset}];

if(count _nearRoads > 0) then
{
_road = _nearRoads select 0;
_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
if (isnil "_connectedRoad") then {
	_connectedroad = _road;
};
_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
};
	
	

	_truck setdir _direction;
	_gunner = _unit;
	[_unit, _gun, _group] spawn {
		params ["_unit", "_gun", "_group"];
		sleep 2;
		_unit assignasgunner _gun;
		_group addvehicle _gun;
		_unit moveIngunner _gun;
	};
	_unit setVariable ["twc_isenemy",1];

/*	_truck addEventHandler ["Killed",{
			if (side (_this select 1) == WEST) then{
		["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
			};
		}];
	*/
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
	_group selectleader _unit;

//[_unit, getpos _unit,150, 2, true] spawn TWC_fnc_Defend;
//[_unit,getpos _unit,150,"LIMITED","COLUMN","SAFE"] call twc_fnc_patrol;
[_group,getpos _unit, 150, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN"] call CBA_fnc_taskPatrol;

[_gunner, _group] spawn {
		params ["_gunner", "_group"];
		sleep 10;
		[_gunner] joinsilent _group;
	};
	
	};
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
	_unit setVariable ["twc_isenemy",1];
	
	
	_spawnpos = _pos;

_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);

while {(_spawnpos distance (getmarkerpos "base")) < 2000 && (count (_spawnpos nearobjects ['CUP_B_SPG9_CDF', 1500]) > 0)} do {
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom)};
	if ((_spawnpos distance (getmarkerpos "base")) > 2000) then {
	_truck = "CUP_C_Datsun" createvehicle _spawnpos; 
	
	_truck setVehicleLock "LOCKEDPLAYER";

	_gun = "CUP_B_SPG9_CDF" createvehicle _spawnpos; 
	
	_gun setVehicleLock "LOCKEDPLAYER";

	_gun attachto [_truck, [-0.2,-1.7,-1.2]];  

	_gun setDir 180;  
	_gun setPos (getpos _gun); 
	_gun addEventHandler ["Fired", {
		[_this select 1, _this select 6, _this select 7] call twc_fnc_gunwalk; }];
	
	_flag = "rhs_flag_insurgents" createvehicle _spawnpos;
	
	_flag attachto [_truck, [-0.75,1.7,0.7]];
	
	_direction = 180;
	_nearRoads = _spawnpos nearRoads 10;

if(count _nearRoads > 0) then
{
_road = _nearRoads select 0;
_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
if (isnil "_connectedRoad") then {
	_connectedroad = _road;
};
_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
};
	if (isnil "_direction") then {
		_direction = random 360
		};
	

	_truck setdir _direction;

	_truck addEventHandler ["Killed", {[50] call twc_fnc_deadasset}];

	_gunner = _unit;
	_unit assignasgunner _gun;
	_group addvehicle _gun;
	_unit moveIngunner _gun;
	_unit setVariable ["twc_isenemy",1];
	
	
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
	
	_unit setVariable ["twc_isenemy",1];
	
	_group selectleader _unit;

	_null = [leader _group, leader _group,150, 2, true] spawn TWC_fnc_Defend;
	
	[_gunner, _group] spawn {
		params ["_gunner", "_group"];
		sleep 10;
		[_gunner] joinsilent _group;
	};
	
	//[_unit,getpos _unit,150,"LIMITED","COLUMN","SAFE"] call twc_fnc_patrol;
	//[_group,getpos _unit, 150, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN"] call CBA_fnc_taskPatrol;
	};
	
	
	};
	
	};

};
};
	