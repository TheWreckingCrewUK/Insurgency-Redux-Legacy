params ["_spawnpos", "_waypoints"];




_vehtype = ["CUP_C_Datsun_4seat", "CUP_C_Skoda_Blue_CIV", "CUP_C_Skoda_White_CIV", "CUP_C_Lada_White_CIV", "CUP_C_Lada_Red_CIV", "CUP_C_Volha_Gray_TKCIV", "CUP_C_Volha_Blue_TKCIV", "CUP_C_Skoda_Blue_CIV", "CUP_C_Skoda_White_CIV", "CUP_C_Lada_White_CIV", "CUP_C_Lada_Red_CIV", "CUP_C_Volha_Gray_TKCIV", "CUP_C_Volha_Blue_TKCIV", "CUP_C_TT650_TK_CIV", "CUP_C_Ural_Civ_03", "CUP_C_TT650_RU", "CUP_C_Ikarus_TKC",
"CUP_C_LR_Transport_CTK"
,"CUP_C_S1203_CIV"
,"CUP_C_V3S_Covered_TKC"
,"CUP_C_Lada_GreenTK_CIV"
,"CUP_C_Lada_TK2_CIV"] call bis_fnc_selectrandom;

_enemyvehs = ["CUP_O_LR_MG_TKA",
"CUP_O_LR_SPG9_TKM"];

if ((random 1) < 0.03) then {
	_vehtype = _enemyvehs  call bis_fnc_selectrandom;;
};




_securepos = twc_basepos;

if ((str (getmarkerpos "respawn_west_forwardbase")) != "[0,0,0]") then {
	if ((_spawnpos distance twc_basepos) > (_spawnpos distance (getmarkerpos "respawn_west_forwardbase"))) then {
		_securepos = (getmarkerpos "respawn_west_forwardbase");
	};
};

if ((_spawnpos distance _securepos) < 1000) exitwith {};


_driver = objnull;
_group = grpnull;
_car = _vehtype createvehicle _spawnpos;

_car setdir (_car getdir (_waypoints select 0));

_enemychance = ((-0.3 + ((_spawnpos distance _securepos) / 10000)) min 0.8);

if (((random 1) < _enemychance) || (_vehtype in _enemyvehs)) then {

	_group = creategroup east;
	
	_driver = _group createUnit [(townspawn call bis_fnc_selectrandom), _spawnpos, [], 10, "NONE"];
	_driver assignasdriver _car;
	_driver moveindriver _car;
	_driver setVariable ["twc_isenemy",1];
	
	_canfit = true;
	
	_passengers = ((count (fullCrew [_car, "cargo", true])) * (random 1)) - 1;
	for "_i" from 0 to _passengers do {
		_unit = _group createUnit [(townspawn call bis_fnc_selectrandom), _spawnpos, [], 10, "NONE"];
		_unit setVariable ["twc_isenemy",1];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
		}];
		_canfit = _unit moveinany _car;
		if (!_canfit) then {
			deletevehicle _unit;
		};
	};
	[leader _group, 1] spawn TWC_fnc_aiscramble;
} else {
	_group = creategroup civilian;
	
	_driver = _group createUnit [(civilianType call bis_fnc_selectrandom), _spawnpos, [], 10, "NONE"];
	_driver assignasdriver _car;
	_driver moveindriver _car;
	
	_canfit = true;
	
	_passengers = ((count (fullCrew [_car, "cargo", true])) * (random 1)) - 1;
	for "_i" from 0 to _passengers do {
		_unit = _group createUnit [(civilianType call bis_fnc_selectrandom), _spawnpos, [], 10, "NONE"];
		_unit setVariable ["twc_isenemy",0];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
		}];
		_canfit = _unit moveinany _car;
		if (!_canfit) then {
			deletevehicle _unit;
		};
	};
};

_driver addEventHandler ["Killed",{
	[(_this select 0)] call twc_fnc_deleteDead;
}];

