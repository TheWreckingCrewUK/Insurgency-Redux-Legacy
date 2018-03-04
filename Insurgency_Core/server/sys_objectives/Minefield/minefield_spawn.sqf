params ["_objType"];

//Selects a random town then makes sure it is far enough from base and friendlies
_town = townLocationArray call bis_fnc_selectRandom;
_pos = getPos _town;
_attemptcount = 0;
while{([_pos,500] call twc_fnc_posNearPlayers) || _pos distance2D (getMarkerPos "base") < 2000 || _town in badTownArray}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos = getPos _town;
	_attemptcount = _attemptcount + 1;
if (_attemptcount > 50) exitwith {
		["TWC_Insurgency_objCompleted", ["Minefield", (_this select 0)]] call CBA_fnc_serverEvent;};
};
_pos = [getPos _town, 500, 2000, 1, 0, 0.7, 0, [], [getPos _town, getPos _town]] call BIS_fnc_findSafePos;
if (random 1 < 0.8) then {
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerActivation ["west", "PRESENT", False];
_trg setTriggerTimeout [7,7,7, true];
_trg setTriggerStatements ["this","[thistrigger] execVM 'Insurgency_Core\server\sys_objectives\Minefield\minefield_patrolspawn.sqf' ",""];
};
//[_pos] execVM "Insurgency_Core\server\sys_objectives\Minefield\minefield_patrolspawn.sqf";

//Adds a marker with a bit of an offset
_markerPos = [_pos, 10] call CBA_fnc_randPos;

_markerstr = createMarker [str (random 1000),_markerPos];
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerShape "Ellipse";
_markerstr setMarkerBrush "Grid";
_markerstr setMarkerSize [70,70];

_markerstr2 = createMarker [str (random 1000),_markerPos];
_markerstr2 setMarkerShape "ICON";
_markerstr2 setMarkerType "MIL_unknown";
_markerstr2 setMarkerColor "colorWest";
_markerstr2 setMarkerText "Minefield";

//Creating the task
_taskID = str (random 1000);
[WEST,[_taskID],["A minefield has been reported in the area. We need to investigate it and defuse them if possible.","Minefield Clearance"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;


_num = 0;
_minecount = 0;
_totalmines = 20 + random 40;
sleep 3;
_minetype = twc_mineType  call bis_fnc_selectRandom;
//Add Mines
for "_i" from 1 to _totalmines do{
	_minePos1 = [_markerpos, 50] call CBA_fnc_randPos;
	_minePos = [_minePos1,[10,50],random 360,0,[0,100]] call SHK_pos;
	_mine = createmine [_minetype, _minePos, [], 5];
	_mine setdir random 360;
_minecount = _minecount + 1;
/*
_marker = createMarker [str getpos _mine,getpos _mine];
_marker setMarkerShape "Ellipse";
_marker setMarkerBrush "Grid";
_marker setMarkerSize [1,1];
_marker setMarkerColor "colorOpfor";
*/

};



sleep 20;

waituntil {count (_markerpos nearobjects ["minebase", 150]) < (_totalmines - (2 + random 3))};
[
	{
		[(_this select 1), "ASSIGNED"] call BIS_fnc_taskSetState;
		["TWC_Insurgency_adjustPoints", 10] call CBA_fnc_serverEvent;
	},
	[_objType, _taskID, _markerstr, _markerstr2],
	(30 + ((floor random 10) * 3))
] call CBA_fnc_waitAndExecute;

//Complete or fail
waituntil {count (_markerpos nearobjects ["minebase", 150]) < (_totalmines /2)};
[
	{
		[(_this select 1), "SUCCEEDED"] call BIS_fnc_taskSetState;
		deleteMarker (_this select 2);
		deleteMarker (_this select 3);
		["TWC_Insurgency_adjustPoints", 30] call CBA_fnc_serverEvent;
		["TWC_Insurgency_objCompleted", ["Minefield", (_this select 0)]] call CBA_fnc_serverEvent;
	},
	[_objType, _taskID, _markerstr, _markerstr2],
	(30 + ((floor random 10) * 3))
] call CBA_fnc_waitAndExecute;

sleep 60;
[
	{
		[(_this select 1)] call bis_fnc_deleteTask;
	},
	[_objType, _taskID, _markerstr, _markerstr2],
	(60 + ((floor random 10) * 6))
] call CBA_fnc_waitAndExecute;

//cleanup after objective complete. It's slowed down so that there's still a risk after it's 'cleared'.
sleep 600;
while{count (_markerpos nearobjects ["minebase", 150]) > 0}do{
sleep 600;
_deletemine = (_markerpos nearobjects ["minebase", 150])  select 0;
_deleteflag = (_markerpos nearobjects ["FlagSmall_F", 200])  select 0;
sleep 3;};