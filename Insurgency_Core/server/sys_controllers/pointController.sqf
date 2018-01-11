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


if(isNil "pointLimit") then{
pointLimit = 400;
publicVariable "pointLimit"; // init once
};

if(isNil "totalPoints") then{
totalPoints = 0;
publicVariable "totalPoints"; // init once
};

_highestPlayerCountReached = 0; // the highest count reached of total connected players

["TWC_Insurgency_adjustPoints", {
	totalPoints = totalPoints + _this;
	
	if (totalPoints >= pointLimit) then {
		execVM "Insurgency_Core\server\sys_controllers\missionsuccess.sqf";
	};
	
	if(totalPoints < 0)then{totalPoints = 0};
	
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
	publicVariable "pointLimit";
}] call BIS_fnc_addStackedEventHandler;
