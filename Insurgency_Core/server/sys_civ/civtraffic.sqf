waituntil {!isnil "twc_basepos"};

_num = missionnamespace getvariable ["twccivcarcount", 7];

_a = missionnamespace getvariable ["twc_civcars", []];
while {(((count _a) > _num) || ((count allplayers) == 0) || ((time) < 120))} do {
	sleep 60;
	_a = missionnamespace getvariable ["twc_civcars", []];
};

_pos = [];

_amount = 2500;

if ((missionnamespace getvariable ["twccancelcars", 0]) == 1) exitwith {};

_found = 0;
while {(((count _pos) == 0) && (_amount < 4000))} do {
	{
		if (_found == 0) then {
			if ((!([ _x, 1500] call twc_fnc_posNearPlayers)) && ([ _x, _amount] call twc_fnc_posNearPlayers) && ((( _x) distance twc_basepos) > 1000) && ((random 1) > 0.3)) then {
				_pos =  _x;
				_found = 1;
			};
		};
	} foreach townLocationArray;
	_amount = _amount + 300;
	systemchat str _amount;
};
if (_amount > 3900) exitwith {sleep 120; execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf";};
systemchat "search complete3d";


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


_eyecheck = 0;	
_checkcount = 0;

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
	
} else {
//AGLToASL
while {((_eyecheck == 0) && (_checkcount < 10))} do {
	if (([ (_spawnpos vectoradd [0,0,4])] call twc_fnc_seenbyplayers) == 0) then {
		_eyecheck = 1;
	} else {
		_spawnpos = [_pos, 200, (random 360), 0, [1,1000],_vehtype] call SHK_pos;
		_checkcount = _checkcount + 1;
		//typeof player createvehicle _spawnpos;
	};
};

};


