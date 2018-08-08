twc_mortarchance = 0.02;
publicVariable "twc_mortarchance";

// Includes
#include "func\init.sqf";
#include "sys_controllers\init.sqf";
#include "sys_townLocations\init.sqf";
#include "sys_civilianVehicles\init.sqf";
#include "sys_vehicleRespawn\init.sqf";
#include "sys_cleanup\init.sqf";
#include "sys_ied\init.sqf";
#include "sys_cache\init.sqf";
#include "sys_objectives\init.sqf";
#include "sys_forwardBase\init.sqf";
#include "sys_chat\init.sqf";
#include "sys_basedefence\init.sqf";
#include "sys_terp\init.sqf";
//#include "sys_strongholds\init.sqf";
execVM "Insurgency_Core\server\sys_strongholds\init.sqf";

execvm "insurgency_core\client\sys_ragdoll\fn_initRagdoll.sqf";

twc_missionname = missionname;
publicVariable "twc_missionname";


if(isNil "twc_attachmentgap") then{
	twc_attachmentgap = 8;
	publicVariable "twc_attachmentgap";
};

if(isNil "twc_is90") then{
	twc_is90 = 0;
	publicVariable "twc_is90";
};

if(isNil "twc_terp") then{
twc_terp = objnull;
};


if(isNil "twc_activemissions") then{
	twc_activemissions = [];
	publicVariable "twc_activemissions";
};


if(isNil "twc_activestrongholds") then{
	twc_activestrongholds = [];
	publicVariable "twc_activestrongholds";
};


if(isNil "twc_ismini") then{
	twc_ismini = 0;
	publicVariable "twc_ismini";
};

if (twc_ismini == 1) then {
["TWC_PlayerDisconnected", "onPlayerDisconnected", {
	
	if ((count(allPlayers - entities "HeadlessClient_F")) == 0) then {
		call BIS_fnc_endMission;
	};
}] call BIS_fnc_addStackedEventHandler;
};

if(isNil "twc_convoyallowed") then{
	twc_convoyallowed = 1;
};


if(isNil "twc_heavies") then{
	twc_heavies = ["twc_heavy_men_rif_m4",
			"twc_heavy_men_com",
			"twc_heavy_men_ar",
			"twc_heavy_men_mg",
			"twc_heavy_men_mg_as",
			"twc_heavy_men_gren_m203",
			"twc_heavy_men_gren_gp25",
			"twc_heavy_men_rif_at",
			"twc_heavy_men_mk",
			"twc_heavy_men_rif_ak74",
			"twc_heavy_men_rif_m16"];
			
};

if(isNil "enemyTechnical") then{
	enemyTechnical = ["CUP_O_LR_MG_TKM", "CUP_O_LR_SPG9_TKM"];
	publicVariable "enemyTechnical";
};


if(isNil "twc_mineType") then{
	twc_mineType = ["APERSMine", "rhs_mine_ptm1", "rhs_mine_pmn2", "rhs_mine_pfm1", "ATMine"];
	publicVariable "twc_mineType";
};


if (isNil "twc_armourcrew") then {
	twc_armourcrew = [];
	publicVariable "twc_armourcrew";
};

if (isNil "twc_sniperteam") then {
	twc_sniperteam = [];
	publicVariable "twc_sniperteam";
};


if (isNil "basemode") then {
basemode = 0;
publicvariable "basemode";
};

// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";

// Array of the locations and the strongholds
townLocationArray = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))] ;
_strongholdArray = [];
while{count _strongholdArray < 2}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((text _town) in badTownArray))then{
	if ((_town distance getmarkerpos "base")>1000) then {
		townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback _town;
		};
	};
};

//Strongholds
{
	[_x] execVM "Insurgency_Core\server\sys_strongholds\createStronghold.sqf";
}forEach _strongholdArray;
townLocationArray = townLocationArray - _strongholdArray;
execVM "Insurgency_Core\server\sys_townLocations\getLocations.sqf";

//Event Handler to stop players from  airdropping crates.
["ace_cargoUnloaded", {
	params ["_item", "_vehicle", ["_dropStyle", ""]];
	
	if (_dropStyle == "paradrop") then {
		if (!((typeOf _vehicle) in paradropVehicleWhitelist)) then {
			{
				deleteVehicle _x;
			} forEach (attachedObjects _item);
		};
	};
}] call CBA_fnc_addEventHandler;

["playerConnectedEHandler", "onPlayerConnected", {
	// _this ([<id>,<uid>,<name>,<jip>,<owner>])
	_isJIP = (_this select 3);
	_owner = (_this select 4);
	_name = (_this select 2);
	_message = format ["%1 has connected, and is awaiting back at base.", _name];

	if (_isJIP) then { { [_x, _message, _owner] call twc_fnc_sendCTabMessage; } forEach allPlayers; };
}] call BIS_fnc_addStackedEventHandler;
/*
["TWC_ArmourCrewConnected", {
	params ["_caller"];

	twc_armourcrew pushBack _caller;
	publicVariable "twc_armourcrew";
	
}] call CBA_fnc_addEventHandler;

["TWC_ArmourCrewDisconnected", "onPlayerDisconnected", {
	twc_armourcrew = twc_armourcrew - [_uid];
	publicVariable "twc_armourcrew";
	
	
}] call BIS_fnc_addStackedEventHandler;

["TWC_SniperConnected", {
	params ["_caller"];

	twc_sniperteam pushBack _caller;
	publicVariable "twc_sniperteam";

	
}] call CBA_fnc_addEventHandler;

["TWC_SniperDisconnected", "onPlayerDisconnected", {
	twc_sniperteam = twc_sniperteam - [_uid];
	publicVariable "twc_sniperteam";
	
	
}] call BIS_fnc_addStackedEventHandler;