//Main Action for All Forward Base Actions
_action = ["twcForwardBaseActions","Forward Base Actions","",{},{true}] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToObject;

//Sub Action for Alpha Crate
_action = ["SpawnAlphaAmmoCrate","Spawn Alpha AmmoCrate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (position player)},{player distance (getMarkerPos "base") < 100 && leader player == player}] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions","twcForwardBaseActions"],_action] call ace_interact_menu_fnc_addActionToObject;