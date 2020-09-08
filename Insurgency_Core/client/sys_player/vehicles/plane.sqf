
params["_plane"];

if(isNil "_plane")exitWith{hint "No plane was given to the spawn system, please notify management"};


if(isNil "twc_planecount") then{
	twc_planecount = 0;
	publicVariable "twc_planecount";
};

if (!(isnull (getConnectedUAV player))) exitwith {
	_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>UAV Active</t>"; 

	 _text1 = format ["<br />You cannot fly a plane while controlling a UAV",0];
	_spawntext = parsetext (_title + _text1);
	hint _spawntext;
};

if (twc_planecount >= 3) exitwith {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many Planes</t>"; 

 _text1 = format ["<br />You have already spawned 3 aircraft. You can return them to base to get more",0];
_spawntext = parsetext (_title + _text1);
hint _spawntext;
	
	};

twc_planecount=twc_planecount + 1;
publicVariable "twc_planecount";

_veh = _plane createvehicle (getPos planespawnpad);

_veh setdir (getdir planespawnpad);

_veh setPos (getPos _veh);

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_veh setVariable ["ace_pylons_magazineWhitelist", [], true];


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Plane Spawner</t>"; 

 _text1 =  "<br />The Plane has been spawned on the Taxiway. Your supply of airframes is limited, do not waste it and return it when you are done";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

_boxaction = ["deleteCreate","Return Plane","",{deleteVehicle this;
twc_planecount=twc_planecount - 1;
publicVariable "twc_planecount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 500]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["deleteCreate","Rearm Plane","",{[this] remoteexec ["twc_rearmvehicle", 0];
},{(count (player nearobjects ["Land_InfoStand_V1_F", 500]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_veh additemcargoglobal ["ToolKit", 1];
_veh addbackpackcargoglobal ["B_AssaultPack_rgr", 1];


_veh addEventHandler ["Killed",{
[] spawn { sleep 36000;

twc_planecount=twc_planecount - 1;
publicVariable "twc_planecount";
};
	}];

#include "planespecifics.sqf";

[_veh, player, 0.5] call twc_fnc_genericfillvehicle;
