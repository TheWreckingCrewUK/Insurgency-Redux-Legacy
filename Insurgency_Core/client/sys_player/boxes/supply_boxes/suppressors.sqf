/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/


if (totalpoints < (pointlimit / 2)) exitwith {
	
	_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Suppressors</t>"; 

	 _text1 = "<br />You need to be more than halfway through the mission before suppressors become available";
	hint parsetext (_title + _text1);
};


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Suppressors</t>"; 

 _text1 = "<br />A Suppressor Box has been spawned.";
hint parsetext (_title + _text1);

_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

 if ((["00", twc_missionname] call BIS_fnc_inString)) then {
 
_box AdditemCargoGlobal ["twc_L85_suppressor",15];

} else {

//supplies
_box AdditemCargoGlobal ["twc_acc_rotex5_grey",15];
_box AdditemCargoGlobal ["twc_acc_nt4_tan",1];
_box AdditemCargoGlobal ["rhsusf_acc_omega9k",2];
_box AdditemCargoGlobal ["cup_acc_cz_m3x",2];
};