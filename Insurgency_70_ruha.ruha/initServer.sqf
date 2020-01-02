//This file defines all of the units used. To change to a new map you mostly only have to change this file.

/*
Known other changes occur in:
server\sys_cache\cacheLoadout.sqf
server\sys_vehicles\VBIED.sqf
*/

//Enable or Disable Debug
twc_serverDebug = false;

twc_surrenderVote = false;

/*
* Denotes the style of building to be used, for dynamic compositions.
* For example: the IED factory.
*
* Known Types:
* "Med" - Mediterranean
* "MidEast" - Middle East
* "IRA" - Irish
*/
TWC_Building_Style = "MidEast";

twc_wdveh = 1;
publicVariable "twc_wdveh";

twc_is90 = 1;
publicVariable "twc_is90";
hvtlist = ["CUP_O_TK_INS_Commander_twc"];

twc_strongholdcount = 0;

twc_isminimission = 1;

pointLimit = 400;
publicVariable "pointLimit";

twc_daytimeonly = true;

sirenlist = [idfalarm,idfalarm_1];
publicvariable "sirenlist";

civilianType = ["greek_Civ_Men_1", "greek_Civ_Men_2", "greek_Civ_Men_3", "greek_Civ_Men_4", "greek_Civ_Men_5", "greek_Civ_Men_6", "greek_Civ_Men_7", "greek_Civ_Men_8", "greek_Civ_Men_9", "greek_Civ_Men_10", "greek_Civ_Men_11"];

publicvariable "civiliantype";
homeEnemy = ["twc_greek_rifleman"];

AA_VEHICLE_TYPE = "CUP_O_ZU23_TK_INS";
AATeams = 6;
AATeam = ["twc_greek_officer", "twc_greek_aa", "twc_greek_aa", "twc_greek_aa"];

//List of Spoof Objects
iedSpoofs = ["Land_Garbage_square3_F", "Land_Garbage_square5_F", "Land_Garbage_line_F"];

paradropVehicleWhitelist = ["CUP_B_C130J_GB", "CUP_B_C130J_Cargo_GB"];

cacheBoxType = "Box_FIA_Wps_F";

townSpawn = ["IRA_Rifleman_AT","IRA_Autorifleman","IRA_Autorifleman_2","IRA_pistol_1","IRA_pistol_2","IRA_pistol_3","IRA_Rifleman_AKM","IRA_Rifleman_FAL","IRA_Rifleman_M16_2","IRA_Rifleman_M16_3","IRA_Rifleman_M16_4","IRA_Rifleman_M16","IRA_Squadleader"];

townSquadWave = ["IRA_Rifleman_AT","IRA_Autorifleman","IRA_Autorifleman_2","IRA_pistol_1","IRA_pistol_2","IRA_pistol_3","IRA_Rifleman_AKM","IRA_Rifleman_FAL","IRA_Rifleman_M16_2","IRA_Rifleman_M16_3","IRA_Rifleman_M16_4","IRA_Rifleman_M16","IRA_Squadleader"];

vehicleList = ["CUP_C_UAZ_Unarmed_TK_CIV", "CUP_C_Skoda_Blue_CIV", "CUP_C_Datsun_Plain", "CUP_C_Ural_Open_Civ_03"];

enemyTechnical = ["CUP_O_LR_MG_TKM", "CUP_O_LR_SPG9_TKM"];

_script = execVM "Insurgency_Core\SHK_pos\shk_pos_init.sqf";
waitUntil{scriptDone _script};


badTownArray = ["Airport north","Loymanara","Jaza","sultansafe","loy manara oilfield","iedrestrictionzone","Novy Lug","Faro","Guran","Feas"];

[west,"base","Main Base"] call BIS_fnc_addRespawnPosition;

//defines how close mortar shells have to be predicted to land before tripping the base alarm. FOB kunduz is 40 as a baseline.
idfbasesize = 70;
publicvariable "idfbasesize";

//Sets up the unit Caching. I have no idea why i have to sleep and wait.
[]spawn{sleep 120;
["AllVehicles","init",{
	[false,(_this select 0),1000] spawn twc_fnc_initVehicleCache
}, true, ["Man","Static"], true] call CBA_fnc_addClassEventHandler;
};
// event handlers run in the non-scheduled environment (can't be execVM)
[] call compile preprocessFile "Insurgency_Core\server\init.sqf";