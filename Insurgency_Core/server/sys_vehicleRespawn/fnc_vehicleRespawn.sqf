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

_veh setVariable ["twc_cacheDisabled",true];

if(isNil {_veh getVariable "respawnInfo"})then{
	_weapons = getWeaponCargo _veh;
	_items = getitemCargo _veh;
	_magazines = getmagazineCargo _veh;
	_backpacks = getBackpackCargo _veh;

	_veh setVariable ["respawnInfo",[(typeOf _veh),(getPosASL _veh),(getDir _veh),_weapons,_items,_magazines,_backpacks],true];
};

_veh addEventHandler ["GetOut",{
	_veh = _this select 0;
	if((getPos _veh) distance2D ((_veh getVariable "respawnInfo") select 1) < 50) exitWith{};
	if((getPos _veh) distance2D (getMarkerPos "respawn_west_forwardBase") < vehicleRespawnDistanceForwardBase) exitWith{};
	
	[_veh]spawn{
		params["_veh"];
		
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
					waituntil {basemode == 0};
					deleteVehicle _veh;
					sleep 20;
		_checkpos = [(_respawnInfo select 1) select 0, (_respawnInfo select 1) select 1, 0];
		waituntil {(count(_checkpos nearobjects ["all", 4]) ==0)};
					_veh = (_respawnInfo select 0) createVehicle [0,0,(200 + (random 1000))];
		
					_veh allowdamage false;
					_veh spawn {
						params ["_veh"];
						sleep 0.5;
						_veh setdamage 0;
						sleep 5;
						_veh allowdamage true;
						_veh setdamage 0;
					};
		
					_veh setDir (_respawnInfo select 2);
					_veh setPosASL ((_respawnInfo select 1) vectoradd [0,0,0.5]);
					
					if (typeof _veh == "ukcw_Gazelle_dyn") then {
						[
						_veh,
						["Woodland",1], 
						["HideWeapons",1]
						] call BIS_fnc_initVehicle;
						_veh setpylonloadout ["ukcw_PylonPod_1200Rnd_L20A1","ukcw_PylonPod_1200Rnd_L20A1"];
						};
					if (damage _veh == 1) then {
					
					_veh = (_respawnInfo select 0) createVehicle [0,0,(200 + (random 1000))];
		
					_veh allowdamage false;
					_veh spawn {
						params ["_veh"];
						sleep 0.5;
						_veh setdamage 0;
						sleep 5;
						_veh allowdamage true;
						_veh setdamage 0;
					};
		
					_veh setDir (_respawnInfo select 2);
					_veh setPosASL ((_respawnInfo select 1) vectoradd [0,0,0.5]);
					};
					
					clearWeaponCargoGlobal _veh;
					clearMagazineCargoGlobal _veh;
					clearItemCargoGlobal _veh;
					clearBackpackCargoGlobal _veh;
					{
						_veh addweaponCargoGlobal [_x,_respawnInfo select 3 select 1 select _forEachIndex];
					}forEach (_respawnInfo select 3 select 0);
					{
						_veh addItemCargoGlobal [_x,_respawnInfo select 4 select 1 select _forEachIndex];
					}forEach (_respawnInfo select 4 select 0);
					{
						_veh addmagazineCargoGlobal [_x,_respawnInfo select 5 select 1 select _forEachIndex];
					}forEach (_respawnInfo select 5 select 0);
					{
						_veh addbackpackCargoGlobal [_x,_respawnInfo select 6 select 1 select _forEachIndex];
					}forEach (_respawnInfo select 6 select 0);
					
					_veh setVariable ["respawnInfo",_respawnInfo];
					[_veh] call twc_fnc_vehicleRespawn;
					_true = false;
				};			
			};
		};
	};
}];

_veh addEventHandler ["Killed",{
	params["_veh"];
	
	[_veh] spawn{
		params["_veh"];
		
		_respawnInfo = _veh getVariable "respawnInfo";
		[_veh]spawn{
		waitUntil {!([(_this select 0),500] call CBA_fnc_nearPlayer)};
		deleteVehicle (_this select 0);
		};
		sleep 10;
		_checkpos = [(_respawnInfo select 1) select 0, (_respawnInfo select 1) select 1, 0.5];
		/*
		while {(count(_checkpos nearobjects [typeof _veh, 3]) >0)} do {
		{if ((damage _x) == 1) then {deletevehicle _x}} foreach (_checkpos nearobjects [typeof _veh, 3]);};
		waituntil {(count(_checkpos nearobjects [typeof _veh, 3]) ==0)};
		sleep (2+ (random 10)); //reason for sleep and double check is so that mass casualty events don't cause the cookoff to instantly injure the new vehicle
		*/
		waituntil {basemode == 0};
		while {(count(_checkpos nearobjects [typeof _veh, 3]) >0)} do {
		{if ((damage _x) == 1) then {deletevehicle _x}} foreach (_checkpos nearobjects [typeof _veh, 4]);sleep 1;};
		sleep (10 + (random 10));
		//waituntil {(count(_checkpos nearobjects [typeof _veh, 3]) ==0)};
		
		_veh = (_respawnInfo select 0) createVehicle [0,0,(200 + (random 1000))];
		
		_veh allowdamage false;
		_veh spawn {
			params ["_veh"];
			sleep 0.5;
			_veh setdamage 0;
			sleep 5;
			_veh allowdamage true;
			_veh setdamage 0;
		};
					
					if (typeof _veh == "ukcw_Gazelle_dyn") then {
						[
						_veh,
						["Woodland",1], 
						["HideWeapons",1]
						] call BIS_fnc_initVehicle;
						_veh setpylonloadout ["ukcw_PylonPod_1200Rnd_L20A1","ukcw_PylonPod_1200Rnd_L20A1"];
						};
					if (damage _veh == 1) then {
					
					_veh = (_respawnInfo select 0) createVehicle [0,0,(200 + (random 1000))];
		
					_veh allowdamage false;
					_veh spawn {
						params ["_veh"];
						sleep 0.5;
						_veh setdamage 0;
						sleep 5;
						_veh allowdamage true;
						_veh setdamage 0;
					};
		
					_veh setDir (_respawnInfo select 2);
					_veh setPosASL ((_respawnInfo select 1) vectoradd [0,0,0.5]);
					};
		
		_veh setDir (_respawnInfo select 2);
		_veh setPosASL ((_respawnInfo select 1) vectoradd [0,0,0.5]);
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		{
			_veh addweaponCargoGlobal [_x,_respawnInfo select 3 select 1 select _forEachIndex];
		}forEach (_respawnInfo select 3 select 0);
		{
			_veh addItemCargoGlobal [_x,_respawnInfo select 4 select 1 select _forEachIndex];
		}forEach (_respawnInfo select 4 select 0);
		{
			_veh addmagazineCargoGlobal [_x,_respawnInfo select 5 select 1 select _forEachIndex];
		}forEach (_respawnInfo select 5 select 0);
		{
			_veh addbackpackCargoGlobal [_x,_respawnInfo select 6 select 1 select _forEachIndex];
		}forEach (_respawnInfo select 6 select 0);
		
		_veh setVariable ["respawnInfo",_respawnInfo];		
		[_veh] call twc_fnc_vehicleRespawn;
	};
}];