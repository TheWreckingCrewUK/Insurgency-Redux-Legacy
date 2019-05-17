

_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];

_return = [];

{
	if (((side _x) == west) && (alive _x) && ((_base distance _x) > 500)) then {
		_return pushback _x;
	};
} foreach allplayers;

_return;
