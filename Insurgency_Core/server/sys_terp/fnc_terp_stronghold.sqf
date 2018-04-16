params ["_count"];

_check = call twc_terp_msgcheck; 
 
_enemycountlow = ceil(((count _count) / 10) - (random 2) + (random 2)) * 10;  
_enemycounthigh = (ceil((_enemycountlow * (1.2+ (random 0.7)))/10)) *10;  
  
  
//systemchat format ["stronghold sees %1 with a low of %2 and a high of %3", count _count, _enemycountlow, _enemycounthigh];  
  
if (_check == 1) then {  
  
format ["Chatter indicates between %1 and %2 insurgents in the nearby stronghold", _enemycountlow, _enemycounthigh] remoteExec ["hint",owner twc_terp];  
};