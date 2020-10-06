params ["_pos"];

if (isnil "_pos") exitwith {0};
if ((count _pos) == 0) exitwith {0};
_return = 0;
if (((count _pos) == 2)) then {
	_pos = [(_pos select 0), (_pos select 1), 0];
};
_pos = ATLToASL _pos;

{

	if (((vehicle _x) distance _pos) < 3000) then {
	
		_eyepos = eyePos _x;
		if ((vehicle _x) != _x) then {
			if ((vehicle _x) isKindOf "Air") then {
				_eyepos = (AGLToASL (getpos (vehicle _x))) vectoradd [0,0,-4];
			};
		} else {
			_eyepos = ((eyepos _x));
		};
		//_check = [objNull, "VIEW"] checkVisibility [_eyepos, (_pos vectoradd [0,0,2])];
		_check = lineIntersectsSurfaces [_eyepos, (_pos vectoradd [0,0,2]), _x, (vehicle _x)];
		if ((count _check) == 0) then {
		//if ((_check) > _return) then {
			//_return = _check;
			_return = 1;
			if (isserver) then {
			//	systemchat ("seenbyplayers " + (str _return));
			};
		};
	};
	
} foreach allplayers;

_return;