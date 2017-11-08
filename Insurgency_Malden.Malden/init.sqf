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
	disableSerialization;
	
	_sandBags = ["twc_Land_BagFence_Corner_F","twc_Land_BagFence_Long_F","twc_Land_BagFence_Short_F","twc_Land_BagFence_End_F","twc_Land_BagFence_Round_F"];
	
	createDialog "twc_sandBag_Dialog";
	
	waitUntil{!isNull (findDisplay 9999);};
	
	_ctrl = (findDisplay 9999) displayCtrl 1500;
	
	{
		_index = _ctrl lbAdd (getText (configFile >> "cfgVehicles" >> _x >> "displayName"));
		_ctrl lbSetData [_index, _x];
	}forEach _sandBags;
	
	while{!isNull (findDisplay 9999);}do{
		_index = lbCurSel _ctrl;
		_classname = _ctrl lbData _index;
		
		ctrlSetText [1201,getText (configFile >> "cfgVehicles" >> _classname >> "editorPreview")];
	};
};