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

_array = [];

missionnamespace setvariable ["twc_cqbtargets", _array, true];

hint "CQB Course Reset";