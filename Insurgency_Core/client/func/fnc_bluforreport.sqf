params ["_pos"];


if ((side player) != east) exitwith {};
_check = call twc_fnc_checkenemyradio;
if (!_check) exitwith {};
_t0 = floor (_pos select 0);
_t1 = floor (_pos select 1);
_location = "Unnamed Village";
_location = text ((nearestLocations [_pos, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 1500]) select 0); 

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>COALITION FORCES SPOTTED</t>"; 

 _text1 = format ["<br />Village: %1<br /> Grid: 0%2 0%3",_location, _t0, _t1];
_spawntext = parsetext (_title + _text1);
hint _spawntext;