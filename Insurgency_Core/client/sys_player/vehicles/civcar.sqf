 _arr = player nearObjects ["landvehicle", 50];
 
 if ((count _arr) > 5) exitwith {
	hint "there are more than 5 vehicles within 50 meters of your position already, please have mercy on the server where possible"
};
 
 
_vehtype = ["CUP_C_Datsun_4seat", "UK3CB_Civ_LandRover_Soft_Red_A", "CUP_C_Skoda_Blue_CIV", "CUP_C_Skoda_White_CIV", "CUP_C_Lada_White_CIV", "CUP_C_Lada_Red_CIV", "CUP_C_Ural_Civ_03", "CUP_C_Volha_Gray_TKCIV", "CUP_C_Volha_Blue_TKCIV", "CUP_C_TT650_TK_CIV", "CUP_C_TT650_RU"] call bis_fnc_selectrandom;

_size = ((sizeof _vehtype) + 2);

 _spawnpos = [getpos player, 10, 30, _size, 0, 0.6, 0] call BIS_fnc_findSafePos;
	
_veh = _vehtype createvehicle _spawnpos;
_veh setdir (random 360);
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_veh addbackpackcargoglobal ["RHS_NSV_Tripod_Bag", 1];

hint "A car has been spawned within 30m of your position";