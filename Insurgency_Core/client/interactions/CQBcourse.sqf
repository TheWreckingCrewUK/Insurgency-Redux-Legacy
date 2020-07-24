_alphaaction = ["SpawnsmallAlphaCreate","Start Simple CQB Course","",{execvm "Insurgency_Core\client\func\fnc_cqbrange.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Start Complex CQB Course","",{[true] execvm "Insurgency_Core\client\func\fnc_cqbrange.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Reset CQB Course","",{execvm "Insurgency_Core\client\func\fnc_cqbrange_reset.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;
