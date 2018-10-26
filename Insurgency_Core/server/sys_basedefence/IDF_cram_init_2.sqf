params ["_cram"];

_cram setvariable ["craminit", 1];
[_cram, -1] call ace_cargo_fnc_setSize;

_light = "PortableHelipadLight_01_red_F" createvehicle getpos _cram;
_light attachto [_cram, [0.7,-2.1,-0.93]];


[_cram, _light] spawn {
		
	params ["_cram", "_light"];
	waituntil {!alive _cram};
	
	deletevehicle _light;
};

[_cram] spawn {
		
	params ["_cram"];
	while {(alive _cram)} do {
		waituntil {(((_cram ammo currentMuzzle (gunner _cram)) == 0) && (alive _cram) && (_cram getvariable ["cram_alarm", 0] == 1)) || (!alive _cram)};
		if (!alive _cram) exitwith {};
		while {((_cram ammo currentMuzzle (gunner _cram)) == 0) && (alive _cram) && (_cram getvariable ["cram_alarm", 0] == 1)} do {
			sleep 1;
			if ((_cram ammo currentMuzzle (gunner _cram)) == 0) then {
			playSound3D ["A3\Sounds_F\sfx\alarmCar.wss", _cram, false, getpos _cram, 2];
			};
		sleep 1;
		};
	};
};
		