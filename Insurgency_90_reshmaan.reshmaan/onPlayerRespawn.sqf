//Stuff that happens on player respawnVehicle

#include "insurgency_core\client\onRespawn.sqf";

//Deletion of ieds so players can't scum score
{
	player removeMagazines _x;
}forEach ["IEDLandBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDUrbansmall_Remote_Mag"];
//If player isn't west then kick them. Apparently players respawning as civ is an issue?
if(side player != west)then{
	call BIS_fnc_endMission;
};

//Make sure medics are medics
if(typeOf player in ["Modern_British_Medic","Modern_USMC_Medic"])then{
	player setVariable ["ace_medical_medicClass",1];
};

//Code to run if player spawns on forWardBase
if((getMarkerPos "respawn_forwardBase") distance2D (getPos player) < 200)then{


};

