[0] call twc_terp_msgcheck; 
 

sleep 2;

If (terpChannel != twc_enemychannel) exitwith {};  
[40] call twc_terp_timer;   
  "You hear chatter that suggests a weapons cache may be nearby" remoteExec ["hint",owner twc_terp];  
