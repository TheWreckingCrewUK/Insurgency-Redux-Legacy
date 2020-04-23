

//if (((getposatl player) select 2) < 30) exitwith {};
player setvariable ["twc_staticlineready", false];
_time = time + ((random 3));
_para = objnull;
if (((getposatl player) select 2) > 50) then {
	sleep 1;

	waituntil {(time > _time) || (((getposatl player) select 2) < 140)};
	_para = createVehicle ["rhs_d6_Parachute", [0,0,1000], [], 0, "FLY"];

	_para setdir (random 360);
};	

_pos = getpos player;
//systemchat (str ((getposatl player) select 2));

if (((getposatl player) select 2) > 150) then {
	player moveinany _para;
} else {
		[] spawn {
			[player, true] remoteExec ["setunconscious"];
			sleep 1;
			[player, false] remoteExec ["setunconscious"];
		};
	if (((getposatl player) select 2) > 50) then {
		[] spawn {
			waituntil {isTouchingGround player};
			sleep 0.3;
			if (alive player) then {
				player setdamage 1;
			};
		};
	};
};

_para setpos _pos;
