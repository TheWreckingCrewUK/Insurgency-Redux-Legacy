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
_houseList = [(worldSize / 2),(worldSize / 2)] nearObjects ["House",(sqrt 2 *(worldSize / 2))];
while {_pos distance [0,0,0] < 100 || (_pos distance (getmarkerpos "base")) < 1000 || (_pos distance (getmarkerpos "respawn_west_forwardbase")) < 1000 || ([_pos,500] call twc_fnc_posNearPlayers)} do {			

	
	sleep 2;
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
publicvariable "hvtlist";

_unitString = hvtlist call bis_fnc_selectRandom;
_hvt = _group createUnit [_unitString,_pos,[],0,"NONE"];
_hvt disableAi "PATH";

_hvt allowdamage false;
_buildingarray = nearestObjects [_pos, ["House", "Building"], 300];
_building = (_buildingarray select 0);
_pos = (_building buildingPos 0);

_hvt setpos _pos;

/*_pos = [_pos, 1, 20, 3, 0, 0.7, 0] call BIS_fnc_findSafePos;

if ((count _pos) == 2) then {
	_pos = [_pos select 0, _pos select 1, 0];
};
*/
_vehspawnPos = [_pos, 1, 30, 5, 0, 0.7, 0] call BIS_fnc_findSafePos; 
if ((count _vehspawnPos) == 2) then {
	_vehspawnPos = [_vehspawnPos select 0, _vehspawnPos select 1, 0];
};
_hvtveh = createvehicle ["CUP_C_Volha_Limo_TKCIV", _vehspawnPos];

_hvtveh setvehiclelock "locked";

_taskID = str (random 1000);

_markerPos = [_pos, 300] call CBA_fnc_randPos;



		
		if (isserver && hasinterface) then {
			_intelPos = _pos;
			_marker = createMarker [(str (random 1000)), _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor "colorWest";
			_marker setMarkerText "HVT";
			_marker setMarkerSize [0.5,0.5];
		};

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
	_unit setUnitPos "UP";
	//_num = _num + 1;
	sleep 0.2;
};

//{
//	[_x, 40] call twc_fnc_aispreadout;
//} foreach units _group;

_id = [_pos, "HVT"];
twc_activemissions pushback _id;
publicVariable "twc_activemissions";

_randsize = 650 + (random 100);
_randtime = 10;
_trg2 = createTrigger ["EmptyDetector", _pos];
_trg2 setTriggerArea [_randsize, _randsize, 30, false];
_trg2 setTriggerActivation ["west", "PRESENT", True];
_trg2 setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg2 setTriggerStatements ["({(_x getvariable ['twc_isterp', 0] == 1)} count thislist) > 0","_id = thistrigger getvariable ['twc_vipid', 'none'];[getpos thistrigger, _id] execvm 'Insurgency_Core\server\sys_terp\fnc_terp_hvt.sqf'",""];

_trg2 setvariable ["twc_vipid", _id, true];
_trg2 setvariable ["twc_vipobjtype", _objType, true];

_hvt setvariable ["twchvttrg2", _trg2, true];

if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit [twc_aaman, _pos,[], 25,"NONE"];
};
};
};


//[_group, _group, 150, 3, false] call CBA_fnc_TaskDefend;
[leader _group, 1] spawn TWC_fnc_aiscramble;

_units = [_pos, nil, units _group, 40, 2, false, true] call ace_ai_fnc_garrison;

[_group, _pos, 100, 3, 0.9] call CBA_fnc_taskDefend;

sleep 10;
_hvt allowdamage true;
_hvt setUnitPos "UP";




_hvt addEventHandler ["Killed", {
	params ["_hvt", "_killer", "_instigator", "_useEffects"];
	_trg2 = _hvt getvariable ["twchvttrg2", objnull];
	_id = _trg2 getvariable ["twc_vipid", 0];
	_objType = _trg2 getvariable ["twc_vipobjtype", 0];
	_taskID = str (random 1000);
	
	["TWC_Insurgency_objCompleted", ["HVT", _objType]] call CBA_fnc_serverEvent;
	
	deletevehicle _trg2;
	["TWC_Insurgency_adjustPoints", 30] call CBA_fnc_serverEvent;
	
	[getpos _hvt] call twc_fnc_counterattack;
	
	_iscaptured = _hvt getvariable ["twc_ishvtcaptured", 0];
	if (_iscaptured == 0) then {
		_marker = createMarker [str (getpos _hvt),getpos _hvt];
		_marker setMarkerType "mil_triangle";
		_marker setMarkerColor "ColorBlue";
		_marker setMarkerText ('HVT Killed');
		_marker setMarkerSize [0.75, 0.75];
		
	};
	
	twc_activemissions deleteAt (twc_activemissions find _id);
	publicVariable "twc_activemissions";
		
	
	[WEST,[_taskID],["We have located and eliminated a high ranking insurgent. Killing him will send ripples through the whole insurgency.","High Value Target"],getpos _hvt,"CREATED",2,true] call BIS_fnc_taskCreate;
	
	[_taskID,"Succeeded"] call BIS_fnc_taskSetState;
	
}];





};

