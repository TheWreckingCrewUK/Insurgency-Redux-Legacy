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
pointLimit = 1000;
totalPoints = 0;

_highestPlayerCountReached = 0; // the highest count reached of total connected players

["TWC_Insurgency_adjustPoints", {
	totalPoints = totalPoints + _this;
	
	if (totalPoints >= pointLimit) then {
		"pointVictory" call BIS_fnc_endMissionServer;
	};
	publicVariable "totalPoints";
}] call CBA_fnc_addEventHandler;

["playerConnectedEHandler", "onPlayerConnected", {
	_playerCount = count (allPlayers - entities "HeadlessClient_F");
	
	if (_playerCount > highestPlayerCountReached) then {
		highestPlayerCountReached = _playerCount;
		
		if (highestPlayerCountReached > 8) then {
			pointLimit = pointLimit + 50;
		};
	};
}] call BIS_fnc_addStackedEventHandler;
