/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

_boxClass = "twc_public_launcherbox_small_at4";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons
_box AddWeaponCargoGlobal ["CUP_launch_M136",5];



_title ="<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Ammo Spawner</t>";
_text1 = "<br />The crate has been spawned.";
hint parsetext (_title + _text1);