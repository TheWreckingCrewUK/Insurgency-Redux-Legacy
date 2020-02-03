/*
by Hobbs
creates civs in a natural manner in places that cannot be seen by players, then have them move around naturally before deleting themselves when not seen by players and outside of a sane radius to avoid performance issues
*/
if (true) exitwith {};
params ["_pos", ["_isblufor", false]];
//systemchat "fluff 7";
if (_isblufor && (isnil "twc_bluflufflist")) exitwith {};
//systemchat "fluff4 9";
missionnamespace setvariable [("twccivfluff" + (str _pos)), 0];
{
	if ((_x distance _pos) < 1000) then {
	//systemchat "fluff 13";
		[_pos, _x, _isblufor] spawn {
			params ["_pos", "_player", "_isblufor"];
			_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
			//systemchat "fluff 16";
			
			_maxcivs = ((((count (nearestObjects [_player, ["house", "vysilacka"], 100])) / 2) min 25) * ((sunormoon * -1) + 2)) / (0.1 + (count allplayers));
			//systemchat ("max2 gets " + (str _maxcivs));
			
			//if it's spawning civs, then don't spawn them near base. if it's spawning blufor, don't spawn them far from base. Last time anything jumped through this many hoops it was on crufts
			while {(_var >= _maxcivs) || ((!_isblufor) && ((((nearestBuilding _player) distance _player) > 50) || (((missionnamespace getvariable ["twc_basepos", [0,0,0]]) distance _player) < 250) || (((count (nearestObjects [_player, ['vysilacka'], 100])) > 0)))) || ((_isblufor) && ((((missionnamespace getvariable ["twc_basepos", [0,0,0]]) distance _player) > 250)) && (((count (nearestObjects [_player, ['vysilacka'], 100])) == 0))) && ((_pos distance _player) < 1000)} do {
				sleep 10;
				_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
				_maxcivs = ((((count (nearestObjects [_player, ["house", "vysilacka"], 100])) / 2) min 25) * ((sunormoon * -1) + 2)) / (0.1 + (count allplayers));
				//systemchat ("fluff 27 with max at " + (str (_var >= _maxcivs)) + (str ((!_isblufor) && ((((nearestBuilding _player) distance _player) > 50) || (((missionnamespace getvariable ["twc_basepos", [0,0,0]]) distance _player) < 250)))) + (str ((_isblufor) && ((((missionnamespace getvariable ["twc_basepos", [0,0,0]]) distance _player) > 250)) && (((count (nearestObjects [_player, ['vysilacka'], 100])) == 0)))));
			};
			//systemchat "fluff 29";
			while {(alive _player) && ((_pos distance _player) < 1000)} do {
			
			
				_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
				while {(_var >= _maxcivs) || ((!_isblufor) && ((((nearestBuilding _player) distance _player) > 50) || (((missionnamespace getvariable ["twc_basepos", [0,0,0]]) distance _player) < 250) || (((count (nearestObjects [_player, ['vysilacka'], 100])) > 0)))) || ((_isblufor) && ((((missionnamespace getvariable ["twc_basepos", [0,0,0]]) distance _player) > 250)) && (((count (nearestObjects [_player, ['vysilacka'], 100])) == 0))) && ((_pos distance _player) < 1000)} do {
					sleep 10;
					//systemchat "fluff wait 36";
					_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
					_maxcivs = ((((count (nearestObjects [_player, ["house", "vysilacka"], 100])) / 2) min 25) * ((sunormoon * -1) + 2)) / (0.1 + (count allplayers));
				};
				
				_maxcivs = (((count ((getpos _player) nearObjects ["House", 100])) / 2) min 25);
				//systemchat ("max2 gets " + (str _maxcivs) + "with current of " + (str _var));
				
				_gop = [(_player getRelPos [(((speed _player) + 0.1) * ((speed _player) + 0.1)), 0]), 50, 150, 3, false] call twc_fnc_findsneakypos;
				
				if (((_gop distance _player) > 10) && ((_gop distance _player) < 150) && (!([_gop,50] call twc_fnc_posNearPlayers))) then {
					_side = civilian;
					if (_isblufor) then {
						_side = west;
					};
					
					_group = creategroup _side; 
					
					_type = missionnamespace getvariable ["civilianType", []];
					if (_isblufor) then {
						_type = twc_bluflufflist;
					};
					
					_unit = _group createUnit [(selectRandom _type), _gop, [], 5, "NONE"];
					//systemchat ("fluff created a " + typeof _unit);
					_unit setVariable ["twc_isenemy",0, true];
					
					_group setbehaviour "safe";
					_group setspeedmode "limited";
					
					
					if (!_isblufor) then {
					[_unit] spawn twc_fnc_enemychatter;
					_westKilled = _unit addEventHandler ["Killed", {
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						
						_pos = _unit getvariable ["unitshome", ""];
						_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
						missionnamespace setvariable [("twccivfluff" + (str _pos)), _var - 1];
						[_unit] call twc_fnc_deleteDead;
						if (_unit getvariable ["twc_isenemy", 0] == 1) exitwith {};
						_instigator = _unit getVariable ["ace_medical_lastDamageSource", _instigator];
						if (isPlayer _instigator) then {
							["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
							["TWC_Insurgency_adjustCivilianMorale", -1] call CBA_fnc_serverEvent;
							if (_unit getvariable ["twc_isenemy", 0] == 0) then {
								diag_log format ["%1 - %2 killed a civilian", time, name _instigator];
								//systemchat format ["%1 - %2 killed a civilian", time, name _instigator];
							};
						};
					}];
					
					_unit addEventHandler["FiredNear", {
						params["_civ"];
						_isBrickingIt = _civ getVariable ["unitIsBrickingIt", false];
						
						if (!(_isBrickingIt) && alive _civ && (_civ getvariable ["twc_isenemy", 0] == 0)) then {
						_civ setVariable ["unitIsBrickingIt", true, false];
							switch (round(random 2)) do {
								case 0:{_civ switchMove "ApanPercMstpSnonWnonDnon_G01";};
								case 1:{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
								case 2:{_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";};
								default{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
							};
							
							_civ setSpeedMode "FULL";
/*
							switch (round(random 1)) do {
								//case 0;
								case 0: {
									_house = nearestBuilding (getPos _civ);
									_count = 0;
									while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
									if (_c > 0) then {
										_ranNum = floor(random _c);
										_pos = (_house buildingPos _ranNum);
									};
									_civ doMove (_buildingLocations buildingPos 1);
								};
								case 1: {
									_newHideyHole = [(position _civ), 100] call CBA_fnc_randPos;
									_civ doMove _newHideyHole;
								};
								default {};
							};
							*/
							
							//_nil = [getpos _civ, nil, [_civ], 50, 2, false, false] call ace_ai_fnc_garrison;
							
							
							[_civ] spawn{
								params["_civ"];
								_time = time + 120;
								waitUntil {unitReady _civ || _time < time};
								_civ setVariable ["unitIsBrickingIt", false, false];
								_civ switchMove "";
								//_civ doMove ((_civ getVariable "unitsHome"));
								_civ setSpeedMode "LIMITED";
								//this waituntil isn't returning true properly, redo it
								waitUntil {unitReady _civ || (_civ getVariable ["unitIsBrickingIt", true])};
								if(_civ getVariable "unitIsBrickingIt")exitWith{};
								doStop _civ;
							};
						};
					}];
					
					} else {
					//blufor code. They act as base security on top of ambience, so make them invincible, highly visible, and wearing guard duty kit
						_unit allowdamage false;
						_unit setVariable ["twc_isenemy",0];
						_unit setVariable ["twc_bluefluff",1];
						_unit setunittrait ["camouflageCoef", 500];
						removebackpack _unit;
						if ((secondaryWeapon _unit) != "") then {
							_unit removeweapon (secondaryWeapon _unit);
						};
						
						_unit addEventHandler["FiredNear", {
							params["_unit", "_shooter"];
							if (((count (weapons _unit)) == 0)) then {
									if ((side _shooter) == east) then {
									_var = _unit getvariable ["twc_lastbrick", 0];
									if (_var < (time - 30)) then {
										//_nil = [getpos _unit, nil, [_unit], 50, 2, false, false] call ace_ai_fnc_garrison;
										_unit setvariable ["twc_lastbrick", time];
									};
								};
							};
						}];
						
						
					};
					removegoggles _unit;
					
					_wppos = [getpos _player, 10, 40, 3, false] call twc_fnc_findsneakypos;
					_wp = _group addwaypoint [_wppos, 20];
					_wp setwaypointstatements ["true", "[this] call twc_fnc_newfluffwp;"];
					_wppos = [getpos _player, 10, 40, 3, false] call twc_fnc_findsneakypos;
					_wp = _group addwaypoint [_wppos, 20];
					_wp setwaypointstatements ["true", "[this] call twc_fnc_newfluffwp;"];
					
					_unit setvariable ["unitshome", (_pos)];
					
					[_unit] spawn {
						params ["_unit"];
						
						_pos = _unit getvariable ["unitshome", ""];
						sleep 300;
						while {alive _unit} do {
							
							
							if ((!([(getpos _unit),30] call twc_fnc_posNearPlayers)) && (([(getpos _unit)] call twc_fnc_seenbyplayers) == 0) && (!([(getpos _unit)] call twc_fnc_lookedatbyplayers)) && ((vehicle _unit) == _unit)) exitwith {
								deletevehicle _unit;
								
								_pos = _unit getvariable ["unitshome", ""];
								_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
								missionnamespace setvariable [("twccivfluff" + (str _pos)), _var - 1];
								
							};
							sleep 30;
						};
					};
					
					_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
					missionnamespace setvariable [("twccivfluff" + (str _pos)), _var + 1];
					while {_var >= 20} do {
						sleep 20;
						//systemchat "fluff 199";
						_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
					};
				} else {
					//systemchat "fluff pos fail";
				};
				sleep 5;
			};
		};
		
	};
} foreach allplayers;

twc_fnc_newfluffwp = {
	params ["_unit"];
	_group = group _unit;
	_pos = getpos _unit;
	_group setbehaviour "safe";
	if ((!([_pos,30] call twc_fnc_posNearPlayers)) && (([_pos] call twc_fnc_seenbyplayers) == 0) && ((vehicle _unit) == _unit)) exitwith {
		deletevehicle _unit;
		
		_pos = _unit getvariable ["unitshome", ""];
		_var = missionnamespace getvariable [("twccivfluff" + (str _pos)), 0];
		missionnamespace setvariable [("twccivfluff" + (str _pos)), _var - 1];
		
	};
	_gop = [_pos, 50, 160, 3, false] call twc_fnc_findsneakypos;
	if ((_gop distance _pos) > 10) then {
		_wp = _group addwaypoint [(_gop), 20];
		_wp setwaypointstatements ["true", "[this] call twc_fnc_newfluffwp;"];
	} else {
		[_unit] call twc_fnc_newfluffwp;
	};
};