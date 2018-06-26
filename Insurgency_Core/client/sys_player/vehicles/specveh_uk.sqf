 _spawnpos = getpos AmmoBoxSpawner;
 
 
 //
 if (isnil "twc_specvehcount") then {
 twc_specvehcount = 0;
 publicVariable "twc_specvehcount";
 };
 
 if (twc_specvehcount == 1) exitwith {
 
 _title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Specialist Vehicle</t>"; 

 _text1 =  "<br />Only one specialist section vehicle may exist at a time. Get the person that spawned the last one to return it in order to get a new one.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;
 };
 
 twc_specvehcount = 1;
 publicVariable "twc_specvehcount";
 
 
 _veh = "UK3CB_BAF_LandRover_Amb_Green_A" createvehicle _spawnpos;  
  
  
[
	_veh,
	nil,
	["ClanLogo_Hide",0,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",0,"AerialFR_Hide",1,"AirIntakeSnorkel_Hide",0,"Flag_Hide",0,"Mudguards_Hide",0,"Radio_Hide",0,"SideLockers_Hide",0]
] call BIS_fnc_initVehicle;

_veh setvariable ["ace_medical_isMedicalFacility", true]; 

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;


_veh addItemCargoGlobal ["ACE_fieldDressing",50];
_veh addItemCargoGlobal ["ACE_elasticBandage",50];
_veh addItemCargoGlobal ["ACE_quikclot",50];
_veh addItemCargoGlobal ["ACE_packingBandage",50];
_veh addItemCargoGlobal ["ACE_personalAidKit",2];
_veh addItemCargoGlobal ["ACE_salineIV",30];
_veh addItemCargoGlobal ["ACE_salineIV_500",30];
_veh addItemCargoGlobal ["ACE_salineIV_250",30];
_veh addItemCargoGlobal ["ACE_epinephrine",25];
_veh addItemCargoGlobal ["ACE_morphine",25];
_veh addItemCargoGlobal ["SmokeShell",5];
_veh addItemCargoGlobal ["SmokeShellRed",3];


_vehaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

 twc_specvehcount = 0;
 publicVariable "twc_specvehcount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_vehaction] call ace_interact_menu_fnc_addActionToobject;