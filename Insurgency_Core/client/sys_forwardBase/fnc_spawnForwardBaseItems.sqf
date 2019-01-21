params["_player",["_marker","forwardBase_itemSpawn"]];
_return = "";
_pos = getMarkerPos _marker;
if(getMarkerColor "respawn_forwardBase" != "")exitWith{_return = "Forward Base is already Setup"; _return};

{
	deleteVehicle _x
}forEach (_pos nearObjects ["twc_portableGenerator",100]);
{
	deleteVehicle _x
}forEach (_pos nearObjects ["twc_radioTable",100]);
/*{
	deleteVehicle _x
}forEach (_pos nearObjects ["twc_SuppliesBox",100]);*/
{
	deleteVehicle _x
}forEach (_pos nearObjects ["twc_radioTable",100]);

"twc_radioTable" createVehicle _pos;
"twc_portableGenerator" createVehicle _pos;
//"twc_SuppliesBox" createVehicle _pos;
//"UK3CB_BAF_MAN_HX58_Container_Green" createVehicle _pos;
_return = "Items Created Successfully. If There Are Containers Available,  You Will Get Repair Support And Vehicle Spawning If You Bring One. You Will Need A Cargo Truck Or A Helicopter.";
_return