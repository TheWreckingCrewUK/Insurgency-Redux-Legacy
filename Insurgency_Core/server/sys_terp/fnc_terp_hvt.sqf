
params ["_pos", "_id"];

if (!(_id in twc_activemissions)) exitwith {};

{
_isterp = _x getvariable ["twc_isterp",0];

if (_isterp == 1) then {
[_x, _pos] spawn {
params ["_unit", "_pos"];
_terpdis = ((vehicle _unit) distance _pos);


_channel = _unit getvariable ["twc_terpchannel", -5];
while {(((vehicle _unit) distance _pos) < (_terpdis + 50)) && (_channel != twc_enemychannel)} do {

[] call twc_terp_msgcheck; 
 

sleep 5;

_channel = _unit getvariable ["twc_terpchannel", -5];
};




If (_channel == twc_enemychannel) exitwith { 


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Enemy Intel - HVT</t>"; 

 _text1 = "<br />You hear chatter that suggests a high ranking insurgent is operating nearby";
 _terptext = parsetext (_title + _text1);
 
 _list = _unit getvariable ["twc_terp_msglist", []];
 _list pushback _terptext;
 
 _unit setvariable ["twc_terp_msglist", _list, true];
 
};
};

};

} foreach allplayers;