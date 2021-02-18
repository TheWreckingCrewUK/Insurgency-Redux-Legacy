 _arr = player nearObjects ["landvehicle", 50];
 
 if ((count _arr) > 5) exitwith {
	hint "there are more than 5 vehicles within 50 meters of your position already, please have mercy on the server where possible"
};
 
 
_vehtype = ["CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_DSHKM_TK_INS",
"CUP_O_Hilux_SPG9_TK_INS"] call bis_fnc_selectrandom;

if ((random 1) < 0.15) then {
	_vehtype = "CUP_O_Hilux_UB32_TK_INS";
};
_vehtype = "CUP_O_Hilux_UB32_TK_INS";
_size = ((sizeof _vehtype) + 2);

 _spawnpos = [getpos player, 10, 30, _size, 0, 0.6, 0] call BIS_fnc_findSafePos;
	
_veh = _vehtype createvehicle _spawnpos;
_veh setdir (random 360);
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

hint "A car has been spawned within 30m of your position";