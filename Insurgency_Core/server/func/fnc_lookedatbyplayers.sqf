/* by Hobbs
checks direction of each player within a sane radius and checks whether they are pointing at the target position
*/

params ["_pos"];

_check = false;
{
	_dir = (_x getreldir _pos);
	_dis = _x distance _pos;
	
	_tol = (70 / (1 + (_dis / 150)));
	
	if ((_dir < (0 + _tol)) || (_dir > (360 - _tol))) then {
		_check = true;
	};
} foreach allplayers;

_check