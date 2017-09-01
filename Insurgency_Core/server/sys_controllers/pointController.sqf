/*
* Author: [TWC] Bosenator
* Server controller for handling point increases/decreases, and their eventual completion screen (or failure)
*
* Arguments:
* 0: "TWC_Insurgency_adjustPoints" <String>
* 1: Integer
*
* Return Value:
* <NONE>
*
* Example:
* ["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
*
* Public: No
*/
_pointLimit = 1000;
_totalPoints = 0;

_highestPlayerCountReached = 0; // the highest count reached of total connected players

["TWC_Insurgency_adjustPoints", {
	totalPoints + (this select 0);
	
	if (totalPoints >= pointLimit) then {
		"pointVictory" call BIS_fnc_endMissionServer;
	};
}] call CBA_fnc_addEventHandler;

playerConnectedHandle = addMissionEventHandler ["PlayerConnected", {
	_playerCount = count (allPlayers - entities "HeadlessClient_F");
	
	if (_playerCount > _highestPlayerCountReached) then {
		_highestPlayerCountReached = _playerCount;
		
		if (_highestPlayerCountReached > 8) {
			_pointLimit = _pointLimit + 50;
		};
	};
}];
