/*
* Details:
* 
* Creates a Civillian that will tak position in a house and will not move.
*
* Required parameters:
*
* 0 - String     Marker name
*
* Addtional parameters:
*
* 1 - Interger   Amount of civillians   Default: 7
* 
*
* Example:
*
* ["bastam", 7] spawn twc_SpawnCiv;
*
* Author: [TWC] Jayman / [TWC] Bosenator
*/
_group = createGroup civilian;
params["_pos", "_civnum", "_civradius"];

_num = 0;

for "_i" from 1 to _civnum do {
	_individualCiv = _group createUnit [(civilianType select (floor random (count civilianType))), _pos, [], _civradius, "NONE"];
	_civHeading = (random 360);
	_individualCiv setFormDir _civHeading;
	_individualCiv setDir _civHeading;
	_individualCiv setVariable ["twc_isenemy",0, true];
	
	_random = random 100;
	if(_random < 66)then{
		_house = nearestBuilding (position _individualCiv);
		_count = 0;
		_c = 0;
		while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
		if (_c > 0) then {
			_ranNum = floor(random _c);
			_individualCiv setPos (_house buildingPos _ranNum);
		};		
	};
	doStop _individualCiv;
	
	
	//_num = _num + 1;
	_westKilled = _individualCiv addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[_unit] call twc_fnc_deleteDead;
		if (_unit getvariable ["twc_isenemy", 0] == 1) exitwith {};
		_instigator = _unit getVariable ["ace_medical_lastDamageSource", _instigator];
		if (isPlayer _instigator) then {
			["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", -1] call CBA_fnc_serverEvent;
			if (_unit getvariable ["twc_isenemy", 0] == 0) then {
				diag_log format ["%1 - %2 killed a civilian", time, name _instigator];
				systemchat format ["%1 - %2 killed a civilian", time, name _instigator];
			};
		};
	}];

	_individualCiv setVariable ["unitsHome", [_pos,(getPos _individualCiv)], false];

	_individualCiv addEventHandler["FiredNear", {
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

			switch (round(random 2)) do {
				case 0;
				case 1: {
					_house = nearestBuilding (getPos _civ);
					_count = 0;
					while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
					if (_c > 0) then {
						_ranNum = floor(random _c);
						_pos = (_house buildingPos _ranNum);
					};
					_civ doMove (_buildingLocations buildingPos 1);
				};
				case 2: {
					_newHideyHole = [(position _civ), 100] call CBA_fnc_randPos;
					_civ doMove _newHideyHole;
				};
				default {};
			};
			[_civ] spawn{
				params["_civ"];
				_time = time + 120;
				waitUntil {unitReady _civ || _time < time};
				_civ setVariable ["unitIsBrickingIt", false, false];
				_civ switchMove "";
				_civ doMove ((_civ getVariable "unitsHome") select 1);
				_civ setSpeedMode "LIMITED";
				waitUntil {unitReady _civ || _civ getVariable "unitIsBrickingIt"};
				if(_civ getVariable "unitIsBrickingIt")exitWith{};
				doStop _civ;
			};
		};
	}];
};