/*
* Author: [TWC] Bosenator
* Defend Forward Base Objective spawn checker.
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

_canSpawn = true;

//Reasons for this to not spawn such as no forward base actually up:
if(TWC_insMorale < 60)then{
	_canSpawn = false;
};
if(getMarkerColor "respawn_west_forwardBase" == "")then{
	_canSpawn = false;
};

_canSpawn
