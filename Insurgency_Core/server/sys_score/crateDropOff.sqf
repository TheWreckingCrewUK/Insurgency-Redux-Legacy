//Will probably be replaced by hooking into the ace stop dragging and/or carrying function.
while{true}do{
	sleep 5;
	_crates = nearestObjects [getMarkerPos "crateDropOff", ["Box_NATO_Ammo_F","ACE_medicalSupplyCrate","Box_Nato_AmmoOrd_F"], 5];
	{
		deleteVehicle _x;
		["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
	}forEach _crates;
};