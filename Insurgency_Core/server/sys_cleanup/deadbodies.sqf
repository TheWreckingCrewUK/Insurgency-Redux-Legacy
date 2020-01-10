_handle = addMissionEventHandler ["HandleDisconnect",{
	params["_unit","_id","_uid","_name"];
	_unit remoteExecCall ["deleteVehicle",_unit];
	if ((count allplayers) > 0) exitwith {};
	{
		if (!alive _x) then {
			_x remoteExecCall ["deleteVehicle",_x];
		};
	} foreach allunits;
}];