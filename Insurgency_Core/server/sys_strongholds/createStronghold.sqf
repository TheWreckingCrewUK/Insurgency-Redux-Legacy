params["_town"];

_pos = getPos _town;
_marker = createMarker [str _pos,_pos];
_marker setMarkerShape "Ellipse";
_marker setMarkerBrush "Grid";
_marker setMarkerSize [250,250];
_marker setMarkerColor "colorOpfor";

_num = 0;
_total = 21;
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
	_unit addMagazines ["handGrenade",2];
	_unit setVariable ["unitsHome",_pos,false];
	_num = _num + 1;
	sleep 0.2;
};
[_group, _group, 150, 3, false] call CBA_fnc_TaskDefend;

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
	[_group, _pos, 150, 3, "MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;
};
[_pos, 5, 75] call twc_spawnCiv;

// Creates Trigger that checks when East is dead and awards points
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [300, 300, 0, false];
_trg setTriggerActivation ["EAST", "NOT PRESENT", False];
_trg setTriggerTimeout[2, 2, 2, true];
_trg setTriggerStatements ["this",format["'%1' setMarkerColor 'colorBlufor'; ['TWC_Insurgency_adjustPoints', 50] call CBA_fnc_serverEvent; ['TWC_Insurgency_adjustCivilianMorale', 15] call CBA_fnc_serverEvent;",_marker],""];