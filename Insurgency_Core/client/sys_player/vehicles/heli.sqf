params["_heli"];

if(isNil "_heli")exitWith{hint "No Heli was given to the spawn system, please notify management"};


if(isNil "twc_Helicount") then{
	twc_Helicount = 0;
	publicVariable "twc_Helicount";
};


if (twc_Helicount >= 2) exitwith {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many Helicopters</t>"; 

 _text1 = format ["<br />There Are Already 2 Helicopters In The AO. You Can Return Them To Base To Have Access to Another",0];
_spawntext = parsetext (_title + _text1);
hint _spawntext;
	
	};

twc_Helicount=twc_Helicount + 1;
publicVariable "twc_Helicount";

_veh = _heli createvehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

if (!(["3CB", typeof _veh] call BIS_fnc_inString)) then {
clearMagazineCargoGlobal _veh;
};



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Helicopter Spawner</t>"; 

 _text1 =  "<br />The Helicopter Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

_boxaction = ["deleteCreate","Return Helicopter","",{deleteVehicle this;
twc_Helicount=twc_Helicount - 1;
publicVariable "twc_Helicount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;



_veh addEventHandler ["Killed",{
 [] spawn { sleep 36000;
twc_Helicount=twc_Helicount - 1;
publicVariable "twc_Helicount";
};
	}];

#include "helispecifics.sqf";

