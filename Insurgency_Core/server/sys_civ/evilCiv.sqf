params["_civ"];

//if (random 1 > 0.1) exitwith {};
_newGroup = createGroup East;

_bluforarray = (_civ nearentities ['man', 10]);
{_civ reveal _x} foreach _bluforarray;
[_civ] joinSilent _newGroup;
_civ setVariable ["twc_isenemy",1, true];

 
 _newgroup setCombatMode "RED";
 //_newgroup addwaypoint [_nearestbluforplayer, 0];
sleep 0.2;
_weapon = [["rhs_weap_savz61_folded", "rhsgref_20rnd_765x17_vz61"],["rhs_weap_aks74u_folded","rhs_30Rnd_545x39_AK"],["rhs_weap_savz61_folded","rhsgref_20rnd_765x17_vz61"]];
_choice = _weapon call BIS_fnc_selectRandom;
_civ addMagazines [(_choice select 1), 4]; 
_gun = (_choice select 0);
//_civweapon = _civ addWeapon _gun;

[_civ, _gun] remoteExec ["addweapon",0];
