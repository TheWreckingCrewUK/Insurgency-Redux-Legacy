twc_fnc_spawnForwardBaseItems = compile preProcessFileLineNumbers"Insurgency_Core\client\sys_forwardBase\fnc_spawnForwardBaseItems.sqf";

_action = ["SpawnForwardBase","Spawn FB Gear","",{[_player] call twc_fnc_spawnForwardBaseItems;_return},{leader _player == _player && ((count units group player >= 4) || count allPlayers < 4)}] call ace_interact_menu_fnc_createAction;

["Land_InfoStand_V2_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;