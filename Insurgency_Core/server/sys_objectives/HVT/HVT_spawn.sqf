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


_nil = [_pos, nil, [_hvt], 20, 2, false, true] call ace_ai_fnc_garrison;

//garrison should return
if (!isnil "_nil") then {
	if ((count _nil) > 0) then {
		_nil = [_pos, nil, [_hvt], 50, 2, false, true] call ace_ai_fnc_garrison;
	};
};

_pos = [_pos, 1, 20, 3, 0, 0.7, 0] call BIS_fnc_findSafePos;

if ((count _pos) == 2) then {
	_pos = [_pos select 0, _pos select 1, 0];
};

_vehspawnPos = [_pos, 1, 30, 5, 0, 0.7, 0] call BIS_fnc_findSafePos; 
if ((count _vehspawnPos) == 2) then {
	_vehspawnPos = [_vehspawnPos select 0, _vehspawnPos select 1, 0];
};
_hvtveh = createvehicle ["CUP_C_Volha_Limo_TKCIV", _vehspawnPos];

_hvtveh setvehiclelock "locked";

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
	_unit setVariable ["twc_isenemy",1];
	//_num = _num + 1;
	sleep 0.2;
};

_nil = [_pos, nil, (units _group), 50, 2, false, true] call ace_ai_fnc_garrison;

_id = [_pos, "HVT"];
twc_activemissions pushback _id;
publicVariable "twc_activemissions";

_randsize = 650 + (random 100);
_randtime = 10;
_trg2 = createTrigger ["EmptyDetector", _pos];
_trg2 setTriggerArea [_randsize, _randsize, 30, false];
_trg2 setTriggerActivation ["west", "PRESENT", True];
_trg2 setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg2 setTriggerStatements ["(VEHICLE twc_terp) in thislist","[getpos thistrigger, _id] execvm 'Insurgency_Core\server\sys_terp\fnc_terp_hvt.sqf'",""];

if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit ["CUP_O_TK_INS_Soldier_AA", _pos,[], 25,"NONE"];
};
};
};


[_group, _group, 150, 3, false] call CBA_fnc_TaskDefend;
[leader _group, 1] spawn TWC_fnc_aiscramble;


//wait 60 seconds and see if he's still alive after spawn, if he's dead then just cancel the task without any reward/penalty
waituntil {time > (_spawntime + 60)};
	if (!alive _hvt) exitwith {
	["TWC_Insurgency_objCompleted", ["HVT", _objType]] call CBA_fnc_serverEvent;
	
	deletevehicle _trg2;
	
		twc_activemissions deleteAt (twc_activemissions find _id);
publicVariable "twc_activemissions";
};

// let's start monitoring conditions to satisfy completion/failure
[_hvt, _taskID, _group, _objType, _id, _markerPos,_trg2] spawn {
	params ["_hvt", "_taskID", "_group", "_objType", "_id", "_markerPos", "_trg2"];
	
	_maxTime = time + ((10*60)*60);
	
	while {alive _hvt} do {
		if (time > _maxTime) exitWith {};
		sleep 5;
	};

	if (!alive _hvt) then {
	
	deletevehicle _trg2;
		["TWC_Insurgency_adjustPoints", 30] call CBA_fnc_serverEvent;
	}else{
	
	deletevehicle _trg2;
		["TWC_Insurgency_adjustPoints", -15] call CBA_fnc_serverEvent;
	};

	//deleteMarker _markerstr;
	//deleteMarker _markerstr2;
	

	[_hvt, _group] spawn {
	_pos = getpos _hvt;
		while {!( !([(_this select 0), 1500] call CBA_fnc_nearPlayer)) } do {
			sleep 30;
		};
		//deleteVehicle (_this select 0);
		
		{
			deleteVehicle _x;
		} forEach units (_this select 1);
	};

	["TWC_Insurgency_objCompleted", ["HVT", _objType]] call CBA_fnc_serverEvent;
	[_pos] call twc_fnc_counterattack;
		twc_activemissions deleteAt (twc_activemissions find _id);
publicVariable "twc_activemissions";
		
	
	[WEST,[_taskID],["We have located and eliminated a high ranking insurgent. Killing him will send ripples through the whole insurgency.","High Value Target"],_markerPos,0,2,true] call BIS_fnc_taskCreate;
	
	[_taskID,"Succeeded"] call BIS_fnc_taskSetState;
	
	deletevehicle _trg2;

};

};

