/*
by Hobbs
if a player joins and the server isn't working correctly, reset the mission
*/

addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	if (diag_fps < 10) then {
		if (time < 120) exitwith {};
		"crash" call BIS_fnc_endMissionServer;
	};
}];