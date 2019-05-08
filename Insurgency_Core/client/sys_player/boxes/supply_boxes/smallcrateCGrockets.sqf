/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/


 if (isnil "twc_javtubetimeout") then {
 twc_javtubetimeout = - 3600;
 publicVariable "twc_javtubetimeout";
 };
 
if ((twc_javtubetimeout > (time))) exitwith {
	hint format ["The Heavy AT spawner is on cooldown currently. %1 minutes remaining.", (ceil ( (twc_javtubetimeout-time) / 60))];
	waituntil {(twc_javtubetimeout-time) < 0};
	hint "More Gustav Rockets are now available from the spawner";
	
};

hint "The Rockets have been spawned. 1 hour remaining until more become available";

twc_javtubetimeout = (time + 3600);
 publicVariable "twc_javtubetimeout";

_boxClass = "twc_public_launcherbox_small_maaws";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons
_box AddMagazineCargoGlobal ["rhs_mag_maaws_HEDP",2];
_box AddMagazineCargoGlobal ["rhs_mag_maaws_HEAT",2];
_box AddMagazineCargoGlobal ["rhs_mag_maaws_HE",2];

