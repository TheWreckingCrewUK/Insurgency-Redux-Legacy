sleep 5;
if(!isMultiplayer)exitWith{};



if((typeOf player) in ["Modern_British_crewchief"])then{
if (( count(allPlayers - entities "HeadlessClient_F")) < 10) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 10} do {
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Helicopter Crew Chief</t><br/><t size='0.6'>You need 10 or more players on the server before you can be a Crew Chief</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};



if((typeOf player) in ["Modern_British_Spotter_coin","Modern_British_Sniper_coin"])then{

execvm "Insurgency_Core\client\sys_restrict\fullsniperteam.sqf";

};




if((typeOf player) in ["Modern_British_Medic_Mert","Modern_British_MERT_HeliPilot"])then{

	execvm "Insurgency_Core\client\sys_restrict\fullmertteam.sqf";

};



if((typeOf player) in ["Modern_British_HeliPilot","1990_British_HeliPilot_Desert","1990_British_HeliPilot","2000_British_HeliPilot_Desert","2000_British_HeliPilot"])then{
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




if((typeOf player) in ["Modern_British_FSTAssistant","Modern_British_FSTCommander", "Modern_British_logitech"])then{



execvm "Insurgency_Core\client\sys_restrict\fullFST.sqf";

};




if((typeOf player) in ["Modern_British_VehicleCrew", "Modern_British_VehicleCommander"])then{


execvm "Insurgency_Core\client\sys_restrict\fullArmourCrew.sqf";

};




if((typeOf player) in ["Modern_British_JetPilot", "Modern_British_FSTForwardObserver"])then{


execvm "Insurgency_Core\client\sys_restrict\fulljetteam.sqf";

};







