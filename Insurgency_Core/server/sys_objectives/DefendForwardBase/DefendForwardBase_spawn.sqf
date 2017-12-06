params ["_objType"];

_playerCount = (count (allPlayers - entities "HeadlessClient_F")) max 1;
_pos = getMarkerPos "respawn_forwardBase";

_time = time;

_taskID = str (random 1000);
[WEST,[_taskID],["Intercepted insurgent communications tell us that an attack on our forward base is imminent.","Defend the Forward Base"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;

[missionNamespace,"respawn_forwardBase"] call BIS_fnc_removeRespawnPosition;

waitUntil {[_pos,400] call twc_fnc_posNearPlayers || _time + 1200 < time};


_BluInBase = false;
if([_pos,400] call twc_fnc_posNearPlayers)then{
	_BluInBase = true;
};

if(_BluInBase)then{
	sleep 240;
	//Calculating total enemies to spawn
	_num = (floor random (count townspawn));
	_total = [_pos] call twc_fnc_calculateSpawnAmount;
for "_i" from 1 to 3 do{
	//Spawning hostiles
	_group = createGroup East;
	_spawnPos = [_pos,300,[0,360]] call SHK_pos;
	for "_i" from 1 to _total do{
		_unit = _group createUnit [(townSpawn select _num), _spawnPos,[], 5,"NONE"];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
			if (side (_this select 1) == WEST) then{
				["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
				["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
			};
		}];
		_unit setVariable ["unitsHome",_pos,false];
		//_num = _num + 1;
		sleep 0.2;
	};
	[_group, (_pos), 40] call CBA_fnc_taskAttack;
};
}else{
	[_pos] call twc_fnc_spawnDefend;
};

_time = time;
_baseControl = 0;

while {_baseControl > -10 && _baseControl < 1}do{
	_obj = nearestObjects [_pos,["Man","Car","Truck"],400];
	_east = east countSide _obj;
	_west = west countSide _obj;
	
	if(_west == 0)then{
		_baseControl = _baseControl - 1;
	};
	if(_east < 5)then{
		_baseControl = 1;
	};
	sleep 60;
};

if(_baseControl == 1)then{
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
	[missionNamespace,"respawn_forwardBase","Forward Base"] call BIS_fnc_addRespawnPosition;
}else{
	["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
	_table = _pos nearObjects ["twc_radioTable",20];
	_table = _table select 0;
	_return = [_table] call twc_fnc_tearDownForwardBase;
	
};
{
	if( str (_x getVariable "unitsHome") == str _pos)then{
		deleteVehicle _x;
		sleep 0.2;
	};
}forEach allUnits;

["TWC_Insurgency_objCompleted", ["DefendForwardBase", _objType]] call CBA_fnc_serverEvent;
[_taskID] call bis_fnc_deleteTask;


