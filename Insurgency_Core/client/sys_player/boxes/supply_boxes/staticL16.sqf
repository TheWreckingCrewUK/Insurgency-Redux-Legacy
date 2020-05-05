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



//_box addWeaponCargoGlobal ["UK3CB_BAF_L16",1];
//_box addWeaponCargoGlobal ["UK3CB_BAF_L16_Tripod",1];
_box addWeaponCargoGlobal ["ace_compat_rhs_usf3_m252_carry",1];
_box addWeaponCargoGlobal ["ace_csw_carryMortarBaseplate",1];

_boxClass = "TWC_Public_AmmoBox_medium";

_box = _boxClass createVehicle (if (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0) then {
(getPos AmmoBoxSpawner)} else 
{(getPos player)});

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

_box addItemCargoGlobal ["ACE_artilleryTable",1];
_box addItemCargoGlobal ["ACE_1Rnd_82mm_Mo_HE",6];
//ACE_1Rnd_82mm_Mo_Illum
//ACE_1Rnd_82mm_Mo_HE
//ace_csw_carryMortarBaseplate
//ace_compat_rhs_usf3_m252_carry