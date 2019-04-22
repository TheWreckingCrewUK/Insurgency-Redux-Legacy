params [["_iscomplex", false]];

{
	if ((getpos _x) inarea "cqbrange") exitwith {
		hint "There are players already on the course. Unable to reset";
	};
} foreach allplayers;


{
	if (!isnull _x) then {
		deletevehicle _x
	};
} foreach (missionnamespace getvariable ["twc_cqbtargets", []]);

_first = 1;
_t = (missionnamespace getvariable ["twc_cqbtargets", []]);
if (count _t == 0) then {
	_first = 0;
};

[_iscomplex] remoteexec ["twc_fnc_startcqbrangeserver", 2];


if (_first == 0) then {
	hint "CQB Course Active";
} else {
	hint "CQB Course Restarted";
};