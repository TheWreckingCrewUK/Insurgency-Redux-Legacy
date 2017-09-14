/*
* Author: [TWC] jayman
* Function for Vehicle Respawn
*
* Arguments:
* 0: Vehicle <Object>
* 1: Respawn Position
*
* Return Value:
* <NONE>
*
* Example:
* [veh1] spawn twc_fnc_vehicleRespawn;
*
* Public: No
*/

params["_veh",["_delay",10],["_respawnDistancePlayers",1000],["_respawnDistanceForwardBase",1000],["_desertedTime",10]];

if(isNil "_veh")exitWith{hint "twc_fnc_vehicleRespawn was not even given a vehicle. Exiting..."};

_respawnPos = getPosASL _veh;
_dir = getDir _veh;
_type = typeOf _veh;
_dead = false;
_nodelay = false;
_forwardBaseCheck = false;
_playersNear = false;
_run = true;

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

while{_run}do{
	sleep 5;
	_pos = getPosASL _veh;
	_forwardBaseCheck = false;
	
	//Check if the vehicle is dead and players have abandoned it.
	if ((getDammage _veh > 0.8) and ({alive _x} count crew _veh == 0)) then {_dead = true};
	
	//Check if the vehicle is deserted
	if(getMarkerColor "respawn_forwardBase" == "")then{
		_forwardBaseCheck = false;
	}else{
		if(_pos distance2D (getMarkerPos "respawn_forwardBase") < _respawnDistanceForwardBase)then{
			_forwardBaseCheck = true;			
		};
	};
	if(_pos distance _respawnPos > 10 && ({alive _x} count crew _veh == 0) && (getDammage _veh < 0.8))then{
		_nearBluefor = false;
		{
			if((getPos _x) distance2D _pos < _respawnDistancePlayers)then{
				_nearBluefor = true;
			};
			
		}forEach playableUnits + switchableUnits;
		if(_nearBluefor)exitWith{};
		if(_forwardBaseCheck)exitWith{};
		systemChat str _forwardBaseCheck;
		_timeout = time + _desertedTime;
		sleep 0.1;
		waitUntil{_timeout < time || !alive _veh || {alive _x} count crew _veh > 0};
		if ({alive _x} count crew _veh > 0) then {_dead = false};
		if ({alive _x} count crew _veh == 0) then {_dead = true; _nodelay =true};
		if !(alive _veh) then {_dead = true; _nodelay = false};
	};
	
	// Respawn vehicle
    if (_dead) then{	  
		if (_nodelay) then {sleep 0.1; _nodelay = false;} else {sleep _delay;};
		sleep 0.1;

		deleteVehicle _veh;
		sleep 2;
		_veh = _type createVehicle _respawnPos;
		_veh setPosASL _respawnPos;
		_veh setDir _dir;

		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;

		_dead = false;
	};
};