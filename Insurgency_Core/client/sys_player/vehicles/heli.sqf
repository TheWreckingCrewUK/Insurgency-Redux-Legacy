params["_heli"];

if(isNil "_heli")exitWith{hint "No Heli was given to the spawn system, please notify management"};

//initialise the count variable
if(isNil "twc_Helicount") then{
	twc_Helicount = 0;
	publicVariable "twc_Helicount";
};

//if it's a mert heli then skip the heli count check, because they're spawned by different groups
if (!(_heli == "twc_mert_ch47")) then {


	if (twc_Helicount >= 2) exitwith {
	
	
		_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many Helicopters</t>"; 

		 _text1 = format ["<br />There Are Already 2 Helicopters In The AO. You Can Return Them To Base To Have Access to Another",0];
		_spawntext = parsetext (_title + _text1);
		hint _spawntext;
	
	};
};

//now that the check has gone through, increase the count by 1 and make sure everyone knows about it
twc_Helicount=twc_Helicount + 1;
publicVariable "twc_Helicount";

//create the vehicle. The type of vehicle is defined in the spawned execvm, usually in pilots.sqf
_veh = _heli createvehicle (getPos AmmoBoxSpawner);
_veh allowdamage false;

//get all the crap out of it
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;


//we want the mags if it's 3cb because the vehicle guns use them, so only clear them if 3cb isn't in the classname
if (!(["3CB", typeof _veh] call BIS_fnc_inString)) then {
clearMagazineCargoGlobal _veh;
};



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Helicopter Spawner</t>"; 

 _text1 =  "<br />The Helicopter Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;


//add an action to return the helicopter, this works locally so only the person spawning it can remove it
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

if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) then {
	_veh addweaponcargoglobal ["UK3CB_BAF_L22A2", 2];
	_veh addmagazinecargoglobal ["UK3CB_BAF_556_30Rnd", 4];
};

sleep 10;
waituntil {(_veh distance (getPos AmmoBoxSpawner)) > 20};
_veh allowdamage true;
