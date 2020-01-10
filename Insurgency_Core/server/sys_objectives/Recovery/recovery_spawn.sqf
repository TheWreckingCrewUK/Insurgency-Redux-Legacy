params ["_objType"];

//Selects a random town then makes sure it is far enough from base and friendlies
_town = townLocationArray call bis_fnc_selectRandom;
_pos = _town;
while{([_pos,500] call twc_fnc_posNearPlayers) || _pos distance2D (getMarkerPos "base") < 1000 || _town in badTownArray}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos = _town;
};
//Creating the truck

_vehicle = (getDescription (((getMarkerPos "base") nearobjects ["car", 300]) call bis_fnc_selectRandom)) select 0;

if(isNil "_vehicle") then{
	["TWC_Insurgency_objCompleted", ["Recovery", _objType]] call CBA_fnc_serverEvent;
};
//{(_target (distance (getMarkerPos "base")) < 40)}
_pos = [_town, 1, 150, 7, 0, 0.7, 0] call BIS_fnc_findSafePos;
_veh = _vehicle createVehicle _pos;
/*
{_recaction = ["ActionRescuevehicle","Recover Vehicle","",{["TWC_Insurgency_adjustPoints", 40] call CBA_fnc_serverEvent; deleteVehicle _target},{((GetPos player) distance (getMarkerPos "base") < 40)}] call ace_interact_menu_fnc_createAction;

[_veh,0,["ACE_MainActions"],_recaction] call ace_interact_menu_fnc_addActionToObject;}

["Hello World","hint",true,true] call BIS_fnc_MP;
*/

clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
//Spawning the enemies
[_veh]spawn{
_veh = (_this select 0);
_num = floor (random 10);
	for "_i" from 1 to _num do{
		_veh setHitIndex [floor (random 10),1];		
	};
};

_veh setfuel random 1;
[_veh, 0, -180 + (random 360)] call BIS_fnc_setPitchBank;

//Adds a marker with a bit of an ofset
_markerPos = [_pos, 200] call CBA_fnc_randPos;

_id = [_markerpos, "Recovery"];

twc_activemissions pushback _id;
publicVariable "twc_activemissions";


/*
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
*/

_num = 0;
sleep 3;

_spawntime = time;

[_veh, _objType, _id]spawn{
_veh = (_this select 0);
_objType = (_this select 1);
_id = (_this select 2);

	//waituntil{((GetPos _veh) distance (getMarkerPos "base") < 100)};
	while {((GetPos _veh) distance (getMarkerPos "base") > 100)} do {
		sleep 60;
	};
	_veh remoteExecCall ["deleteVehicle",_veh];
	["TWC_Insurgency_objCompleted", ["Recovery", _objType]] call CBA_fnc_serverEvent;
	deleteMarker _markerstr;
	deleteMarker _markerstr2;
	[_taskID] call bis_fnc_deleteTask;
	["TWC_Insurgency_adjustPoints", 40] call CBA_fnc_serverEvent;
	//Creating the task
	
_taskID = str (random 1000);
[WEST,[_taskID],["Allied forces had to abandon a vehicle in this area. It has since been recovered by our forces.","Recovery"],_markerstr2,"CREATED",2,false] call BIS_fnc_taskCreate;

	[_taskID,"Succeeded"] call BIS_fnc_taskSetState;
		twc_activemissions deleteAt (twc_activemissions find _id);
publicVariable "twc_activemissions";

};
/*
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
*/

//Complete or fail
if(isNil "_veh")exitWith{};


//wait 60 seconds and see if the vehicle is still alive after spawn, if it's dead then just cancel the task without any reward/penalty
waituntil {time > (_spawntime + 60)};
	if (!alive _veh) exitwith {
["TWC_Insurgency_objCompleted", ["Recovery", _objType]] call CBA_fnc_serverEvent;
	
		twc_activemissions deleteAt (twc_activemissions find _id);
publicVariable "twc_activemissions";
};



while {(alive _veh)} do {
	sleep 30;
};

if (!(_id in twc_activemissions)) exitwith {};

//End of Tasks tuff
["TWC_Insurgency_objCompleted", ["Recovery", _objType]] call CBA_fnc_serverEvent;
_taskID = str (random 1000);
[WEST,[_taskID],["Allied forces have had to abandon a vehicle in this area. It has since been destroyed.","Recovery"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;

	[_taskID,"Failed"] call BIS_fnc_taskSetState;
		twc_activemissions deleteAt (twc_activemissions find _id);

deleteVehicle _veh;


//If vip is returned then it exits not hurting score
if(isNil "_veh")exitWith{};

["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
