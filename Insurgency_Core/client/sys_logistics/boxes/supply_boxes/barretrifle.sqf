/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

if (isnil "twc_50spawned") then {
	twc_50spawned = 0;
	publicVariable "twc_50spawned";
};
	
if (twc_50spawned == 1) exitwith {hint "A Rifle has already been spawned, there are no more available"};

twc_50spawned = 1;
publicVariable "twc_50spawned";

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Anti Material Rifle</t>"; 

 _text1 = "<br />An Anti Material Rifle has been spawned";
hint parsetext (_title + _text1);

_boxClass = "UK3CB_BAF_Box_WpsLaunch";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons


//supplies
_box AddweaponCargoGlobal ["twc_rhs_weap_M107",1];

_box AddMagazineCargoGlobal ["UK3CB_BAF_127_10Rnd",20];
_box AddMagazineCargoGlobal ["CUP_10Rnd_127x99_m107",10];
_box AddMagazineCargoGlobal ["CUP_10Rnd_127x99_m107",6];