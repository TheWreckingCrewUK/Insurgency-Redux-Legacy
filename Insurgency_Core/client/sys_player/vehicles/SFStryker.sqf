
 if (isnil "twc_sfmraptimeout") then {
 twc_sfmraptimeout = - 3600;
 publicVariable "twc_sfmraptimeout";
 };
 
if ((twc_sfmraptimeout > (time)) && !isserver) exitwith {
	_title ="<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>";
	_text1 = format ["<br />The Heavy Vehicle spawner is on cooldown currently. %1 minutes remaining.<br /><br />Note: The M-ATV's are not restricted in this way.", (ceil ( (twc_sfmraptimeout-time) / 60))];
	hint parsetext (_title + _text1);
	while {(twc_sfmraptimeout-time) > 0} do {
		sleep 20;
	};
	hint "Another Heavy Vehicle is now available from the spawner";
	
};

twc_sfmraptimeout = time + 3600;


 _spawnpos = getpos AmmoBoxSpawner;
 

_vehtype = "twc_stryker_wd";


 
 _car = _vehtype createvehicle _spawnpos;   
_veh = _car;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

if (twc_wdveh == 1) then {
	
[
	_veh,
	["Olive",1], 
	["Hatch_Commander",0,"Hatch_Front",0,"Hatch_Left",0,"Hatch_Right",0,"Ramp",0,"Hide_Antenna_1",0,"Hide_Antenna_2",0,"Hide_Antenna_3",0,"Extend_Mirrors",1,"Hatch_Driver",1]
] call BIS_fnc_initVehicle;


} else {
[
	_veh,
	["Tan",1], 
	["Hatch_Commander",1,"Hatch_Front",0,"Hatch_Left",0,"Hatch_Right",0,"Ramp",1,"Hide_Antenna_1",0,"Hide_Antenna_2",0,"Hide_Antenna_3",0,"Extend_Mirrors",1,"Hatch_Driver",1]
] call BIS_fnc_initVehicle;

};


_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;twc_sfmraptimeout = -999;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_mult = 1;


_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",6];

_veh AddWeaponCargoGlobal ["rhs_weap_m72a7",1*_mult];

_veh AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10*_mult];
_veh AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5*_mult];

_veh addItemCargoGlobal ["ACE_DefusalKit",1*_mult];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",1*_mult];
_veh addItemCargoGlobal ["ACE_CableTie",10*_mult];
_veh addItemCargoGlobal ["ACE_fieldDressing",25*_mult];
_veh addItemCargoGlobal ["ACE_elasticBandage",15*_mult];
_veh addItemCargoGlobal ["ACE_quikclot",15*_mult];
_veh addItemCargoGlobal ["ACE_packingBandage",15*_mult];
_veh addItemCargoGlobal ["ACE_salineIV_250",10];
_veh addItemCargoGlobal ["ACE_salineIV_500",10];
_veh addItemCargoGlobal ["ACE_epinephrine",10*_mult];
_veh addItemCargoGlobal ["ACE_morphine",10*_mult];
_veh addItemCargoGlobal ["HandGrenade",4];
_veh addItemCargoGlobal ["SmokeShell",3*_mult];
_veh addItemCargoGlobal ["SmokeShellRed",3*_mult];
_veh addbackpackCargoGlobal ["B_AssaultPack_cbr",2];


[_veh, player, 5] call twc_fnc_genericfillvehicle;