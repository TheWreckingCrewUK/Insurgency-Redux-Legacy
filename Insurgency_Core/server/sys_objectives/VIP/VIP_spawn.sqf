/*
* Author: [TWC] Jayman
* VIP Objective Creator 
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
//Finds the random building position away from base and not near players
_pos = [0,0,0];

_houseList = [(worldSize / 2),(worldSize / 2)] nearObjects ["House",(sqrt 2 *(worldSize / 2))];

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


//Creating the VIP
_group = createGroup civilian;
_vip = _group createUnit ["C_journalist_F",_pos,[],0,"NONE"];

/*
_name = (["vip_1", "vip_2", "vip_3", "vip_4", "vip_5"] call bis_fnc_selectrandom);

[_vip, _name] remoteExec ["setIdentity", 0];
*/
_name = selectrandom ["Ross Kemp", "Jeremy Corbyn", "Jay Man", "Brad Pitt", "Robert Paulson", "John Lennon", "Mike Wazowski", "Uvuvwevwevwe Onyetenyevwe Ugwemuhwem Osas"];
_vip setVariable ["ace_nameraw", _name, true];
_vip setVariable ["ace_name", _name, true];


_vip allowdamage false;
[_vip, true] call ACE_captives_fnc_setHandcuffed;
//[_vip, true] call ACE_captives_fnc_setSurrendered;
_vip setVariable ["twc_isenemy",0, true];


//Adds a Marker with a bit of an offset so players know where to go
_markerPos = [_pos, 2] call CBA_fnc_randPos;


		if (isserver && hasinterface) then {
			_intelPos = _pos;
			_marker = createMarker [(str (random 1000)), _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor "colorWest";
			_marker setMarkerText "Hostage";
			_marker setMarkerSize [0.5,0.5];
		};

_id = [_markerpos, "Hostage"];

twc_activemissions pushback _id;
publicVariable "twc_activemissions";

_randsize = 650 + (random 100);
_randtime = 10;
_trg2 = createTrigger ["EmptyDetector", _pos];
_trg2 setTriggerArea [_randsize, _randsize, 30, false];
_trg2 setTriggerActivation ["west", "PRESENT", True];
_trg2 setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg2 setTriggerStatements ["({(_x getvariable ['twc_isterp', 0] == 1)} count thislist) > 0","_id = thistrigger getvariable ['twc_vipid', 'none'];[getpos thistrigger, _id] execvm 'Insurgency_Core\server\sys_terp\fnc_terp_vip.sqf'",""];

_trg2 setvariable ["twc_vipid", _id, true];
_vip setvariable ["twchvttrg2", _trg2, true];
_trg2 setvariable ["twc_vipobjtype", _objType, true];

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
_markerstr2 setMarkerText "Hostage Rescue";
*/
_spawntime = time;
//Spawning the enemies
[_pos]spawn{
_pos = (_this select 0);
_num = 0;
_total = 10;
_group = createGroup East;
	for "_i" from 1 to _total do{
		_unit = _group createUnit [(townspawn select (floor random (count townspawn))), _pos,[], 5,"NONE"];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
			if (side (_this select 1) == WEST) then{
				InsP_enemyMorale = InsP_enemyMorale + 0.06; publicVariable "InsP_enemyMorale";
			};
		}];
//		_unit addMagazines ["handGrenade",2];
		_unit setVariable ["unitsHome",_pos,false];
		_unit setVariable ["twc_isenemy",1];
		_unit setUnitPos "UP";
		//_num = _num + 1;
		sleep 0.2;
	};
//	[leader _group, 1] spawn TWC_fnc_aiscramble;
	
	_units = [_pos, nil, units _group, 5, 1, false, true] call ace_ai_fnc_garrison;

	[_group, _pos, 100, 3, 0.1] call CBA_fnc_taskDefend;
};


sleep 10;
_vip allowdamage true;




_vip addEventHandler ["Killed", {
	params ["_vip", "_killer", "_instigator", "_useEffects"];
	_trg2 = _vip getvariable ["twchvttrg2", objnull];
	_id = _trg2 getvariable ["twc_vipid", 0];
	_objType = _trg2 getvariable ["twc_vipobjtype", "0"];
	["TWC_Insurgency_objCompleted", ["VIP", _objType]] call CBA_fnc_serverEvent;
	
	deletevehicle _trg2;
	["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
	twc_activemissions deleteAt (twc_activemissions find _id);
	publicVariable "twc_activemissions";
	
	[_vip] spawn twc_fnc_deletedead;
	_taskID = str (random 1000);
	[WEST,[_taskID],["A member of the press was captured by insurgents, and later died","Hostage Rescue"],(getpos _vip),"CREATED",2,true] call BIS_fnc_taskCreate;

	[_taskID,"Failed", true] call BIS_fnc_taskSetState;
	
}];
