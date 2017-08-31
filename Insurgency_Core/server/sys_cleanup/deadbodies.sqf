_handle = addMissionEventHandler ["HandleDisconnect",{
	if((_this select 0) distance2D (getMarkerPos "base") < 200) then{
		deleteVehicle (_this select 0);
	};
}];