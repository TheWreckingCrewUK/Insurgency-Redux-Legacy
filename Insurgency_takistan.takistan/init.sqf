//These have to go in the init because when a plyer dismounts a vehicle the vehicle is local to them
vehicleRespawnDistancePlayers = 1500;
vehicleRespawnDistanceForwardBase = 300;
vehicleRespawnDelay = 6000;

twc_fnc_vehicleRespawn = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_vehicleRespawn\fnc_vehicleRespawn.sqf";

// list of IEDs and Spoof Objects
iedTypes = ["ACE_IEDLandSmall_Range_Ammo", "ACE_IEDUrbanSmall_Range_Ammo", "ACE_IEDLandBig_Range_Ammo", "ACE_IEDUrbanBig_Range_Ammo"];
//Stops non-blufor from triggering ieds
[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
    if (side _unit != WEST) exitWith { false };
    true
}] call ace_explosives_fnc_addDetonateHandler;