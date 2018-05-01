[0] call twc_terp_msgcheck; 
 

sleep 2;

If (terpChannel != twc_enemychannel) exitwith {};  
[40] call twc_terp_timer;   


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Enemy Intel</t>"; 

 _text1 = "<br />You hear chatter that suggests a weapons cache may be nearby";
 _terptext = parsetext (_title + _text1);
 
 [_terptext] remoteExec ["hint",owner twc_terp];

