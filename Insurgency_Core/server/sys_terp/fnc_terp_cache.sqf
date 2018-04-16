_check = call twc_terp_msgcheck; 
 
//systemchat "cache received";
  
if (_check == 1) then {  
  "You hear chatter that suggests a weapons cache may be nearby" remoteExec ["hint",owner twc_terp];  
};