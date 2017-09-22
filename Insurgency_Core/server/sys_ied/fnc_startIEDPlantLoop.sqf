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

// Needs to be a global list in the future!
private _iedTypes = ["ACE_IEDLandBig_Range", "ACE_IEDUrbanBig_Range", "ACE_IEDUrbanSmall_Range", "ACE_IEDLandSmall_Range"];
private _iedType = selectRandom _iedTypes;

private _roadPos = [[worldSize / 2, worldSize / 2, 0], [0, 5000], [0, 360], 0] call SHK_pos;
private _road = [_roadPos, 500] call twc_fnc_getRandomNearbyRoad;

// Adapated from Jaymans glorious method
while {([_roadPos, 1000] call twc_fnc_posNearPlayers) || (_road isEqualTo objNull)} do {
	_roadPos = [[worldSize / 2, worldSize / 2, 0], [0, 5000], [0, 360], 0] call SHK_pos;
	_road = [_roadPos, 500] call twc_fnc_getRandomNearbyRoad;
};

// chance it also spawns in the middle of nowhere, but not as likely
if ((random 1) >= 0.2) then {
	[_iedType, _road, 0, 0.5] call TWC_fnc_spawnIed;
} else {
	[_iedType, _roadPos, 0, 0.5] call TWC_fnc_spawnIed;
};

[twc_fnc_startIEDPlantLoop, _iedFactoryControlled, _delay] call CBA_fnc_waitAndExecute;