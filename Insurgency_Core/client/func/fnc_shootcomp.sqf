params ["_dis"];

_target = nearestobject [(getpos player), "TargetBootcampHumanSimple_F"];
systemchat format ["The shoot will begin when you are %1 meters from the target. Put 5 shots into the target when the timer beeps", _dis];

_t = time;
player setvariable ["twcshootcomp_total", time];
waituntil {(player distance _target) > _dis};
player setvariable ["twcshootcomp_run", ((floor ((time - _t) * 100)) / 100)];

playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\drill_start.wss", player];


player setvariable ["twcshootcomp_time", time];
player setvariable ["twcshootcomp_shots", 0];
player setvariable ["twcshootcomp_hits", 0];
player setvariable ["twcshootcomp_dis", _dis];
player setvariable ["twcshootcomp_tar", _target];
player setvariable ["twcshootcomp_start", time];

_eh1 = _target addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	_unit setdamage 0;
	
	if (!(_instigator == player)) exitwith {};
	_h = player getvariable ["twcshootcomp_hits", 0];
	player setvariable ["twcshootcomp_hits", _h + 1];
	
	
}];

_eh2 = player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	
	_h = player getvariable ["twcshootcomp_shots", 0];
	player setvariable ["twcshootcomp_shots", _h + 1];
	if (_h == 0) then {
		_t = player getvariable ["twcshootcomp_start", 0];
		player setvariable ["twcshootcomp_start", time];
		player setvariable ["twcshootcomp_rtime", ((floor ((time - _t) * 100)) / 100)];
	};
	if (_h == 2) then {
		player setvariable ["twcshootcomp_firemode", ((weaponstate player) select 2)];
	};
	if (_h == 4) then {
	[] spawn {
		sleep 0.1;
		
		_t = player getvariable ["twcshootcomp_start", 0];
		player setvariable ["twcshootcomp_time", ((floor ((time - _t) * 100)) / 100)];
		
		_t = player getvariable ["twcshootcomp_total", 0];
		player setvariable ["twcshootcomp_total", ((floor ((time - _t) * 100)) / 100)];
		
		
		_text = format ["Hobbs - %1m || Total: %2s || Run: %3s || Reaction: %4s || Shoot: %7s || Hits: %5 || Firemode: %6", player getvariable ["twcshootcomp_dis", 0], player getvariable ["twcshootcomp_total", 0], player getvariable ["twcshootcomp_run", 0], player getvariable ["twcshootcomp_rtime", 0], player getvariable ["twcshootcomp_hits", 0], player getvariable ["twcshootcomp_firemode", "Single"], player getvariable ["twcshootcomp_time", "0"]];
		
		_target = player getvariable ["twcshootcomp_tar", objnull];
		_eh1 = player getvariable ["twcshootcomp_e1", 1]; 
		_eh2 = player getvariable ["twcshootcomp_e2", 1];
		
		_target removeEventHandler ["hit", _eh1];
		player removeEventHandler ["fired", _eh2];
		_shooter = player;
		[_text, _shooter] remoteexec ["twc_hintnearbyshootcomp"];
		};
	};
	
}];

player setvariable ["twcshootcomp_e1", _eh1];
player setvariable ["twcshootcomp_e2", _eh2];


twc_hintnearbyshootcomp = {
	params ["_text", "_shooter"];
	if ((player distance _shooter) > 30) exitwith {};
	systemchat _text;
};
	