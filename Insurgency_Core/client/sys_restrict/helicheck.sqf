
_count = 0;
{
	if (_x == leader _x) then {
		if ((["commander", str (typeof _x)] call BIS_fnc_inString) || (["leader", str (typeof _x)] call BIS_fnc_inString) || (["CUP_O_RUS_SpecOps", str (typeof _x)] call BIS_fnc_inString)) then {
			_count = _count + 1;
		};
	};
} foreach allplayers;

_count