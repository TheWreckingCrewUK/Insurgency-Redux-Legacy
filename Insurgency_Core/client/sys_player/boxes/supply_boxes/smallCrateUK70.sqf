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

//supplies
_box AddMagazineCargoGlobal ["UK3CB_BAF_762_20Rnd",40];
_box AddMagazineCargoGlobal ["UK3CB_BAF_762_20Rnd_T",20];
_box AddMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer",7];
_box AddMagazineCargoGlobal ["ukcw_l42_10rnd_mag",15];

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