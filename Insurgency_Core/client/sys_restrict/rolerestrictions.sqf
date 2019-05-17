//sleep 5;
if(isserver)exitWith{systemchat "role restrict skipped for server";};


twc_fnc_helicheck = compile preprocessfilelinenumbers "Insurgency_Core\client\sys_restrict\helicheck.sqf";

if(["helipilot", typeof player] call BIS_fnc_inString)then{
_return = call twc_fnc_helicheck;
if ((_return) < 1) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {((_return) < 1)} do {
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Helicopter Pilot</t><br/><t size='0.6'>You need an infantry commander online before you can be a helicopter pilot</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;
	
	_return = call twc_fnc_helicheck;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};

if(["crewchief", typeof player] call BIS_fnc_inString)then{
_return = call twc_fnc_helicheck;
if (((_return) < 2)) then {

cutText ["", "Black", 0.001];
player forceWalk true;
while {((_return) < 2)} do {
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Helicopter Crew Chief</t><br/><t size='0.6'>You need 2 or more infantry commanders on the server before you can be a Crew Chief</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;
	_return = call twc_fnc_helicheck;

};

	
cutText ["","Black IN",5];
player forceWalk false;
};
};


if ((["sniper", typeof player] call BIS_fnc_inString) || (["spotter", typeof player] call BIS_fnc_inString)) then {

execvm "Insurgency_Core\client\sys_restrict\fullsniperteam.sqf";

};

if ((["uksf", typeof player] call BIS_fnc_inString)) then {

execvm "Insurgency_Core\client\sys_restrict\fullsfteam.sqf";

};

if ((["blank", typeof player] call BIS_fnc_inString)) then {

execvm "Insurgency_Core\client\sys_restrict\blank.sqf";

};




if((typeOf player) in ["Modern_British_Medic_Mert","Modern_British_MERT_HeliPilot"])then{

	execvm "Insurgency_Core\client\sys_restrict\fullmertteam.sqf";

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







