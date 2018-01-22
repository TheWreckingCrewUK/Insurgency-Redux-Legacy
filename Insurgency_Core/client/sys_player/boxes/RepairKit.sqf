/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

if (( count(allPlayers - entities "HeadlessClient_F"))<3) then {
[3] execVM "Domination_Core\client\sys_restrict\restrictedkit.sqf";} else {
_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);
"ace_Wheel" createVehicle (getPos AmmoBoxSpawner);
"ace_Wheel" createVehicle (getPos AmmoBoxSpawner);
"ace_Track" createVehicle (getPos AmmoBoxSpawner);
"ace_Track" createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;


//supplies
_box AdditemCargoGlobal ["Toolkit",4];};