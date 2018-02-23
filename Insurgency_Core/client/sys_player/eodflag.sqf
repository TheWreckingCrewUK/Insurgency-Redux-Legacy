_player = _this select 1;

createVehicle ["twc_flag_eod", ([_player, 2, getdir _player] call BIS_fnc_relPos), [], 0, "CAN_COLLIDE"]