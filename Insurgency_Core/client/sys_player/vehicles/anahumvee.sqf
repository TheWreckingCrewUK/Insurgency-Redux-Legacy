 _spawnpos = getpos AmmoBoxSpawner;
 
 
 //
 if (isnil "twc_specvehcount") then {
 twc_specvehcount = 0;
 publicVariable "twc_specvehcount";
 };
 
 if (twc_specvehcount == 1) exitwith {
 
 _title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Specialist Vehicle</t>"; 

 _text1 =  "<br />Only one of these may exist at a time. Get the person that spawned the last one to return it in order to get a new one.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;
 };
 
 twc_specvehcount = 1;
 publicVariable "twc_specvehcount";
 
 
 _veh = "CUP_B_M1151_USA" createvehicle _spawnpos;  
  
 
  
 _gun = "CUP_O_ZU23_TK_INS" createvehicle _spawnpos;  
  
 
  
 _gun attachto [_veh, [-0.1,0,1.2]];


clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;




_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;
deleteVehicle (nearestObject [this, "CUP_O_ZU23_TK_INS"]);

 twc_specvehcount = 0;
 publicVariable "twc_specvehcount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;