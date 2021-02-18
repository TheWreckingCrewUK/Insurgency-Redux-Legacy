systemchat "respawn start";

params ["_veh"];

_respawnInfo = _veh getVariable ["respawnInfo", []];

if ((count _respawnInfo) == 0) exitwith {
	diag_log "no respawninfo, exiting";
};

if ((count((ASLToATL (_respawnInfo select 1)) nearobjects ["all", 4]) > 0)) exitwith {
	[_veh] call twc_fnc_addvehtorespawnlist;
};

_veh remoteExecCall ["deleteVehicle",_veh];

_veh = (_respawnInfo select 0) createVehicle [0,0,(200 + (random 1000))];

_veh allowdamage false;

_veh spawn {
	params ["_veh"];
	sleep 0.5;
	_veh setdamage 0;
	sleep 5;
	_veh allowdamage true;
	_veh setdamage 0;
};

_veh setDir (_respawnInfo select 2);
_veh setPosASL ((_respawnInfo select 1) vectoradd [0,0,0.5]);

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
{
	_veh addweaponCargoGlobal [_x,_respawnInfo select 3 select 1 select _forEachIndex];
}forEach (_respawnInfo select 3 select 0);
{
	_veh addItemCargoGlobal [_x,_respawnInfo select 4 select 1 select _forEachIndex];
}forEach (_respawnInfo select 4 select 0);
{
	_veh addmagazineCargoGlobal [_x,_respawnInfo select 5 select 1 select _forEachIndex];
}forEach (_respawnInfo select 5 select 0);
{
	_veh addbackpackCargoGlobal [_x,_respawnInfo select 6 select 1 select _forEachIndex];
}forEach (_respawnInfo select 6 select 0);

_veh setVariable ["respawnInfo",_respawnInfo];
[_veh] call twc_fnc_vehicleRespawn;