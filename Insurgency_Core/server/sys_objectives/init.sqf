/*
* Author: [TWC] Bosenator
* Server controller for dynamic objectives.
*
* Public: No
*/

// Might want to shift to a map-specific config later
// _heartsAndMindsObjs = ["TWC_Obj_CrashedHeli"];
// _searchAndDestroyObjs = [];

// _currentHAMObj = "";
// _currentSADObj = "";
// _currentRANObj = "";

// fired when an event is completed
// selects next objective, and triggers its init

// ["TWC_Insurgency_objCompleted", "TWC_Obj_CrashedHeli"] call CBA_fnc_serverEvent;

/* 

For ones that spawn after the start, for example convoy intercept, these will be managed by an ObjectiveController system. This will ensure there's only 2-3 of these present, excluding ones that the mission starts with. On completion of one of these objectives, it'll pull another random one that conditions to exist pass. One of these should always be a "hearts and minds" objective, and another should always be a "search and destroy" style objective, with the third being random from either.

*/

// refer to issue: https://github.com/TheWreckingCrewUK/Insurgency/issues/9