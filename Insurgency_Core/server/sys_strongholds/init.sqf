//Extra stronghold spawner for larger maps
/*
removing this for now since patrol towns are good atm and it saves on performance

[]spawn {
_total = (worldsize) / 6000;

if(_total < 1) exitwith {};



for "_i" from 1 to _total do{

//Finding a position that is far enough from base and not near players
_pos = [0,0,0];

while {_pos distance [0,0,0] < 100 || (_pos distance (getmarkerpos "base")) < 500 || ([_pos,500] call twc_fnc_posNearPlayers)} do {			

	_houseList = [(worldSize / 2),(worldSize / 2)] nearObjects ["House",(sqrt 2 *(worldSize / 2))];
	sleep .25;
	_c = 0;
	_house = _houseList call BIS_fnc_selectRandom;
	while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	if (_c > 0) then {
		_ranNum = floor(random _c);
		_pos = (_house buildingPos _ranNum);
		sleep 1;
	};
	sleep 0.25;
};

[_pos] execVM "Insurgency_Core\server\sys_strongholds\createsemiStronghold.sqf";
};
};

