
twc_missionname = missionname;
publicVariable "twc_missionname";

twc_mortarchance = 0.01;
publicVariable "twc_mortarchance";

vehicleRespawnDelay = 600;
vehicleRespawnDistancePlayers = 2000;

if (isNil "twc_aaman") then {
twc_aaman = "CUP_O_TK_INS_Soldier_AA";
};

//also run in client init
twc_pubaiuncon = true;

while {sunormoon > 0} do {
	skiptime 2;
};
while {sunormoon < 1} do {
	while {sunormoon < 1} do {
		skiptime (0.5 + (random 1));
	};
	skiptime (random 0.5);
};
1 setOvercast 0.0;
1 setfog 0.0;
1 setrain 0.0;

_cram = missionnamespace getvariable ["cram", objnull];
_cram setvehicleammo 0;

// Includes
#include "crashprotection.sqf";
#include "func\init.sqf";
diag_log "hoblog init 24";
#include "sys_controllers\init.sqf";
diag_log "hoblog init 26";

#include "sys_civilianVehicles\init.sqf";
diag_log "hoblog init 32";
#include "sys_cleanup\init.sqf";
diag_log "hoblog init 34";
#include "sys_ied\init.sqf";
diag_log "hoblog init 36";

#include "sys_cache\init.sqf";
diag_log "hoblog init 38";
#include "sys_objectives\init.sqf";
//#include "sys_chat\init.sqf";
#include "sys_basedefence\init.sqf";
#include "sys_vehicleRespawn\init.sqf";
#include "sys_terp\init.sqf";
#include "sys_mechanised\init.sqf";
execVM "Insurgency_Core\server\sys_strongholds\init.sqf";
diag_log "hoblog init 48";
//execvm "Insurgency_Core\server\sys_civ\civtraffic.sqf";

CIVILIAN setFriend [EAST, 1];
independent setFriend [EAST, 0];
east setFriend [independent, 0];
independent setFriend [west, 1];

//execvm "insurgency_core\client\sys_ragdoll\fn_initRagdoll.sqf";

twc_fortifyobjectsbudget = [["twc_Land_BagFence_Long_F", 20], ["twc_Land_BagFence_Round_F", 20], ["twc_Land_BagFence_End_F", 10], ["Land_Shed_06_F", 50],["Land_PortableLight_single_F", 25],["twc_Land_HBarrier_Big_F", 25], ["twc_Land_HBarrier_5_F", 25], ["twc_Land_HBarrierTower_F", 35]];

twc_fortifyobjects = [];
{
	twc_fortifyobjects pushback (_x select 0);
} foreach twc_fortifyobjectsbudget;

publicvariable "twc_fortifyobjects";

[west, 2000, twc_fortifyobjectsbudget] call acex_fortify_fnc_registerObjects;

//make twc variants of ["Land_HBarrier_Big_F", 250], ["Land_HBarrier_5_F", 250] Land_HBarrierTower_F Land_Shed_06_F so that nearobjects can't pick up mapobjects with the same classname

if ((missionnamespace getvariable ["twc_isminimission", 0]) == 1) then {
	
	[] spawn {
		sleep 600;
		while {(count allplayers) > 0} do {
			sleep 60;
		};
		"pointVictory" call BIS_fnc_endMissionServer;
	};
};
/*
if (!hasinterface) then {
	skiptime (random 25);
};
*/


addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (!isplayer _unit) exitwith {};
	if ((_unit distance (missionnamespace getvariable ["twc_basepos", [0,0,0]])) > 150) exitwith {};
	[(vehicle _unit)] spawn {
		params ["_unit"];
		while {isplayer _unit} do {
			sleep 1;
		};
		deletevehicle _unit;
	};
}];



publicvariable "townspawn";

