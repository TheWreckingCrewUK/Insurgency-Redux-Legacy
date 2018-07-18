/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (if (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0) then {
(getPos AmmoBoxSpawner)} else 
{(getPos player)});

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons

//supplies



_box AddMagazineCargoGlobal ["rhs_30Rnd_545x39_AK",30];
_box AddMagazineCargoGlobal ["rhs_30Rnd_545x39_AK_green",10];


_box AddMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",3];
_box AddMagazineCargoGlobal ["rhs_rpg7_TBG7V_mag",2];


_box AddMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_7N26",5];
_box AddMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_green",2];

_box AddMagazineCargoGlobal ["rhs_VOG25",15];
_box AddMagazineCargoGlobal ["rhs_GRD40_White",5];


_box addItemCargoGlobal ["ACE_fieldDressing",20];
_box addItemCargoGlobal ["ACE_elasticBandage",20];
_box addItemCargoGlobal ["ACE_quikclot",20];
_box addItemCargoGlobal ["ACE_packingBandage",20];
_box addItemCargoGlobal ["ACE_personalAidKit",5];
_box addItemCargoGlobal ["ACE_salineIV_500",2];
_box addItemCargoGlobal ["ACE_atropine",5];
_box addItemCargoGlobal ["ACE_epinephrine",5];
_box addItemCargoGlobal ["ACE_morphine",5];
_box addItemCargoGlobal ["HandGrenade",5];
_box addItemCargoGlobal ["SmokeShell",5];
_box addItemCargoGlobal ["SmokeShellRed",2];

[player, _box] call ace_cargo_fnc_startLoadIn;