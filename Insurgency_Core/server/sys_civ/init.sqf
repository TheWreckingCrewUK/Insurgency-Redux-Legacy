

/*
params["_civ"];
//if (random 1 > 0.2) exitwith {};
 
_nearestEnemy = nearestobjects [_civ,["SoldierEB"],50];
[_civ] joinSilent (_nearestEnemy select 0);
 
_groundObj = nearestObjects [_civ, ["GroundWeaponHolder" ,"WeaponHolderSimulated"], 40];
_groundWeapon = getWeaponCargo (_groundObj select 0);
_mag = getArray (configFile >> "CfgWeapons" >> (_groundWeapon select 0) select 0 >> "magazines");
_pos1 = position (_groundObj select 0);
 
_civ doMove _pos1;
waitUntil {
    _civPos = position _civ;
    _civDist = _civPos distance (_groundObj select 0);
    _civDist < 1
 };
 
_civ addMagazines [_mag select 0, 4];
_civ addWeapon ((_groundWeapon select 0) select 0);
deleteVehicle (_groundObj select 0);

*/