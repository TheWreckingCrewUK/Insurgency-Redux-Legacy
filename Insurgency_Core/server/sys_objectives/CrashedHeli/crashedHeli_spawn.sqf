/*
* Author: [TWC] Jayman
* Helicopter Crash Objective spawner.
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
//Starts by finding a suitable spawn position. Far from players as well as the main base
_pos = [[worldSize/2,worldSize/2,0],[0,5000],[0,360],0] call SHK_pos;
while{([_pos,1000] call twc_fnc_posNearPlayers) || _pos distance2D (getMarkerPos "base") < 1000}do{
	_pos = [[worldSize/2,worldSize/2,0],[0,5000],[0,360],0] call SHK_pos;
};
//Spawning the random helicopter
_heloString = ["RHS_UH60M","UK3CB_BAF_Wildcat_Ah1_CAS_8A","CUP_B_UH1Y_UNA_USMC"] call bis_fnc_selectRandom;
_helo = _heloString createVehicle _pos;
_helo setFuel 0;
_helo setHit ["motor",1];
_helo setVariable ["ace_cookoff_enable",false];

//Creating the markers with their standard ofset
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
_markerstr2 setMarkerText "Crashed Helicopter";

//Spawning the searching hostiles
_enemyGroups = [];
for "_i" from 1 to 3 do{
	_num = 0;
	_total = 8;
	_group = createGroup East;
	for "_i" from 1 to _total do{
		_unit = _group createUnit [(townSpawn select _num), _pos,[], 5,"NONE"];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
			if (side (_this select 1) == WEST) then{
				["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
				["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
			};
		}];
		_unit setVariable ["unitsHome",_pos,false];
		_num = _num + 1;
		sleep 0.2;
	};
	[_group, _pos, 300, 3, "MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;
	_enemyGroups pushback _group;
};

//Randomly chooses between the two seperate missions
_random = round (random 100);
	
//First one is both pilots are dead but we should retrive the crates before
if(_random <= 33)exitWith{
	
//Spawning dead pilots for immersion then adding crates to the helo
	_group = createGroup West;
	_unit1 = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
	_unit1 moveInDriver _helo;
	_unit1 setDamage 1;
	_unit2 = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
	_unit2 setDamage 1;
	for "_i" from 1 to 3 do{
		_crateString = twc_scoreableAmmoBoxes call bis_fnc_selectRandom;
		_crate = _crateString createVehicle _pos;
		[_crate,_helo] call ace_cargo_fnc_loadItem;
	};
	
	//Creating the task
	_taskID = str (random 1000);
	[WEST,[_taskID],["A friendly helicopter has crashed dropping supplies. We should secure them before the insurgents do.","Helicopter Crash"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;
		
	//The main Waituntil for blufor to complete
	_time = time + 1200;
	waitUntil{time > _time || [_helo,200] call CBA_fnc_nearPlayer};
		
	//If blu is near they don't lose points, but it waits until they seperate for deletion of helo
	if (([_helo,200] call CBA_fnc_nearPlayer)) then {
		waitUntil{!([_helo,200] call CBA_fnc_nearPlayer)};			
	}else{
		["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
	};
		
	//We delete the men since we don't need them anymore
	deleteVehicle _unit1;
	deleteVehicle _unit2;
};

//Next one is two injured pilots. We need to rescue them.
if(_random > 33)exitWith{
	
//Spawning the units and injuring them
	_group = createGroup West;
	_unit1 = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
	_unit1 moveInDriver _helo;
	for "_i" from 1 to 5 do {
		[_unit1,random 0.8,["vehiclecrash"]] call twc_fnc_aiWounds;
	};
	_unit1 addEventHandler ["killed",{
		["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
	}];
	[_unit1,true,1800,true] call ace_medical_fnc_setUnconscious;
	_unit2 = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
	for "_i" from 1 to 5 do {
		[_unit2,random 0.8,["vehiclecrash"]] call twc_fnc_aiWounds;
	};
	_unit2 addEventHandler ["killed",{
		["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
	}];
	[_unit2,true,1800,true] call ace_medical_fnc_setUnconscious;
	
	//Creating the task. It is frashed slightly different
	_taskID = str (random 1000);
	[WEST,[_taskID],["A friendly helicopter has crashed, but the crew survived. We should rescue them before the insurgents get to them.","Helicopter Crash"],_markerstr2,0,2,True] call BIS_fnc_taskCreate;
		
	//Main wait
	_time = time + 1200;
	waitUntil{time > _time || [_helo,200] call CBA_fnc_nearPlayer};
	
	//If blufor is near they dont lose points
	if (([_helo,200] call CBA_fnc_nearPlayer)) then {
		waitUntil{!([_helo,200] call CBA_fnc_nearPlayer)};
	}else{
		["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
	};
};
	
//Ran by all Version.	
{
	_y = _x;
	{
		deleteVehicle _x;
	}forEach units _y;

}forEach _enemyGroups;
	
deleteVehicle _helo;
deleteMarker _markerstr;
deleteMarker _markerstr2;
{deleteGroup _x}forEach allGroups;
[_taskID] call bis_fnc_deleteTask;
["TWC_Insurgency_objCompleted", ["CrashedHeli", _objType]] call CBA_fnc_serverEvent;