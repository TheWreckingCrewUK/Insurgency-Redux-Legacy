
_lastcheck = missionnamespace getvariable ["twc_vehrespawnlastcheck", -9999];

if (_lastcheck > (time - 600)) exitwith {};

twc_vehrespawnlastcheck = time;

_array = missionnamespace getvariable ["twc_vehrespawnlist", []];

{
	_veh = (_x select 0);
	_time = (_x select 1);
	if (({alive _x} count (crew _veh)) == 0) then {
		if (_time < (time - vehicleRespawnDelay)) then {
			if (!([_veh,vehicleRespawnDistancePlayers] call CBA_fnc_nearPlayer)) then {
				[_veh] spawn twc_fnc_respawnvehicle;
			};
		};
	};
	sleep 10;
} foreach _array;