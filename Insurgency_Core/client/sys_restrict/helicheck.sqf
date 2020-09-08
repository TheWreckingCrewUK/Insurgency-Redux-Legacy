if (isserver) exitwith {2};
_count = 0;
{
	if (_x == leader _x) then {
		if ((["commander", str (typeof _x)] call BIS_fnc_inString) || ((["leader", str (typeof _x)] call BIS_fnc_inString) && (!(["team", str (typeof _x)] call BIS_fnc_inString))) || (["CUP_O_RUS_SpecOps", str (typeof _x)] call BIS_fnc_inString)) then {
			_count = _count + 1;
		};
	};
} foreach allplayers;

if (((count (units (group player))) == (count allplayers))) then {
	_count = 2;
	group player setvariable ["twc_oversize", true, true];
};

_count