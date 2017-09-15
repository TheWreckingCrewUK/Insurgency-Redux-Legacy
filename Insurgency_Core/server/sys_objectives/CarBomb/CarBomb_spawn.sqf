_town = townLocationArray call bis_fnc_selectRandom;
_veh = "CUP_C_Datsun_Plain" createVehicle (getPos _town);
while{[_veh,500] call CBA_fnc_nearPlayer}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_veh setPos (getPos _town);
};
_pos = [getPos _town,[0,300],[0,360],0] call SHK_pos;

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
_markerstr2 setMarkerText "CarBomb";

_taskID = str (random 1000);
[WEST,[_taskID],["A Suspicious Vehicle has been left in the area. We need to investigate it.","Car Bomb"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;

waitUntil{[_veh,200] call CBA_fnc_nearPlayer};
"Bo_GBU12_LGB" createVehicle (getPos _veh);
_veh setDamage 1;

sleep 3;
//Add Wounded Civilians
for "_i" from 1 to 5 do{
	_unitPos = [(getPos _veh), 30] call CBA_fnc_randPos;
	_group = createGroup civilian;
	_unit = _group createUnit ["c_man_1",_unitPos,[],0,"NONE"];
	for "_i" from 1 to 5 do {
		[_unit,random 0.8,["stab"]] call twc_fnc_aiWounds;
	};
	_unit addEventHandler ["killed",{
		["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
	}];
	[_unit,true,600,true] call ace_medical_fnc_setUnconscious;
	[_unit] spawn{waitUntil {(_this select 0) distance2D baseHospital < 5}; ["TWC_Insurgency_adjustPoints", 10] call CBA_fnc_serverEvent; deleteVehicle (_this select 0)};
};
//Add Enemies

_nearest=objNull;
_nearestdist=300;
{
	_dist=vehicle _x distance _pos;
	if (isPlayer _x and _dist<_nearestdist) then {
		_nearest=_x;
		_nearestdist=_dist;
	};
} forEach playableUnits;
[_pos,2,[200,300],[_nearest]] spawn twc_spawnAIUnits;

//Complete or fail

[_taskID] call bis_fnc_deleteTask;
["TWC_Insurgency_objCompleted", ["CarBomb"]] call CBA_fnc_serverEvent;
deleteMarker _markerstr;
deleteMarker _markerstr2;