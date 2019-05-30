 _spawnpos = getpos AmmoBoxSpawner;
 
_vehtype = "CUP_B_M1165_GMV_USA";

_time = (group player) getvariable ["twc_lastminigunhumvee", -9999];

if (_time > (time - 3600)) exitwith { hint "An M134 Humvee has already been spawned. There are no more available"};

(group player) setvariable ["twc_lastminigunhumvee", time, true];
 
 _veh = _vehtype createvehicle _spawnpos;   

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


_veh AddWeaponCargoGlobal ["rhs_weap_m72a7",2];

_veh AddMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",40];

_veh AddMagazineCargoGlobal ["UGL_FlareWhite_F",2];
_veh AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",7];
_veh AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",3];

_veh addItemCargoGlobal ["DemoCharge_Remote_Mag",1];
_veh addItemCargoGlobal ["ACE_Clacker",1];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",1];
_veh addItemCargoGlobal ["ACE_fieldDressing",25];
_veh addItemCargoGlobal ["ACE_elasticBandage",15];
_veh addItemCargoGlobal ["ACE_packingBandage",15];
_veh addItemCargoGlobal ["ACE_salineIV_250",10];
_veh addItemCargoGlobal ["ACE_epinephrine",3];
_veh addItemCargoGlobal ["ACE_morphine",3];
_veh addItemCargoGlobal ["HandGrenade",2];
_veh addItemCargoGlobal ["SmokeShell",3];
_veh addItemCargoGlobal ["SmokeShellRed",3];

_fsgun = ["twc_rhs_weap_m240B_mgo_lazer",1];
_fsmag = ["UK3CB_BAF_762_100Rnd_T",5];

_veh AddMagazineCargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP",4];


_veh AddWeaponCargoGlobal _fsgun;
_veh AddMagazineCargoGlobal _fsmag;