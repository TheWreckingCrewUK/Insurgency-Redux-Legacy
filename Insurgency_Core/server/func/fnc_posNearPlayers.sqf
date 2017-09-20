/*
* Function Similar to CBA_fnc_nearPlayer, but uses a position instead of a unit

[_unit,200] call twc_fnc_posNearPlayers

Returns
<BOOL>
*/

params["_pos","_distance"];

_near = false;
{
	if(_pos distance2D _x < _distance) then{
		_near = true;
	};
}forEach (allPlayers - entities "HeadlessClient_F");
_near