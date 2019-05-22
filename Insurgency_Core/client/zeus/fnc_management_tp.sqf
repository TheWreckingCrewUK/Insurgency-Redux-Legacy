/* simple script to get management guys to or from base, either to check stuff, help new guys that have just spawned or get stuff from crate
*/


//_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];
_base = getpos cratebox;
_curpos = getpos player;

_var = player getvariable ["twc_mgmt_lasttppos", _base];
if ((player distance _base) > 300) then {
	_var = _base;
	player setpos _var;
} else {
	(vehicle player) setpos _var;
};



if ((_var distance _base) > 10) then {
	player setvariable ["twc_mgmt_lasttppos", _base];
} else {
	player setvariable ["twc_mgmt_lasttppos", _curpos];
};