params ["_dis"];


_target = nearestobject [(getpos player), "TargetBootcampHumanSimple_F"];

if (((typeof cursorTarget) == "TargetBootcampHuman_F") && (cameraview == "GUNNER")) then {
	_target = cursorTarget;
};

_checkarr = player getvariable ["twc_activecomptargets_prestart", []];

//if (([_target, _dis] in _checkarr)) exitwith {systemchat "nope";};


//it can't stack more than 2 per distance per target, so quit if that happens
_count = 0;

{
	if (((_x select 0) == _target) && ((_x select 1) == _dis)) then {
		_count = _count + 1;
	};
} foreach (player getvariable ["twc_activecomptargets_prestart", []]);

if (_count > 0) exitwith {
	systemchat "You cannot stack more than 1 of the same distance per target";
};

_checkarr pushback ([_target, _dis]);
player setvariable ["twc_activecomptargets_prestart", _checkarr];

_shotcount = (player getvariable ["twc_shootcomp_shotcount", 1]) + 1;

_text = format ["The shoot will begin when you are %1 meters from the target. Put %2 shots into the target when the timer beeps", _dis, _shotcount];

if (_shotcount == 1) then {
	_text = format ["The shoot will begin when you are %1 meters from the target. Put %2 shot into the target when the timer beeps", _dis, _shotcount];
};

if ((player distance _target) > 30) then {
	_text = format ["Long range target selected. The shoot will begin when you are %1 meters from the target. Put %2 shots into the target when the timer beeps", _dis, _shotcount];
	if (_shotcount == 1) then {
		_text = format ["Long range target selected. The shoot will begin when you are %1 meters from the target. Put %2 shot into the target when the timer beeps", _dis, _shotcount];
	};
};

systemchat _text;
playsound "hint3";
playSound3D ["A3\missions_f\data\sounds\click.wss", player];

_startpos = getpos player;
if ((player getvariable ["twc_shootcomp_shooterready", 0]) == 0) then {
waituntil {((player getvariable ["twc_shootcomp_shooterready", 1]) >= 1)};

_movetime = time;
_startpos = getpos player;
waituntil {((time > (_movetime + (2 + (random 2)))))};
playSound3D ["a3\Ui_f\data\Sound\ReadOut\readoutClick.wss", player];

_startpos = [0,0,10];
};
player setvariable ["twc_shootcomp_shooterready", 2];



_count = 0;

{
	if (((_x select 0) == _target) && ((_x select 1) == _dis)) then {
		_count = _count + 1;
	};
} foreach (player getvariable ["twc_activecomptargets_prestart", []]);

while {_count > 1} do {
	_count = 0;
	//sleep 0.05;
	{
		if (((_x select 0) == _target) && ((_x select 1) == _dis)) then {
			_count = _count + 1;
		};
	} foreach (player getvariable ["twc_activecomptargets_prestart", []]);
};

_timeout = time;		

waituntil {_a = player getvariable ["twc_activecomptargets_prestart", [0]];((((_a select 0) select 0) == _target) && (((_a select 0) select 1) == _dis)) || (_timeout < (time - 120))};


waituntil {((player distance _startpos) > 0.5) || (_timeout < (time - 120))};

if (_timeout < (time - 120)) exitwith {
	systemchat "Shoot cancelled, timed out";
	playsound "hint3";
	_checkarr = player getvariable ["twc_activecomptargets_prestart", []];
		
	_checkarr deleteat (_checkarr find ([_target, _dis]));
		
	player setvariable ["twc_activecomptargets_prestart", _checkarr];
};


_t = time;
_target setvariable ["twcshootcomp_total" + (str _dis) + (name player), time];

_timeout = time;	

waituntil {(((player distance _target) > _dis) && ((player distance _target) < (_dis + ((_dis - 2) min 10)))) || (_timeout < (time - 120))};

if (_timeout < (time - 120)) exitwith {
	systemchat "Shoot cancelled, timed out";
	playsound "hint3";
	_checkarr = player getvariable ["twc_activecomptargets_prestart", []];
		
	_checkarr deleteat (_checkarr find ([_target, _dis]));
		
	player setvariable ["twc_activecomptargets_prestart", _checkarr];
	
	player setvariable ["twc_shootcomp_shooterready", 1];
};

