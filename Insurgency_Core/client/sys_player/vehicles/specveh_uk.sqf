 _spawnpos = getpos AmmoBoxSpawner;
 
 
 //
 if (isnil "twc_specvehcount") then {
 twc_specvehcount = 0;
 publicVariable "twc_specvehcount";
 };
 
 if (twc_specvehcount == 1) exitwith {
 
 _title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Specialist Vehicle</t>"; 

 _text1 =  "<br />Only one specialist section vehicle may exist at a time. Get the person that spawned the last one to return it in order to get a new one.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;
 };
 
 twc_specvehcount = 1;
 publicVariable "twc_specvehcount";
 
 _vehtype = "UK3CB_BAF_Panther_GPMG_Sand_A";
 
 if (twc_wdveh == 1) then {
	_vehtype = "UK3CB_BAF_Panther_GPMG_Green_A";
};
 
 _veh = _vehtype createvehicle _spawnpos;  
  
  

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;


_vehaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

 twc_specvehcount = 0;
 publicVariable "twc_specvehcount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_vehaction] call ace_interact_menu_fnc_addActionToobject;
[_veh, player, 5] call twc_fnc_genericfillvehicle;