
waitUntil {inputAction "User10" > 0};
[player] remoteexec ["twc_fnc_stopcivs", 2];
hint "GET DOWN";
sleep 10;

execvm "Insurgency_Core\client\sys_intel\stopcivsinit.sqf";