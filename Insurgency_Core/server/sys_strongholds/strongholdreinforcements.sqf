

params["_id", "_num"];

_pos = _id select 0;

_max = 900;
_spawnpos = [_pos, 700, _max, 3, 0, 20, 0] call BIS_fnc_findSafePos;

while {({side _x == independent} count nearestObjects [_spawnpos,['Man','Car','Tank'],500] > 0) && (([_spawnpos] call twc_fnc_seenbyplayers) > 0) && (_max < 2000) && ((_spawnpos distance twc_basepos) < 4000)} do {
	_max = _max + 20;
	_spawnpos = [_pos, 700, _max, 3, 0, 20, 0] call BIS_fnc_findSafePos;
};

if (_max >= 2000) exitwith {};

_group = creategroup east;

_total = 5 + random 10;

for "_i" from 1 to _total do{
_unit = _group createUnit [((townSpawn + ['CUP_O_TK_INS_Soldier_AA']) call bis_fnc_selectrandom), _spawnpos,[], 5,'NONE'];
_unit addEventHandler ['Killed',{
	[(_this select 0)] call twc_fnc_deleteDead;
	if (side (_this select 1) == WEST) then{
		['TWC_Insurgency_adjustInsurgentMorale', -0.25] call CBA_fnc_serverEvent;
		['TWC_Insurgency_adjustCivilianMorale', 0.25] call CBA_fnc_serverEvent;
	};
}];
};

/*
_final = _num + _total;
if (_final < 50) then {
	[_id, _final] call twc_fnc_strongholdreinforcements;
};
*/

_group setvariable ["twc_strongholdpos", _pos];
[leader _group] spawn TWC_fnc_aiscramble;

_gopos = _pos;

if ((random 1) < 0.5) then {
	{
		if (((vehicle _x) == _x) && ((_x distance _pos) < 1000) && ((random 1) < 0.5)) then {
			_gopos = getpos _x;
		};
	} foreach allplayers;
};

_wp = _group addwaypoint [_gopos, 0];
_wp setWaypointCompletionRadius 100;
_wp setWaypointformation (["column", "line", "vee", "file"] call bis_fnc_selectrandom);
_wp setWaypointStatements ["true", "_pos = (group this) getvariable ['twc_strongholdpos', (getpos this)];[_pos, nil, thislist, 300, 2, true, false] call ace_ai_fnc_garrison;[group this, _pos, 300, 3, 0.5, 0.5] call CBA_fnc_taskDefend;['TWC_Insurgency_adjustInsurgentMorale', 1] call CBA_fnc_serverEvent;
_trg = createTrigger ['EmptyDetector', _pos];
_trg setTriggerArea [300, 300, 0, false];
_trg setTriggerActivation ['EAST', 'PRESENT', False];
_trg setTriggerTimeout[0, 0, 0, true];
_trg setTriggerStatements ['count thisList > 20','[getpos thistrigger] spawn twc_fnc_strongholdreset',''];
"];

_total