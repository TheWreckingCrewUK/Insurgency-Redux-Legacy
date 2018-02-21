params ["_objType"];

//Selects a random town then makes sure it is far enough from base and friendlies
_town = townLocationArray call bis_fnc_selectRandom;
_pos = getPos _town;
while{([_pos,500] call twc_fnc_posNearPlayers) || _pos distance2D (getMarkerPos "base") < 1000 || _town in badTownArray}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos1 = getPos _town;
};

_pos = [getPos _town, 500, 2000, 1, 0, 0.7, 0, [], [getPos _town, getPos _town]] call BIS_fnc_findSafePos;

//Adds a marker with a bit of an offset
_markerPos = [_pos, 100] call CBA_fnc_randPos;

_markerstr = createMarker [str (random 1000),_markerPos];
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerShape "Ellipse";
_markerstr setMarkerBrush "Grid";
_markerstr setMarkerSize [100,100];

_markerstr2 = createMarker [str (random 1000),_markerPos];
_markerstr2 setMarkerShape "ICON";
_markerstr2 setMarkerType "MIL_unknown";
_markerstr2 setMarkerColor "colorWest";
_markerstr2 setMarkerText "Minefield";

//Creating the task
_taskID = str (random 1000);
[WEST,[_taskID],["A minefield has been reported in the area. We need to investigate it and defuse them if possible.","Clear Minefield"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;


_num = 0;
_minecount = 0;
_totalmines = 20 + random 40;
sleep 3;
_minetype = twc_mineType  call bis_fnc_selectRandom;
//Add Mines
for "_i" from 1 to _totalmines do{
	_minePos1 = [_pos, 50] call CBA_fnc_randPos;
	_minePos = [_minePos1,[10,50],random 360,0,[0,100]] call SHK_pos;
	_mine = createmine [_minetype, _minePos, [], 5];
	
_minecount = _minecount + 1;
/*
_marker = createMarker [str getpos _mine,getpos _mine];
_marker setMarkerShape "Ellipse";
_marker setMarkerBrush "Grid";
_marker setMarkerSize [2,2];
_marker setMarkerColor "colorOpfor";
*/

};

sleep 20;
//Complete or fail
waituntil {_minecount < 5};
[
	{
		[(_this select 1)] call bis_fnc_deleteTask;
		deleteMarker (_this select 2);
		deleteMarker (_this select 3);
		["TWC_Insurgency_objCompleted", ["Minefield", (_this select 0)]] call CBA_fnc_serverEvent;
	},
	[_objType, _taskID, _markerstr, _markerstr2],
	(60 + ((floor random 10) * 6))
] call CBA_fnc_waitAndExecute;
