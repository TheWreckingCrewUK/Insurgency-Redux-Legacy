twc_fnc_giveUp = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_chat\giveUp.sqf";

["giveup",{player setVariable ["wantingSurrender",true,true]; [] remoteExec ["twc_fnc_giveUp",2]},"all"] call CBA_fnc_registerChatCommand;