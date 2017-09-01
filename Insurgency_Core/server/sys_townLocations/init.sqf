/*
* Calls the scripts from the sys_townLocations folder
* Must use #include since it must do added before getLocations
*/
TWC_fnc_townINIT = compile preprocessFileLineNumbers "Insurgency_Core\server\sys_townLocations\fnc_townINIT.sqf";
#include "addedLocations.sqf";
#include "getLocations.sqf";