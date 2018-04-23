[0] call twc_terp_msgcheck;

sleep 2;

If (terpChannel != twc_enemychannel) exitwith {}; 
[40] call twc_terp_timer;   

_ied = (vehicle twc_terp nearobjects ['pipebombbase', 500]) select 0;

_dis = ((ceil(((twc_terp distance _ied) + random 100) / 50)) / 2) * 100;



format ["You hear chatter indicating an IED nearby, within approximately %1 meters of your current position",_dis] remoteExec ["hint",owner twc_terp];
