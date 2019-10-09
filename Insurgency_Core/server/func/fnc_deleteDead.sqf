params["_unit"];
[_unit] spawn{
	params ["_unit"];
	_bluClose = 1;
	_start = time;
	//initial timer, don't do anything in the first 5 minutes. More efficient way would be to push them back to a central array then base the timeout on how big the array is
	sleep 300;
	while{_bluClose == 1}do{
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
	deleteVehicle _unit;
};