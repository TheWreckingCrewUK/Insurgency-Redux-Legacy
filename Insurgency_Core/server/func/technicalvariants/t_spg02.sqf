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


_truck = "CUP_O_LR_SPG9_TKM" createvehicle _pos; 
_truck setVehicleLock "LOCKEDPLAYER";
//_truck setfuel 0;
_truck setobjecttextureglobal [0, "cup\wheeledvehicles\cup_wheeledvehicles_lr\data\textures\civ_r_lr_base_co.paa"];

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

	
_truck addEventHandler ["Killed",{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	["TWC_Insurgency_adjustInsurgentMorale", -1] call CBA_fnc_serverEvent;
	["TWC_Insurgency_adjustCivilianMorale", 1] call CBA_fnc_serverEvent;
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
	{
		_x setdamage 1;
	} foreach (attachedobjects _unit);
}];