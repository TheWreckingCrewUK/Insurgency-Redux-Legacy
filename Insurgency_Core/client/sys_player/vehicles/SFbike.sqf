 _spawnpos = getpos AmmoBoxSpawner;
 
_vehtype = "CUP_C_TT650_TK_CIV";

 
 _veh = _vehtype createvehicle _spawnpos;   

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Bike Has Been Spawned. It's Already Loaded With Ammunition and can be loaded inside other vehicles. It takes 7 cargo space.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;



_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;


_veh AddWeaponCargoGlobal ["CUP_launch_M72A6",1];

_veh AddMagazineCargoGlobal ["30Rnd_556x45_Stanag",5];

_veh addItemCargoGlobal ["ACE_EntrenchingTool",1];
_veh addItemCargoGlobal ["ACE_fieldDressing",25];
_veh addItemCargoGlobal ["ACE_epinephrine",3];
_veh addItemCargoGlobal ["ACE_morphine",3];
_veh addItemCargoGlobal ["SmokeShellRed",3];



[_veh, player, 2] call twc_fnc_genericfillvehicle;
[_veh, 7] call ace_cargo_fnc_setSize;