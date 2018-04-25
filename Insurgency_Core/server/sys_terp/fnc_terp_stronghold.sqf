params ["_count"];

[0] call twc_terp_msgcheck; 

_countnum = count _count;
 {if (!(alive _x)) then {_countnum = _countnum - 1}} foreach _count;
_enemycountlow = (ceil((_countnum / 10) - (random 2) + (random 2)) * 10) max 0;  
_enemycounthigh = ((ceil((_enemycountlow * (1.2+ (random 0.7)))/10)) *10) max 0;  
  
   
sleep 2;

If (terpChannel != twc_enemychannel) exitwith {};
If (terptimer >0) exitwith {0};
[40] call twc_terp_timer;   
  
format ["Chatter indicates between %1 and %2 insurgents in the nearby stronghold", _enemycountlow, _enemycounthigh] remoteExec ["hint",owner twc_terp];  
