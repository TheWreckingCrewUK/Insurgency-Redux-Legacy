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

#include "armourspecifics.sqf";
