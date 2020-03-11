 _spawnpos = getpos AmmoBoxSpawner;
 
_vehtype = "CUP_O_Hilux_unarmed_TK_INS";

	
 _car = _vehtype createvehicle _spawnpos;  
_veh = _car;
	
_colour = (["White", "Red", "Olive", "Grey", "Black", "Camo", "DarkBlue", "DarkGrey"] call bis_fnc_selectrandom);
[
	_veh,
	[_colour,1], 
	true
] call BIS_fnc_initVehicle;

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




[_veh, player, 6] call twc_fnc_genericfillvehicle;

