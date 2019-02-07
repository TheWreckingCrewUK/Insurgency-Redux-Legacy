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


_truck = "RHS_Ural_Zu23_MSV_01" createvehicle _pos; 
_truck setVehicleLock "LOCKEDPLAYER";
_truck setfuel 0;
_truck setobjecttextureglobal [0, "rhsafrf\addons\rhs_a2port_car\ural\data\ural_kabina_civil_co.paa"];

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

[_pos, _truck, _group] spawn {
	params ["_pos", "_truck", "_group"];
	
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
	_unit assignasgunner _truck;
	_group addvehicle _truck;
	_unit moveIngunner _truck;
};
