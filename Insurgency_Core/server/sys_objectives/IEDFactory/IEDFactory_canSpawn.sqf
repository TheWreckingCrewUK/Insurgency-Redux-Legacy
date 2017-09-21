/*
* Author: [TWC] Bosenator
* IED Factory Objective spawn checker.
*
* Arguments:
* <TBD>
*
* Return Value:
* 0: Spawn Capability <Boolean>
*
* Example:
* <TBD>
*
* Public: No
*/

private _IEDFactoryIsAlive = missionNamespace getVariable ["IEDFactoryIsAlive", false];
private _IEDFactoryLastCompleted = missionNamespace getVariable ["IEDFactoryLastCompleted", 0];

// assume that if these aren't set, we're the first one to be spawned
if (isNil "_IEDFactoryIsAlive" || !(_IEDFactoryIsAlive)) exitWith { true };
if (isNil "_IEDFactoryLastCompleted" || _IEDFactoryLastCompleted == 0) exitWith { true };

// has it been an hour?
if (_IEDFactoryLastCompleted >= (time + 3600)) exitWith { true };

false