if (!(_checkcount < 50)) exitwith {
//systemchat "find fail";
sleep 10;

execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf";};

_car = _vehtype createvehicle _spawnpos;

_securepos = twc_basepos;

if ((str (getmarkerpos "respawn_west_forwardbase")) != "[0,0,0]") then {
	if ((_spawnpos distance twc_basepos) > (_spawnpos distance (getmarkerpos "respawn_west_forwardbase"))) then {
		_securepos = (getmarkerpos "respawn_west_forwardbase");
	};
};

_enemychance = ((-0.3 + ((_spawnpos distance _securepos) / 10000)) min 0.8);


_driver = objnull;
_group = grpnull;

if (((random 1) < _enemychance) || (_vehtype in _enemyvehs)) then {

	_group = creategroup east;
	
	_driver = _group createUnit [(townspawn call bis_fnc_selectrandom), _spawnpos, [], 10, "NONE"];
	_driver assignasdriver _car;
	_driver moveindriver _car;
	_driver setVariable ["twc_isenemy",1];
	
	_canfit = true;
	if ((random 1) < 0.8) then {
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
	while {(_canfit) && ((random 1) < 0.6)} do {
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
	if ((random 1) < 0.8) then {
		_unit = _group createUnit [(civilianType call bis_fnc_selectrandom), _spawnpos, [], 10, "NONE"];
		_unit setVariable ["twc_isenemy",1];
		_unit addEventHandler ["Killed",{
			[(_this select 0)] call twc_fnc_deleteDead;
		}];
		_canfit = _unit moveinany _car;
		if (!_canfit) then {
			deletevehicle _unit;
		};
	};
	while {(_canfit) && ((random 1) < 0.6)} do {
		_unit = _group createUnit [(civilianType call bis_fnc_selectrandom), _spawnpos, [], 10, "NONE"];
		_unit setVariable ["twc_isenemy",1];
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


_array = missionnamespace getvariable ["twc_civcars", []];
_array pushback [_driver, _car];
missionnamespace setvariable ["twc_civcars", _array];

_car addEventHandler ["Killed", {
	params ["_car", "_killer", "_instigator", "_useEffects"];
	if ((!([getpos _car, 2000] call twc_fnc_posNearPlayers)) || ((!([getpos _car, 150] call twc_fnc_posNearPlayers)) && (([getposasl _car vectoradd [0,0,(sizeof (typeof _car)) * 0.7]] call twc_fnc_seenbyplayers) == 0))) then {
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
		deletevehicle _driver;
		{deletevehicle _x} foreach crew _car;
		deletevehicle _car;
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
	

[_car, _driver] spawn {
	params ["_car", "_driver"];
	while {alive _car} do {
		
		sleep 60;
		_array = missionnamespace getvariable ["twc_civcars", []];
			if ((!([getpos _car, 1500] call twc_fnc_posNearPlayers)) || ((!([getpos _car, 150] call twc_fnc_posNearPlayers)) && (([getposasl _car vectoradd [0,0,(sizeof (typeof _car)) * 0.7]] call twc_fnc_seenbyplayers) == 0))) then {
				{deletevehicle _x} foreach crew _car;
				deletevehicle (_car);
				//systemchat "getout eh fail";
				_num = (_array find [_driver, _car]);
				if (_num == -1) then {_num = 1;};
				_array deleteat _num;
				missionnamespace setvariable ["twc_civcars", _array];
			};
		
	};
};
}];


_driver addEventHandler ["Killed", {
	params ["_driver", "_killer", "_instigator", "_useEffects"];
	_car = _driver getvariable ["twccivcar_car", (vehicle _driver)];
	if (!([getpos _driver, 2000] call twc_fnc_posNearPlayers)) then {
		
		deletevehicle (_driver);
		{deletevehicle _x} foreach crew _car;
		//systemchat "driver dead";
	};
	
	if  ((!([getpos _car, 150] call twc_fnc_posNearPlayers)) && (([getposasl _car vectoradd [0,0,(sizeof (typeof _car)) * 0.7]] call twc_fnc_seenbyplayers) == 0)) then {
		deletevehicle _car;
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
		deletevehicle (_driver);
		{deletevehicle _x} foreach crew _car;
		deletevehicle (_car);
		//systemchat "195";
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
		sleep 120; execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf"};

_speed = speed _player;

_nearestRoad = [getposatl _car, 50] call BIS_fnc_nearestRoad;
_dir = _car getdir _player;
_dir = getdir _nearestRoad;

_gopos1 = _car getpos [(_amount * 2), _dir];

if ((_speed > 50) && ((random 1) < 0.3)) then {
	_dir =_dir + 180;
	//systemchat "run away";
	_gopos1 = ([(getpos _car), 1500, _dir, 0, [2,700],_vehtype] call SHK_pos);
} else {
	
	_gopos1 = ([(getpos _player), 500, (random 360), 0, [2,2000],_vehtype] call SHK_pos);
};

_cd = 100;

_chkva = (floor (random 100));
//systemchat ((str _chkva) + "start");
//something in here is causing a 0 elements provided, 3 expected error
if (!isnil "_gopos1") then {
	while {((_gopos1 distance twc_basepos) < 1000)} do {
		_cpos1 = (_gopos1 getpos [(_amount + _cd), _dir]);
		_gopos1 = ([_cpos1, 500, (random 360), 0, [2,4000],_vehtype] call SHK_pos);
		_cd = _cd + 200;
		sleep 1;
	};
};
//systemchat ((str _chkva) + "end");
_car setdir _dir;

//_gopos1 = _car getpos [(_amount * 2), _dir];

if (count _gopos1 == 2) then {
	_gopos1 = [_gopos1 select 0, _gopos1 select 1, 0];
	//systemchat "yep its 2";
};

//_gopos1 = ([(getpos _player), 500, (random 360), 0, [2,2000],_vehtype] call SHK_pos);
if (count _gopos1 == 0) exitwith {
//systemchat "wp fail";
		deletevehicle (_driver);
		{deletevehicle _x} foreach crew _car;
		deletevehicle (_car);
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
	if ((count allplayers) == 0) exitwith {
		
		deletevehicle (_driver);
		_array = missionnamespace getvariable ["twc_civcars", []];
		_array deleteat (_array find [_driver, _car]);
		missionnamespace setvariable ["twc_civcars", _array];
	};
		
	
	_last = _car getvariable ["twc_lastwptime", 0];
	
	if ((!([getpos _driver, 2500] call twc_fnc_posNearPlayers)) || ((!([getpos _driver, 1000] call twc_fnc_posNearPlayers)) && (_last > (time - 2))) || ((!([getpos _driver, 1000] call twc_fnc_posNearPlayers)) && ((vehicle _driver) == _driver))) exitwith {
		
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
	
	while {((_gopos2 distance _car) < 100) || ((_gopos2 distance twc_basepos) < 1000)} do {
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
	_car setvariable ["twc_lastwptime", time];
};




[_driver, _car] spawn {
	params ["_driver", "_car"];
	
	while {alive _driver} do {
		_pos = getpos _driver;
		_car = _driver getvariable ["twccivcar_car", objnull];
		sleep 60;
		_array = missionnamespace getvariable ["twc_civcars", []];
		
		
		if ((typeof _car) != (typeof vehicle _driver)) then {
			if ((!([getpos _driver, 1500] call twc_fnc_posNearPlayers)) || ((!([getpos _driver, 150] call twc_fnc_posNearPlayers)) && (([getposasl _driver vectoradd [0,0,2]] call twc_fnc_seenbyplayers) == 0))) then {
				deletevehicle (_driver);
				//systemchat "driver gone";
				_num = (_array find [_driver, _car]);
				_array deleteat _num;
				missionnamespace setvariable ["twc_civcars", _array];
			};
		};
			
			
		if (((_pos distance (getpos _driver)) < 20)) exitwith {
			
			
			if ((!([getpos _driver, 1000] call twc_fnc_posNearPlayers)) || ((!([getpos _driver, 150] call twc_fnc_posNearPlayers)) && (([getposasl _driver vectoradd [0,0,2]] call twc_fnc_seenbyplayers) == 0))) then {
			deletevehicle (_car);
			deletevehicle (_driver);
			//systemchat "bad dis";
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











