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
_box AddWeaponCargoGlobal ["UK3CB_BAF_AT4_CS_AP_Launcher",2];

_box AddMagazineCargoGlobal ["ACE_SpareBarrel",1];

//supplies
_box AddMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer",1];
_box AddMagazineCargoGlobal ["rhsusf_100Rnd_762x51",4];

_box AddMagazineCargoGlobal ["CUP_6Rnd_HE_M203",5];
_box AddMagazineCargoGlobal ["CUP_6Rnd_Smoke_M203",2];

_box AddMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag",20];
_box AddMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",10];

_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",10];
_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",10];

_box AddMagazineCargoGlobal ["rhs_200rnd_556x45_M_SAW",3];
_box AddMagazineCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",5];

_box AddMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",20];
_box AddMagazineCargoGlobal ["rhsusf_8Rnd_00Buck",5];
_box AddMagazineCargoGlobal ["rhsusf_8Rnd_Slug",5];

_box AddMagazineCargoGlobal ["rhsusf_10Rnd_762x51_m118_special_Mag",5];

_box AddMagazineCargoGlobal ["rhsusf_mag_6Rnd_M441_HE",2];

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