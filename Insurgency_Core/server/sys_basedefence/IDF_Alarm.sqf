if (idfon == 0) then {
idfon = 1;
publicvariable "idfon";
sleep 1;
//systemchat "Alarm On";
	
//_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
//_soundToPlay = _soundPath + "server\sys_idf\idfalarm.wav";

//playSound3D ["TWC_sound_idfsiren.wav", idfalarm, false, getposasl idfalarm,5];

//	[idfalarm, "TWC_sound_idfsiren"] call CBA_fnc_globalSay3d;
//call TWC_fnc_idfsiren;	
if (twc_is90 == 0) then {
{
	[_x, "TWC_sound_idfsiren"] call CBA_fnc_globalSay3d;
} forEach sirenlist;
} else{
if (random 2 > 1) then {
{
	[_x, "TWC_sound_incomingvoice1"] call CBA_fnc_globalSay3d;
} forEach sirenlist;
} else{
{
	[_x, "TWC_sound_incomingvoice2"] call CBA_fnc_globalSay3d;
} forEach sirenlist;
};
sleep 10;
idfon = 0;
publicvariable "idfon";
sleep 30;
};

//playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", idfalarm, false, getposasl idfalarm,5];
sleep 20;
	idfsafe = 0;
	publicvariable "idfsafe";
//playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", idfalarm, false, getposasl idfalarm,5];

sleep 6;
alarm = 0;
	publicvariable "alarm";
	
idfon = 0;
publicvariable "idfon";
	
idfreported = 0;
publicvariable "idfreported";
	sleep 60;
		basesafe = 0;
	publicvariable "idfsafe";

terminate execVM "insurgency_core\server\sys_basedefence\IDF_Alarm.sqf";
};



