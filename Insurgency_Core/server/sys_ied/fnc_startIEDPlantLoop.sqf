/*
* Author(s): [TWC] Bosenator | [TWC] jayman
* IED repopulator.
*
* Has override for _iedFactoryControlled, so it can stop if that's cleared.
*
* Arguments:
* <Integer> Seconds delay between planting (Defaut: 120)
* <Boolean> IED Factory Controlled? (Default: false)
*
* Return Value:
* <NONE>
*
* Example:
* [120, false] call twc_fnc_startIEDPlantLoop;
*
* Public: No
*/
params [["_delay", 120], ["_iedFactoryControlled", false]];

private _shouldPlantIED = missionNamespace getVariable ["IEDFactoryIsFunctional", false];
if (_iedFactoryControlled && !(_shouldPlantIED)) exitWith {};

private _iedType = selectRandom iedTypes;

private _roadPos = [[worldSize / 2, worldSize / 2, 0], [0, 5000], [0, 360], 0] call SHK_pos;
private _road = [_roadPos, 500] call twc_fnc_getRandomNearbyRoad;

// Adapated from Jaymans glorious method
while {([_roadPos, 1000] call twc_fnc_posNearPlayers) || (_road isEqualTo objNull)} do {
	_roadPos = [[worldSize / 2, worldSize / 2, 0], [0, 5000], [0, 360], 0] call SHK_pos;
	_road = [_roadPos, 500] call twc_fnc_getRandomNearbyRoad;
};

// chance it also spawns them within 500 meters of a road (bit randomnly like though)
if ((random 1) >= 0.2) then {
	[_iedType, _road] call INS_fnc_spawnIEDOnRoad;
} else {
	[_iedType, _roadPos] call INS_fnc_spawnIED;
};

if (!(_iedFactoryControlled)) then {
	if (!(isNil "TWC_insMorale")) then {
		if (TWC_insMorale > 0) then {
			_delay = 300 + (round ((TWC_insMorale / 100) * 900));
		} else {
			_delay = 300;
		};
	};
};

[INS_fnc_startIEDPlantLoop, _iedFactoryControlled, _delay] call CBA_fnc_waitAndExecute;