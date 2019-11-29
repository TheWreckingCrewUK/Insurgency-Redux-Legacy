params ["_pos"];

_return = 0;
if (((count _pos) == 2)) then {
	_pos = [(_pos select 0), (_pos select 1), 0];
};

{

	//_pos = eyePos _x;
	if ((vehicle _x) != _x) then {
		if (vehicle _x isKindOf "Air") then {
			_pos = eyePos _x vectoradd [0,0,-4];
		} else {
			_pos = eyePos _x vectoradd [0,0,4];
		};
	};
	_check = [objNull, "VIEW"] checkVisibility [eyePos _x, ((AGLToASL _pos) vectoradd [0,0,2])];
	if (_check > _return) then {
		_return = _check;
	};
	_check = [objNull, "fire"] checkVisibility [eyePos _x, ((AGLToASL _pos) vectoradd [0,0,2])];
	if (_check > _return) then {
		_return = _check;
	};
} foreach allplayers;

_return;