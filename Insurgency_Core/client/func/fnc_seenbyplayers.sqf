params ["_pos"];

_return = 0;

{

	_pos = eyePos _x;
	if ((vehicle _x) != _x) then {
		if (vehicle player isKindOf "Air") then {
			_pos = eyePos _x vectoradd [0,0,-4];
		};
	};
	_check = [objNull, "VIEW"] checkVisibility [eyePos _x, _pos];
	if (_check > _return) then {
		_return = _check;
	};
} foreach allplayers;

_return;