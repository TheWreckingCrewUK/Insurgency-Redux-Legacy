TWC_fnc_notAllowedInSeat = {
	params ["_playerUnit"];
	
	_freePassengerSpace = (vehicle _playerUnit) emptyPositions "cargo";
	_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>RESTRICTED</t>";

	// move them to the passenger seats first, prevents annoyance/unnecessary death in the air
	if (_freePassengerSpace > 0) exitWith {
		_veh = vehicle _playerUnit;
		moveOut _playerUnit;
		_playerUnit moveInCargo _veh;
		_text = "<br />You are not qualified for that slot. Take a seat in back.";
		hint parseText (_title + _text);
	};
	
	moveOut _playerUnit;
	_text = "<br />You are not qualified for that slot.";
	hint parseText (_title + _text);
};

TWC_fnc_notenoughplayers = {
	params ["_playerUnit","_count","_currentcount","_problem"];
	if (_problem == "low") then {
	_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>Not Enough Players</t>";

	moveOut _playerUnit;
	if (_Currentcount > 1) then {
	_text1 = "<br />There are ";
	_text2 = " players in the server.";
	_text3 = "<br />You need ";
	_text4 = " to be able to use this vehicle";
	hint parseText (_title + _text1 + str _currentcount + _text2 + _text3 + str _count + _text4);
	} else
	{
	_text1 = "<br />You're the only player on the server.";
	_text3 = "<br />You need more than ";
	_text4 = " to be able to use this vehicle";
	
	
	hint parseText (_title + _text1 + _text3 + str _count + _text4);
	};}
	
	else
	{
	
	_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many Players</t>";

	moveOut _playerUnit;
	_text1 = "<br />There are ";
	_text2 = " players in the server.";
	_text3 = "<br />You need less than ";
	_text4 = " to be able to use this vehicle";
	hint parseText (_title + _text1 + str _currentcount + _text2 + _text3 + str _count + _text4);
	};
	
	};

TWC_fnc_checkVehicleSlot = {
	params ["_playerUnit"];
	
	if (vehicle _playerUnit == _playerUnit) exitWith { false; }; // double check
	
	_currentSeat = [_playerUnit] call CBA_fnc_vehicleRole;
	{
		_vehicle = (_x select 0);
		_slotsAndRoles = (_x select 1);
		_count = (_x select (count (_x)-1));
		_maxcount = (_x select (count (_x)-2));
		_currentcount = ( count(allPlayers - entities "HeadlessClient_F"));
		_snipercount = 10;
		
		
 if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin","Modern_Artillery_Commander","Modern_Artillery_Gunner"]) then {if (_snipercount > _currentcount) then {[_playerUnit,_snipercount,_currentcount,"low"] call TWC_fnc_notenoughplayers};};
		
		if (typeof (vehicle _playerUnit) == _vehicle) then {
			{
				_slot = (_x select 0);
				_roles = (_x select 1);
				if (_currentSeat == _slot) then {
//				systemchat format ["%1", _roles];
					if (!(typeOf _playerUnit in _roles)) then {
						[_playerUnit] call TWC_fnc_notAllowedInSeat;
					} else {
					if (typename _count == "SCALAR") then {if (_count > _currentcount) then {[_playerUnit,_count,_currentcount,"low"] call TWC_fnc_notenoughplayers} else {if (typename _maxcount == "SCALAR") then {if (_maxcount < _currentcount) then {[_playerUnit,_count,_currentcount,"high"] call TWC_fnc_notenoughplayers};};};};
					};
				};
			} forEach _slotsAndRoles;
		};
	} forEach twc_restrictedVehicleSlots;
};




[player, "GetInMan", {
	params ["_playerUnit"];
	[_playerUnit] call TWC_fnc_checkVehicleSlot;
}, player] call CBA_fnc_addBISEventHandler;

[player, "SeatSwitchedMan", {
	params ["_playerUnit"];
	[_playerUnit] call TWC_fnc_checkVehicleSlot;
}, player] call CBA_fnc_addBISEventHandler;