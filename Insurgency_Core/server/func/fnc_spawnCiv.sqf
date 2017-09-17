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
* ["bastam", 7] spawn twc_fnc_SpawnCiv;
*
* Author: [TWC] Fakematty / [TWC] Jayman / [TWC] Bosenator
*/
_group = createGroup civilian;
params["_pos", "_civnum", "_civradius"];

for "_i" from 1 to _civnum do {
	_individualCiv = _group createUnit [civilianType, _pos, [], _civradius, "NONE"];
	_civHeading = (random 360);
	_individualCiv setFormDir _civHeading;
	_individualCiv setDir _civHeading;
	
	_westKilled = _individualCiv addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[_unit] call twc_fnc_deleteDead;
		//[_this select 0, _this select 1, _intelCache] call InsP_fnc_civKill;

		if (isPlayer _instigator) then {
			["TWC_Insurgency_adjustPoints", [-5]] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", [-1]] call CBA_fnc_serverEvent;
		};

		_unit removeAllEventHandlers "FiredNear";
		_unit removeAllEventHandlers "Killed";
	}];

	_individualCiv setVariable ["unitsHome", _pos, false];

	_individualCiv addEventHandler["FiredNear", {
		_civ = _this select 0;
		_isBrickingIt = _civ getVariable ["unitIsBrickingIt", false];
		
		if (!(_isBrickingIt) && alive _civ) then {
			switch (round(random 2)) do {
				case 0:{_civ switchMove "ApanPercMstpSnonWnonDnon_G01";};
				case 1:{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
				case 2:{_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";};
				default{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
			};
			
			_civ setSpeedMode "FULL";

			switch (round(random 2)) do {
				case 0: { 
					[(group _civ), (position _civ)] call CBA_fnc_waypointGarrison;
				};
				case 1: {
					_buildingLocations = nearestObjects [_civ, ["House", "Building"], 100];
					if ((count _buildingLocations) > 0) then {
						_civ doMove (_buildingLocations select 0);
					};
				};
				case 2: {
					_newHideyHole = [(position _civ), 100] call CBA_fnc_randPos;
					_civ doMove _newHideyHole;
				};
				default {};
			};
			
			[
				{
					_civ = _this select 0;
					_civ switchMove "";
					_civ doMove (_civ getVariable ["unitsHome", [0, 0, 0]]);
					_civ setVariable ["unitIsBrickingIt", false, false];
				},
				[_civ],
				30 + (round(random (60)))
			] call CBA_fnc_waitAndExecute;
			
			_civ setVariable ["unitIsBrickingIt", true, false];
		};
	}];
	
	_clothes =
	[
		"CUP_O_TKI_Khet_Partug_03",
		"CUP_O_TKI_Khet_Partug_05",
		"CUP_O_TKI_Khet_Partug_06",
		"CUP_O_TKI_Khet_Partug_07",
		"CUP_O_TKI_Khet_Partug_02",
		"CUP_O_TKI_Khet_Partug_08"
	] call BIS_fnc_selectRandom;
	
	_individualCiv forceadduniform _clothes;
};
