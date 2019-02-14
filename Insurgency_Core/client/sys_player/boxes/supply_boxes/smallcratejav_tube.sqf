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
	hint "More Javelin Tubes are now available from the spawner";
	
};

hint "The Tubes have been spawned. 1 hour remaining until more become available";

twc_javtubetimeout = (time + 3600);
 publicVariable "twc_javtubetimeout";

_boxClass = "UK3CB_BAF_Box_WpsLaunch_Javelin";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons
_box AddWeaponCargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube",1];

