params ["_player"];

waituntil {!alive _player};


_count = group player getvariable ["armourcount", 0];
group player setvariable ["armourcount", _count - 1, true];

if ((group player getvariable ["armourcount", 1]) == 0) then {
	group player setvariable ["twc_ismechanised", 0, true];
};