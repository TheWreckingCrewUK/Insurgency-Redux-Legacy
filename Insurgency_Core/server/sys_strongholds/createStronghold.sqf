

params["_town"];

//Trigger to identify town
_pos = getPos _town;
/*
_marker = createMarker [str _pos,_pos];
_marker setMarkerShape "Ellipse";
_marker setMarkerBrush "Grid";
_marker setMarkerSize [250,250];
_marker setMarkerColor "colorOpfor";
*/

if (worldname == "zargabad") exitwith {};


_id = [_pos, "Stronghold"];
twc_activestrongholds pushback _id;
publicVariable "twc_activestrongholds";
_rand = (str random 1000);

missionNamespace setVariable [format["stronghold_%1", _rand], 5];

_randsize = 650 + (random 100);
_randtime = 10;
_trg2 = createTrigger ["EmptyDetector", _pos];
_trg2 setTriggerArea [_randsize, _randsize, 30, false];
_trg2 setTriggerActivation ["west", "PRESENT", True];
_trg2 setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg2 setTriggerStatements ["(VEHICLE twc_terp) in thislist","[nearestObjects [thistrigger, ['soldiergb'], 500], getpos thistrigger] execvm 'Insurgency_Core\server\sys_terp\fnc_terp_stronghold.sqf'",""];


//Spawning a load of hostiles and the civs

[_pos, 2, 500] execvm "Insurgency_Core\server\func\fnc_spawnTechnicals.sqf";

_num = 0;
_total = 15;
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
	_unit addMagazines ["handGrenade",2];
	_unit setVariable ["unitsHome",_pos,false];
	_num = _num + 1;
	sleep 0.2;
};
	{[_pos, nil, [_x], 200, 2, true, true] call ace_ai_fnc_garrison;} foreach units _group;
_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;

for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit ["CUP_O_TK_INS_Soldier_AA", _pos,[], 25,"NONE"];
};
};


for "_i" from 1 to 7 do{
	_num = 0;
	_total = 5 + random 5;
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
	if (random 1 > 2) then {
	[_group, _pos, 400, 5, "MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;}
	else
	{
	{[_pos, nil, [_x], 200, 2, true, true] call ace_ai_fnc_garrison;} foreach units _group;
	//using the inferior cba defence function after the ace garrison teleport, so that if ace can't find a building then cba takes over
	[_group, _pos, 300, 3, 0.5, 0.5] call CBA_fnc_taskDefend;
	};
};
//[_pos, 5, 75] call twc_spawnCiv;



/*
_housecheck = (_pos) nearObjects ["House",200];
if(count _housecheck > 0) then{

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
};

*/

_idpos = twc_activestrongholds find _id;
// Creates Trigger that checks when East is dead and awards points
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [300, 300, 0, false];
_trg setTriggerActivation ["EAST", "PRESENT", False];
_trg setTriggerTimeout[2, 2, 2, true];
_trg setTriggerStatements ["count thisList < 4",format ["
['TWC_Insurgency_adjustPoints', 50] call CBA_fnc_serverEvent;

_taskID = (str random 1000);

[WEST,[_taskID],['Reconnaissance identified a large stronghold which was later destroyed by friendly forces','Stronghold'],(getpos thistrigger),0,2,true] call BIS_fnc_taskCreate;

	[_taskID,'Succeeded'] call BIS_fnc_taskSetState;
	
	missionNamespace setVariable [format['stronghold_%1', %1], 2];
['TWC_Insurgency_adjustCivilianMorale', 15] call CBA_fnc_serverEvent;", _rand],""];

waituntil {
	(missionNamespace getVariable [format['stronghold_%1', _rand], 0]) == 2};

deletevehicle _trg2;

		twc_activestrongholds deleteAt (twc_activestrongholds find _id);
publicVariable 'twc_activestrongholds';
