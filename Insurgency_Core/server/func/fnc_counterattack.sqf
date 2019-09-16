params ["_pos"];

_distance = 3000;
_town = [0];

{
	_isfriend = profilenamespace getvariable ['twcenemytown' + (str _x), 5];
	
	if ((_isfriend == 1) || (_isfriend == 5)) then {
		if (((_x distance _pos) < _distance) && (!([_x,1000] call twc_fnc_posNearPlayers))) then {
			_town = _x;
			_distance = (_x distance _pos);
		};
	};
} foreach twc_locationarray_trgs;

if ((count _town ) == 1) exitwith {
//systemchat "f1";
};
//systemchat "s1";
_spawnpos = [_town, 1, 50, 5, 0, 20, 0] call BIS_fnc_findSafePos;



_group = creategroup east;
_total = 5 + random 5;
for "_i" from 1 to _total do {
	_unit = _group createUnit [(selectRandom townSpawn), _spawnPos, [], 5, "NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;

		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	
	_unit setVariable ["twc_isenemy",1];
	
//systemchat (typeof _unit);
};

[leader _group] spawn TWC_fnc_aiscramble;

_wp =  _group addwaypoint [_pos, 200]; 
_wp setWaypointformation (["column", "STAG COLUMN", "file"] call bis_fnc_selectrandom);

_wp setWaypointStatements ["true", "[group this, getPos this, 4000] call bis_fnc_taskPatrol"];
