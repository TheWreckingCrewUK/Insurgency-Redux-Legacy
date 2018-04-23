 call twc_terp_msgcheck;

sleep 2;

If (terpChannel != twc_enemychannel) exitwith {}; 
If (terptimer >0) exitwith {0};
[40] call twc_terp_timer; 
"You hear general insurgent chatter coming from nearby" remoteExec ["hint",twc_terp];
