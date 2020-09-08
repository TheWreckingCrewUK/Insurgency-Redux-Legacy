/*
by Hobbs
if a player joins and the server isn't working correctly, reset the mission
*/

addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	if ((diag_fps < 3) && ((count allplayers) < 4)) then {
		if (time < 120) exitwith {};
		profilenamespace setvariable ["twc_lastcrashinfo", diag_activeSQFScripts];
		saveprofilenamespace;
		diag_log ("crash protection triggered with fps of " + (str diag_fps) + " with a server time of " + (str time) + " on " + missionname + " and scripts " + (str diag_activeSQFScripts));
		"crash" call BIS_fnc_endMissionServer;
	};
}];