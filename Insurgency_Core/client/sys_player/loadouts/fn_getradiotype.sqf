//gets an acre radio id from a persistent loadout and changes it into a base radio className

//_radio = [_x] call twc_fnc_getradiotype

params ["_classname"];

_radiotype = _classname;
if ("343" in _classname) then {
	_radiotype = "ACRE_PRC343";
} else {
	if ("152" in _classname) then {
		_radiotype = "ACRE_PRC152";
	} else {
		if ("148" in _classname) then {
			_radiotype = "ACRE_PRC148";
		} else {
			if ("117" in _classname) then {
				_radiotype = "ACRE_PRC117F";
			} else {
				_radiotype = "ACRE_PRC77";
			};
		};
	};
};

_radiotype