sleep 10;
"pointVictory" call BIS_fnc_endMissionServer;
sleep 1;
twc_endmissionplayer = {
player setvehicleammo 0;
};
{[_x] remoteexec ["twc_endmissionplayer", _x];} foreach allplayers;