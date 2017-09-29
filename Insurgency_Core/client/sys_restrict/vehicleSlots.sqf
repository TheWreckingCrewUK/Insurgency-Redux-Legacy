TWC_fnc_notAllowedInSeat = {
	params ["_playerUnit"];
	
	private _freePassengerSpace = (vehicle _playerUnit) emptyPositions "cargo";
	private _title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>RESTRICTED</t>";

	// move them to the passenger seats first, prevents annoyance/unnecessary death in the air
	if (_freePassengerSpace > 0) exitWith {
		_playerUnit moveInCargo (vehicle _playerUnit);
		private _text = "<p>You are not qualified for that slot. Take a seat in back.</p>";
		hint parseText (_title + _text);
	};
	
	moveOut _playerUnit;
	private _text = "<p>You are not qualified for that slot. Get out of here.</p>";
	hint parseText (_title + _text);
};

TWC_fnc_checkVehicleSlot = {
	// check the class of the player, this will make it easier
	// typeOf vehicle player == "Modern_British_heliPilot"
	params ["_playerUnit"];
	
	if (vehicle _playerUnit == _playerUnit) exitWith { false; }; // double check
	
	private _currentSeat = [_playerUnit] call CBA_fnc_vehicleRole;
	
	{
		private _vehicle = (_x select 0);
		private _slotsAndRoles = (_x select 1);
		
		if (typeof (vehicle _playerUnit) == _vehicle) then {
			{
				private _slot = (_x select 0);
				private _roles = (_x select 1);
				
				if (_currentSeat == _slot) then {
					if (!(typeOf _playerUnit in _roles)) then {
						[_playerUnit] call TWC_fnc_notAllowedInSeat;
					};
				};
			} forEach _slotsAndRoles;
		};
	} forEach restrictedVehicleSlots;
};

[player, "GetInMan", {
	params ["_playerUnit"];
	[_playerUnit] call TWC_fnc_checkVehicleSlot;
}, player] call CBA_fnc_addBISEventHandler;

[player, "SeatSwitchedMan", {
	params ["_playerUnit"];
	[_playerUnit] call TWC_fnc_checkVehicleSlot;
}, player] call CBA_fnc_addBISEventHandler;