_target setvariable ["twcshootcomp_run" + (str _dis) + (name player), ((floor ((time - _t) * 100)) / 100)];

_checkarr = player getvariable ["twc_activecomptargets", []];

_checkarr pushback ([_target, _dis]);
player setvariable ["twc_activecomptargets", _checkarr, true];

_startrun = player getvariable ["twc_shootcomp_runtotal", -999];
if ((_startrun == -999)) then {
	player setvariable ["twc_shootcomp_runtotal", time];
};



_prestartarr = player getvariable ["twc_activecomptargets_prestart", []];
_startrunneeded = player getvariable ["twc_shootcomp_runtotalneeded", -999];
if ((_startrunneeded == -999)) then {
	if ((count _prestartarr) > 1) then {
		player setvariable ["twc_shootcomp_runtotalneeded", 1];
	};
};


[_target] remoteexec ["twc_shootcomp_resettarget", _target];

_target setvariable ["twcshootcomp_time" + (str _dis) + (name player), time];
_target setvariable ["twcshootcomp_shots" + (str _dis) + (name player), 0];
_target setvariable ["twcshootcomp_hits" + (str _dis) + (name player), 0];
_target setvariable ["twcshootcomp_tar" + (str _dis) + (name player), _target];
_target setvariable ["twcshootcomp_start" + (str _dis) + (name player), time];
_target setvariable ["twc_compfires" + (str _dis) + (name player), []];


_eh1 = _target getvariable ["twcshootcomp_e1", -999]; 


if ((_eh1 != -999)) exitwith {
	hint "This target is already in use by another player";
};


_me = player;
[_target, _me, _dis] remoteexec ["twc_shootcomp_addeh1", _target];



twc_shootcomp_removeeh1 = {
	params ["_eh1", "_target"];
	_target removeEventHandler ["hit", _eh1];
};


_eh2 = player getvariable ["twcshootcomp_e2", -999];

