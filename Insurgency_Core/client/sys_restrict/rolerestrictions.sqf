sleep 5;
if(!isMultiplayer)exitWith{};



if((typeOf player) in ["Modern_British_crewchief", "2000_British_CrewChief", "2000_British_CrewChief_Desert"])then{
if (( count(allPlayers - entities "HeadlessClient_F")) < 14) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {( count(allPlayers - entities "HeadlessClient_F")) < 14} do {
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Helicopter Crew Chief</t><br/><t size='0.6'>You need 14 or more players on the server before you can be a Crew Chief</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};


if ((["sniper", typeof player] call BIS_fnc_inString) || (["spotter", typeof player] call BIS_fnc_inString)) then {

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




if(["FST", str (group player)] call BIS_fnc_inString)then{



execvm "Insurgency_Core\client\sys_restrict\fullFST.sqf";

};

if(["recce", str (group player)] call BIS_fnc_inString)then{



execvm "Insurgency_Core\client\sys_restrict\fullrecce.sqf";

};


if((typeOf player) in ["Modern_British_VehicleCrew", "Modern_British_VehicleCommander", "1990_British_Tank_Crew_Desert", "1990_British_Tank_Commander_Desert", "2000_British_Vehicle_Commander", "2000_British_Vehicle_Crew"])then{


execvm "Insurgency_Core\client\sys_restrict\fullArmourCrew.sqf";

};




if((typeOf player) in ["Modern_British_JetPilot", "Modern_British_FSTForwardObserver"])then{


execvm "Insurgency_Core\client\sys_restrict\fulljetteam.sqf";

};







