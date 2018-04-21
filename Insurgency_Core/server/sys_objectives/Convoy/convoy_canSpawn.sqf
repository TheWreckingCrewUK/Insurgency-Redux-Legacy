/*
* Author: [TWC] Bosenator
* Car Bomb Objective spawn checker.
*
* Arguments:
* <TBD>
*
* Return Value:
* 0: Spawn Capability <Boolean>
*
* Example:
* <TBD>
*some conditions for the convoy. The spawned group is modern so it checks for a 90's tag that is defined in initserver in the mission file and then defaults to 0 in the core server init if it's not defined by the mission. There's also a veto option from twc_convoyallowed that's defined in the same manner, since the objective was originally vehicle based and needed a blacklist capability for small maps.
* Public: No
*/
//if (twc_is90 == 0) then {if (twc_convoyallowed == 1) then {true} else {false};};
false