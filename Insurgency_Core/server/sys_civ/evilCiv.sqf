params["_civ"];

if (random 1 > 0.1) exitwith {};
_newGroup = createGroup East;
//_nearestEnemy = _civ findnearestenemy _civ;

/*_bluforArray = [0,51];
_entityArray = _civ nearEntities 50;
{
    if (side _x != west) exitwith {};
    if ((_bluforArray select 1) > (_civ distance _x)) then
    {
        _bluforArray set [1, (_civ distance _x)];
        _bluforArray set [0, _x];
    };
} forEach _entityArray;
 
_nearestbluforplayer = _bluforArray select 0;
_nearestbluforpayerdistance = _bluforArray select 0;
*/
_bluforarray = (_civ nearentities ['man', 10]);
{_civ reveal _x} foreach _bluforarray;

//_nearestbluforplayer = _bluforArray select 0;

//_nearestplayer = position nearestobject [_civ, allPlayers];

//_enemyGroup = group (_nearestEnemy);

[_civ] joinSilent _newGroup;

 
//_civ reveal _nearestbluforplayer;
 _newgroup setCombatMode "RED";
 _newgroup addwaypoint [_nearestbluforplayer, 0];
sleep 0.2;
_weapon = [["rhs_weap_savz61_folded", "rhsgref_20rnd_765x17_vz61"],["rhs_weap_aks74u","rhs_30Rnd_545x39_AK"],["rhs_weap_savz61_folded","rhsgref_20rnd_765x17_vz61"]];
_choice = _weapon call BIS_fnc_selectRandom;
_civ addMagazines [(_choice select 1), 4]; 
_gun = (_choice select 0);
_civweapon = _civ addWeapon _gun;

//systemchat _civweapon;

//_mag = getArray (configFile >> "CfgWeapons" >> (_civweapon select 0) select 0 >> "magazines"); 

