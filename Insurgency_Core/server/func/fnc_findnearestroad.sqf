/*
//find nearest road for larger areas, exitwith on success so that time isn't wasted when searching a larger area when one is already near
//Arguments:
// [location, minimum search radius, maximum search radius] call twc_fnc_findnearestroad
// OR
// [location, maximum search radius] call twc_fnc_findnearestroad
*/

params ["_pos", "_min", ["_max", -100]];

if (_max == -100) then {
	_max = _min;
	_min = (20 min (_max - 10));
};

_step = (_max - _min) / 5;

_road = objnull;
//systemchat "twc nearestroad1";

for "_i" from 0 to 4 do {
	_amount = _min + (_step * _i);
	_road = ([_pos, _step] call BIS_fnc_nearestRoad);
	if (!(isnull _road)) exitwith {_road};
};

_desperate = 1;
while {(isnull _road)} do {
	_road = ([_pos, (_max + (_step * _desperate))] call BIS_fnc_nearestRoad);
	_desperate = _desperate + 1;
};

_road