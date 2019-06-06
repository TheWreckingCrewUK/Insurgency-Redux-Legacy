

_a = missionnamespace getvariable ["twc_civcars", []];
while {(((count _a) > 7) || ((count allplayers) == 0) || ((time) < 120))} do {
	sleep 60;
	_a = missionnamespace getvariable ["twc_civcars", []];
};

_pos = [];

_amount = 3000;

if ((missionnamespace getvariable ["twccancelcars", 0]) == 1) exitwith {};


while {(((count _pos) == 0) && (_amount < 4000))} do {
	{
		if ((!([getpos _x, 2500] call twc_fnc_posNearPlayers)) && ([getpos _x, _amount] call twc_fnc_posNearPlayers) && (((getpos _x) distance twc_basepos) > 1000) && ((random 1) > 0.7)) then {
			_pos = getpos _x;
		};
	} foreach townLocationArray;
	_amount = _amount + 300;
	//systemchat str _amount;
};
if (_amount > 3900) exitwith {sleep 120; execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf";};
//systemchat "search complete2";

_vehtype = ["CUP_C_Datsun_4seat", "UK3CB_Civ_LandRover_Soft_Red_A", "CUP_C_Skoda_Blue_CIV", "CUP_C_Skoda_White_CIV", "CUP_C_Lada_White_CIV", "CUP_C_Lada_Red_CIV", "CUP_C_Volha_Gray_TKCIV", "CUP_C_Volha_Blue_TKCIV", "CUP_C_Datsun_4seat", "UK3CB_Civ_LandRover_Soft_Red_A", "CUP_C_Skoda_Blue_CIV", "CUP_C_Skoda_White_CIV", "CUP_C_Lada_White_CIV", "CUP_C_Lada_Red_CIV", "CUP_C_Volha_Gray_TKCIV", "CUP_C_Volha_Blue_TKCIV", "CUP_C_TT650_TK_CIV", "CUP_C_Ural_Civ_03", "CUP_C_TT650_RU", "CUP_C_Ikarus_TKC"] call bis_fnc_selectrandom;


_val = 15000;
_player = objnull;


{
	if (((side _x) == west) && (alive _x) && ((_pos distance _x) < _val)) then {
		_player = _x;
	};
} foreach allplayers;

if (_player == objnull) exitwith {
		sleep 120; execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf"};
		
_spawnpos = [_pos, 200, (random 360), 0, [1,1000],_vehtype] call SHK_pos;
		
if ((speed _player) > 30) then {
	//systemchat "player travelling1";
	_d = getdir (vehicle _player);
	//_pos = _pos getpos [(3000), _d];
	_spos = [_pos, random 500, (_d + (random 30) - 15), 0, [1,1000],_vehtype] call SHK_pos;
	while {((([_spos, 2000] call twc_fnc_posNearPlayers)) || (!([_spos, 5000] call twc_fnc_posNearPlayers)) || (((_spos) distance twc_basepos) < 1000) || ((count _spos)== 0))} do {
		//_spos = [_pos, 1500] call CBA_fnc_randPos;
		_spos =  [_pos, (1000 + (random 1500)), (random 360), 0, [1,2500],_vehtype] call SHK_pos;
	};
	_pos = [_spos, 500, (random 360), 0, [1,1500],_vehtype] call SHK_pos;;
	_spawnpos = _pos;
	//systemchat str (_spos distance player);
};



_car = _vehtype createvehicle _spawnpos;

_group = creategroup civilian;
_driver = _group createUnit [(civilianType select (floor random (count civilianType))), _pos, [], 10, "NONE"];

_driver assignasdriver _car;
_driver moveindriver _car;

_car setvariable ["twccivcar_driver",_driver];
_driver setvariable ["twccivcar_car",_car];

_car forceFollowRoad true;
_driver forceFollowRoad true;
_car limitspeed 60;

clearweaponcargoglobal _car;
clearmagazinecargoglobal _car;
clearitemcargoglobal _car;
clearbackpackcargoglobal _car;

[_car] spawn {
	params ["_car"];
	sleep 150;
	if (!([_car, 3000] call twc_fnc_posNearPlayers)) then {
		_array = missionnamespace getvariable ["twc_civcars", []];
		_driver = _car getvariable ["twccivcar_driver",objnull];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
		deletevehicle _car;
	};
};

_array = missionnamespace getvariable ["twc_civcars", []];
_array pushback [_driver, _car];
missionnamespace setvariable ["twc_civcars", _array];

_car addEventHandler ["Killed", {
	params ["_car", "_killer", "_instigator", "_useEffects"];
	if (!([getpos _car, 2000] call twc_fnc_posNearPlayers)) then {
		deletevehicle _car;
	};
	_array = missionnamespace getvariable ["twc_civcars", []];
	_driver = _car getvariable ["twccivcar_driver",objnull];
	_array deleteat (_array find [_driver, _car]);
	missionnamespace setvariable ["twc_civcars", _array];
}];

_car addEventHandler ["GetOut", {
	params ["_car", "_role", "_driver", "_turret"];
	if (!([getpos _car, 1200] call twc_fnc_posNearPlayers)) exitwith {
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
		deletevehicle _car;
		deletevehicle _driver;
	};
	
	if (((damage _car) < 0.5) && (!([getpos _car, 300] call twc_fnc_posNearPlayers))) then {
		_dam = damage _car;
		_car setdamage (_dam + 0.2);
		_car setdamage _dam;
	};
	
	if (!alive _driver) then {
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
	};
}];


_driver addEventHandler ["Killed", {
	params ["_driver", "_killer", "_instigator", "_useEffects"];
	if (!([getpos _driver, 2000] call twc_fnc_posNearPlayers)) then {
		_car = _driver getvariable ["twccivcar_car", objnull];
		deletevehicle _car;
		deletevehicle (_driver);
	};
	_array = missionnamespace getvariable ["twc_civcars", []];
	_array deleteat (_array find [_driver, _car]);
	missionnamespace setvariable ["twc_civcars", _array];
}];

_val = 15000;
_player = _car;


{
	if (((side _x) == west) && (alive _x) && ((_car distance _x) < _val)) then {
		_player = _x;
	};
} foreach allplayers;

if (_player == _car) exitwith {
		deletevehicle (_car);
		deletevehicle (_driver);
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
		sleep 120; execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf"};

_speed = speed _player;
_dir = _car getdir _player;

_gopos1 = _car getpos [(_amount * 2), _dir];

if ((_speed > 50) && ((random 1) < 0.3)) then {
	_dir =_dir + 180;
	//systemchat "run away";
	_gopos1 = ([(getpos _car), 1500, _dir, 0, [2,700],_vehtype] call SHK_pos);
} else {
	
	_gopos1 = ([(getpos _player), 500, (random 360), 0, [2,2000],_vehtype] call SHK_pos);
};

_car setdir _dir;

//_gopos1 = _car getpos [(_amount * 2), _dir];


//_gopos1 = ([(getpos _player), 500, (random 360), 0, [2,2000],_vehtype] call SHK_pos);
if (count _gopos1 == 0) exitwith {systemchat "wp fail";
		deletevehicle (_car);
		deletevehicle (_driver);
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
		sleep 120; execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf"};

_wp = _group addWaypoint [_gopos1, 0];
_wp setWaypointStatements ["true", "[(vehicle this),this, (group this)] call twc_addcivcarwp"];
_wp setwaypointcompletionradius 30;

twc_addcivcarwp = {
	params ["_car", "_driver", "_group"];
	//systemchat "new waypoint";
	
	if ((!([getpos _driver, 2500] call twc_fnc_posNearPlayers)) || ((!([getpos _driver, 1000] call twc_fnc_posNearPlayers)) && ((vehicle _driver) == _driver))) exitwith {
		
		deletevehicle (_driver);
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
	};
	if ((!([getpos _car, 2500] call twc_fnc_posNearPlayers))) then {
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
		deletevehicle (_driver);
		deletevehicle (_car);
	};
	
	_gopos2 = _car getpos [(1000), (getdir _car)];

	_gopos2 = ([_gopos2, 500, (random 360), 0, [2,2000],_car] call SHK_pos);
	
	while {((_gopos2 distance _car) < 100)} do {
		_gopos2 = _car getpos [(1000), (random 360)];

		_gopos2 = ([_gopos2, 500, (random 360), 0, [2,2000],_car] call SHK_pos);
	};
	
	if (count _gopos2 == 0) exitwith {
		[_car, _driver] spawn {
			params ["_car", "_driver"];
			(group _driver) addWaypoint [[0,0,0], 0];
			while (([getpos _car, 2000] call twc_fnc_posNearPlayers)) do {
				 sleep 60;
			};
			_array = missionnamespace getvariable ["twc_civcars", []];
			_array deleteat (_array find [_driver, _car]);
			missionnamespace setvariable ["twc_civcars", _array];
			deletevehicle (_car);
			deletevehicle (_driver);
		};
	};
	
	_wp = _group addWaypoint [_gopos2, 0];
	_wp setWaypointStatements ["true", "[(vehicle this),this, (group this)] call twc_addcivcarwp"];
	_wp setwaypointcompletionradius 30;
};


[_driver] spawn {
	params ["_driver"];
	while {alive _driver} do {
		_pos = getpos _driver;
		sleep 60;
		if ((((_pos distance (getpos _driver)) < 40) || (vehicle _driver == _driver))) exitwith {
			_car = vehicle _driver;
			
			if (!([getpos _driver, 1000] call twc_fnc_posNearPlayers)) then {
			deletevehicle (_car);
			deletevehicle (_driver);
			_array = missionnamespace getvariable ["twc_civcars", []];
			
			_num = (_array find [_driver, _car]);
			if (_num == -1) then {_num = 1;};
			_array deleteat _num;
			missionnamespace setvariable ["twc_civcars", _array];
			} else {
			[_car, _driver] spawn {
				params ["_car", "_driver"];
				
				_car forceFollowRoad false;
				_driver forceFollowRoad false;
				sleep 60;
				_car forceFollowRoad true;
				_driver forceFollowRoad true;
				};
			};
		};
	};
};

sleep 30;

execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf";










