/*
Function for removing the forward base should the enemy capture it

*/
params["_thisList"];
_pos = getMarkerPos "respawn_forwardBase";

//Removes respawn point and marker
[missionNamespace,"respawn_forwardBase"] call BIS_fnc_removeRespawnPosition;
deleteMarker "respawn_forwardBase";

//Removes the objects
{
	deleteVehicle _x;
}forEach (_pos nearObjects ["twc_portableGenerator",200]);
{
	deleteVehicle _x
}forEach (_pos nearObjects ["twc_SuppliesBox",200]);
{
	deleteVehicle _x
}forEach (_pos nearObjects ["twc_radioTable",200]);

//Deletes enemies
{
	deleteVehicle _x;
}forEach _thisList;
{
	deleteGroup _x;
}forEach allGroups;