/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

if (isnil "twc_uavspawned") then {
	twc_uavspawned = 0;
	publicVariable "twc_uavspawned";
};
	
if (twc_uavspawned == 1) exitwith {hint "A Raven has already been spawned, there are no more available"};

twc_uavspawned = 1;
publicVariable "twc_uavspawned";

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Raven UAV</t>"; 

 _text1 = "<br />A Raven UAV has been spawned. Make sure not to give it to someone that doesn't have a backpack by default, it will be deleted without warning and you won't be able to get another";
hint parsetext (_title + _text1);

_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons


//supplies
_box AddBackpackCargoGlobal ["B_UAV_01_backpack_F",1];