/*
*    TWC public sevrer
*   
*
*  Zeus event box with various items to help with hearts and minds efforts.
*	Spawnable by the QM and the SL's
* US Version, without berets
*/
_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (if (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0) then {
(getPos AmmoBoxSpawner)} else 
{(getPos player)});

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;


//supplies

_box addItemCargoGlobal ["CUP_Item_Money",20];

_box addItemCargoGlobal ["ACE_MRE_SteakVegetables",5];
_box addItemCargoGlobal ["ACE_MRE_MeatballsPasta",5];
_box addItemCargoGlobal ["ACE_MRE_LambCurry",5];
_box addItemCargoGlobal ["ACE_MRE_CreamTomatoSoup",5];
_box addItemCargoGlobal ["ACE_MRE_CreamChickenSoup",5];
_box addItemCargoGlobal ["ACE_MRE_ChickenHerbDumplings",5];
_box addItemCargoGlobal ["ACE_MRE_ChickenTikkaMasala",5];
_box addItemCargoGlobal ["ACE_MRE_BeefStew",5];

_box addItemCargoGlobal ["ACE_WaterBottle",10];

[player, _box] call ace_cargo_fnc_startLoadIn;