params ["_count", "_pos"];
systemchat "stronghold 2";

{
_isterp = _x getvariable ["twc_isterp",0];

if (_isterp == 1) then {
[_x, _count, _pos] spawn {
params ["_unit", "_count", "_pos"];

systemchat "stronghold 11";
[0] call twc_terp_msgcheck; 

_terpdis = ((vehicle _unit) distance _pos);
_channel = _unit getvariable ["twc_terpchannel", -5];
while {(((vehicle _unit) distance _pos) < (_terpdis + 50))  && (_channel != twc_enemychannel)} do {

[0] call twc_terp_msgcheck; 
sleep 5;

_channel = _unit getvariable ["twc_terpchannel", -5];
};

systemchat "stronghold 23";
_countnum = count _count;
 {if (!(alive _x)) then {_countnum = _countnum - 1}} foreach _count;
_enemycountlow = (ceil((_countnum / 10) - (random 2) + (random 2)) * 10) max 0;  
_enemycounthigh = ((ceil((_enemycountlow * (1.2+ (random 0.7)))/10)) *10) max 0;  
  
 
if (_countnum < 5) exitwith {};



If (_channel == twc_enemychannel) then {
  

  
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Stronghold Intel - Stronghold</t>"; 

 _text1 = format ["<br />Chatter indicates a stronghold nearby with between %1 and %2 insurgents currently active", _enemycountlow, _enemycounthigh];
 _terptext = parsetext (_title + _text1);
 
 
 _list = _unit getvariable ["twc_terp_msglist", []];
 _list pushback _terptext;
 
 _unit setvariable ["twc_terp_msglist", _list, true];
 };
 };
};
} foreach allplayers;
