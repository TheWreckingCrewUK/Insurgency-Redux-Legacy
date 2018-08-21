params ["_iedpos", "_thislist"];

//if (random 1 >0.3) exitwith {};
//systemchat "counterattack called";
_LocationArray = [];

if (isnil "_thislist") then {_thislist = [];};

_LocationArray = nearestLocations [_iedpos, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2000];

if ((count _LocationArray) == 0) exitwith {};

_pos = [[getpos (_LocationArray select 0),[0,40],random 360,0,[0,100]] call SHK_pos,5] call CBA_fnc_randPos;

if ((_pos distance _iedpos) > 500) then {
//	systemchat "random pos chosen";

	_pos = [_iedpos, 300, 500, 10, 0, 1, 0, [], [_iedpos, _iedpos]] call BIS_fnc_findSafePos;

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
		
		
	};
	
	[_group, _iedpos, 100] call CBA_fnc_taskAttack;


	_pos = [_pos, 50, 100, 10, 0, 1, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;

	
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
		
		{_unit reveal [_x, 4]} foreach _thislist;
	};
	
	[_group, _iedpos, 100] call CBA_fnc_taskAttack;
	
	

} else {
//systemchat "location chosen";


	for "_i" from 1 to 2 do {
	
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
		
		{_unit reveal [_x, 4]} foreach _thislist;
	};
	
	[_group, _iedpos, 100] call CBA_fnc_taskAttack;
};

};