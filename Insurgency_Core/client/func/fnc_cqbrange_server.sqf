

params [["_iscomplex", false]];

{
	if ((getpos _x) inarea "cqbrange") exitwith {
		hint "There are players already on the course. Unable to reset";
	};
} foreach allplayers;

_group = creategroup east;

_num = ((count allplayers * 2) + 8) min 20;

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

_array = [];



for "_i" from 1 to _num do {
	_unit = _group createUnit [(townspawn call bis_fnc_selectrandom), ["cqbrange"] call CBA_fnc_randPosArea, [], 0, "NONE"]; 
	_unit disableai "PATH";
	_unit setunitpos (["up", "middle"] call bis_fnc_selectrandom);
	_array pushback _unit;
};
[leader _group, 1] call twc_fnc_aiscramble;

if (_iscomplex) then {
	for "_i" from 1 to (_num / 2) do {
		_unit = _group createUnit [(civilianType call bis_fnc_selectrandom), ["cqbrange"] call CBA_fnc_randPosArea, [], 0, "NONE"]; 
		_unit disableai "PATH";
		_array pushback _unit;
			[_unit] joinsilent _group;
			
	};
};


missionnamespace setvariable ["twc_cqbtargets", _array, true];

