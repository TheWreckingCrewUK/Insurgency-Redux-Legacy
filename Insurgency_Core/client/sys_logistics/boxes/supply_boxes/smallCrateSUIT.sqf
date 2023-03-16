/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/
params ["_box"];

_boxClass = "ACE_Box_Ammo";

if ((count (units group player)) < 6) exitwith {
	hint "You need 6 or more people in your section to be issued the SUIT scope.";
};

_timer = (group player) getvariable ["twc_lastsuit", -99999];

if ((_timer > (time - 10000))) exitwith {
	hint "A SUIT scope was issued to your section already. No more are available to you";
};
(group player) setvariable ["twc_lastsuit", time, true];

if (isnil "_box") then {
	_box = _boxClass createVehicle (getPos AmmoBoxSpawner);
};

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

_box addItemCargoGlobal ["uk3cb_baf_suit",1];
