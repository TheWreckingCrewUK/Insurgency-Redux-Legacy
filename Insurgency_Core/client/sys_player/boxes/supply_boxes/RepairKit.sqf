/*
By [TWC] Hobbs
Spawns a spare wheel, then, if conditions are right, spawns 3 more on top of it
only spawns more if there are a few players on

will put a check on in future to check for wheels around already, to stop spam
*/

if (( count(allPlayers - entities "HeadlessClient_F"))<3) then {_wheel = "ace_Wheel" createVehicle (getPos AmmoBoxSpawner); } else {


_wheel = "ace_Wheel" createVehicle (getPos AmmoBoxSpawner); 
 createVehicle ["ace_Wheel", position _wheel vectoradd [random 1,random 1, 0.4], [], 0, "can_collide"];  
 createVehicle ["ace_Wheel", position _wheel vectoradd [random 1,random 1, 0.8], [], 0, "can_collide"];  
 createVehicle ["ace_Wheel", position _wheel vectoradd [random 1,random 1, 1.2], [], 0, "can_collide"];  
};