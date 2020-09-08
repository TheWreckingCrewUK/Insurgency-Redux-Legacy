/* by Hobbs
finds a position that just happens to be where noone can see, within a set min/max distance from the target position
will also fall back to a position that noone is pointed at which could be in the open, which is not suitable for spawning enemies

arguments:
position
min search radius
max search radius
size of area required
fallback override (set to false to disable)

return:
unseen position, if the function fails then it will return the given position


example:
[getpos player, 50, 150, 20, true] call twc_fnc_findsneakypos;

*/

params ["_pos", "_min", "_max", ["_size", 2], ["_fallback", true]];

_fncreturn = _pos;
_checkpos = ([_pos, _min, _max, _size, 0, 0.7, 0] call BIS_fnc_findSafePos);

//systemchat (str _checkpos);
if ((count _checkpos) == 2) then {
	_checkpos = [(_checkpos select 0), (_checkpos select 1), 0];
};

//systemchat (str _checkpos);
_checkvis = ([_checkpos] call twc_fnc_seenbyplayers);
//systemchat ("a" + (str _checkvis));
_checkcount = 0;

if ((_checkvis == 0) && ((_checkpos distance _pos) < _max) && (!([_checkpos,50] call twc_fnc_posNearPlayers))) then {
	_fncreturn = _checkpos;
} else {

	_newmax = ((_max - _min) / 80);
	while {(_checkvis > 0) && (_checkcount < 5)} do {
		_checkpos = ([_pos, _min, (_min + (_newmax * _checkcount)), _size, 0, 1, 0] call BIS_fnc_findSafePos);
		
		
		if ((count _checkpos) == 2) then {
			_checkpos = [(_checkpos select 0), (_checkpos select 1), 0];
		};
		_checkvis = ([_checkpos] call twc_fnc_seenbyplayers);
		//systemchat ("b" + (str _checkvis));
		if ((_checkvis == 0) && ((_checkpos distance _pos) < _max) && (!([_checkpos,50] call twc_fnc_posNearPlayers))) then {
			_fncreturn = _checkpos;
		};
		_checkcount = (_checkcount + 1);
	};

};
//systemchat (str _checkcount);
if (((str _fncreturn) == (str _pos)) && _fallback) then {

	//systemchat "fallback";

	_checkpos = ([_pos, _min, _max, _size, 0, 1, 0] call BIS_fnc_findSafePos);

	if ((count _checkpos) == 2) then {
		_checkpos = [(_checkpos select 0), (_checkpos select 1), 0];
	};
	_checkvis = ([_checkpos] call twc_fnc_lookedatbyplayers);

	_checkcount = 0;
//systemchat ((str _checkvis) + (str _checkcount) + (str ((_checkpos distance _pos) < _min)));


if ((!_checkvis) && ((_checkpos distance _pos) > _min) && (!([_pos,50] call twc_fnc_posNearPlayers))) then {
	_fncreturn = _checkpos;
} else {

	while {((_checkvis) || ((_checkpos distance _pos) < _min)) && (_checkcount < 10)} do {
		
		_checkpos = ([_pos, _min, _max, _size, 0, 1, 0] call BIS_fnc_findSafePos);
		if ((count _checkpos) == 2) then {
			_checkpos = [(_checkpos select 0), (_checkpos select 1), 0];
		};
		_checkvis = ([_checkpos] call twc_fnc_lookedatbyplayers);
		
		if ((!_checkvis) && ((_checkpos distance _pos) < _max)) then {
			_fncreturn = _checkpos;
		};
		_checkcount = (_checkcount + 1);
	};
};
};
//systemchat (str _checkcount);

if ((count _fncreturn) == 2) then {
	_fncreturn = [(_fncreturn select 0), (_fncreturn select 1), 0];
};


if ((str _fncreturn) != (str _pos)) then {
/*
[_fncreturn, _checkpos] spawn {
	params ["_fncreturn", "_checkpos"];
	_cone = "RHS_Ural_Civ_01" createvehicle _fncreturn;
	_cone setpos _fncreturn;
	_checkvis = ([_checkpos] call twc_fnc_lookedatbyplayers);
	//systemchat (str _checkvis);
	tp = _checkpos;
	sleep 20;
	deletevehicle _cone;
};

*/

} else {
	//systemchat "sneakypos fail";
};


_fncreturn