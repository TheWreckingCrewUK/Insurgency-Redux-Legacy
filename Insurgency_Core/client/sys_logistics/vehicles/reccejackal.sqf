 _spawnpos = getpos AmmoBoxSpawner;
 
 
_vehtype = "UK3CB_BAF_Jackal2_L134A1_W";

if (twc_wdveh == 0) then {
_vehtype = "UK3CB_BAF_Jackal2_L134A1_D";
};
 
 _veh = _vehtype createvehicle _spawnpos;  


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;




_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


_veh AddMagazineCargoGlobal ["UK3CB_BAF_32Rnd_40mm_G_Box",12];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",8];
_veh AddMagazineCargoGlobal ["30Rnd_556x45_Stanag",20];
_veh AddMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",10];

[_veh, player, 5] call twc_fnc_genericfillvehicle;