
if (idfon ==1) exitwith {};

idfon = 1;
publicvariable "idfon";


if (twc_is90 == 0) then {

	{
	[_x, "TWC_sound_idfclear"] call CBA_fnc_globalSay3d;
} forEach sirenlist;
sleep 30;
	idfon = 0;
	publicvariable "idfon";
} else 
{
	{
	[_x, "TWC_sound_allclearvoice"] call CBA_fnc_globalSay3d;
} forEach sirenlist;
sleep 5;
	idfon = 0;
	publicvariable "idfon";
};

//playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", idfalarm, false, getposasl idfalarm,5];

//playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", idfalarm, false, getposasl idfalarm,5];


	


terminate execVM "insurgency_core\server\sys_basedefence\INF_Alarmclear.sqf";




