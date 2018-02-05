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

if (isNil "iedTypes") then {
	iedTypes = ["ACE_IEDLandSmall_Range_Ammo", "ACE_IEDUrbanSmall_Range_Ammo", "ACE_IEDLandBig_Range_Ammo", "ACE_IEDUrbanBig_Range_Ammo", "Land_Garbage_square3_F", "Land_Garbage_square5_F", "Land_Garbage_line_F"];
};

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
		_delay = 1800; // every 30 minutes, when no one is online
		_justPlayers = count (allPlayers - entities "HeadlessClient_F");
	
		if (_justPlayers > 0) then {
			_delay = ((round (_delay / _justPlayers)) max 150);
		};
		
		if (TWC_insMorale > 0) then {
			_delay = _delay + (round ((TWC_insMorale / 100) * 900));
		};
	};
};

[INS_fnc_startIEDPlantLoop, _iedFactoryControlled, _delay] call CBA_fnc_waitAndExecute;