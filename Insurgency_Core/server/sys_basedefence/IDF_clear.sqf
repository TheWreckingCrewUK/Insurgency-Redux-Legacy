
if (clearing == 0) then {
clearing = 1;
publicvariable "clearing";


if (basesafe < 200) then {
while {basesafe < 200} do {
//systemchat "safety+10";
basesafe = basesafe + 10;
publicvariable "basesafe";
sleep 10;
};
};

	if (basesafe == 200) then {
//	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
//_soundToPlay = _soundPath + "server\sys_idf\idfclear.wav";
//playSound3D ["A3\Sounds_F\sfx\alarmCar.wss", idfalarm, false, getposasl idfalarm,5,0.5];


	[idfalarm, "TWC_sound_idfclear"] call CBA_fnc_globalSay3d;

basesafe = 201;
publicvariable "basesafe";

clearing = 0;
publicvariable "clearing";
};

};