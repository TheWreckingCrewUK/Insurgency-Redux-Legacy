/*
* Author: [TWC] Bosenator
* IED Factory Objective spawner.
*
* Arguments:
* <NONE>
*
* Return Value:
* <NONE>
*
* Example:
* <TBD>
*
* Public: No
*/

missionNamespace setVariable ["IEDFactoryIsAlive", false, false];
missionNamespace setVariable ["IEDFactoryLastCompleted", 0, false];
missionNamespace setVariable ["IEDFactoryLastPosition", [0, 0, 0], false];

// Find location that's at least a km from last position and is in the opening
// Store that position, once found as last position

// Set that it's alive

// Spawn the IED Factory 

// Commence IED production and placing them around the map (make it interruptable)

// Create map marker & non-location specific task, about the general area it's suspected to be in (3km area? calculation based on map size?)

// Add EventHandlers to spawned defenders to track killed
// Once all killed, consider it cleared (award points as mentioned in #36)
// Set timed execute (cba) to check after a time duration, if it hasn't been destroyed, re-occupy and restart production

// Add EventHandlers to spawned "caches"/"equipment" whatever to track destroyed
// Once all destroyed, consider it completed (award points and other bonuses as mentioned in #36)
// Remove all previous map markers related to this IED factory, and create new perm marker noting its completion

// set a function to periodically check there's no players in range, once they've fucked off, remove all remaining elements of it (except for the completed marker)
// vollah

