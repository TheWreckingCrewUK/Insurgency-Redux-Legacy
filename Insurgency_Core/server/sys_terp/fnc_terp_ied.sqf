params ["_iedpos"];

_terpdis = ((vehicle twc_terp) distance _iedpos);

while {((vehicle twc_terp) distance _iedpos) < (_terpdis + 50)} do {

[0] call twc_terp_msgcheck;

if ((count ((vehicle twc_terp) nearobjects ['pipebombbase', 500])) ==0) exitwith {};

sleep 2;

If (terpChannel == twc_enemychannel) then {
[10] call twc_terp_timer;   


_dis = ((ceil(((twc_terp distance _iedpos) + random 100) / 50)) / 2) * 100;



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Enemy Intel - IED</t>"; 

 _text1 = format ["<br />You hear chatter indicating an IED nearby, within approximately %1 meters of your current position",_dis];
 _terptext = parsetext (_title + _text1);
 
 [_terptext] remoteExec ["hint",owner twc_terp];
 
 sleep 20;
};

sleep 5;
};

