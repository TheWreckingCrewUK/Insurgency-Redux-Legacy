//includes the vehicle specifics inside an execvm packet for the persistent patrol base system
params ["_veh"];

waituntil {!isnil "twc_wdveh"};

#include "armourspecifics.sqf";
#include "helispecifics.sqf";
#include "planespecifics.sqf";