/*

params["_town"];

//Trigger to identify town
_pos = getPos _town;
_marker = createMarker [str _pos,_pos];
_marker setMarkerShape "Ellipse";
_marker setMarkerBrush "Grid";
_marker setMarkerSize [250,250];
_marker setMarkerColor "colorOpfor";

//Spawning a load of hostiles and the civs
_num = (floor random (count townspawn));
_total = 16;
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
_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;

for "_i" from 1 to 2 do{
	_num = 0;
	_total = 8;
	_group = createGroup East;
	for "_i" from 1 to _total do{
		_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _pos,[], 5,"NONE"];
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

for "_i" from 1 to 4 do{
	_boxType = ["CUP_BAF_IEDBox","Box_IED_Exp_F"];
	_box = (_boxType call bis_fnc_selectRandom) createVehicle _pos;
	clearBackpackCargoGlobal _box;
	_box addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -2] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 2] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustPoints", 15] call CBA_fnc_serverEvent;
		};
	}];
	[_box]spawn{
		params["_box"];
		_pos = getPos _box;
		while{getPos _box distance _pos < 10}do{
			_houseList = (getPos _box) nearObjects ["House",200];
			sleep 0.25;
			_c = 0;
			_house = _houseList call BIS_fnc_selectRandom;
			while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
			if (_c > 0) then {
				_ranNum = floor(random _c);
				_box setPos (_house buildingPos _ranNum);
			};
		};
	};
};

// Creates Trigger that checks when East is dead and awards points
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [300, 300, 0, false];
_trg setTriggerActivation ["EAST", "PRESENT", False];
_trg setTriggerTimeout[2, 2, 2, true];
_trg setTriggerStatements ["count thisList < 4",format["'%1' setMarkerColor 'colorBlufor'; ['TWC_Insurgency_adjustPoints', 50] call CBA_fnc_serverEvent; ['TWC_Insurgency_adjustCivilianMorale', 15] call CBA_fnc_serverEvent;",_marker],""];
*/