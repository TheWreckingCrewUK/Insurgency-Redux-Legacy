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

_box AddMagazineCargoGlobal ["CUP_30Rnd_556x45_G36",40];
_box AddMagazineCargoGlobal ["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",10];


_box AddMagazineCargoGlobal ["CUP_MAAWS_HEDP_MDP",3];


_box AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",3];
_box AddMagazineCargoGlobal ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",3];

_box AddMagazineCargoGlobal ["CUP_1Rnd_HEDP_M203",15];
_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];


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