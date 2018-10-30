/*
* Author(s): [TWC] Hobbs
* Mortar Spawner

* Arguments:
* <Array> Position
*
* Return Value:
* <NONE>
*
* Example:
* [getMarkerPos "spawn",[100,200],p1] spawn twc_fnc_spawnAIUnits;
*
* Public: No
*/

//Recieved Parameters
params ["_mortar"];

waituntil {!(isnil "twc_mortar_targetlist")};
waituntil {(count twc_mortar_targetlist) > 0};


_targetpos = twc_mortar_targetlist select 0;

//_random = ( 150 + (random 150)) + ((_mortar distance _targetpos1) / 20);
//_targetpos = ([_targetpos1,_random] call cba_fnc_randpos);

 //if ((typeName _mortar == "OBJECT")) then {_targetpos = getpos _targetpos};
sleep (1 + random 60);


if ((_mortar distance _targetpos) > 4500) exitwith {
[_mortar] spawn twc_fnc_mortarattack;
twc_mortar_targetlist deleteAt (twc_mortar_targetlist find _targetpos);
publicVariable "twc_mortar_targetlist";};

_mortar setvehicleammodef 1;
_mortar setvehicleammo 1;

_mortar lookat (_targetpos);
sleep 5;
 [_mortar, _targetpos] spawn {
_total = 5 +(random 5);
 params ["_mortar", "_targetpos"];
for "_i" from 1 to _total do {

 _ammo = ((gunner _mortar) ammo (currentmuzzle (gunner _mortar))); 
//_random = ( 150 + (random 50)) + ((_mortar distance _targetpos) / 30);
 _firepos = _targetpos;
 _mortar doArtilleryFire [_firepos , currentmagazine _mortar, 1]; 
 waituntil {_ammo > ((gunner _mortar) ammo (currentmuzzle (gunner _mortar)))}; 

 };
 
_mortar lookat objnull;
if ((random 1) < 0.7) then {
_mortar setvehicleammodef 0;
_mortar setvehicleammo 0;
};
sleep 60;
twc_mortar_targetlist deleteAt (twc_mortar_targetlist find _targetpos);
publicVariable "twc_mortar_targetlist";
 };



sleep (30 + random 30);

if ((random 1) < 0.2) then { twc_mortar_targetlist pushback _targetpos;};

[_mortar] spawn twc_fnc_mortarattack;