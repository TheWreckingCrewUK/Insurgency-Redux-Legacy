//Stuff that happens on player respawnVehicle

//Deletion of ieds so players can't scum score
player removeItems "IEDLandBig_Remote_Mag";

//If player isn't west then kick them. Apparently players respawning as civ is an issue?
if(side player != west)then{
	call BIS_fnc_endMission;
};

//Code to run if player spawns on forWardBase
if((getMarkerPos "respawn_forwardBase") distance2D (getPos player) < 200)then{


};