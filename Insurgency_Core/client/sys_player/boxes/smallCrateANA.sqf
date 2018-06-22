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

//add 556 mags if it's not 90's, because they have access to M16's
if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
_box AddMagazineCargoGlobal ["30Rnd_556x45_Stanag",20];
_box AddMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",5];
};

_box AddMagazineCargoGlobal ["rhs_30Rnd_762x39mm",20];
_box AddMagazineCargoGlobal ["rhs_30Rnd_762x39mm_tracer",5];
_box AddMagazineCargoGlobal ["rhs_30Rnd_545x39_7N22_AK",5];

_box AddMagazineCargoGlobal ["rhs_mag_9x18_8_57N181S",5];

_box AddMagazineCargoGlobal ["rhs_rpg7_PG7V_mag",2];
_box AddMagazineCargoGlobal ["rhs_rpg7_OG7V_mag",4];


_box AddMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_green",6];

_box AddMagazineCargoGlobal ["rhs_10Rnd_762x54mmR_7N1",6];


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