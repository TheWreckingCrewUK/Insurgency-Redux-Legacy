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
params ["_objType"];

[_objType] spawn {
params ["_objType"];


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

_group = createGroup East;

if(isNil "hvtlist") then{
	hvtlist = ["CUP_O_TK_INS_Commander_twc","rhsgref_ins_squadleader"];
};


_unitString = hvtlist call bis_fnc_selectRandom;
_hvt = _group createUnit [_unitString,_pos,[],0,"NONE"];
_hvt disableAi "PATH";
_vehspawnPos = [_pos,[5,30],random 360,0, [1,30]] call SHK_pos; 
createvehicle ["CUP_C_Volha_Limo_TKCIV", _vehspawnPos];

_taskID = str (random 1000);

_markerPos = [_pos, 300] call CBA_fnc_randPos;
/*
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


[WEST,[_taskID],["We have located a high ranking insurgent. Killing him will send ripples through the whole insurgency.","High Value Target"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;
*/
//add Hostiles
_num = 0;
_total = 10;
_group = createGroup East;
_spawntime = time;

for "_i" from 1 to _total do{
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _pos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			InsP_enemyMorale = InsP_enemyMorale + 0.06; publicVariable "InsP_enemyMorale";
		};
	}];
	_unit addMagazines ["handGrenade",2];
	_unit setVariable ["unitsHome",_pos,false];
	//_num = _num + 1;
	sleep 0.2;
};

for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit ["CUP_O_TK_INS_Soldier_AA", _pos,[], 25,"NONE"];
};
};


[_group, _group, 150, 3, false] call CBA_fnc_TaskDefend;

_id = [_pos, "HVT"];
twc_activemissions pushback _id;
publicVariable "twc_activemissions";

//wait 60 seconds and see if he's still alive after spawn, if he's dead then just cancel the task without any reward/penalty
waituntil {time > (_spawntime + 60)};
	if (!alive _hvt) exitwith {
	["TWC_Insurgency_objCompleted", ["HVT", _objType]] call CBA_fnc_serverEvent;
	
		twc_activemissions deleteAt (twc_activemissions find _id);
publicVariable "twc_activemissions";
};

// let's start monitoring conditions to satisfy completion/failure
[_hvt, _taskID, _group, _objType, _id, _markerPos] spawn {
	params ["_hvt", "_taskID", "_group", "_objType", "_id", "_markerPos"];
	
	_maxTime = time + ((10*60)*60);
	
	while {alive _hvt} do {
		if (time > _maxTime) exitWith {};
		sleep 5;
	};

	if (!alive _hvt) then {
		["TWC_Insurgency_adjustPoints", 50] call CBA_fnc_serverEvent;
	}else{
		["TWC_Insurgency_adjustPoints", -15] call CBA_fnc_serverEvent;
	};

	//deleteMarker _markerstr;
	//deleteMarker _markerstr2;
	

	[_hvt, _group] spawn {
		waitUntil { !([(_this select 0), 750] call CBA_fnc_nearPlayer) };
		deleteVehicle (_this select 0);
		
		{
			deleteVehicle _x;
		} forEach units (_this select 1);
	};

	["TWC_Insurgency_objCompleted", ["HVT", _objType]] call CBA_fnc_serverEvent;
	
		twc_activemissions deleteAt (twc_activemissions find _id);
publicVariable "twc_activemissions";
		
	
	[WEST,[_taskID],["We have located and eliminated a high ranking insurgent. Killing him will send ripples through the whole insurgency.","High Value Target"],_markerPos,0,2,true] call BIS_fnc_taskCreate;
	
	[_taskID,"Succeeded"] call BIS_fnc_taskSetState;

};

};

