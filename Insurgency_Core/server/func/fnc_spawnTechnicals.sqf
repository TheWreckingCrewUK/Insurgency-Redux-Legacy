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

_total = ceil(_total / 2);

if(_pos distance (getmarkerpos "base") < 1000) exitwith {};

if ((count(_pos nearRoads _radius)) == 0) exitwith {};

for "_i" from 1 to _total do {


	for "_i" from 1 to (ceil (_total / 2)) do {

	//Spawning hostiles
	//_group = createGroup East;


	if (isNil "townSpawn") exitWith {};


	
	
	
	_spawnpos = _pos;



	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	
	while {((_spawnpos distance (getmarkerpos "base")) < 1000) && (count (_spawnpos nearobjects ['rhs_KORD_high_MSV', 1500]) > 0)} do {
	
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	};

	_truck = "CUP_C_Datsun" createvehicle _spawnpos; 
	
	_truck setVehicleLock "LOCKEDPLAYER";
	
	_guntype = ["rhs_KORD_high_MSV", "twc_KORD_high_20mm"] call bis_fnc_selectrandom;
	_gun = _guntype createvehicle _spawnpos; 
	
	_gun setVehicleLock "LOCKEDPLAYER";
	
	_gun attachto [_truck, [0.2,-1.5,0.4]];
	_gun addEventHandler ["Fired", {
		[_this select 1, _this select 6, _this select 7] call twc_fnc_gunwalk; }];
	
	
	_direction = 180;	
	_nearRoads = _spawnpos nearRoads 10;

if(count _nearRoads > 0) then
{
_road = _nearRoads select 0;
_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
};

   if (((_direction + 180 -(_truck getdir _pos)) < -90) || ((_direction + 180 -(_truck getdir _pos)) > 90)) then { 
	
	_direction = _direction +180;
	};

	_truck setdir _direction;
	
	

	[_pos, _gun, _group] spawn {
		params ["_pos", "_gun", "_group"];
		
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
		sleep 5;
		_unit assignasgunner _gun;
		_group addvehicle _gun;
		_unit moveIngunner _gun;
	};

/*	_truck addEventHandler ["Killed",{
			if (side (_this select 1) == WEST) then{
		["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
			};
		}];
	*/
	};



	for "_i" from 1 to (ceil (_total / 2)) do {

	//Spawning hostiles
	//_group = createGroup East;


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
	while {((_spawnpos distance (getmarkerpos "base")) < 1000) && (count (_spawnpos nearobjects ['CUP_B_SPG9_CDF', 300]) > 0)} do {
	
	_spawnpos = getpos ((_pos nearRoads _radius) call bis_fnc_selectrandom);
	};
	
	_truck = "CUP_C_Datsun" createvehicle _spawnpos; 
	
	_truck setVehicleLock "LOCKEDPLAYER";

	_gun = "CUP_B_SPG9_CDF" createvehicle _spawnpos; 
	
	_gun setVehicleLock "LOCKEDPLAYER";

	_gun attachto [_truck, [-0.2,-1.7,-1.2]];  

	_gun setDir 180;  
	_gun setPos (getpos _gun);
	
	_gun addEventHandler ["Fired", {
		[_this select 1, _this select 6, _this select 7] call twc_fnc_gunwalk;  }];
	
	
	_direction = 180;	
	_nearRoads = _spawnpos nearRoads 10;

if(count _nearRoads > 0) then
{
_road = _nearRoads select 0;
_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
};

   if (((_direction + 180 -(_truck getdir _pos)) < -90) || ((_direction + 180 -(_truck getdir _pos)) > 90)) then { 
	
	_direction = _direction +180;
	};

	_truck setdir _direction;


/*	_truck addEventHandler ["Killed",{
			if (side (_this select 1) == WEST) then{
		["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
			};
		}];
*/


	[_unit, _gun, _group] spawn {
		params ["_unit", "_gun", "_group"];
		sleep 2;
		_unit assignasgunner _gun;
		_group addvehicle _gun;
		_unit moveIngunner _gun;
	};
	_unit setVariable ["twc_isenemy",1];
	
	};

};


