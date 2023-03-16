/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/
params ["_box"];

_boxClass = "ACE_Box_Ammo";

if (isnil "_box") then {
	_box = _boxClass createVehicle (getPos AmmoBoxSpawner);
};

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons
_box AddWeaponCargoGlobal ["CUP_launch_M72A6",2];

_box AddMagazineCargoGlobal ["ACE_SpareBarrel",1];

//supplies
_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",7];

_box AddMagazineCargoGlobal ["CUP_30Rnd_9x19_MP5",30];

_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_10Rnd",10];
_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_10Rnd_T",4];

_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",30];
_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",5];

_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",6];
_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",2];

_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",8];

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