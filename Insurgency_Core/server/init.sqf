
twc_missionname = missionname;
publicVariable "twc_missionname";

twc_mortarchance = 0.01;
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
#include "sys_mechanised\init.sqf";
//#include "sys_strongholds\init.sqf";
execVM "Insurgency_Core\server\sys_strongholds\init.sqf";
execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf";
execvm "insurgency_core\client\sys_ragdoll\fn_initRagdoll.sqf";
CIVILIAN setFriend [EAST, 1];
independent setFriend [EAST, 0];
east setFriend [independent, 0];
independent setFriend [west, 1];

if ((missionnamespace getvariable ["twc_isminimission", 0]) == 1) then {
	
	[] spawn {
		sleep 600;
		while {(count allplayers) > 0} do {
			sleep 60;
		};
		"pointVictory" call BIS_fnc_endMissionServer;
	};
};

skiptime (random 30);

//list of leaders that can do attachments without the slot system
twc_goodeggs = [
"76561198018609662", //sarge
"76561198050512686", //patty
"76561198034730503", //cuck
"76561198053960783", //crow
"76561198042520910", //aleyboy
"76561198035067970", //martingw
"76561198157816526", //nubben
"76561198005456546", //bosenator
"76561198030665694" //hobbs

];
publicVariable "twc_goodeggs";

if(isNil "twc_attachmentgap") then{
	twc_attachmentgap = 12;
	publicVariable "twc_attachmentgap";
};

if(isNil "twc_campaignmode") then{
	twc_campaignmode = 0;
	publicVariable "twc_campaignmode";
};

if(isNil "twc_basepos") then{
	twc_basepos = getmarkerpos "base";
	publicVariable "twc_basepos";
};

if(isNil "twc_mortar_targetlist") then{
	twc_mortar_targetlist = [];
	publicVariable "twc_mortar_targetlist";
};

if(isNil "twc_is90") then{
	twc_is90 = 0;
	publicVariable "twc_is90";
};

if(isNil "twc_terp") then{
twc_terp = objnull;
publicVariable "twc_terp";
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

//array of positions that are used for the allegiance system, so that players can get distances and nearest locations from them
if (isNil "twc_locationarray_trgs") then {
	twc_locationarray_trgs = [];
	publicVariable "twc_locationarray_trgs";
};

if (isNil "twc_sniperteam") then {
	twc_sniperteam = [];
	publicVariable "twc_sniperteam";
};


if (isNil "basemode") then {
basemode = 0;
publicvariable "basemode";
};

if (isNil "twc_strongholdcount") then {
twc_strongholdcount = 3;
};

// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";

// List of civilians who have decided whether to pull a gun
goodcivlist = [];
publicVariable "goodcivlist";

// Array of the locations and the strongholds
townLocationArray = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))] ;
_strongholdArray = [];
while{count _strongholdArray <= twc_strongholdcount}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((text _town) in badTownArray))then{
	if ((_town distance getmarkerpos "base")>1000) then {
		//townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback (getpos _town);
		};
	};
};
//persistent stronghold system

//future: make a system for management to deleteat find mission in order to reset strongholds on a per mission basis

_p1 = profilenamespace getvariable ["twc_perstrongholds", []];
_found = 0;

{
	if ((_x select 0) == missionname) then {
		_found = 1;
		_strongholdArray = (_x select 1);
	};
} foreach _p1;

if ((random 1) < 0.3) then {
// do the while again, so that if there are less strongholds in the persistent array then create a new one
while{count _strongholdArray <= twc_strongholdcount}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((text _town) in badTownArray))then{
	if ((_town distance getmarkerpos "base")>1000) then {
		//townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback (getpos _town);
		};
	};
};
};

twc_strongholdArray = [];
{twc_strongholdArray pushback (str _x)} foreach _strongholdArray;

_perstrongholds = [missionname, _strongholdArray];

if (_found == 0) then {_p1 pushback _perstrongholds};

profilenamespace setvariable ["twc_perstrongholds", _p1];

saveprofilenamespace;

if(isNil "customlocations") then{
	customlocations = [worldSize/2,worldSize/2,0] nearEntities ["Land_Can_Rusty_F", (sqrt 2 *(worldSize / 2))];
	};
	{
	_location = createLocation [ "NameVillage" , getpos _x, 100, 100];
townLocationArray = townLocationArray + (nearestLocations [getpos _x, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2]);} foreach customlocations;

//Strongholds
{
	[_x] execVM "Insurgency_Core\server\sys_strongholds\createStronghold.sqf";
}forEach _strongholdArray;
townLocationArray = townLocationArray - _strongholdArray;
execVM "Insurgency_Core\server\sys_townLocations\getLocations.sqf";

publicVariable "townLocationArray";

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