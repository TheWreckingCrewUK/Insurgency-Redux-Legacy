/*
* Function to calculate an "ideal" spawn amount, based on numerous factors.
* Has a total modifier, to affect the return too.
* 
* Paramaters:
* <Array> Location to Spawn
* <Integer> Modifier (Default: 1, Optional)
*
* Returns:
* <Integer> Amount to Spawn
*
* Example:
* [0.5] call twc_fnc_calculateSpawnAmount;
*/
params[["_loc", [0,0,0]], ["_mod", 1]];

_defaultAmount = 4;
_playerCount = (count (allPlayers - entities "HeadlessClient_F")) max 1;

// 9 with 10 online for example
_total = _defaultAmount + (round (_playerCount * (random [0.3, 0.5, 0.7])));

_kmFromBase = ((_loc distance getMarkerPos "base") / 1000) max 1;
_moraleMod = round (TWC_insMorale * 0.08); //100% = 8 extra

_total = (_total + _kmFromBase) + _moraleMod;

(_total * _mod)