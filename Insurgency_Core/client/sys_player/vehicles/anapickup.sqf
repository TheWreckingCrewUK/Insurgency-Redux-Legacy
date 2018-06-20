params["_heli"];

if(isNil "_heli")exitWith{hint "No vehicle was given to the spawn system, please notify management"};


_veh = _heli createvehicle (getPos AmmoBoxSpawner);


_veh setObjectTextureGlobal [0, "a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"]; [ 
 _veh, 
 ["Beige",1],  
 ["HideDoor1",0,"HideDoor2",0,"HideDoor3",1,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",1,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0] 
] call BIS_fnc_initVehicle;




clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Pickup Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;




_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;