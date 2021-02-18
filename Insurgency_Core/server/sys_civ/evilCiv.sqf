params["_civ"];

//if (random 1 > 0.1) exitwith {};
_newGroup = createGroup East;

_bluforarray = (_civ nearentities ['man', 10]);
{_civ reveal _x} foreach _bluforarray;
[_civ] joinSilent _newGroup;
_civ setVariable ["twc_isenemy",1, true];

 
 _newgroup setCombatMode "RED";
 //_newgroup addwaypoint [_nearestbluforplayer, 0];
 _civ enableai "path";
 _civ enableai "move";
 _civ enableai "fsm";
 
 if ((primaryweapon _civ) != "") exitwith {};
 
sleep 0.2;
_weapon = [["CUP_hgun_SA61", "CUP_20Rnd_B_765x17_Ball_M"],["CUP_arifle_AKS74U","CUP_30Rnd_545x39_AK74_plum_M"],["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"],["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"],["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"]];
_choice = _weapon call BIS_fnc_selectRandom;
_civ addMagazines [(_choice select 1), 4]; 
_gun = (_choice select 0);
//_civweapon = _civ addWeapon _gun;

[_civ, _gun] remoteExec ["addweapon",0];
