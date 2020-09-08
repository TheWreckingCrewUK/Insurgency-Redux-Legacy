params ["_player"];
_player = vehicle player;
if (!alive _player) exitwith {
	[twc_fnc_civfluff_client, [_player], 30] call CBA_fnc_waitAndExecute;
};

_timer = 30;

if (isserver) then {
	_timer = missionnamespace getvariable ["twc_diag_civtimer", 3];
};

//systemchat "civfluffclient start";

_buildings = nearestObjects [(_player getRelPos [(((speed _player) + 0.1) * 6), 0]), ["house", "vysilacka"], 200];

if ((count _buildings) < 4) exitwith {
	[twc_fnc_civfluff_client, [_player], _timer] call CBA_fnc_waitAndExecute;
	//systemchat "civfluffclient 9";
};

_mancount = (count (_player nearEntities ["Man", 400]));

if (_mancount > (((count _buildings) * 1)min 20)) exitwith {
	[twc_fnc_civfluff_client, [_player], _timer] call CBA_fnc_waitAndExecute;
	//systemchat "civfluffclient 16";
};

_gop = [(getpos (selectrandom _buildings)), 2, 50, 3, false] call twc_fnc_findsneakypos;

if ((((_gop distance _player) < 10) || ((_gop distance _player) > 250) || ((_gop) inarea "cqbrange") || (([_gop,50] call twc_fnc_posNearPlayers)))) exitwith {
	[twc_fnc_civfluff_client, [_player], _timer] call CBA_fnc_waitAndExecute;
	//systemchat "civfluffclient 23";
};



_waypoints = [];
_attempts = 0;

while {((count _waypoints < 2) && (_attempts < 3))} do {
	_wp = [(getpos (selectrandom _buildings)), 2, 30, 3, false] call twc_fnc_findsneakypos;

	if ((((_gop distance _player) < 10) || ((_gop distance _player) > 250) || (([_gop,50] call twc_fnc_posNearPlayers)))) then {
		_attempts = _attempts + 1;
	} else {
	
		_waypoints pushback _wp;
	};
};

if (_attempts == 3) exitwith {
	//systemchat "civfluffclient 43";
	[twc_fnc_civfluff_client, [_player], _timer] call CBA_fnc_waitAndExecute;
};

// if spawn was successful, do it again with a lesser timer
[twc_fnc_civfluff_client, [_player], (_timer * 0.3)] call CBA_fnc_waitAndExecute;

//systemchat (str [_gop, _waypoints]);
[_gop, _waypoints] remoteExec ["twc_fnc_civfluff_server", 2];

