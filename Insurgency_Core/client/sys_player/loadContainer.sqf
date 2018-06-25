params ["_con"];

[30, _con, {

params ["_con"];

_truck = nearestobject [getpos _con, "rhsusf_M977A4_BKIT_usarmy_d"];  

if (_truck getvariable ["twc_isloaded", 1] == 1) exitwith {hint "This truck already has a container on it"};

_dir = getdir _truck;

_pos = getpos _truck;

_truck setpos [0,0,100];

_truck setdir 0;

_con attachto [_truck, [-0.055,-1.3,1.8]];

_con setdir 270;

_con setpos (getpos _con);

_truck setdir _dir;

_truck setpos _pos;

_con setvariable ["twc_isloaded", 1];

_truck setvariable ["twc_isloaded", 1];


}, {}, "Loading Container"] call ace_common_fnc_progressBar;