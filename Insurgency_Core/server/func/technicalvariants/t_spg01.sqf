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


_truck = "CUP_C_Datsun" createvehicle _pos; 
_truck setVehicleLock "LOCKEDPLAYER";
_truck setfuel 0;

_gun = "CUP_B_SPG9_CDF" createvehicle _pos;
_gun setVehicleLock "LOCKEDPLAYER";
_gun attachto [_truck, [-0.2,-1.7,-1.2]];
_gun setDir 180;  
_gun setPos (getpos _gun);

_direction = 180;	
_nearRoads = _pos nearRoads 30;

if(count _nearRoads > 0) then
{
	_road = _nearRoads select 0;
	_road2 = _nearRoads select 1;
	_direction = random 360;
	if (!isnil "_road2") then {
		_direction = _road2 getdir _road;
	};
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
