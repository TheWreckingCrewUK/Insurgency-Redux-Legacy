params["_heli"];

if(isNil "_heli")exitWith{hint "No heli was given to the spawn system, please notify management"};

if ((((twc_utilhelitime)-time) max (twc_helitime-time)) > 0) then {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Helicopter Spawner Cooldown</t>"; 

 _text1 = format ["<br />The Utility Helicopter Spawner Is On Cooldown Currently. %1 Hours Remaining.",(ceil(((((twc_utilhelitime)-time) max (twc_helitime-time)) / 60) / 6)) /10];
_spawntext = parsetext (_title + _text1);
hint _spawntext;
	
	} else {

twc_utilhelitime=time+(twc_utilhelitime_amount*60);
publicVariable "twc_utilhelitime";

twc_helitime=time+twc_helitime_amount;
publicVariable "twc_helitime";

_veh = _heli createvehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearitemCargoGlobal _veh;

if (!(["3CB", typeof _veh] call BIS_fnc_inString)) then {
clearMagazineCargoGlobal _veh;
};



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Helicopter Spawner</t>"; 

 _text1 =  "<br />The Utility Helicopter Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;


_boxaction = ["deleteCreate","Return Helicopter","",{deleteVehicle this;
if (((twc_utilhelitime)-time) > (-120)) then {
twc_utilhelitime=time;
publicVariable "twc_utilhelitime";

twc_helitime=time;
publicVariable "twc_helitime";

} else {

twc_utilhelitime=time + 60;
publicVariable "twc_utilhelitime";

twc_helitime=time + 60;
publicVariable "twc_helitime";
};

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

}