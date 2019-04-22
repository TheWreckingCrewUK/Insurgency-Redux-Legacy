

params [["_iscomplex", false]];

{
	if ((getpos _x) inarea "cqbrange") exitwith {
		hint "There are players already on the course. Unable to reset";
	};
} foreach allplayers;

_group = creategroup east;

_num = ((count allplayers) + 8) min 15;

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
	_array pushback _unit;
};

if (_iscomplex) then {
	for "_i" from 1 to (_num / 2) do {
		_unit = _group createUnit [(civilianType call bis_fnc_selectrandom), ["cqbrange"] call CBA_fnc_randPosArea, [], 0, "NONE"]; 
		_unit disableai "PATH";
		_array pushback _unit;
			[_unit] joinsilent _group;
		/*
		if ((random 1) > 0.03) then {
			_unit addItemtoUniform "CUP_handgrenade_RGD5";
			_unit addItemtoUniform "CUP_handgrenade_RGD5";
		} else {
			_unit addEventHandler ["Killed",{

				if (side (_this select 1) == WEST) then{
					hint "Civilian Killed";
				};
			}];
		};
		*/
	};
};


missionnamespace setvariable ["twc_cqbtargets", _array, true];

if (_first == 0) then {
	hint "CQB Course Active";
} else {
	hint "CQB Course Restarted";
};