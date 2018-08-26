_action = ["Actiondetainenemy","Detain","",{["TWC_Insurgency_adjustPoints", 30] call CBA_fnc_serverEvent;deleteVehicle _target; call InsP_fnc_enemyIntel},{((GetPos player) distance (getMarkerPos "base") < 20) && (((_this select 0) getVariable ["twc_isenemy",1]) == 1) && (alive _target) && (side (_this select 0) != WEST)}] call ace_interact_menu_fnc_createAction; 
 
["man",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass; 

_action = ["Actiondetainenemy","Submit Body","",{["TWC_Insurgency_adjustPoints", 5] call CBA_fnc_serverEvent;deleteVehicle _target; if (random 1 < 0.2) then {call InsP_fnc_enemyIntel} else {hint "No relevant information found"}},{((GetPos player) distance (getMarkerPos "base") < 20) && (((_this select 0) getVariable ["twc_isenemy",0]) == 1)}] call ace_interact_menu_fnc_createAction; 
 
["ACE_bodyBagObject",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass; 