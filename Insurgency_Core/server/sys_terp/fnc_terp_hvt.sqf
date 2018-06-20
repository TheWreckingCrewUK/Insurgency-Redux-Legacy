
params ["_pos"];


_terpdis = ((vehicle twc_terp) distance _pos);

_sent = 0;

while {(((vehicle twc_terp) distance _pos) < (_terpdis + 50)) && (_sent == 0)} do {

[0] call twc_terp_msgcheck; 
 

sleep 2;


If (terptimer == 0) then {

If (terpChannel == twc_enemychannel) exitwith { 
[10] call twc_terp_timer;   


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Enemy Intel - HVT</t>"; 

 _text1 = "<br />You hear chatter that suggests a high ranking insurgent is operating nearby";
 _terptext = parsetext (_title + _text1);
 
 [_terptext] remoteExec ["hint",owner twc_terp];
 
_sent = 1;
};
};
sleep 20;
};


