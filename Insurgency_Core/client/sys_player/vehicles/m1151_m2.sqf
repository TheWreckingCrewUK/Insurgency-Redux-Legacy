 _spawnpos = getpos AmmoBoxSpawner;
 
 
_class = "rhsusf_m1151_m2_v2_usarmy_wd";

if (twc_wdveh == 0) then {
	_class = "rhsusf_m1151_m2_v2_usarmy_d";
};
 
 _veh = _class createvehicle _spawnpos;  
  
 
  


clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;





//[_veh, player, 5] call twc_fnc_genericfillvehicle;