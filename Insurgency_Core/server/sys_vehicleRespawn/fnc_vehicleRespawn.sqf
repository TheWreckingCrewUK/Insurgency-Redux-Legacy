/*
* Author: [TWC] jayman
* Function for Vehicle Respawn using event handlers for minimal lag
*
* Arguments:
* 0: Vehicle <Object>
*
* Return Value:
* <NONE>
*
* Example:
* [veh1] spawn twc_fnc_vehicleRespawn;
*
* Public: No
*/
params["_veh"];

if(isNil "_veh")exitWith{hint "twc_fnc_vehicleRespawn was not even given a vehicle. Exiting..."};

_veh setVariable ["respawnInfo",[(typeOf _veh),(getPosASL _veh),(getDir _veh)]];


_veh addEventHandler ["GetOut",{
	_veh = _this select 0;
	if((getPos _veh) distance2D ((_veh getVariable "respawnInfo") select 1) < 50) exitWith{};
//	if((getPos _veh) distance2D (getMarkerPos "respawn_forwardBase") < vehicleRespawnDistanceForwardBase) exitWith{hint "player dismounted near forward base. Exiting..."};
	
	[_veh]spawn{
		_veh = _this select 0;
		
		_true = true;
		_time = time + vehicleRespawnDelay;
		while{_true}do{
			waitUntil {str (fullCrew _veh) != "[]" || _time < time};
			if(str (fullCrew _veh) != "[]")exitWith{};
			if(_time < time)then{
				if([_veh,vehicleRespawnDistancePlayers] call CBA_fnc_nearPlayer)then{
					_time = time + vehicleRespawnDelay;
				}else{
					_respawnInfo = _veh getVariable "respawnInfo";
					deleteVehicle _veh;
					sleep 2;
					_veh = (_respawnInfo select 0) createVehicle (_respawnInfo select 1);
					_veh setPosASL (_respawnInfo select 1);
					_veh setDir (_respawnInfo select 2);

					clearWeaponCargoGlobal _veh;
					clearMagazineCargoGlobal _veh;
					clearItemCargoGlobal _veh;
					clearBackpackCargoGlobal _veh;
			
					[_veh] call twc_fnc_vehicleRespawn;
					_true = false;
				};			
			};
		};
	};
}];

_veh addEventHandler ["Killed",{
	_veh = _this select 0;
	
	[_veh] spawn{
		_veh = _this select 0;
		
		_respawnInfo = _veh getVariable "respawnInfo";
		deleteVehicle _veh;
		sleep 2;
		_veh = (_respawnInfo select 0) createVehicle (_respawnInfo select 1);
		_veh setPosASL (_respawnInfo select 1);
		_veh setDir (_respawnInfo select 2);

		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
			
		[_veh] call twc_fnc_vehicleRespawn;
	};
}];