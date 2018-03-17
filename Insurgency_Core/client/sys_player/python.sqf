//just a code dump at the moment

pythontruck = "CUP_B_Wolfhound_LMG_GB_D" createvehicle position player; con = "rhs_weap_9K133_launcher_used" createvehicle position player; con attachto [pythontruck, [0.7,2.7,1.5]]; con setVectorDirAndUp [[0,1.5,2],[1,1,0]]; con setpos con; 


[] spawn {_pelpos = getpos pythontruck vectoradd [0, 5 * (cos (getdir pythontruck )), 2 * (tan (getdir pythontruck ))]; 
 
 _pellet = createvehicle ["rhs_weap_9K133_launcher_used", _pelpos, [], 0, "can_collide"];  
  _pelpos2 = getpos pythontruck vectoradd [0, 7 * (cos (getdir pythontruck )), 2 * (tan (getdir pythontruck ))];
 _pellet2 = createvehicle ["B_Static_Designator_01_F", _pelpos2, [], 0, "can_collide"];  
 _rope = ropeCreate [_pellet2, "hull", _pellet, [0, 0, 0], 150];  
 _pellet setvelocity [30 * (sin (getdir pythontruck )), 30 * (cos (getdir pythontruck )), 20]; 
  
 waituntil {(_pellet distance _pellet2) > 50}; 
 _pellet2 setvelocity [10 * (sin (getdir pythontruck )), 10 * (cos (getdir pythontruck )), 10];

 }; 


{if ((_x distance pythontruck) > 30) then {"M_Scalpel_AT" createVehicle position _x;}; deletevehicle _x} foreach (pythontruck nearobjects ["ropeSegment", 200]);
{deletevehicle _x} foreach (pythontruck nearobjects ["rhs_weap_9K133_launcher_used", 200]);
{deletevehicle _x} foreach (pythontruck nearobjects ["B_Static_Designator_01_F", 200]);
 
 
player addEventHandler ["Hit", {[] spawn {if !(vehicle player == player) exitwith{};if (stance player == "PRONE") exitwith {};if ((random 1)>1.5) exitwith{}; _this = player; _this setUnconscious true; sleep 0.5; _this setUnconscious false}}]

