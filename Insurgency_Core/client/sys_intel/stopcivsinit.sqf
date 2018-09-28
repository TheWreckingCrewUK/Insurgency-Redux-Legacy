
sleep 20;

waitUntil {inputAction "User10" > 0};

_civsnear = 0;

{
	if (!((str side _x) == "WEST")) then {
	_civsnear = 1;
		};
} foreach (player nearentities ["man",100]);

sleep 0.2;

if (_civsnear == 0) exitwith {

execvm "Insurgency_Core\client\sys_intel\stopcivsinit.sqf";
};

[getpos player, vehicle player] remoteexec ["twc_fnc_stopcivs", 2];

_sound = ["TWC_sound_down01","TWC_sound_down02","TWC_sound_down03","TWC_sound_down04","TWC_sound_down05","TWC_sound_down06"] call bis_fnc_selectrandom;

[player, _sound] call CBA_fnc_globalSay3d;

execvm "Insurgency_Core\client\sys_intel\stopcivsinit.sqf";