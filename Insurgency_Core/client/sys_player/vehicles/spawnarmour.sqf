params["_heli"];

if(isNil "_heli")exitWith{hint "No heli was given to the spawn system, please notify management"};

if (isnil "twc_armourcount") then {twc_armourcount = 0;
publicVariable "twc_armourcount";};

if (twc_armourcount > 1) exitwith {hint "2 heavy vehicles have been spawned already"};

_veh = _heli createvehicle getpos ammoboxspawner;

twc_armourcount = twc_armourcount +1;
publicVariable "twc_armourcount";


_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

twc_armourcount = twc_armourcount -1;
publicVariable "twc_armourcount";
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


_veh addEventHandler ["Killed",{

twc_armourcount=twc_armourcount - 0.5;
publicVariable "twc_armourcount";
	}];