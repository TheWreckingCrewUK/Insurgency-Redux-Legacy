_alphaaction = ["SpawnsmallAlphaCreate","Teleport to Patrol Base","",{player setpos (getmarkerpos "respawn_west_forwardbase")},{((str (getmarkerpos "respawn_west_forwardbase")) != "[0,0,0]") && (!(player getvariable ["ace_dragging_isdragging", false])) && (!(player getvariable ["ace_dragging_iscarrying", false]))}] call ace_interact_menu_fnc_createAction;
["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;


_alphaaction = ["SpawnsmallAlphaCreate","Teleport to Main Base","",{player setpos twc_basepos},{((player distance twc_basepos) > 400) && (!(player getvariable ["ace_dragging_isdragging", false])) && (!(player getvariable ["ace_dragging_iscarrying", false]))}] call ace_interact_menu_fnc_createAction;
["TWC_Item_Public_Base_LOCSTAT",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;