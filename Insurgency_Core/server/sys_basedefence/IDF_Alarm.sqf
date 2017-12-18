if (idfreported == 1) then {

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

{
	[_x, "TWC_sound_idfsiren"] call CBA_fnc_globalSay3d;
} forEach sirenlist;


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
};



