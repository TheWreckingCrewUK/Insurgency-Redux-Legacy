_check = [0] call twc_terp_msgcheck;
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

[40] call twc_terp_timer;
_check = 1;
*/
//systemchat format ["check returns %1 for IED message", _check];

if (_check == 1) then {

_ied = (vehicle twc_terp nearobjects ['pipebombbase', 500]) select 0;

_dis = ((ceil(((twc_terp distance _ied) + random 100) / 50)) / 2) * 100;



format ["You hear chatter indicating an IED nearby, within approximately %1 meters of your current position",_dis] remoteExec ["hint",owner twc_terp];
};