 _spawnpos = getpos AmmoBoxSpawner;
 
_vehtype = "CUP_B_HMMWV_Crows_M2_USA";
	

if (twc_wdveh == 1) then {
	_vehtype = "CUP_B_M1151_M2_USA";
};
	
 _car = _vehtype createvehicle _spawnpos;  
_veh = _car;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;



_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;


_mult = 1;

_veh setammocargo 0;
_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",7];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",8];
_veh AddMagazineCargoGlobal ["30Rnd_556x45_Stanag",6];

_veh AddWeaponCargoGlobal ["CUP_launch_M72A6",3];
_veh AddWeaponCargoGlobal ["twc_m4_acog_lazer",2];


[_veh, player, 4] call twc_fnc_genericfillvehicle;