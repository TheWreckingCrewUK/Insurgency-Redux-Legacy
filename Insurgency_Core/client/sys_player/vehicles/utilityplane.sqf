params["_heli"];

if(isNil "_heli")exitWith{hint "No heli was given to the spawn system, please notify management"};

if ((((twc_utilplanetime)-time) max (twc_planetime-time)) > 0) then {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Plane Spawner Cooldown</t>"; 

 _text1 = format ["<br />The Utility Plane Spawner Is On Cooldown Currently. %1 Hours Remaining.",(ceil(((((twc_utilplanetime)-time) max (twc_planetime-time)) / 60) / 6)) /10];
_spawntext = parsetext (_title + _text1);
hint _spawntext;
	
	} else {

twc_utilplanetime=time+(twc_utilplanetime_amount*60);
publicVariable "twc_utilplanetime";

twc_planetime=time+twc_planetime_amount;
publicVariable "twc_planetime";

_veh = _heli createvehicle (getPos planespawnpad);

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Plane Spawner</t>"; 

 _text1 =  "<br />The Utility Plane Has Been Spawned On The Apron";
_spawntext = parsetext (_title + _text1);
hint _spawntext;


_boxaction = ["deleteCreate","Return Plane","",{deleteVehicle this;
if (((twc_utilplanetime)-time) > (-120)) then {
twc_utilplanetime=time;
publicVariable "twc_utilplanetime";

twc_planetime=time;
publicVariable "twc_planetime";

} else {

twc_utilplanetime=time + 60;
publicVariable "twc_utilplanetime";

twc_planetime=time + 60;
publicVariable "twc_planetime";
};

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

}