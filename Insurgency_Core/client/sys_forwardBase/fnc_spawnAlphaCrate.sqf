params["_player",["_marker","forwardBase_itemSpawn"]];
_return = "";
_pos = getMarkerPos _marker;
if!(typeOf _player in twc_FOAllowedPlayers)exitWith{_return = "You are not permitted to spawn the Items"; _return};

{
	deleteVehicle _x
}forEach (_pos nearObjects ["twc_forwardBase_BritishAmmoBox",100]);

"twc_forwardBase_BritishAmmoBox" createVehicle _pos;
_return = "Items Created Successfully";
_return