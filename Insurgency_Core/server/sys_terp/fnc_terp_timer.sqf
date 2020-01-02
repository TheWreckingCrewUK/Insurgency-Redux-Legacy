//Controller to make sure terp messages don't overstack, run local

_isterp = player getvariable ["twc_isterp", 0];


while {(_isterp == 1)} do {
	_msglist = player getvariable ["twc_terp_msglist", []];
	while {((count _msglist) == 0)} do {
		sleep 10;
		_msglist = player getvariable ["twc_terp_msglist", []];
	};
	_msg = _msglist select 0;
	hint _msg;
	_msglist deleteat 0;
	player setvariable ["twc_terp_msglist", _msglist];
	sleep 10;
	_isterp = player getvariable ["twc_isterp", 0];
};