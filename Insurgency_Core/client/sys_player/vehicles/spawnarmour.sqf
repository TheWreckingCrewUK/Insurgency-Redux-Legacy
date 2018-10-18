params["_heli"];

if(isNil "_heli")exitWith{hint "No heli was given to the spawn system, please notify management"};

if (isnil "twc_armourcount") then {twc_armourcount = -4;
publicVariable "twc_armourcount";};

if (twc_armourcount > 2) exitwith {hint "There are no more armoured vehicle available for spawning"};

//pre spawn file to change classname to woodland/desert versions if necessary
#include "armourspecifics_prespawn.sqf";

_veh = _heli createvehicle getpos ammoboxspawner;

twc_armourcount = twc_armourcount +1;
publicVariable "twc_armourcount";

	
	if (typeof _veh == "rhsusf_M1117_D") then {
[
	_veh,
	["desert",1], 
	["DUKE_Hide",1]
] call BIS_fnc_initVehicle;
};

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

twc_armourcount = twc_armourcount -1;
publicVariable "twc_armourcount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


_veh addEventHandler ["Killed",{

twc_armourcount=twc_armourcount - 0.4;
publicVariable "twc_armourcount";
	}];
	
if ((["90", twc_missionname] call BIS_fnc_inString) || (["00", twc_missionname] call BIS_fnc_inString)) then {

_veh AddWeaponCargoGlobal ["UK3CB_BAF_L85A1_SUSAT3D_Lazer",1];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",2];
};

if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {

	
//Weapons
	_box AddWeaponCargoGlobal ["rhs_weap_m72a7",2];


	//supplies
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",1];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd",4];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",20];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",5];

	_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
	_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
	_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",4];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",2];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",2];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",5];

	_box AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",8];

	_box addItemCargoGlobal ["ACE_fieldDressing",5];
	_box addItemCargoGlobal ["ACE_elasticBandage",5];
	_box addItemCargoGlobal ["ACE_quikclot",5];
	_box addItemCargoGlobal ["ACE_packingBandage",5];
	_box addItemCargoGlobal ["ACE_salineIV_500",4];
	_box addItemCargoGlobal ["ACE_atropine",5];
	_box addItemCargoGlobal ["ACE_epinephrine",5];
	_box addItemCargoGlobal ["ACE_morphine",5];
	_box addItemCargoGlobal ["HandGrenade",2];
	_box addItemCargoGlobal ["SmokeShell",2];
	_box addItemCargoGlobal ["SmokeShellRed",2];
};

#include "armourspecifics.sqf";
