params["_civ"];

if (0 > 0.2) exitwith {};
_newGroup = createGroup East;
_nearestEnemy = _civ findnearestenemy _civ;

_nearestplayer = 
nearestobject [_civ,playableUnits];

_enemyGroup = group (_nearestEnemy);

[_civ] joinSilent _newGroup;

sleep 2;
_weapon = [["rhs_weap_savz61_folded", "rhsgref_20rnd_765x17_vz61"],["rhs_weap_aks74u","rhs_30Rnd_545x39_AK"],["rhs_weap_savz61","rhsgref_20rnd_765x17_vz61"]];
_choice = _weapon call BIS_fnc_selectRandom;
_civ addMagazines [(_choice select 1), 4]; 
_gun = (_choice select 0);
_civweapon = _civ addWeapon _gun;
//systemchat _civweapon;

//_mag = getArray (configFile >> "CfgWeapons" >> (_civweapon select 0) select 0 >> "magazines"); 

 //experimental/untested:
 _newgroup setCombatMode "RED";
 _newgroup addwaypoint [position _nearestplayer, 0];