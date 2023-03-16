 _spawnpos = getpos AmmoBoxSpawner;
 
_vehtype = "UK3CB_BAF_Jackal2_L111A1_D";
	
_is00 = 0;
 if ((["00", twc_missionname] call BIS_fnc_inString)) then {
 _is00 = 1;
 };

 if (_is00 == 1) then {

	_vehtype = "UK3CB_BAF_Jackal2_L111A1_W";

	if (twc_wdveh == 0) then {
	_vehtype = "UK3CB_BAF_Jackal2_L111A1_D";
	};
} else {
	_vehtype = "UK3CB_BAF_Coyote_Logistics_L111A1_W";

	if (twc_wdveh == 0) then {
	_vehtype = "UK3CB_BAF_Coyote_Logistics_L111A1_D";
	};
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

if (_is00 == 0) then {
_mult = 1.5;
};


_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",8*_mult];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",8*_mult];

_veh AddWeaponCargoGlobal ["CUP_launch_M72A6",1*_mult];

_veh AddMagazineCargoGlobal ["CUP_30Rnd_556x45_Emag",30*_mult];
_veh AddMagazineCargoGlobal ["CUP_30Rnd_556x45_Emag_Tracer_Red",10*_mult];

_veh AddMagazineCargoGlobal ["UGL_FlareWhite_F",5*_mult];
_veh AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10*_mult];
_veh AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5*_mult];

_veh addItemCargoGlobal ["ACE_DefusalKit",1*_mult];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",1*_mult];
_veh addItemCargoGlobal ["ACE_CableTie",10*_mult];
_veh addItemCargoGlobal ["ACE_fieldDressing",25*_mult];
_veh addItemCargoGlobal ["ACE_elasticBandage",15*_mult];
_veh addItemCargoGlobal ["ACE_quikclot",15*_mult];
_veh addItemCargoGlobal ["ACE_packingBandage",15*_mult];
_veh addItemCargoGlobal ["ACE_personalAidKit",1*_mult];
_veh addItemCargoGlobal ["ACE_salineIV_250",15*_mult];
_veh addItemCargoGlobal ["ACE_salineIV_500",15*_mult];
_veh addItemCargoGlobal ["ACE_atropine",5*_mult];
_veh addItemCargoGlobal ["ACE_epinephrine",10*_mult];
_veh addItemCargoGlobal ["ACE_morphine",10*_mult];
_veh addItemCargoGlobal ["HandGrenade",2*_mult];
_veh addItemCargoGlobal ["SmokeShell",3*_mult];
_veh addItemCargoGlobal ["SmokeShellRed",3*_mult];

_fsgun = ["UK3CB_BAF_L7A2",1];
_fsmag = ["UK3CB_BAF_762_100Rnd_T",3*_mult];

if (_is00 == 1) then {
	_veh AddMagazineCargoGlobal ["CUP_30Rnd_9x19_MP5",6];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",10];
	
	if ((random 1) < 0.5) then {
		_fsgun = ["TWC_UK3CB_BAF_L110A2_SUSAT",1];
		_fsmag = ["UK3CB_BAF_556_200Rnd_T",5*_mult];
	};
} else {

	_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",2];
	_veh AddMagazineCargoGlobal ["CUP_17Rnd_9x19_glock17",4*_mult];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",5*_mult];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10*_mult];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",5];
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",4];
	
	_mag = (group player) getvariable ["twc_cqbmag", "CUP_30Rnd_556x45_Emag"];
	_veh AddMagazineCargoGlobal [_mag ,5];
	
	
	if ((random 1) < 0.5) then {
		_fsgun = ["UK3CB_BAF_L110A2_ELCAN3D",1];
		_fsmag = ["UK3CB_BAF_556_200Rnd_T",5*_mult];
	};
};

_veh AddWeaponCargoGlobal _fsgun;
_veh AddMagazineCargoGlobal _fsmag;
[_veh, player, 5] call twc_fnc_genericfillvehicle;


[_veh, 8] call ace_cargo_fnc_setSpace;
_veh setvariable ["ace_cargo_loaded", ["ACE_Wheel","ACE_Wheel","ACE_Wheel","ACE_Wheel","ACE_Wheel"], true];