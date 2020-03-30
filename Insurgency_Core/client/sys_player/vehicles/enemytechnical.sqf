 _arr = player nearObjects ["landvehicle", 50];
 
 if ((count _arr) > 5) exitwith {
	hint "there are more than 5 vehicles within 50 meters of your position already, please have mercy on the server where possible"
};
 
 
_vehtype = ["CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_SPG9_TK_INS"] call bis_fnc_selectrandom;

if ((random 1) < 0.05) then {
	_vehtype = "CUP_O_Hilux_UB32_TK_INS";
};

_size = ((sizeof _vehtype) + 2);

 _spawnpos = [getpos player, 10, 30, _size, 0, 0.6, 0] call BIS_fnc_findSafePos;
	
_veh = _vehtype createvehicle _spawnpos;
_veh setdir (random 360);
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

if (totalpoints > (pointlimit * 0.3)) then {
	_veh addbackpackcargoglobal ["RHS_NSV_Tripod_Bag", 1];
};
hint "A car has been spawned within 30m of your position";


if (_vehtype in ["CUP_O_Hilux_UB32_TK_INS",
"CUP_O_Hilux_SPG9_TK_INS"]) then {
	_veh addEventHandler ["Fired", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		[_unit, _projectile] call twc_fnc_idf;
		_mult = 0.5; _projectile setvelocity [(velocity _projectile select 0) + (((random 16) - 8) * _mult), (velocity _projectile select 1) + (((random 16) - 8) * _mult), 	(velocity _projectile select 2) + (((random 8) - 3) * _mult)];;
		
	}];
} else {

	_veh addEventHandler ["Fired", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		
		_mult = 0.5; _projectile setvelocity [(velocity _projectile select 0) + (((random 16) - 8) * _mult), (velocity _projectile select 1) + (((random 16) - 8) * _mult), 	(velocity _projectile select 2) + (((random 8) - 3) * _mult)];;
		
	}];
};