params ["_player"];

if (isnil "_player") exitwith {
	systemchat "Tell Hobbs: Crew Count function is broken";
};

 _armourcrew = ["Modern_British_VehicleCrew","Modern_USMC_VehicleCrew","1990_British_Tank_Crew_Desert","2000_British_Vehicle_Crew","Modern_British_VehicleCommander","Modern_USMC_VehicleCommander","1990_British_Tank_Commander_Desert","2000_British_Vehicle_Commander"];

_crewcount = 0;

{if (typeof _x in _armourcrew) then {_crewcount = _crewcount + 1;}} foreach units group _player;

group _player setvariable ["armourcount", _crewcount, true];

waituntil {!alive _player};



_crewcount = 0;

{if (typeof _x in _armourcrew) then {_crewcount = _crewcount + 1;}} foreach units group _player;

group _player setvariable ["armourcount", _crewcount, true];

if ((group _player getvariable ["armourcount", 1]) == 0) then {
	group _player setvariable ["twc_ismechanised", 0, true];
};