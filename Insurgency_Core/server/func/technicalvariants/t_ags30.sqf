/*
* Author(s): [TWC] Hobbs
* Technical Spawner

* Arguments:
* <Array> Position
* <Group> Group to attach the technical to
* <Number> Whether to attach a flag to it
*
* Return Value:
* <NONE>
*
* 
* 
*
* Public: No
*/
params ["_pos", "_group", "_flag"];


_truck = "C_Truck_02_covered_F" createvehicle _pos; 
_truck setVehicleLock "LOCKEDPLAYER";
_truck setfuel 0;

_gun = "CUP_O_AGS_SLA" createvehicle _pos;
_gun setVehicleLock "LOCKEDPLAYER";
_gun attachto [_truck, [0,-2.6,0.5]];
_gun setDir 180;  
_gun setPos (getpos _gun);

_direction = 180;	
_nearRoads = _pos nearRoads 10;

if(count _nearRoads > 0) then
{
	_road = _nearRoads select 0;
	_roadConnectedTo = roadsConnectedTo _road;
	_connectedRoad = _road;
	_connectedRoad = _roadConnectedTo select 0;
	_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
};

if (((_direction + 180 -(_truck getdir _pos)) < -90) || ((_direction + 180 -(_truck getdir _pos)) > 90)) then { 
	
	_direction = _direction +180;
};

_truck setdir _direction;
	
	sleep 5;

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
