params["_unit"];

//currently deactivated function, to see if there's a conflict between this and our framework cleanup
if (!hasinterface) exitwith {};
[_unit] spawn{
	params ["_unit"];
	_bluClose = 1;
	_start = time;
	//initial timer, don't do anything in the first 5 minutes. More efficient way would be to push them back to a central array then base the timeout on how big the array is
	sleep 300;
	while{_bluClose == 1}do{
		if (isnull _unit) exitwith {};
		sleep 60;
		
		_checkvis = 1;
		if (_start < (time - 600)) then {
			_checkvis = ([(getpos _unit)] call twc_fnc_seenbyplayers);
		};
		
		_lookcheck = ([(getpos _unit)] call twc_fnc_lookedatbyplayers);
		if ((!_lookcheck) || (_checkvis == 0)) then {
			_bluClose = 0;
		};
	};
	_unit remoteExecCall ["deleteVehicle",_unit];
};