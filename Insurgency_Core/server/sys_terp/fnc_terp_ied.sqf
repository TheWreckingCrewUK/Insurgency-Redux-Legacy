params ["_iedpos"];
if ((count (_iedpos nearobjects ['pipebombbase', 5])) ==0) exitwith {};
{
_isterp = _x getvariable ["twc_isterp",0];

if (_isterp == 1) then {
[_x, _iedpos] spawn {
params ["_unit", "_iedpos"];

_terpdis = ((vehicle _unit) distance _iedpos);


_channel = _unit getvariable ["twc_terpchannel", -5];

while {(((vehicle _unit) distance _iedpos) < (_terpdis + 50)) && (_channel != twc_enemychannel)} do {

[] call twc_terp_msgcheck;


sleep 3;

_channel = _unit getvariable ["twc_terpchannel", -5];
};

if ((count ((vehicle _unit) nearobjects ['pipebombbase', 500])) ==0) exitwith {};


If (_channel == twc_enemychannel) then {


_dis = ((ceil(((_unit distance _iedpos) + random 100) / 50)) / 2) * 100;



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Enemy Intel - IED</t>"; 

 _text1 = format ["<br />You hear chatter indicating an IED nearby, within approximately %1 meters of your current position",_dis];
 _terptext = parsetext (_title + _text1);
 
 _list = _unit getvariable ["twc_terp_msglist", []];
 _list pushback _terptext;
 
 _unit setvariable ["twc_terp_msglist", _list, true];
 
};

};
};
} foreach allplayers;
