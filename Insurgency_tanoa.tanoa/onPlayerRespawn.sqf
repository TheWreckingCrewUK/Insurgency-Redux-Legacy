//Stuff that happens on player respawnVehicle

#include "insurgency_core\client\onRespawn.sqf";

//Deletion of ieds so players can't scum score
{
	player removeMagazines _x;
}forEach ["ACE_IEDLandBig_Range_Ammo","ACE_IEDLandSmall_Range_Ammo","ACE_IEDUrbanBig_Range_Ammo","ACE_IEDUrbanSmall_Range_Ammo"];
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



//Set Radios Correctly
_radioID = [getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType")] call acre_api_fnc_getRadioByType; 
 if (!isNil "_radioID") then { 
_channelNumber = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioChannel"); 
 _switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
 Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType"),_channelNumber]; 
 };