params ["_con"];

[30, _con, {

params ["_con"];

_dir = (getdir _con) - 90;

_truck = nearestobject [getpos _con, "rhsusf_M977A4_BKIT_usarmy_d"]; 

_pos = _con getrelpos [-8, _dir];

detach _con;

_con setpos _pos;


_con setvariable ["twc_isloaded", 0];

_truck setvariable ["twc_isloaded", 0];


}, {}, "Unloading Container"] call ace_common_fnc_progressBar;