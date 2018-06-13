sleep 5;
//if(!isMultiplayer)exitWith{};

/*
if((typeOf player) in ["Modern_British_crewchief"])then{
if (( count(allPlayers - entities "HeadlessClient_F")) < 8) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 8} do {
cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Helicopter Crew Chief</t><br/><t size='0.6'>You need 8 or more players on the server before you can be a Crew Chief</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};
*/


if((typeOf player) in ["Modern_British_Spotter_coin","Modern_British_Sniper_coin"])then{
/*if (( count(allPlayers - entities "HeadlessClient_F")) < 8) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 8} do {
cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Sniper Team</t><br/><t size='0.6'>You need 8 or more players on the server before you can be in a sniper team</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
*/

execvm "Insurgency_Core\client\sys_restrict\fullsniperteam.sqf";

};


/*
if((typeOf player) in ["Modern_British_JetPilot"])then{
if (( count(allPlayers - entities "HeadlessClient_F")) < 6) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 6} do {
cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Fixed Wing Pilot</t><br/><t size='0.6'>You need 6 or more people before you can be a fixed wing pilot</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};
*/
/*
if((typeOf player) in ["Modern_British_HeliPilot","2000_British_HeliPilot_Desert","2000_British_HeliPilot"])then{
if (( count(allPlayers - entities "HeadlessClient_F")) < 5) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 5} do {
cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Helicopter Pilot</t><br/><t size='0.6'>You need 5 or more people before you can be a helicopter pilot</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};

*/

/*

if((typeOf player) in ["Modern_British_FSTAssistant","Modern_British_FSTForwardObserver","Modern_British_FSTCommander"])then{
if (( count(allPlayers - entities "HeadlessClient_F")) < 8) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 8} do {
cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Fire Support Team</t><br/><t size='0.6'>You need 8 or more people before you can be in the Fire Support Team</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};
*/



if((typeOf player) in ["Modern_British_VehicleCrew", "Modern_British_VehicleCommander"])then{
/*if (( count(allPlayers - entities "HeadlessClient_F")) < 8) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 8} do {
cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Armour Crew</t><br/><t size='0.6'>You need 8 or more people before you can be in the Armour Crew</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};
	
cutText ["","Black IN",5];
player forceWalk false;

};
*/
execvm "Insurgency_Core\client\sys_restrict\fullArmourCrew.sqf";

};





/*
if((typeOf player) in ["Modern_British_logitech"])then{

_count = 15;

if(getMarkerColor "respawn_forwardBase" != "")then{_count = 8};

if (( count(allPlayers - entities "HeadlessClient_F")) < _count) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < _count} do {
cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Logistics Team</t><br/><t size='0.6'>You need 15 or more people before you can be in the Logistics Team. If a Patrol Base is active, you need more than 8 people</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};
	
cutText ["","Black IN",5];
player forceWalk false;

};


};
*/



