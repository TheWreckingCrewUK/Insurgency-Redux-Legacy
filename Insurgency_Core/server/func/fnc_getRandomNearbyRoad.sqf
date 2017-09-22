/*
* Function to return a random road segment within a given radius, of a given position.
* Commonly used within Spawn IED and Spawn Roadblock.
* 
* Paramaters:
* <Array> Position
* <Integer> Search Radius (Default: 200)
*
* Returns:
* <Object> Road Segment, ObjNull if no round was found
*
* Example:
* [_position, _radius] call twc_fnc_getRandomNearbyRoad;
*/
params["_pos", ["_radius", 200]];

if (isNil "_pos") exitWith { objNull };

private _foundRoads = _pos nearRoads _radius;
if (count _foundRoads == 0) exitWith { objNull };

selectRandom _foundRoads