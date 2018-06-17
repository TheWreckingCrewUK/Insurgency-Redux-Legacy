params ["_count"];

[0] call twc_terp_msgcheck; 

_countnum = count _count;
 {if (!(alive _x)) then {_countnum = _countnum - 1}} foreach _count;
_enemycountlow = (ceil((_countnum / 10) - (random 2) + (random 2)) * 10) max 0;  
_enemycounthigh = ((ceil((_enemycountlow * (1.2+ (random 0.7)))/10)) *10) max 0;  
  
 
if (_countnum == 0) exitwith {};
sleep 2;

If (terpChannel != twc_enemychannel) exitwith {};
If (terptimer >0) exitwith {0};
[20] call twc_terp_timer;   

  
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Stronghold Intel</t>"; 

 _text1 = format ["<br />Chatter indicates between %1 and %2 insurgents in the nearby stronghold", _enemycountlow, _enemycounthigh];
 _terptext = parsetext (_title + _text1);
 
 [_terptext] remoteExec ["hint",owner twc_terp];