if ((_eh2 == -999)) then {

_eh2 = player addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_targets = player getvariable ["twc_activecomptargets", []];
	
	{
		_target = _x select 0;
		_dis = _x select 1;
		_shotcount = (player getvariable ["twc_shootcomp_shotcount", 1]);
		
		
		_h = _target getvariable ["twcshootcomp_shots" + (str _dis) + (name player), 0];
		if (_h > _shotcount) exitwith {
			systemchat "overshoot";
		};
		//systemchat format ["%1", _h +1];
		if (_h < _shotcount) then {
			_target setvariable ["twcshootcomp_shots" + (str _dis) + (name player), _h + 1];
		};
		
		if (_h == 0) then {
			_t = _target getvariable ["twcshootcomp_start" + (str _dis) + (name player), 0];
			_target setvariable ["twcshootcomp_start" + (str _dis) + (name player), time];
			_target setvariable ["twcshootcomp_rtime" + (str _dis) + (name player), ((floor ((time - _t) * 100)) / 100)];
		};
		_firearray = _target getvariable ["twc_compfires" + (str _dis) + (name player), []];
		if (!(((weaponstate player) select 2) in _firearray)) then {
			_firearray pushback ((weaponstate player) select 2);
			_target setvariable ["twc_compfires" + (str _dis) + (name player), _firearray];
		};
	
	if (_h == _shotcount) then {
	[_target, _dis, _projectile] spawn {
		params ["_target", "_dis", "_projectile"];
		
		
			_eh2 = player getvariable ["twcshootcomp_e2", 1];
				
			player removeEventHandler ["FiredMan", _eh2];
			player setvariable ["twcshootcomp_e2", -999];
			
		player setvariable ["twc_shootcomplete" + (str _dis), 1,true];
		
		_me = player;
		
		waituntil {((_projectile distance player) > (_dis +15)) || (!alive _projectile)};
		[_me, _dis] remoteexec ["twc_shootcomp_completetarget"];
		waituntil {((player getvariable ["twc_shootcomplete" + (str _dis), 1]) == 0)};
		
		_t = _target getvariable ["twcshootcomp_start" + (str _dis) + (name player), 0];
		_target setvariable ["twcshootcomp_time" + (str _dis) + (name player), ((floor ((time - _t) * 100)) / 100)];
		
		//_t = _target getvariable ["twcshootcomp_total" + (str _dis) + (name player), 0];
		_1 = _target getvariable ["twcshootcomp_run" + (str _dis) + (name player), 0];
		_2 = _target getvariable ["twcshootcomp_rtime" + (str _dis) + (name player), 0];
		_3 = _target getvariable ["twcshootcomp_time" + (str _dis) + (name player), 0];
		
		_target setvariable ["twcshootcomp_total" + (str _dis) + (name player), ((floor ((_1 + _2 + _3) * 100)) / 100)];
		
		_text = format ["%8 - %1m || Total: %2s || Run: %3s || Reaction: %4s || Shoot: %7s || Shots: %9|| Hits: %5 || Firemode: %6", _dis, _target getvariable ["twcshootcomp_total" + (str _dis) + (name player), 0], _target getvariable ["twcshootcomp_run" + (str _dis) + (name player), 0], _target getvariable ["twcshootcomp_rtime" + (str _dis) + (name player), 0], _target getvariable ["twcshootcomp_hits" + (str _dis) + (name player), 0], _target getvariable ["twc_compfires" + (str _dis) + (name player), (str ["Single"])], _target getvariable ["twcshootcomp_time" + (str _dis) + (name player), 0], name player,  ((_target getvariable ["twcshootcomp_shots" + (str _dis) + (name player), 0]) + 1)];
		
		_shooter = player;
		[_text, _shooter] remoteexec ["twc_hintnearbyshootcomp"];
		hint _text;
		
		_checkarr = player getvariable ["twc_activecomptargets", []];
		
		_checkarr deleteat (_checkarr find ([_target, _dis]));
		
		player setvariable ["twc_activecomptargets", _checkarr, true];
		
		_checkarr = player getvariable ["twc_activecomptargets_prestart", []];
		
		_checkarr deleteat (_checkarr find ([_target, _dis]));
		
		player setvariable ["twc_activecomptargets_prestart", _checkarr];
		
		if ((count _checkarr) == 0) then {
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\course_active.wss", player];
			
			_startrunneeded = player getvariable ["twc_shootcomp_runtotalneeded", -999];
			if (_startrunneeded == 1) then {
				_t = player getvariable ["twc_shootcomp_runtotal", -999];
				_runtime = ((floor ((time - _t) * 100)) / 100);
				_text = format ["%1 - Shoot Total: %2s", (name player), _runtime];
				
				[_text] spawn {
					params ["_text"];
					sleep 1;
					_shooter = player;
					[_text, _shooter] remoteexec ["twc_hintnearbyshootcomp"];
				};
			};
			player setvariable ["twc_shootcomp_runtotal", -999];
			player setvariable ["twc_shootcomp_runtotalneeded", -999];
			player setvariable ["twc_shootcomp_shooterready", 1];
		};
		
		_targets = player getvariable ["twc_activecomptargets", []];
	
		//if ((count _targets) == 0) then {
		if ((count _checkarr) == 0) then {
		
			_eh1 = _target getvariable ["twcshootcomp_e1", 1]; 
			[_eh1, _target] remoteexec ["twc_shootcomp_removeeh1", _target];
			
			
			
			_target setvariable ["twcshootcomp_e1", -999, true];
		} else {
		
			_return = objnull;
			{
				if ((_x select 0) == _target) then {
					_return = _target;
				};
			} foreach _targets;
			if (_return != _target ) then {
				_eh1 = _target getvariable ["twcshootcomp_e1", 1]; 
				[_eh1, _target] remoteexec ["twc_shootcomp_removeeh1", _target];
				_target setvariable ["twcshootcomp_e1", -999, true];
			};
		};
		_target setvariable ["twcshootcomp_shots" + (str _dis) + (name player), 0];
		};
	};
	} foreach _targets;
	
	
}];

player setvariable ["twcshootcomp_e2", _eh2];

};


playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\drill_start.wss", player];