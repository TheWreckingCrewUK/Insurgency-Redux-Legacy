_action = ["startsiren","Start Siren","",{execvm "Insurgency_Core\server\sys_basedefence\inf_alarm.sqf"},{((count units group player >= 4) || count allPlayers < 4)}] call ace_interact_menu_fnc_createAction;

["Land_Laptop_device_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;

_action1 = ["startsiren","Sound All Clear","",{execvm "Insurgency_Core\server\sys_basedefence\inf_alarmclear.sqf"},{((count units group player >= 4) || count allPlayers < 4)}] call ace_interact_menu_fnc_createAction;

["Land_Laptop_device_F",0,["ACE_MainActions"],_action1,true] call ace_interact_menu_fnc_addActionToClass;