if(isNil "twc_attachmentgap") then{
	twc_attachmentgap = 12;
	publicVariable "twc_attachmentgap";
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

["ace_captiveStatusChanged", {
	params ["_unit", "_state", "_reason"];
	if (isplayer _unit) exitwith {};
	if ((_unit getVariable ["twc_bluefluff",0]) == 0) exitwith {};
	deletevehicle _unit;
}] call CBA_fnc_addEventHandler;


["ace_captiveStatusChanged", {
	params ["_unit", "_state", "_reason"];
	if (isplayer _unit) exitwith {};
	if (side _unit == west) exitwith {};
	if (((_unit) getvariable ["twc_isenemy", 0]) == 0) then{
		if ((random 1) > 0.4) then {
			[(getpos _unit)] call twc_fnc_betrayal;
		};
	};
}] call CBA_fnc_addEventHandler;


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
	twc_mineType = ["APERSMine","ATMine"];
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
twc_strongholdcount = 2;
};
twc_strongholdcount = twc_strongholdcount min 2;


_trg = createTrigger ["EmptyDetector", twc_basepos];
_trg setTriggerArea [1000, 1000, 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerTimeout [0,0,0, true];

_trg setTriggerStatements ["this","[twc_basepos, true] call twc_fnc_civfluff;",""];

diag_log "hoblog init 227";
// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";

// List of civilians who have decided whether to pull a gun
goodcivlist = [];
publicVariable "goodcivlist";

townLocationArray = [];

_expomode = missionnamespace getvariable ["twc_gridspawnmode", -1];
if (_expomode == -1) then {
	//twc_gridspawnmode = 1;
};
_expomode = missionnamespace getvariable ["twc_gridspawnmode", 0];
if (_expomode == 1) then {
	//EXPERIEMENTAL grid system
	// Array of the locations and the strongholds
	_gridarray = [];

	for "_1" from 0 to (worldSize / 1000) do {
		for "_2" from 0 to (worldSize / 1000) do {
			_pos = [(_1 * 1000) + 500, (_2 * 1000) + 500, 0];
			//if (!((str _pos) in (str _gridarray))) then {
				_gridarray pushback (ATLToASL _pos);
			//};
		};
	};
	townLocationArray = _gridarray;
} else {

	_townarray = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))];

	{
		townLocationArray pushback (getpos _x);
	} foreach _townarray;
};
//townLocationArray = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))] ;
_strongholdArray = [];
while{count _strongholdArray <= twc_strongholdcount}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((str _town) in badTownArray))then{
	if ((_town distance getmarkerpos "base")>2000) then {
		//townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback (_town);
		};
	};
};
//persistent system

diag_log "hoblog init 271";
execvm "Insurgency_Core\server\sys_forwardbase\fnc_persistentpb_read.sqf";


_p1 = profilenamespace getvariable ["twc_perstrongholds", []];
_found = 0;

{
	if ((_x select 0) == missionname) then {
		_found = 1;
		_strongholdArray = (_x select 1);
	};
} foreach _p1;

if ((random 1) < 10.3) then {
// do the while again, so that if there are less strongholds in the persistent array then create a new one
while{count _strongholdArray < twc_strongholdcount}do{

	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((str _town) in badTownArray))then{
	if ((_town distance getmarkerpos "base")>1000) then {
		//townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback (_town);
		};
	};
};
};

twc_strongholdArray = [];
{twc_strongholdArray pushback (str _x)} foreach _strongholdArray;

diag_log "hoblog init 303";
_perstrongholds = [missionname, _strongholdArray];

//if (_found == 0) then {_p1 pushback _perstrongholds};
_p1 pushback _perstrongholds;
profilenamespace setvariable ["twc_perstrongholds", _p1];

saveprofilenamespace;

_activestrongholds = 0;
{
	if (_activestrongholds < twc_strongholdcount) then {
		[_x] execVM "Insurgency_Core\server\sys_strongholds\createStronghold.sqf";
		_activestrongholds = _activestrongholds + 1;
	};
}forEach _strongholdArray;
townLocationArray = townLocationArray - _strongholdArray;

execVM "Insurgency_Core\server\sys_townLocations\getLocations.sqf";

publicVariable "townLocationArray";
diag_log "hoblog init 328";


/*
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
*/

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
*/

