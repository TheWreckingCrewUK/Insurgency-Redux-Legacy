//These have to go in the init because when a plyer dismounts a vehicle the vehicle is local to them
vehicleRespawnDistancePlayers = 1000;
vehicleRespawnDistanceForwardBase = 300;
vehicleRespawnDelay = 10;

twc_fnc_vehicleRespawn = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_vehicleRespawn\fnc_vehicleRespawn.sqf";

// list of IEDs and Spoof Objects
iedTypes = ["ACE_IEDLandBig_Range", "ACE_IEDUrbanBig_Range", "ACE_IEDUrbanSmall_Range", "ACE_IEDLandSmall_Range","Land_Garbage_square3_F", "Land_Garbage_square5_F", "Land_Garbage_line_F"];

//Stops non-blufor from triggering ieds
[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
    if (side _unit != WEST) exitWith { false };
    true
}] call ace_explosives_fnc_addDetonateHandler;


twc_fnc_showSandBagItems = {
	params["_player","_target","_params"];
	disableSerialization;
	
	player setVariable ["twc_spawnFromBox",false];
	
	_sandBags = [["ACE_ConcertinaWireCoil",500],["twc_Land_BagFence_Corner_F",100],["twc_Land_BagFence_Long_F",100],["twc_Land_BagFence_Short_F",100],["twc_Land_BagFence_End_F",100],["twc_Land_BagFence_Round_F",100]];
	
	createDialog "twc_sandBag_Dialog";
	
	waitUntil{!isNull (findDisplay 9999);};
	
	_ctrl = (findDisplay 9999) displayCtrl 1500;
	
	{
		_string = str (_sandBags select _foreachindex select 1);
		_index = _ctrl lbAdd (getText (configFile >> "cfgVehicles" >> _x select 0 >> "displayName"));
		_ctrl lbSetData [_index, _x select 0];
	}forEach _sandBags;
	
	_classname = "";
	_selectedIndex = "";
	while{!isNull (findDisplay 9999);}do{
		_selectedIndex = lbCurSel _ctrl;
		_classname = _ctrl lbData _selectedIndex;
		
		ctrlSetText [1201,getText (configFile >> "cfgVehicles" >> _classname >> "editorPreview")];
	};
	sleep 0.2;
	systemChat str _selectedIndex;
	if(player getVariable "twc_spawnFromBox")then{
		_return = [_target,_classname,((_sandBags select _selectedIndex) select 1)] call twc_fnc_createDefenses;
		hint _return;
		player setVariable ["twc_spawnFromBox",false];
	};
};