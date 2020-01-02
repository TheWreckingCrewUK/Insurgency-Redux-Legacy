/*
* Author(s): [TWC] Bosenator | [TWC] jayman
* Hostile Spawner

* Arguments:
* <Array> Position
* <Array> Radus of two numbers to spawn hostiles between.
* <Array> List of units
*
* Return Value:
* <NONE>
*
* Example:
* [getMarkerPos "spawn",[100,200],p1] spawn twc_fnc_spawnAIUnits;
*
* Public: No
*/

//Recieved Parameters
params ["_pos","_groupradius","_thisList", ["_multiplier",1]];

if (twc_campaignmode == 1) then {
	call twc_fnc_commandcheck;
};

//Selects a direction generally oposite of incoming friendlies
//_dir = (_thisList select 0) getDir _pos;
_dir = random 360;

//if ([_pos,200] call twc_fnc_posNearPlayers) exitwith {};

_dir1 = _dir - 30;
_dir2 = _dir + 30;

//Calculating total enemies to spawn
_num = 0;
_total = ([_pos] call twc_fnc_calculateSpawnAmount) * _multiplier;

_side = east;

if (_multiplier == 0.5) then {
_Trg = createTrigger ["EmptyDetector", _pos];


_Trg setTriggerArea [700, 700, 0, false];
_Trg setTriggerActivation ["east", "present", false];
_Trg setTriggerTimeout [0,0,0, true];
_Trg setTriggerStatements ["(count thislist) > 2","if (!isserver) exitwith {};missionnamespace setvariable ['twcenemycount' + (str getpos thistrigger), 1]",""];

_multiplier = 1;

sleep 1;

_count = missionnamespace getvariable ['twcenemycount' + (str (getpos _Trg)), 0];

_isfriend = profilenamespace getvariable ['twcenemytown' + (str _pos), 1];

if ((_count == 0) && (_isfriend == 1)) then {
	
	_side = independent;
} else {
	profilenamespace setvariable ['twcenemytown' + (str _pos), 0];
	saveprofilenamespace;
};
};

[_pos, (str _side)] execvm "Insurgency_Core\server\sys_terp\fnc_terp_enemy.sqf";

//Spawning hostiles
_group = createGroup _side;
//_spawnPos = [_pos,_groupradius,[_dir1,_dir2]] call SHK_pos;
_spawnPos = _pos;

_spawnposarray = [];
_buildings = nearestObjects [_spawnPos, ["House"], 800];
/*
{
	_check = [];
	if ((count _spawnposarray) < (_total * 2)) then {
		_check = [_x] call BIS_fnc_buildingPositions;
		if ((count _check) > 0) then {
			_potential = [getpos _x, 2, 50, 2, true] call twc_fnc_findsneakypos;
			if (((str _potential) != (str _x))) then {
				_spawnposarray pushback _potential;
			};
		};
	};
} foreach _buildings;



systemchat ("aiunits finds " + (str (count _spawnposarray)) + " potentials");
*/
if ((count _buildings) == 0) exitwith {
	//systemchat "no potential, spawnaiunits exiting";
	twc_lastcompletion = time;
};
if (isNil "townSpawn") exitWith {};

for "_i" from 1 to (_total min (count _buildings)) do {
	//_spawnpos = [_pos, 20, 250, 3, true] call twc_fnc_findsneakypos;
	_unit = _group createUnit [(selectRandom townSpawn), ([getpos (_buildings call bis_fnc_selectrandom), 2, 50, 2, true] call twc_fnc_findsneakypos), [], 0, "NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;

		if (side (_this select 1) == WEST) then{
			if (((_this select 0) getvariable ["twc_isenemy", 0]) == 0) then{
				["TWC_Insurgency_adjustInsurgentMorale", 0.25] call CBA_fnc_serverEvent;
				["TWC_Insurgency_adjustCivilianMorale", -0.25] call CBA_fnc_serverEvent;
			} else {
				["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
				["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
			};
		};
	}];
	
	[_unit] spawn twc_fnc_enemychatter;
	
	if (_side == independent) then {
		[_unit] joinsilent _group;
		_unit addEventHandler ["Hit", {
			params ["_unit", "_source", "_damage", "_instigator"];
			if ((isplayer _instigator) && ((side _instigator) == west)) then {
				//independent setFriend [west, 0];
				if (((_unit) getvariable ["twc_isenemy", 0]) == 0) then{
					[getpos _unit] call twc_fnc_betrayal;
				};
			};
		}];
		
		["ace_captiveStatusChanged", {
			params ["_unit", "_state", "_reason"];
			if (((_unit) getvariable ["twc_isenemy", 0]) == 0) then{
				if ((random 1) > 0.4) then {
					[(getpos _unit)] call twc_fnc_betrayal;
				};
			};
		}] call CBA_fnc_addEventHandler;
	_unit setVariable ["twc_isenemy",0, true];
	} else {
	_unit setVariable ["twc_isenemy",1];
	};
	_unit setVariable ["unitsHome",_pos,false];
	//_num = _num + 1;
	//sleep 0.2;
	
};

[leader _group] spawn TWC_fnc_aiscramble;

if (_side != independent) then {

_civg = creategroup civilian;
_fraggertotal = (random 2);

for "_i" from 1 to _fraggertotal do {
	_unit = _civg createUnit [(selectRandom civilianType), ([getpos (_buildings call bis_fnc_selectrandom), 2, 50, 2, true] call twc_fnc_findsneakypos), [], 5, "NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;

		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_unit setVariable ["unitsHome",_pos,false];
	_unit setVariable ["twc_isenemy",1, true];
	//_num = _num + 1;
	_unit addItemtoUniform "CUP_handgrenade_RGD5";
	_unit addItemtoUniform "CUP_handgrenade_RGD5";
	//sleep 0.2;
};
//sleep 1;
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";

units _civg joinsilent _group;
};


	_rem = [];
	
	_gopos = [_pos select 0, _pos select 1, 0];
	/*
	_rem = [_gopos, nil, units _group, 300, 0, false, true] call ace_ai_fnc_garrison;
	if (isnil "_rem") then {
		_rem = units _group;
	};
	
	{
		deletevehicle _x;
	} foreach _rem;
	*/
{
	[_x] call twc_fnc_aispreadout;
} foreach units _group;
	
	sleep 30;
	//[_gopos, nil, units _group, 600, 2, true, false] call ace_ai_fnc_garrison;
{
	[_x] call twc_fnc_aispreadout;
} foreach units _group;
	
	_array1 = [];
	_array2 = [];
	
	{if (random 0.5 > 1) then {_array1 pushback _x} else {_array2 pushback _x};} foreach (units _group);
	
	while {alive (units _group select 0)} do {
	
	_randtime = random 120;
	sleep (120 + _randtime);
	
	//[_gopos, nil, _array1, 600, 2, true, false] call ace_ai_fnc_garrison;
{
	[_x] call twc_fnc_aispreadout;
} foreach _array1;
	
	
	_randtime = random 120;
	sleep (120 + _randtime);
	
	//[_gopos, nil, _array2, 600, 2, true, false] call ace_ai_fnc_garrison;
{
	[_x] call twc_fnc_aispreadout;
} foreach _array2;
};
	