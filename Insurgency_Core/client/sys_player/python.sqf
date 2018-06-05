//just a code dump at the moment

pythontruck = "CUP_B_Wolfhound_LMG_GB_D" createvehicle position player;
con = "rhs_weap_9K133_launcher_used" createvehicle position player;
con attachto [pythontruck, [0.7,2.7,1.5]];
con setVectorDirAndUp [[0,1.5,2],[1,1,0]];
con setpos (getPos con);


[] spawn {
	_pelpos = getpos pythontruck vectoradd [0, 5 * (cos (getdir pythontruck )), 2 * (tan (getdir pythontruck ))];
	_pellet = createvehicle ["rhs_weap_9K115_launcher_used", _pelpos, [], 0, "can_collide"];
	_ropepos = (pythontruck modeltoworld [0,10,0]);
	_rope = ropeCreate [pythontruck, [0.77,3.1,2], _pellet, [0, 0, 0], 150];
	_pellet setvelocity [25 * (sin (getdir pythontruck )), 25 * (cos (getdir pythontruck )), 20];
};

{
	if ((_x distance pythontruck) > 20) then {
		_r = "M_Scalpel_AT" createVehicle position _x;_r setVectorDirAndUp [[0,-1.5,-2],[-1,-1,0]];
	};

	deletevehicle _x;

	{deletevehicle _x} foreach (_x nearobjects ["rhs_weap_9K115_launcher_used", 20]);
	{_x setdamage 1} foreach (_x nearobjects ["pipebombbase", 20]);
	{_x setdamage 1} foreach (_x nearobjects ["minebase", 20]);
} foreach (pythontruck nearobjects ["ropeSegment", 200]);


player addEventHandler ["Hit", {
	[] spawn {
		if !(vehicle player == player) exitwith{};
		if (stance player == "PRONE") exitwith {};
		if ((random 1)>1.5) exitwith{};
		
		_this = player;
		_this setUnconscious true;
		sleep 0.1;
		_this setUnconscious false;
	}
}];

[] spawn {
	sleep 10;
	_pelpos = getpos pythontruck vectoradd [0, 5 * (cos (getdir pythontruck )), 2 * (tan (getdir pythontruck ))];

	_pellet = createvehicle ["rhs_weap_9K115_launcher_used", _pelpos, [], 0, "can_collide"];
	_ropepos = (pythontruck modeltoworld [0,10,0]);
	_rope = ropeCreate [pythontruck, [0.77,3.1,2], _pellet, [0, 0, 0], 150];
	_pellet setvelocity [25 * (sin (getdir pythontruck )), 25 * (cos (getdir pythontruck )), 20];
	
	sleep 10;
	
	{
		if ((_x distance pythontruck) > 20) then {
			_r = "M_Scalpel_AT" createVehicle position _x;
			_r setVectorDirAndUp [[0,-1.5,-2], [-1,-1,0]];
		};

		deletevehicle _x;
		{deletevehicle _x} foreach (_x nearobjects ["rhs_weap_9K115_launcher_used", 20]);
		{_x setdamage 1} foreach (_x nearobjects ["pipebombbase", 20]);
		{_x setdamage 1} foreach (_x nearobjects ["minebase", 20]);
	} foreach (pythontruck nearobjects ["ropeSegment", 200]);
};



// super basic implementation of spawning a hesco barrier in front of an arv. in future it needs the ace progress bar for each step and a method of destroying barriers, as well as some kind of purpose to making barriers in the first place. might do it with earthen ramparts instead

[] spawn {sleep 5;_relpos = tank getRelPos [7, 2]; _wall = "Land_Wired_Fence_8mD_F" createvehicle [0,0,0]; _wall setdir (getdir tank);_wall setpos _relpos;sleep 5;deletevehicle _wall;_wall = "Land_HBarrier_Big_F" createvehicle [0,0,0]; _wall setdir (getdir tank);_wall setpos _relpos;}

//rampart version

[] spawn {sleep 1;_relpos = tank getRelPos [9, 1]; _wall = "Land_Wired_Fence_8mD_F" createvehicle [0,0,0]; _wall setdir (getdir tank);_wall setpos _relpos;sleep 1;deletevehicle _wall;_wall = "Land_Rampart_F" createvehicle [0,0,0]; _wall setdir ((getdir tank) + 90);_wall setpos _relpos;}