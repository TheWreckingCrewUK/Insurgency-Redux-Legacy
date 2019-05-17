
params["_pos", "_dis", ["_activeonly", 0]];

_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];
_outsideblufor = allplayers;

if (_activeonly == 1) then {
	_outsideblufor = call twc_fnc_findoutsideblufor;
};
if ((count _outsideblufor) == 0) then {
	_outsideblufor = allplayers;
};
_return = false;

//if ((_base distance _pos) < _dis) exitwith {_return = true;_return};

{
	if (((side _x) == west) && (alive _x) && (((getposatl _x) select 2) < 20) && (_x in _outsideblufor) && ((_pos distance _x) < _dis)) then {
		_return = true;
	};
} foreach allplayers;
_return;

//if there's someone outside base then make sure you're only checking against players that are not very close to base so that insurgents don't keep spawning near base when there's only the heli pilot and new guys in there