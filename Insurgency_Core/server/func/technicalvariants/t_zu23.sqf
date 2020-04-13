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

_type = selectrandom ["RHS_Ural_Zu23_MSV_01", "CUP_O_Hilux_zu23_TK_INS", "RHS_ZU23_MSV"];

if (_type == "RHS_ZU23_MSV") then {
	_pos = [_pos, 2000, 50, 10] call BIS_fnc_findOverwatch;
};

_truck = _type createvehicle _pos; 
_truck setVehicleLock "LOCKEDPLAYER";
_truck setfuel 0;
if (_type == "RHS_Ural_Zu23_MSV_01") then {
	_truck setobjecttextureglobal [0, "rhsafrf\addons\rhs_a2port_car\ural\data\ural_kabina_civil_co.paa"];
};

if (_type == "CUP_O_Hilux_zu23_TK_INS") then {
	_colour = (["White", "Red", "Olive", "Grey", "Black", "Camo", "DarkBlue", "DarkGrey"] call bis_fnc_selectrandom);
[
	_truck,
	[_colour,1], 
	true
] call BIS_fnc_initVehicle;
};

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

_truck addEventHandler ["Fired", {  
   params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"]; 
   _mult = 3; _projectile setvelocity [(velocity _projectile select 0) + (((random 16) - 8) * _mult), (velocity _projectile select 1) + (((random 16) - 8) * _mult),  (velocity _projectile select 2) + (((random 8) - 3) * _mult)];;  
     
  }];

_truck setdir _direction;
	
	

[_pos, _truck, _group] spawn {
	params ["_pos", "_truck", "_group"];
	sleep 5;
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
	["TWC_Insurgency_adjustInsurgentMorale", -1] call CBA_fnc_serverEvent;
	["TWC_Insurgency_adjustCivilianMorale", 1] call CBA_fnc_serverEvent;
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
}];