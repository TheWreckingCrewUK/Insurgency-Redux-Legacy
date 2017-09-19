/*
* Author: [TWC] Jayman
* VIP Objective Creator 
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
_group = createGroup civilian;
_vip = _group createUnit ["C_journalist_F",[0,0,0],[],0,"NONE"];

while {_vip distance [0,0,0] < 100 || (_vip distance (getmarkerpos "base")) < 500 || [_vip,500] call CBA_fnc_nearPlayer} do {			

	_houseList = [(worldSize / 2),(worldSize / 2)] nearObjects ["House",(sqrt 2 *(worldSize / 2))];
	sleep .25;
	_c = 0;
	_house = _houseList call BIS_fnc_selectRandom;
	while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	if (_c > 0) then {
		_ranNum = floor(random _c);
		_vip setPos (_house buildingPos _ranNum);
		sleep 1;
	};
	sleep 0.25;
};

[_vip, true] call ACE_captives_fnc_setSurrendered;

_pos = getPos _vip;
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
_markerstr2 setMarkerText "Very Important Person";

[_pos]spawn{
_pos = (_this select 0);
_num = 0;
_total = 10;
_group = createGroup East;
	for "_i" from 1 to _total do{
		_unit = _group createUnit [(townSpawn select _num), _pos,[], 5,"NONE"];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
			if (side (_this select 1) == WEST) then{
				InsP_enemyMorale = InsP_enemyMorale + 0.06; publicVariable "InsP_enemyMorale";
			};
		}];
		_unit addMagazines ["handGrenade",2];
		_unit setVariable ["unitsHome",_pos,false];
		_num = _num + 1;
		sleep 0.2;
	};
	[_group, _group, 150, 3, false] call CBA_fnc_TaskDefend;
};
_taskID = str (random 1000);
[WEST,[_taskID],["A member of the press has been captured by insurgents. We need to rescue him.","Hostage Situation"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;

_time = time + 1200;
waitUntil {_vip distance (getMarkerPos "base") < 20 || !alive _vip || time < _time};
if(time < _time && !([_vip,200] call CBA_fnc_nearPlayer))then {
	[_vip, true, false] call ace_medical_fnc_setDead
};
sleep 2;
if(!alive _vip)then{
	["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
}else{
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
};

["TWC_Insurgency_objCompleted", ["VIP"]] call CBA_fnc_serverEvent;
deleteMarker _markerstr;
deleteMarker _markerstr2;
deleteVehicle _vip;
[_taskID] call bis_fnc_deleteTask;