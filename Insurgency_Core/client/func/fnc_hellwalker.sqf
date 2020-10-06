/*
by hobbs

spawns enemies consistently around the player until they are dead.

*/
twc_fnc_deleteDead = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_deleteDead.sqf";

params [["_radius", 100], ["_interval", 10], ["_max", 20]];

twc_fnc_newhellwp = {
	params ["_unit"];
	_group = group _unit;
	_pos = getpos _unit;
	_group setbehaviour "safe";
	if ((!([_pos,50] call twc_fnc_posNearPlayers))) then {
		{
			if ((([getpos _x] call twc_fnc_seenbyplayers) == 0) && ((vehicle _x) == _x)) then {
				deletevehicle _x;
			};
		} foreach (units _group);
	};
	if ((count (units _group)) == 0) exitwith {};
	_gop = [_pos, 10, 160, 3, false] call twc_fnc_findsneakypos;
	if ((_gop distance _pos) > 10) then {
		_wp = _group addwaypoint [(_gop), 20];
		_wp setwaypointstatements ["true", "[this] call twc_fnc_newhellwp;"];
	} else {
		[_unit] call twc_fnc_newhellwp;
	};
};
systemchat ("hellwalker start with " + (str _max) + " guys at a radius of " + (str _radius) + " with an interval of " + (str _interval) + " seconds");
_count = 0;
while {(alive player) && (_count < _max)} do {
	_pos = getpos player;
	_spawnpos = [_pos, _radius] call cba_fnc_randpos;
	//systemchat (str _spawnpos);
	if ((str _spawnpos) != (str _pos)) then {
		//systemchat "unit spawn";
		_group = creategroup east;
		for "_i" from 0 to (random 5) do {
			_uspawnpos = [_spawnpos, 2, 20, 1, false] call twc_fnc_findsneakypos;
			if ((str _uspawnpos) != (str _spawnpos)) then {
				_unit = _group createUnit [(selectRandom townSpawn), _uspawnpos, [], 0, "NONE"];
				_count = _count + 1;
			};
		//	_unit addEventHandler ["Killed",{
		//		[(_this select 0)] call twc_fnc_deleteDead;
		//	}];
		};
		_wp = _group addwaypoint [_pos, 20];
		_wp setwaypointstatements ["true", "[this] call twc_fnc_newhellwp;"];
		[_group] spawn TWC_fnc_aiscramble;
		sleep _interval;
	};
	
	sleep 5;
};
systemchat "That'll do pig";