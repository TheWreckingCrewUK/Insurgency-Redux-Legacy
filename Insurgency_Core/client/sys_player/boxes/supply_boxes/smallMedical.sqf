/*
*    TWC public server
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/


_boxClass = "ACE_medicalSupplyCrate_advanced";

_box = _boxClass createVehicle (if (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0) then {
(getPos AmmoBoxSpawner)} else 
{(getPos player)});

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Medical supplies
_box addItemCargoGlobal ["ACE_fieldDressing",20];
_box addItemCargoGlobal ["ACE_elasticBandage",30];
_box addItemCargoGlobal ["ACE_quikclot",20];
_box addItemCargoGlobal ["ACE_packingBandage",30];
_box addItemCargoGlobal ["ACE_personalAidKit",1];
_box addItemCargoGlobal ["ACE_salineIV_500",10];
_box addItemCargoGlobal ["ACE_salineIV_250",10];
_box addItemCargoGlobal ["ACE_atropine",15];
_box addItemCargoGlobal ["ACE_epinephrine",15];
_box addItemCargoGlobal ["ACE_morphine",15];
_box addItemCargoGlobal ["ACE_tourniquet",6];

//Respawn/Despawn Script

_trg = createTrigger ["EmptyDetector", getPos AmmoBoxSpawner];
_trg setTriggerArea [5,5,0,false];
_trg setTriggerActivation ["WEST", "NOT PRESENT", false];
_trg setTriggerTimeout [1800,1800,1800,true];
_trg setTriggerStatements ["this", "_box = (getPos thisTrigger) nearestObject 'ACE_medicalSupplyCrate_advanced'; deleteVehicle _box;",""];
_trg attachTo [_box];

[player, _box] call ace_cargo_fnc_startLoadIn;