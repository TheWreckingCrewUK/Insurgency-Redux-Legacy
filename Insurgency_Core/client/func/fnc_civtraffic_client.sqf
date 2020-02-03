params ["_player"];

if (!alive _player) exitwith {
	[twc_fnc_civtraffic_client, [_player], 30] call CBA_fnc_waitAndExecute;
};

_isatbase = (((_player distance twc_basepos ) < 1000) || ((_player distance (getmarkerpos "respawn_west_forwardbase") ) < 300));
//systemchat "civtraffclient 7";
if (_isatbase && (!isserver)) exitwith {
	[twc_fnc_civtraffic_client, [_player], 300] call CBA_fnc_waitAndExecute;
};
_timer = 600;

if (isserver) then {
	_timer = missionnamespace getvariable ["twc_diag_civtimer", 100];
};

//systemchat "civtraffclient start";

_roads = _player nearRoads 2500;

if ((count _roads) < 4) exitwith {
	[twc_fnc_civtraffic_client, [_player], 300] call CBA_fnc_waitAndExecute;
	//systemchat "civtraffclient 9";
};

_carcount = missionnamespace getvariable ["twc_civcars", []];

if ((count _carcount) > 20) exitwith {
	[twc_fnc_civtraffic_client, [_player], _timer] call CBA_fnc_waitAndExecute;
	//systemchat "civtraffclient 16";
};

_dir = 0;
if ((random 1) < 0.4) then {
	_dir = 180;
};
_gop = [(_player getRelPos [2000, _dir]), 1500, 2500] call twc_fnc_findnearestroad;

//systemchat (str (_gop distance player));

if ((((isnull _gop)) || (([getpos _gop,800] call twc_fnc_posNearPlayers)))) exitwith {
	[twc_fnc_civtraffic_client, [_player], _timer] call CBA_fnc_waitAndExecute;
	//systemchat "civtraffclient 23";
};

_gop = getpos _gop;


_waypoints = [];
_attempts = 0;

_predictpos = (_player getRelPos [(((speed _player) + 0.1) * (10)), 0]);

_wp = [([_predictpos, 300] call cba_fnc_randpos), 1000] call twc_fnc_findnearestroad;

if (!isnull _wp) then {
	_waypoints pushback (getpos _wp);
};


while {((count _waypoints < 3) && (_attempts < 10))} do {
	_wp = [(_wp getpos [800, ((_gop getdir _wp) + (random 40) - 20)]), 1000] call twc_fnc_findnearestroad;

	if (((_gop distance _player) > 3500) || (([_gop,300] call twc_fnc_posNearPlayers))) then {
		_attempts = _attempts + 1;
	} else {
	
		_waypoints pushback _wp;
	};
};

if (_attempts == 10) exitwith {
	//systemchat "civtraffclient 43";
	[twc_fnc_civtraffic_client, [_player], _timer] call CBA_fnc_waitAndExecute;
};
//systemchat (str [_gop, _waypoints]);
[_gop, _waypoints] remoteExec ["twc_fnc_civtraffic_server", 2];


// if spawn was successful, do it again with a lesser timer
[twc_fnc_civtraffic_client, [_player], _timer * 0.3] call CBA_fnc_waitAndExecute;