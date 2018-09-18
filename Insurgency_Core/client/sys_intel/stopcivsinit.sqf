
waitUntil {inputAction "User10" > 0};
[getpos player, vehicle player] remoteexec ["twc_fnc_stopcivs", 2];

_sound = ["TWC_sound_down01","TWC_sound_down02","TWC_sound_down03","TWC_sound_down04","TWC_sound_down05","TWC_sound_down06"] call bis_fnc_selectrandom;

[player, _sound] call CBA_fnc_globalSay3d;

sleep 10;

execvm "Insurgency_Core\client\sys_intel\stopcivsinit.sqf";