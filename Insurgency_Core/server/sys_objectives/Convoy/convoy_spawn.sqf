params ["_objType"];

//this objective makes a small 2 vehicle convoy and makes them patrol through 3 different towns. You need twc_convoyallowed to be defined as 1 in the map's server init for this to work because there's a lot of maps with non ai-friendly roads

//Selects a random town then makes sure it is far enough from base and friendlies
_town = townLocationArray call bis_fnc_selectRandom;
_pos = getPos _town;
_attemptcount = 0;
while{([_pos,800] call twc_fnc_posNearPlayers) || _pos distance2D (getMarkerPos "base") < 2000 || _town in badTownArray}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos = getPos _town;
	_attemptcount = _attemptcount + 1;
if (_attemptcount > 50) exitwith {
		["TWC_Insurgency_objCompleted", ["Convoy", (_this select 0)]] call CBA_fnc_serverEvent;};
};
_spawnpos = [getPos _town, 10, 200, 10, 0, 20, 0] call BIS_fnc_findSafePos;
_pos = [getpos _town,[400,500],random 360,0,[1,100]] call SHK_pos;
sleep 1;
_town = townLocationArray call bis_fnc_selectRandom;
_pos2 = getPos _town;
_attemptcount = 0;
while{_pos2 distance2D _pos > 3000  || _pos2 distance2D (getMarkerPos "base") < 2000 || _town in badTownArray}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos2 = getPos _town;
	_attemptcount = _attemptcount + 1;
if (_attemptcount > 50) exitwith {
		["TWC_Insurgency_objCompleted", ["Convoy", (_this select 0)]] call CBA_fnc_serverEvent;};
};
_pos2 = [getpos _town,[400,500],random 360,0,[1,100]] call SHK_pos;
sleep 1;
_town = townLocationArray call bis_fnc_selectRandom;
_pos3 = getPos _town;
_attemptcount = 0;
while{_pos3 distance2D _pos2 > 3000 || _pos3 distance2D (getMarkerPos "base") < 2000 || _town in badTownArray}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos3 = getPos _town;
	_attemptcount = _attemptcount + 1;
if (_attemptcount > 50) exitwith {
		["TWC_Insurgency_objCompleted", ["Convoy", (_this select 0)]] call CBA_fnc_serverEvent;};
};
_pos3 = [getpos _town,[400,500],random 360,0,[1,100]] call SHK_pos;

_markerPos = [_pos, 50] call CBA_fnc_randPos;
_markerstr = createMarker [str (random 1000),_markerPos];
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerShape "Ellipse";
_markerstr setMarkerBrush "Grid";
_markerstr setMarkerSize [1,1];

_markerstr2 = createMarker [str (random 1000),_markerPos];
_markerstr2 setMarkerShape "ICON";
_markerstr2 setMarkerType "MIL_unknown";
_markerstr2 setMarkerColor "colorWest";

_group = createGroup East;

/*
_spawnpos2 = [_spawnpos,[200,300],random 360,0,[1,100]] call SHK_pos;

_chosencar = enemyTechnical call BIS_fnc_selectRandom;
_technical = _chosencar createVehicle _spawnPos;
_truck = "CUP_O_Ural_Reammo_RU" createVehicle _spawnPos2;

_driver = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
_truckdriver = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
_gunner = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
_truckdriver moveInDriver _truck;
_driver moveInDriver _technical;
_gunner moveInGunner _technical;
*/
_total = 15 + random 10;
for "_i" from 1 to _total do{
	_unit = _group createUnit [(twc_heavies select (floor random (count twc_heavies))), _spawnPos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
		["TWC_Insurgency_adjustPoints", 4] call CBA_fnc_serverEvent;
		};
	}];
	
	//_num = _num + 1;
	sleep 0.2;
};

_group setFormation "COLUMN";
_group setSpeedMode "LIMITED";
_group setBehaviour "SAFE";
_group addwaypoint [_pos,0];
_group addwaypoint [_pos2,0];
_group addwaypoint [_pos3,0];
_group addwaypoint [_pos3,0];
 [_group, 4] setWaypointType "CYCLE";



//Creating the task
_taskID = str (random 1000);
[WEST,[_taskID],["A group of infantry consisting of foreign nationals has been spotted patrolling to and from this location. Locate it and neutralise it.","Foreign Fighters"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;




sleep 20;

//Complete
waituntil {{alive _x} count units _group < 5};

sleep 10;
[
	{
		[(_this select 1)] call bis_fnc_deleteTask;
	["TWC_Insurgency_objCompleted", ["Convoy", _objType]] call CBA_fnc_serverEvent;
	},
	[_objType, _taskID, _markerstr, _markerstr2],
	(60 + ((floor random 10) * 6))
] call CBA_fnc_waitAndExecute;

