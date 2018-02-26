/*
_player = _this;

createVehicle ["FlagSmall_F", ([_player, 2, getdir _player] call BIS_fnc_relPos), [], 0, "CAN_COLLIDE"];


	_twc_removeflag = ["clearflag","Remove Flag","",{deletevehicle _target},{count (_target nearobjects ["minebase", 3]) == 0}] call ace_interact_menu_fnc_createAction;
	["FlagSmall_F",0,["ACE_MainActions"],_twc_removeflag,true] call ace_interact_menu_fnc_addActionToClass;

count (_pos nearobjects ["minebase", 400]) > 0 && count (_pos nearobjects ["twc_flag_eod", 400]) < 30}