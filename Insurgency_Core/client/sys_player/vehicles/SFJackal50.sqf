 _spawnpos = getpos AmmoBoxSpawner;
 

_vehtype = "UK3CB_BAF_Jackal2_L111A1_W";

if (twc_wdveh == 0) then {
_vehtype = "UK3CB_BAF_Jackal2_L111A1_D";
};
 
 _car = _vehtype createvehicle _spawnpos;   
_veh = _car;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

sleep 1;


_car spawn {
params ["_car"];
_objects = attachedobjects _car;
waituntil {!alive _car || isnull _car};
{deletevehicle _x} foreach _objects;
};

_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;


//supplies
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",8];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",8];

_veh AddWeaponCargoGlobal ["rhs_weap_m72a7",1];

_veh AddMagazineCargoGlobal ["CUP_30Rnd_556x45_Emag",30];
_veh AddMagazineCargoGlobal ["CUP_30Rnd_556x45_Emag_Tracer_Red",10];

_veh AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
_veh AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
_veh AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

_veh addItemCargoGlobal ["ACE_DefusalKit",2];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",2];
_veh addItemCargoGlobal ["ACE_CableTie",15];
_veh addItemCargoGlobal ["ACE_fieldDressing",25];
_veh addItemCargoGlobal ["ACE_elasticBandage",25];
_veh addItemCargoGlobal ["ACE_quikclot",25];
_veh addItemCargoGlobal ["ACE_packingBandage",25];
_veh addItemCargoGlobal ["ACE_personalAidKit",1];
_veh addItemCargoGlobal ["ACE_salineIV_250",20];
_veh addItemCargoGlobal ["ACE_salineIV_500",20];
_veh addItemCargoGlobal ["ACE_atropine",5];
_veh addItemCargoGlobal ["ACE_epinephrine",10];
_veh addItemCargoGlobal ["ACE_morphine",10];
_veh addItemCargoGlobal ["HandGrenade",2];
_veh addItemCargoGlobal ["SmokeShell",3];
_veh addItemCargoGlobal ["SmokeShellRed",3];

if ((["00", twc_missionname] call BIS_fnc_inString)) then {
	_veh AddMagazineCargoGlobal ["rhsusf_5Rnd_Slug",10];
	_veh AddMagazineCargoGlobal ["rhsusf_5Rnd_00Buck",10];
	_veh AddMagazineCargoGlobal ["CUP_30Rnd_9x19_MP5",10];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",10];
} else {
	_veh AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",8];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",5];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];
};