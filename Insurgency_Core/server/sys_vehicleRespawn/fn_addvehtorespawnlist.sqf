
params ["_veh"];

_array = missionnamespace getvariable ["twc_vehrespawnlist", []];

_isinlist = false;

_result = [objnull, 0];

{
	if ((_x select 0) == _veh) then {
		_isinlist = true;
		//(_x select 1) = time;
		_result = _x;
	};
} foreach _array;


if (_isinlist) exitwith {
	_shouldbethere = true;
	_veh = (_result select 0);
	
	if (((getPos _veh) distance2D ((_veh getVariable "respawnInfo") select 1) < 50) || ((getPos _veh) distance2D (getMarkerPos "respawn_west_forwardBase") < vehicleRespawnDistanceForwardBase) || (({alive _x}count (crew _veh)) > 0)) then {
		_shouldbethere = false;
	};
	
	
	_array deleteat (_array find _result);
	twc_vehrespawnlist = _array;
	if (!(_shouldbethere)) then {
		//systemchat "vehicle in list already but shouldn't be, deleting";
	} else {
		//systemchat "vehicle in list already, updating time";
		_array pushback [_veh, time];
		twc_vehrespawnlist = _array;
	};
};

_array pushback [_veh, time];

twc_vehrespawnlist = _array;

[] spawn {
	sleep 10;
	[] spawn twc_fnc_checkrespawnlist;
};