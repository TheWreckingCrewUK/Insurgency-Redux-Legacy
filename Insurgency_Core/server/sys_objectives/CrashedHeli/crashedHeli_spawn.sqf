_pos = [[worldSize/2,worldSize/2,0],[0,5000],[0,360],0] call SHK_pos;
while{([_pos,1000] call twc_fnc_posNearPlayers)}do{
	_pos = [[worldSize/2,worldSize/2,0],[0,5000],[0,360],0] call SHK_pos;
};
_heloString = ["RHS_UH60M","UK3CB_BAF_Wildcat_Ah1_CAS_8A","CUP_B_UH1Y_UNA_USMC"] call bis_fnc_selectRandom;
_helo = _heloString createVehicle _pos;
_helo setVariable ["ace_cookoff_enable",false];

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

_random = random 100;
_unit1 = true;
_unit2 = true;
_cratesArray = [];
call{
	if(_random < 33)exitWith{
		_group = createGroup West;
		_unit1 = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
		_unit1 moveInDriver _helo;
		_unit1 setDamage 1;
		_unit2 = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
		_unit2 setDamage 1;
		for "_i" from 1 to 3 do{
			_crateString = ["Box_NATO_Ammo_F","ACE_medicalSupplyCrate","Box_Nato_AmmoOrd_F"] call bis_fnc_selectRandom;
			_crate = _crateString createVehicle _pos;
			_cratesArray pushBack _crate;
		};
		_taskID = str (random 1000);
		[WEST,[_taskID],["A friendly helicopter has crashed dropping supplies. We should secure them before the insurgents do.","Helicopter Crash"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;
		
		_time = time + 1200;
		waitUntil{time > _time || [_helo,200] call CBA_fnc_nearPlayer};
		if (([_helo,200] call CBA_fnc_nearPlayer)) then {
			[_helo,[_unit1,_unit2],_cratesArray,_markerstr,_markerstr2] spawn{waitUntil {!([(_this select 0),200] call CBA_fnc_nearPlayer)}; deleteVehicle (_this select 0); {if([_x,200] call CBA_fnc_nearPlayer)then{}else{deleteVehicle _x}}forEach (_this select 1) + (_this select 2); deleteMarker (_this select 3); deleteMarker (_this select 4); ["TWC_Insurgency_objCompleted", "CrashedHeli"] call CBA_fnc_serverEvent;};
			["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
		}else{
			["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
			deleteVehicle _helo;
			{
				deleteVehicle _x;
			}forEach ([_unit1,_unit2] + _cratesArray);
			deleteMarker _markerstr;
			deleteMarker _markerstr2;
			["TWC_Insurgency_objCompleted", ["CrashedHeli"]] call CBA_fnc_serverEvent;
		};
	};
	if(_random < 101)exitWith{
		_group = createGroup West;
		_unit = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
		_unit moveInDriver _helo;
		for "_i" from 1 to 5 do {
			[_unit,random 0.8,["vehiclecrash"]] call twc_fnc_aiWounds;
		};
		_unit addEventHandler ["killed",{
			["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
		}];
		[_unit,true,600,true] call ace_medical_fnc_setUnconscious;
		_unit2 = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
		for "_i" from 1 to 5 do {
			[_unit,random 0.8,["vehiclecrash"]] call twc_fnc_aiWounds;
		};
		_unit addEventHandler ["killed",{
			["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
		}];
		[_unit,true,600,true] call ace_medical_fnc_setUnconscious;
		
		_taskID = str (random 1000);
		[WEST,[_taskID],["A friendly helicopter has crashed, but the crew survived. We should rescue them before the insurgents get to them.","Helicopter Crash"],_markerstr2,0,2,true] call BIS_fnc_taskCreate;
		
		_time = time + 1200;
		waitUntil{time > _time || [_helo,200] call CBA_fnc_nearPlayer};
		if (([_helo,200] call CBA_fnc_nearPlayer)) then {
			["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
			[_helo,_markerstr,_markerstr2] spawn {waitUntil {!([_this select 0,200] call CBA_fnc_nearPlayer)}; deleteMarker (_this select 1); deleteMarker (_this select 2);deleteVehicle (_this select 0)};
		}else{
			["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
			deleteVehicle _helo;
			{
				deleteVehicle _x;
			}forEach ([_unit1,_unit2] + _cratesArray);
			deleteMarker _markerstr;
			deleteMarker _markerstr2;
			["TWC_Insurgency_objCompleted", ["CrashedHeli"]] call CBA_fnc_serverEvent;
		};
	};
};
[_taskID] call bis_fnc_deleteTask;