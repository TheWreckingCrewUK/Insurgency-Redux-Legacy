
if (idfon ==1) exitwith {}; 

idfon = 1;
publicvariable "idfon";

	[idfalarm, "TWC_sound_infsiren"] call CBA_fnc_globalSay3d;
//playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", idfalarm, false, getposasl idfalarm,5];
sleep 24;
	idfon = 0;
	publicvariable "idfsafe";
//playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", idfalarm, false, getposasl idfalarm,5];


	


terminate execVM "insurgency_core\server\sys_basedefence\INF_Alarm.sqf";
