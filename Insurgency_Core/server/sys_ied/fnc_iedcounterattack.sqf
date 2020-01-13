params ["_iedpos", ["_chance", 0.5]];

if (random 1 > _chance) exitwith {};
//systemchat "counterattack called";



	_pos = [_iedpos, 50, 400, 3, false] call twc_fnc_findsneakypos;
	
	if (((_pos distance _iedpos) < 30) || ((_pos distance _iedpos) > 410)) then {
		while {(((_pos distance _iedpos) < 90) || ((_pos distance _iedpos) > 410))} do {
			_pos = [_iedpos, 50, 400, 3, false] call twc_fnc_findsneakypos;
		};
	};
	
	
	_total = 2 + random 5;
	_group = createGroup East;
	
	
	for "_i" from 1 to _total do{
	
		_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _pos,[], 5,"NONE"];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
			if (side (_this select 1) == WEST) then{
				["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
				["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
			};
		}];
		
		_pos = [_pos, 3, 40, 3, false] call twc_fnc_findsneakypos;
		
	};
	
_wp = _group addwaypoint [_iedpos, 0];

[leader _group] spawn TWC_fnc_aiscramble;

_wp setWaypointStatements ["true", "{[_x] call twc_fnc_deleteDead} foreach (units (group this))"];


if (random 1 >0.5) then {
	[_iedpos] call INS_fnc_iedcounterattack;
};