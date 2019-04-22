 _spawnpos = getpos AmmoBoxSpawner;
 
 

 
 _veh = "UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A_TWC" createvehicle _spawnpos;  


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

sleep 1;

{deletevehicle _x} foreach attachedobjects _veh;

//re-adding the init code that it should be taking from config but isn't when on server
_car = _veh;			_obj = 'fuel_can' createvehicle [0,0,0];		_obj attachto [_car, [0.85,0.28,-0.8]];			_obj setVectorDirAndUp [[1,0,0.2],[0,0,1]];				[_obj, 20] call ace_refuel_fnc_makeSource;	[_obj, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;	_obj = 'fuel_can' createvehicle [0,0,0];		_obj attachto [_car, [0.85,-0.2,-0.8]];		_obj setVectorDirAndUp [[1,0,0.2],[0,0,1]];					[_obj, 20] call ace_refuel_fnc_makeSource;		[_obj, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;		_car animate ['sparewheel_hide', 1];		_car animate ['gear_hide', 1];		 _obj = 'fuel_can' createvehicle [0,0,0];  _obj attachto [_car, [-1.11,-1.7,-1.5]];   _obj setVectorDirAndUp [[1,0,0],[0,0,1]];				[_obj, 20] call ace_refuel_fnc_makeSource;		[_obj, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;			  _obj = 'ace_wheel' createvehicle [0,0,0];  _obj attachto [_car, [-0.1,2.95,-1.4]];   _obj setVectorDirAndUp [[0,-0.1,1],[0,1,0]]; 		 _obj = 'ace_wheel' createvehicle [0,0,0];  _obj attachto [_car, [-1.1,-0.2,-0.8]];   _obj setVectorDirAndUp [[0.2,0,1],[0,0,1]];		 _obj = 'ace_wheel' createvehicle [0,0,0];  _obj attachto [_car, [-1.1,-1.3,-0.7]];   _obj setVectorDirAndUp [[0.2,0,1],[0,0,1]]; 

_car animate ['javelintubespare_hide', 1];

_obj = 'ace_wheel' createvehicle [0,0,0];
_obj attachto [_car, [0.95,-1.2,-0.7]];  _y = 90; _p = -80; _r = 0; 
_obj setVectorDirAndUp [ 
 [ sin _y * cos _p,cos _y * cos _p,sin _p], 
 [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
];

_car spawn {
params ["_car"];
_objects = attachedobjects _car;
waituntil {!alive _car || isnull _car};
{deletevehicle _x} foreach _objects;
};

_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


_veh AddWeaponCargoGlobal ["UK3CB_BAF_L128A1_Eotech",1];
_veh AddWeaponCargoGlobal ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1];
_veh AddWeaponCargoGlobal ["ACE_VMM3",1];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",10];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",10];

//supplies
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",4];

_veh AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",20];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",5];

_veh AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
_veh AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
_veh AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

_veh AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",5];

_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",3];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",7];

_veh AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",8];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",8];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",8];

_veh addItemCargoGlobal ["ACE_DefusalKit",2];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",2];
_veh addItemCargoGlobal ["ACE_CableTie",15];
_veh addItemCargoGlobal ["ACE_fieldDressing",25];
_veh addItemCargoGlobal ["ACE_elasticBandage",25];
_veh addItemCargoGlobal ["ACE_quikclot",25];
_veh addItemCargoGlobal ["ACE_packingBandage",25];
_veh addItemCargoGlobal ["ACE_personalAidKit",1];
_veh addItemCargoGlobal ["ACE_salineIV_250",10];
_veh addItemCargoGlobal ["ACE_salineIV_500",10];
_veh addItemCargoGlobal ["ACE_atropine",5];
_veh addItemCargoGlobal ["ACE_epinephrine",10];
_veh addItemCargoGlobal ["ACE_morphine",10];
_veh addItemCargoGlobal ["HandGrenade",2];
_veh addItemCargoGlobal ["SmokeShell",3];
_veh addItemCargoGlobal ["SmokeShellRed",3];
