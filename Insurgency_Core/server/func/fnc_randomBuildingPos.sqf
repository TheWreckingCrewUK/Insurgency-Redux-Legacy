/*
* Author [TWC] Jayman
*
* Function to get a random building and position on that building so I stop having to type it out in every script
*
* Arguments:
* 1: <ARRAY> Position
* 2: <Number> Radius
*
* Example
* [(getMarkerPos "marker"),300] call twc_fnc_randomBuildingPos
*
* Returns <Array> BuildingPos
*/

params[["_pos",[(worldSize / 2),(worldSize / 2)]],["_radius",(sqrt 2 *(worldSize / 2))]];

_houseList = _pos nearObjects ["House",_radius];
_c = 0;
_house = _houseList call BIS_fnc_selectRandom;
while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {sleep 0.1; _c = _c + 1};
if (_c > 0) then {
	_ranNum = floor(random _c);
	_buildingPos = (_house buildingPos _ranNum);
};
_buildingPos