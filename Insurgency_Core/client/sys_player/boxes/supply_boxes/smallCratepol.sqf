/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

_boxClass = "ACE_Box_Ammo";


_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons

//supplies


_box AddMagazineCargoGlobal ["ACE_SpareBarrel",1];

_box AddMagazineCargoGlobal ["CUP_30Rnd_556x45_AK",30];
_box AddMagazineCargoGlobal ["CUP_30Rnd_TE1_Red_Tracer_556x45_AK",10];


_box AddMagazineCargoGlobal ["CUP_PG7VL_M",3];


_box AddMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",7];

_box AddMagazineCargoGlobal ["CUP_1Rnd_HE_GP25_M",15];
_box AddMagazineCargoGlobal ["CUP_1Rnd_SMOKE_GP25_M",5];


_box addItemCargoGlobal ["ACE_fieldDressing",20];
_box addItemCargoGlobal ["ACE_elasticBandage",20];
_box addItemCargoGlobal ["ACE_quikclot",20];
_box addItemCargoGlobal ["ACE_packingBandage",20];
_box addItemCargoGlobal ["ACE_personalAidKit",2];
_box addItemCargoGlobal ["ACE_salineIV_500",2];
_box addItemCargoGlobal ["ACE_atropine",5];
_box addItemCargoGlobal ["ACE_epinephrine",5];
_box addItemCargoGlobal ["ACE_morphine",5];
_box addItemCargoGlobal ["HandGrenade",5];
_box addItemCargoGlobal ["SmokeShell",5];
_box addItemCargoGlobal ["SmokeShellRed",2];

[player, _box] call ace_cargo_fnc_startLoadIn;