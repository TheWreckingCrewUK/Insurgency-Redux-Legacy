params ["_objType"];

//Selects a random town then makes sure it is far enough from base and friendlies
_town = townLocationArray call bis_fnc_selectRandom;
_pos = getPos _town;
while{([_pos,500] call twc_fnc_posNearPlayers) || _pos distance2D (getMarkerPos "base") < 1000 || _town in badTownArray}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos = getPos _town;
};
//Creating the truck

_vehicle = (getDescription (((getMarkerPos "base") nearobjects ["car", 300]) call bis_fnc_selectRandom)) select 0;

if(isNil "_vehicle") then{
_vehicle = ((getMarkerPos "base") nearobjects ["car", 500]) call bis_fnc_selectRandom;
};
//{(_target (distance (getMarkerPos "base")) < 40)}
_pos = [getPos _town,[0,200],[0,360],0] call SHK_pos;
_veh = _vehicle createVehicle _pos;
/*
{_recaction = ["ActionRescuevehicle","Recover Vehicle","",{["TWC_Insurgency_adjustPoints", 40] call CBA_fnc_serverEvent; deleteVehicle _target},{((GetPos player) distance (getMarkerPos "base") < 40)}] call ace_interact_menu_fnc_createAction;

[_veh,0,["ACE_MainActions"],_recaction] call ace_interact_menu_fnc_addActionToObject;}

["Hello World","hint",true,true] call BIS_fnc_MP;
*/

clearItemCargoGlobal _veh;
//Spawning the enemies
[_veh]spawn{
_veh = (_this select 0);
_num = floor (random 10);
	for "_i" from 1 to _num do{
		_veh setHitIndex [floor (random 10),1];		
	};
};

_veh setfuel random 1;

//Adds a marker with a bit of an ofset
_markerPos = [_pos, 200] call CBA_fnc_randPos;

_markerstr = createMarker [str (random 1000),_markerPos];
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerShape "Ellipse";
_markerstr setMarkerBrush "Grid";
_markerstr setMarkerSize [200,200];

_markerstr2 = createMarker [str (random 1000),_markerPos];
_markerstr2 setMarkerShape "ICON";
_markerstr2 setMarkerType "MIL_unknown";
_markerstr2 setMarkerColor "colorWest";
_markerstr2 setMarkerText "Vehicle Recovery";

//Creating the task
_taskID = str (random 1000);
[WEST,[_taskID],["Allied Forces Have Had To Abandon A Vehicle In This Area. It May Be Damaged. Bring It Back To Base In Whatever Condition You Can.","Recovery"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;


_num = 0;
sleep 3;

[_veh, _markerstr, _markerstr2, _objType, _taskID]spawn{
_veh = (_this select 0);
_markerstr = (_this select 1);
_markerstr2 = (_this select 2);
_objType = (_this select 3);
_taskID = (_this select 4);

	waituntil{((GetPos _veh) distance (getMarkerPos "base") < 100)};
	sleep 60;
	deletevehicle _veh;
	["TWC_Insurgency_objCompleted", ["Recovery", _objType]] call CBA_fnc_serverEvent;
	deleteMarker _markerstr;
	deleteMarker _markerstr2;
	[_taskID] call bis_fnc_deleteTask;
	["TWC_Insurgency_adjustPoints", 40] call CBA_fnc_serverEvent;

};

_nearest=objNull;
_nearestdist=200;
{
	_dist=vehicle _x distance _pos;
	if (isPlayer _x and _dist<_nearestdist) then {
		_nearest=_x;
		_nearestdist=_dist;
	};
} forEach allPlayers;
[_pos,2,[200,300],[_nearest]] spawn twc_spawnAIUnits;

//Complete or fail
if(isNil "_veh")exitWith{};

waitUntil {(!alive _veh)};
sleep 30;
//End of Tasks tuff
["TWC_Insurgency_objCompleted", ["Recovery", _objType]] call CBA_fnc_serverEvent;
deleteMarker _markerstr;
deleteMarker _markerstr2;
deleteVehicle _veh;
[_taskID] call bis_fnc_deleteTask;

//If vip is returned then it exits not hurting score
if(isNil "_veh")exitWith{};

["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