_car setvariable ["twccivcar_driver",_driver];
_driver setvariable ["twccivcar_car",_car];

_car forceFollowRoad true;
_driver forceFollowRoad true;
_car engineon true;
_car limitspeed 60;

clearweaponcargoglobal _car;
clearmagazinecargoglobal _car;
clearitemcargoglobal _car;
clearbackpackcargoglobal _car;

{
	if ((vehicle _x) == _x) exitwith {
		deletevehicle _x;
	};
	_x addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		[_unit] call twc_fnc_deleteDead;
	}];
} foreach (crew _car);

_array = missionnamespace getvariable ["twc_civcars", []];
_array pushback [_driver, _car];
missionnamespace setvariable ["twc_civcars", _array, true];


_car addEventHandler ["Killed", {
	params ["_car", "_killer", "_instigator", "_useEffects"];
	if ((!([getpos _car, 2000] call twc_fnc_posNearPlayers)) || ((!([getpos _car, 150] call twc_fnc_posNearPlayers)) && (([getposasl _car vectoradd [0,0,(sizeof (typeof _car)) * 0.7]] call twc_fnc_seenbyplayers) == 0))) then {
		deletevehicle _car;
	};
	_array = missionnamespace getvariable ["twc_civcars", []];
	_driver = _car getvariable ["twccivcar_driver",objnull];
	_array deleteat (_array find [_driver, _car]);
	missionnamespace setvariable ["twc_civcars", _array, true];
}];

_car addEventHandler ["GetOut", {
	params ["_car", "_role", "_driver", "_turret"];
	if (!([getpos _car, 1200] call twc_fnc_posNearPlayers)) exitwith {
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array, true];
		deletevehicle _driver;
		{deletevehicle _x} foreach crew _car;
		deletevehicle _car;
	};
	
	if (((damage _car) < 0.8) && (!([getpos _car, 300] call twc_fnc_posNearPlayers))) then {
		_dam = damage _car;
		_car setdamage 0.1;
		_car setdamage 0;
	};
	
	if (!alive _driver) then {
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array, true];
	};
	
}];




twc_fnc_deletecarwhenready = {
	params ["_unit"];
	if ((!([(getpos _unit),300] call twc_fnc_posNearPlayers)) && (([(getpos _unit)] call twc_fnc_seenbyplayers) == 0)) then {
		{deletevehicle _x} foreach crew _unit;
		deletevehicle _unit;
	} else {
		[twc_fnc_deletecarwhenready, [_unit], 30] call CBA_fnc_waitAndExecute;
	};
};
	
[twc_fnc_deletecarwhenready, [_car], 300] call CBA_fnc_waitAndExecute;

twc_fnc_newcarfluffwp = {
	params ["_unit"];
	_group = group _unit;
	_pos = getpos _unit;
	_group setbehaviour "safe";
	if ((!([_pos,200] call twc_fnc_posNearPlayers)) && (([_pos] call twc_fnc_seenbyplayers) == 0) && ((vehicle _unit) == _unit)) exitwith {
		deletevehicle _unit;
		
		
	};
	
	
	
	
	_gop = [(_unit getRelPos [1000, ((random 40) - 20)]), 1000] call twc_fnc_findnearestroad;
	
	if (isnull _gop) exitwith {
		[_unit] call twc_fnc_newcarfluffwp;
	};
	
	_gop = getpos _gop;
	
	if ((_gop distance _pos) > 10) then {
		_wp = _group addwaypoint [(_gop), 4];
		_wp setwaypointstatements ["true", "[this] call twc_fnc_newcarfluffwp;"];
		_wp setwaypointcompletionradius 30;
	} else {
		[twc_fnc_newcarfluffwp, [_unit], 30] call CBA_fnc_waitAndExecute;
	};
};

{
	_wp = _group addwaypoint [_x, 4];
	_wp setwaypointstatements ["true", "[this] call twc_fnc_newcarfluffwp;"];
	_wp setwaypointcompletionradius 30;
} foreach _waypoints;