params ["_spawnpos", "_waypoints"];

{deletegroup _x} foreach allgroups;

_side = civilian;
_type = missionnamespace getvariable ["civilianType", []];

_isblufor = (((_spawnpos distance twc_basepos ) < 300) || ((_spawnpos distance (getmarkerpos "respawn_west_forwardbase") ) < 300));
//systemchat "civfluffserver 7";
if (_isblufor) then {
	_side = west;
	_type = missionnamespace getvariable ["twc_bluflufflist", []];
};

if ((count _type) == 0) exitwith {};


//systemchat "civfluffserver 16";
					_group = creategroup _side; 
					_unit = _group createUnit [(selectRandom _type), _spawnpos, [], 5, "NONE"];
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

							
							_nil = [getpos _civ, nil, [_civ], 50, 2, false, false] call ace_ai_fnc_garrison;
							
							
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
						_unit setunittrait ["camouflageCoef", 1500];
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
					
					{
						_wp = _group addwaypoint [_x, 20];
						_wp setwaypointstatements ["true", "[this] call twc_fnc_newfluffwp;"];
					
					} foreach _waypoints;
					
					
					
					
twc_fnc_deletewhenready = {
	params ["_unit"];
	if ((!([(getpos _unit),30] call twc_fnc_posNearPlayers)) && (([(getpos _unit)] call twc_fnc_seenbyplayers) == 0) && (!([(getpos _unit)] call twc_fnc_lookedatbyplayers)) && ((vehicle _unit) == _unit)) then {
		deletevehicle _unit;
	} else {
		[twc_fnc_deletewhenready, [_unit], 30] call CBA_fnc_waitAndExecute;
	};
};
	
[twc_fnc_deletewhenready, [_unit], 300] call CBA_fnc_waitAndExecute;

twc_fnc_newfluffwp = {
	params ["_unit"];
	_group = group _unit;
	_pos = getpos _unit;
	_group setbehaviour "safe";
	if ((!([_pos,30] call twc_fnc_posNearPlayers)) && (([_pos] call twc_fnc_seenbyplayers) == 0) && ((vehicle _unit) == _unit)) exitwith {
		deletevehicle _unit;
		
		
	};
	_gop = [_pos, 50, 160, 3, false] call twc_fnc_findsneakypos;
	if ((_gop distance _pos) > 10) then {
		_wp = _group addwaypoint [(_gop), 20];
		_wp setwaypointstatements ["true", "[this] call twc_fnc_newfluffwp;"];
	} else {
		[_unit] call twc_fnc_newfluffwp;
	};
};