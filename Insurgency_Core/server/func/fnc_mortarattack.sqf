params ["_targetpos"];


[_targetpos] spawn {

params ["_targetpos"];

sleep (10 + random 30);

twc_mortar setvehicleammo 1;

_total = 5 +(random 7);

if ((twc_mortar distance _targetpos) > 4000) exitwith {};

_radius = (twc_mortar distance _targetpos) / 80;

twc_mortar lookat (_targetpos);

for "_i" from 1 to _total do {

twc_mortar doArtilleryFire [_targetpos, currentmagazine twc_mortar, 1]; 

sleep (4 + random 3);

}; twc_mortar lookat objnull;

twc_mortar setvehicleammo 0;

sleep (30 + random 180);

if ((random 1) < twc_mortarchance) exitwith { [_targetpos] remoteExec ["twc_fnc_mortarattack", 2];};

};
