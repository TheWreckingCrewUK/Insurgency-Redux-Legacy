
params["_plane"];

if(isNil "_plane")exitWith{hint "No plane was given to the spawn system, please notify management"};


if(isNil "twc_planecount") then{
	twc_planecount = 0;
	publicVariable "twc_planecount";
};


if (twc_planecount >= 2) exitwith {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many Planes</t>"; 

 _text1 = format ["<br />There Are Already 2 Planes In The AO. You Can Return Them To Base To Have Access to Another",0];
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




_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>plane Spawner</t>"; 

 _text1 =  "<br />The Plane Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

_boxaction = ["deleteCreate","Return Plane","",{deleteVehicle this;
twc_planecount=twc_planecount - 1;
publicVariable "twc_planecount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;



_veh addEventHandler ["Killed",{
[] spawn { sleep 36000;

twc_planecount=twc_planecount - 1;
publicVariable "twc_planecount";
};
	}];

#include "planespecifics.sqf";

