/*
*    TWC public server
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

_boxClass = "groundWeaponHolder"; 
 
_box = _boxClass createVehicle (if (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0) then {
(getPos AmmoBoxSpawner)} else 
{(getPos player)});


_box addItemCargoGlobal ["ACE_artilleryTable",1];
_box addWeaponCargoGlobal ["UK3CB_BAF_L16",1];
_box addWeaponCargoGlobal ["UK3CB_BAF_L16_Tripod",1];
