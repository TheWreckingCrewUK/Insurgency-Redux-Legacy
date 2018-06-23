params ["_targetpos"];


[_targetpos] spawn {

params ["_targetpos"];

sleep 10 + (random 30);

_total = 3 +(random 7);

if ((twc_mortar distance _targetpos) > 4000) exitwith {};

_radius = (twc_mortar distance _targetpos) / 80;

twc_mortar lookat (_targetpos);

for "_i" from 1 to _total do {

twc_mortar doArtilleryFire [[_targetpos,150] call cba_fnc_randpos, currentmagazine twc_mortar, 1];

sleep 4 +(random 3);

}; twc_mortar lookat objnull;

twc_mortar setvehicleammo 1;

sleep 60 + (random 60);

if ((random 1) > 0.8) exitwith {[_targetpos] call twc_fnc_mortarattack};

};
