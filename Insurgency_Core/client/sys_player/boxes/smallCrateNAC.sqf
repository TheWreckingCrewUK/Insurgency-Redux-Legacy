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
_box AddWeaponCargoGlobal ["rhs_weap_m72a7",2];


//supplies
_box AddMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",6];

_box AddMagazineCargoGlobal ["rhsgref_30rnd_556x45_m21",20];
_box AddMagazineCargoGlobal ["rhsgref_30rnd_556x45_m21_T",5];

_box AddMagazineCargoGlobal ["30Rnd_556x45_Stanag",20];
_box AddMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",5];

_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
_box AddMagazineCargoGlobal ["ACE_HuntIR_M203",5];
_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];


_box addItemCargoGlobal ["ACE_fieldDressing",5];
_box addItemCargoGlobal ["ACE_elasticBandage",5];
_box addItemCargoGlobal ["ACE_quikclot",5];
_box addItemCargoGlobal ["ACE_packingBandage",5];
_box addItemCargoGlobal ["ACE_personalAidKit",1];
_box addItemCargoGlobal ["ACE_salineIV_500",4];
_box addItemCargoGlobal ["ACE_atropine",5];
_box addItemCargoGlobal ["ACE_epinephrine",5];
_box addItemCargoGlobal ["ACE_morphine",5];
_box addItemCargoGlobal ["HandGrenade",2];
_box addItemCargoGlobal ["SmokeShell",2];
_box addItemCargoGlobal ["SmokeShellRed",2];

[player, _box] call ace_cargo_fnc_startLoadIn;