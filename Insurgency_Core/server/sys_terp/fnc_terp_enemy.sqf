_check = call twc_terp_msgcheck;
/*
{ 
 if (_x isKindOf "twc_ana_interpreter") then { 
 
twc_terp = _x;
publicVariable "twc_terp"}; 
} forEach allUnits; 

if (isnull twc_terp) exitwith {};
_terpradio = ["ACRE_PRC152", twc_terp] call acre_api_fnc_getRadioByType;  
 if (isnil "_terpradio") exitwith {};
terpChannel = [_terpradio] call acre_api_fnc_getRadioChannel;
publicVariable "terpChannel";
If (terpChannel != twc_enemychannel) exitwith {_check=0};
If (terptimer >0) exitwith {_check=0};
[40] call twc_terp_timer;
_check = 1;
*/
//systemchat format ["check returns %1 for enemy message", _check];

if (_check == 1) then {

"You hear general insurgent chatter coming from nearby" remoteExec ["hint",twc_terp];

};