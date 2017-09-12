_badPos = true;
_pos = [0,0,0];
while{_badPos}do{
	_badPos = false;
	_pos = [[worldSize/2,worldSize/2,0],[0,5000],[0,360],0] call SHK_pos;
	{
		if(_pos distance2D _x < 1000) then{
			_badPos = true;
		};
	}forEach (allPlayers - entities "HeadlessClient_F");
};
_heloString = ["RHS_UH60M","UK3CB_BAF_Wildcat_Ah1_CAS_8A","CUP_B_UH1Y_UNA_USMC"] call bis_fnc_selectRandom;
_helo = _heloString createVehicle _pos;

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
call{
	if(_random < 101)exitWith{
		_group = createGroup West;
		_unit = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
		_unit moveInDriver _helo;
		_unit setDamage 1;
		_unit = _group createUnit ["B_Helipilot_F",_pos,[],0,"NONE"];
		_unit setDamage 1;
		_cratesArray = [];
		for "_i" from 0 to 3 do{
			_crateString = ["Box_NATO_Ammo_F","ACE_medicalSupplyCrate","Box_Nato_AmmoOrd_F"] call bis_fnc_selectRandom;
			_crate = _crateString createVehicle _pos;
			_cratesArray pushBack _crate;
		};
	};
};
_time = time + 1200;
waitUntil{time > _time || [_helo,200] call CBA_fnc_nearPlayer};
if (([_helo,200] call CBA_fnc_nearPlayer)) then {
	[_helo,_group,_cratesArray,_markerstr,_markerstr2] spawn{waitUntil {!([_helo,200] call CBA_fnc_nearPlayer)}; deleteVehicle (_this select 0); {deleteVehicle _x}forEach (units (_this select 1) + (_this select 2)); deleteMarker (_this select 3); deleteMarker (_this select 4)};
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
}else{
	["TWC_Insurgency_adjustPoints", -20] call CBA_fnc_serverEvent;
	deleteVehicle _helo;
	{
		deleteVehicle _x;
	}forEach ((units _group) + _cratesArray);
	deleteMarker _markerstr;
	deleteMarker _markerstr2;
};
["TWC_Insurgency_objCompleted", "CrashedHeli"] call CBA_fnc_serverEvent;