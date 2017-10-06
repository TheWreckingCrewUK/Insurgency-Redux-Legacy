//These have to go in the init because when a plyer dismounts a vehicle the vehicle is local to them
vehicleRespawnDistancePlayers = 1000;
vehicleRespawnDistanceForwardBase = 300;
vehicleRespawnDelay = 10;

// list of IEDs and Spoof Objects
iedTypes = ["ACE_IEDLandBig_Range", "ACE_IEDUrbanBig_Range", "ACE_IEDUrbanSmall_Range", "ACE_IEDLandSmall_Range","Land_Garbage_square3_F", "Land_Garbage_square5_F", "Land_Garbage_line_F"];

//Stops non-blufor from triggering ieds
[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
    if (side _unit != WEST) exitWith { false };
    true
}] call ace_explosives_fnc_addDetonateHandler;