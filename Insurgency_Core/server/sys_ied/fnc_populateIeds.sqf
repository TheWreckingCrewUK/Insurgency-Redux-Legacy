/*
 * Author: MikeMatrix | [TWC] Bosenator 
 * Populate Map with IEDs on roads.
 *
 * Arguments:
 * 0: Amount of IEDs <NUMBER>
 * 1: Excluded Marker Areas <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [50] call TWC_fnc_populateIEDs
 */
params ["_amount", ["_exclusionMarkers", [], [[]]]];

// All roads on the map
_allRoads = [worldSize / 2, worldSize / 2] nearRoads (sqrt 2 * (worldSize / 2));

// Filter function for limiting roads to exclude any roads in marker areas of _exlcusionMarkers
_fnc_filterRoadPositions = {
	if (_exclusionMarkers isEqualTo []) exitWith {_x};
	
	_value = _x;
	_position = getPos _x;
	
	{
		if (_position inArea _x) exitWith {nil};
		_value
	} forEach _exclusionMarkers;
};

// Filter roads and trim nils
[_allRoads, _fnc_filterRoadPositions, true] call CBA_fnc_filter;
_allRoads = _allRoads arrayIntersect _allRoads;

if (count _allRoads <= 0) exitWith {};

if (isNil "iedTypes") then {
	iedTypes = ["ACE_IEDLandSmall_Range_Ammo", "ACE_IEDUrbanSmall_Range_Ammo", "ACE_IEDLandBig_Range_Ammo", "ACE_IEDUrbanBig_Range_Ammo"];
};

// Spawn IEDs
for "_i" from 0 to _amount step 1 do {
	_road = _allRoads call BIS_fnc_selectRandom;
	_iedType = iedTypes call BIS_fnc_selectRandom;
	
	//chance modifier to thin them out a bit
if(((random 1)>((0.5+(worldsize/40000))) min 0.9)) then {
	// chance it's off the road a bit, but within 100~ meters at the start of the game
	if ((random 1) >= 0.3) then {
		[_iedType, _road, true] call INS_fnc_spawnIEDOnRoad;
	} else {
		[_iedType, getPos _road, ((random 1) * 100), true] call INS_fnc_spawnIED;
	};
};
	// still remove road regardless, don't want it to be crowded
	_allRoads = _allRoads - [_road];
	if (count _allRoads <= 0) exitWith {};
};
