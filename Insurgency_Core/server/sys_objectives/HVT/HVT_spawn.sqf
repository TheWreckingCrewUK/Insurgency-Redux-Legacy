/*
* Author: [TWC] Jayman
* HVT Objective Creator 
*
* Arguments:
* <NONE>
*
* Return Value:
* <NONE>
*
* Example:
* <TBD>
*
* Public: No
*/
_group = createGroup East;
_unitString = ["c_man_1"] call bis_fnc_selectRandom;
_hvt = _group createUnit [_unitString,[0,0,0],[],0,"NONE"];

while {_x distance [0,0,0] < 100 || (_x distance (getmarkerpos "base")) < 500 || [_hvt,500] call CBA_fnc_nearPlayer} do {			

	_houseList = [(worldSize / 2),(worldSize / 2)] nearObjects ["House",(sqrt 2 *(worldSize / 2))];
	sleep .25;
	_c = 0;
	_house = _houseList call BIS_fnc_selectRandom;
	while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	if (_c > 0) then {
		_ranNum = floor(random _c);
		_x setPos (_house buildingPos _ranNum);
		sleep 1;
	};
	sleep 0.25;
};
_hvt disableAi "PATH";

_pos = getPos _hvt;
_markerPos = [_pos, 300] call CBA_fnc_randPos;

_markerstr = createMarker [str (random 1000),_markerPos];
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerShape "Ellipse";
_markerstr setMarkerBrush "Grid";
_markerstr setMarkerSize [500,500];

_markerstr2 = createMarker [str (random 1000),_markerPos];
_markerstr2 setMarkerShape "ICON";
_markerstr2 setMarkerType "MIL_unknown";
_markerstr2 setMarkerColor "colorWest";
_markerstr2 setMarkerText "High Value Target";

//Add Hostiles

//Add WaitUntil
_time = time + 1200;
waitUntil{time > _time || !alive _hvt};

//Add completion or failure
while{alive _hvt && [_hvt,200] call CBA_fnc_nearPlayer}do{
	sleep 5;
};
if(!alive _hvt)then{
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
}else{
	["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
};
deleteMarker _markerstr;
deleteMarker _markerstr2;
deleteVehicle _hvt;