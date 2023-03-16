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


_box addItemCargoGlobal ["ACE_fieldDressing",15];
_box addItemCargoGlobal ["ACE_elasticBandage",15];
_box addItemCargoGlobal ["ACE_quikclot",15];
_box addItemCargoGlobal ["ACE_packingBandage",15];
_box addItemCargoGlobal ["ACE_personalAidKit",1];
_box addItemCargoGlobal ["ACE_salineIV_500",4];
_box addItemCargoGlobal ["ACE_atropine",5];
_box addItemCargoGlobal ["ACE_epinephrine",5];
_box addItemCargoGlobal ["ACE_morphine",5];
_box addItemCargoGlobal ["HandGrenade",2];
_box addItemCargoGlobal ["SmokeShell",2];
_box addItemCargoGlobal ["SmokeShellRed",2];

[_box, player, 5] call twc_fnc_genericfillvehicle;