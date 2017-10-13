/*
* Function to spawn an IED factory composition.
* 
* PARAMS:
* 0 - Size <INTEGER>
*
* RETURNS:
* <N/A>
*
* EXAMPLE:
* [1] spawn TWC_IEDFactory_spawnBuilding;
*/
params [["_size", 0]]; // 0 - small, 1 - medium, 2 - large

private _regionPath = "Insurgency_Core\server\sys_objectives\IEDFactory\" + TWC_Building_Style;
private _buildingFunc = _regionPath + "\" + _size + ".sqf";
private _handle = execVM _buildingFunc;