//sleep 5;
if(isserver)exitWith{
	systemchat "role restrict skipped for server";
};



if(["crewchief", typeof player] call BIS_fnc_inString)then{
if (( count(allPlayers - entities "HeadlessClient_F")) < 11) then {

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



if(["helipilot", typeof player] call BIS_fnc_inString)then{
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


if(["armour", str (group player)] call BIS_fnc_inString)then{

execvm "Insurgency_Core\client\sys_restrict\fullArmourCrew.sqf";

};




if(["fixed wing", str (group player)] call BIS_fnc_inString)then{


execvm "Insurgency_Core\client\sys_restrict\fulljetteam.sqf";

};







