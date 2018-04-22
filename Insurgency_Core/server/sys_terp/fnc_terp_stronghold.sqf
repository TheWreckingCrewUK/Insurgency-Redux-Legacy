params ["_count"];

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

 
_enemycountlow = ceil(((count _count) / 10) - (random 2) + (random 2)) * 10;  
_enemycounthigh = (ceil((_enemycountlow * (1.2+ (random 0.7)))/10)) *10;  
  
  
//systemchat format ["stronghold sees %1 with a low of %2 and a high of %3", count _count, _enemycountlow, _enemycounthigh];  
  
if (_check == 1) then {  
  
format ["Chatter indicates between %1 and %2 insurgents in the nearby stronghold", _enemycountlow, _enemycounthigh] remoteExec ["hint",owner twc_terp];  
};