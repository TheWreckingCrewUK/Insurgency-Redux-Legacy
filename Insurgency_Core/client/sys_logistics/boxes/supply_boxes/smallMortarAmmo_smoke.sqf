/*
*    TWC public server
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/


_boxClass = "TWC_Public_AmmoBox_medium";

_box = _boxClass createVehicle (if (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0) then {
(getPos AmmoBoxSpawner)} else 
{(getPos player)});

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//1 Mortar and Tripod
//_box AddWeaponCargoGlobal ["UK3CB_BAF_M6",1];

//Ammo

//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells",8];
//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",8];
_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",20];



[player, _box] call ace_cargo_fnc_startLoadIn;