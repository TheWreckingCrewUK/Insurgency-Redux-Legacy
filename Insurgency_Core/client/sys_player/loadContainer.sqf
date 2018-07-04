params ["_con"];

[30, _con, {

params ["_con"];

_truck = nearestobject [getpos _con, "rhsusf_M977A4_BKIT_usarmy_d"];  

if (_truck getvariable ["twc_isloaded", 1] == 1) exitwith {hint "This truck already has a container on it"};

_con attachto [_truck, [-0.055,-1.3,1.8]];

_y = 90;  _p = 0; _r = 0;     
_con setVectorDirAndUp [     
 [ sin _y * cos _p,cos _y * cos _p,sin _p],     
 [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D     
]; 


_con setpos (getpos _con);

_con setvariable ["twc_isloaded", 1];

_truck setvariable ["twc_isloaded", 1];


}, {}, "Loading Container"] call ace_common_fnc_progressBar;