//checks that all is good with the interpreter before sending any message to him. called by the primary functions and returns 0 if anything is wrong, returns 1 if everything is ok
params ["_time"];

{ 
 if (_x isKindOf "twc_ana_interpreter") then { 
 
twc_terp = _x;
publicVariable "twc_terp"}; 
} forEach allUnits; 

 
if (isnull twc_terp) exitwith {terpChannel = 0; publicvariable "terpChannel"}; 
1;
[{ 
_terpradio = ["ACRE_PRC152", twc_terp] call acre_api_fnc_getRadioByType;   
 if (isnil "_terpradio") exitwith {}; 
terpChannel = [_terpradio] call acre_api_fnc_getRadioChannel; 
publicVariable "terpChannel"; 
If (terpChannel != twc_enemychannel) exitwith {0}; 
1; 
}] remoteExec ["bis_fnc_call", twc_terp];
/*
if (isnull twc_terp) then {0} else {

if (isnil "_time") then {If (terptimer >0) exitwith {0}};

If (terpChannel != twc_enemychannel) exitwith {0};

[40] call twc_terp_timer;
1;
};