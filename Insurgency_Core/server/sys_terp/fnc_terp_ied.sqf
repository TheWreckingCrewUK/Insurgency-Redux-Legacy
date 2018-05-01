[0] call twc_terp_msgcheck;

sleep 2;

If (terpChannel != twc_enemychannel) exitwith {}; 
[40] call twc_terp_timer;   

_ied = (vehicle twc_terp nearobjects ['pipebombbase', 500]) select 0;

_dis = ((ceil(((twc_terp distance _ied) + random 100) / 50)) / 2) * 100;



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Enemy Intel</t>"; 

 _text1 = format ["<br />You hear chatter indicating an IED nearby, within approximately %1 meters of your current position",_dis];
 _terptext = parsetext (_title + _text1);
 
 [_terptext] remoteExec ["hint",owner twc_terp];

