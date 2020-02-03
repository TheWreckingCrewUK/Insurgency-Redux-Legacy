params ["_pos"];

if (isnil "_pos") exitwith {0};
if ((count _pos) == 0) exitwith {0};

_return = 0;
if (((count _pos) == 2)) then {
	_pos = [(_pos select 0), (_pos select 1), 0];
};

{

	//_pos = eyePos _x;
	
	_eyepos = (AGLToASL (getpos (vehicle _x))) vectoradd [0,0,4];
	if ((vehicle _x) != _x) then {
		if ((vehicle _x) isKindOf "Air") then {
			_eyepos = (AGLToASL (getpos (vehicle _x))) vectoradd [0,0,-4];
		};
	} else {
		_eyepos = eyePos _x;
	};
	_check = [objNull, "VIEW"] checkVisibility [_eyepos, (_pos vectoradd [0,0,2])];
	if (_check > _return) then {
		_return = _check;
	};
	
	_check = [objNull, "fire"] checkVisibility [_eyepos, (_pos vectoradd [0,0,2])];
	if (_check > _return) then {
		_return = _check;
	};
	
} foreach allplayers;


_return;