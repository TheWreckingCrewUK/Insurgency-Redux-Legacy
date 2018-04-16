//checks that all is good with the interpreter before sending any message to him. called by the primary functions and returns 0 if anything is wrong, returns 1 if everything is ok
params ["_time"];
if (isnull twc_terp) then {0} else {

if (isnil "_time") then {If (terptimer >0) exitwith {0}};

_terpradio = ["ACRE_PRC152", twc_terp] call acre_api_fnc_getRadioByType; 

_currentChannel = [_terpradio] call acre_api_fnc_getRadioChannel; 

if (isnil "_currentchannel") exitwith {0};

If (_currentchannel != twc_enemychannel) exitwith {0};

[40] call twc_terp_timer;
1;
};