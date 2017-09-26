//params [["_factoryGuessMarker", Nil]];

private _isAlive = missionNamespace getVariable ["IEDFactoryIsAlive", false];
private _pos = missionNamespace getVariable ["IEDFactoryLastPosition", [0, 0, 0]];
private _stop = false; // stop the loop!

if (!(_isAlive)) then {
	if (!([_pos, 1000] call twc_fnc_posNearPlayers)) then {
		// TODO: DELETE THE OBJECTS NOW
		_stop = true;
	};
};

if (!(_stop)) then {
	[TWC_fnc_IEDFactory_loop, [], 30] call CBA_fnc_waitAndExecute;
};
