/*
* Details:
* 
* Creates a Civillian that will tak position in a house and will not move.
*
* Required parameters:
*
* 0 - String     Marker name
*
* Addtional parameters:
*
* 1 - Interger   Amount of civillians   Default: 7
* 
*
* Example:
*
*["bastam",7] spawn twc_fnc_SpawnCiv
*
* Author: [TWC] Fakematty / [TWC] Jayman
*/
_group = createGroup civilian;
params["_pos", "_civnum", "_civradius"];

for "_i" from 1 to _civnum do {
	_individualCiv = _group createUnit [civilianType, _pos, [], _civradius, "NONE"];
	_civHeading = (random 360);
	_individualCiv setFormDir _civHeading;
	_individualCiv setDir _civHeading;
	_westKilled = _individualCiv addEventHandler ["Killed", {
		[(_this select 0)] call twc_fnc_deleteDead;
		[_this select 0, _this select 1, _intelCache] call InsP_fnc_civKill;
	}];
	_individualCiv disableAi "path";
};
