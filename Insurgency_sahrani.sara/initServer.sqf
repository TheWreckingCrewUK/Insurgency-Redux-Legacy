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

hvtlist = ["CUP_O_TK_INS_Commander_twc","rhsgref_ins_squadleader"];

sirenlist = [idfalarm,idfalarm_1,idfalarm_2,idfalarm_3,idfalarm_4,idfalarm_5];
publicvariable "sirenlist";

civilianType = ["C_man_polo_3_F_afro", "C_man_polo_1_F_afro", "C_man_polo_4_F_afro","C_man_polo_5_F_afro", "C_man_polo_6_F_afro", "C_man_p_fugitive_F_afro"];

publicvariable "civiliantype";
homeEnemy = ["twc_greek_rifleman"];

AA_VEHICLE_TYPE = "CUP_O_ZU23_TK_INS";
AATeams = 6;
AATeam = ["twc_greek_officer", "twc_greek_aa", "twc_greek_aa", "twc_greek_aa"];

//List of Spoof Objects
iedSpoofs = ["Land_Garbage_square3_F", "Land_Garbage_square5_F", "Land_Garbage_line_F"];

paradropVehicleWhitelist = ["CUP_B_C130J_GB", "CUP_B_C130J_Cargo_GB"];

cacheBoxType = "Box_FIA_Wps_F";

townSpawn = ["twc_farc_men_off","twc_farc_men_rif_m16","twc_farc_men_mg_m60","twc_farc_men_mg_pkp","twc_farc_men_mg_as","twc_farc_men_rif_akm","twc_farc_men_rif_m21","twc_farc_men_rif_hk416","twc_farc_men_rif_ak104","twc_farc_men_rif_ak74","twc_farc_men_rif_at","twc_farc_men_rif_m4","twc_farc_men_rif_akm","twc_farc_men_rif_m21","twc_farc_men_rif_hk416","twc_farc_men_rif_ak104","twc_farc_men_rif_ak74","twc_farc_men_rif_at","twc_farc_men_rif_m4","twc_farc_men_rif_akm","twc_farc_men_rif_m21","twc_farc_men_rif_hk416","twc_farc_men_rif_ak104","twc_farc_men_rif_ak74","twc_farc_men_rif_at","twc_farc_men_rif_m4"];

townSquadWave = ["twc_farc_men_off","twc_farc_men_rif_m16","twc_farc_men_mg_m60","twc_farc_men_mg_pkp","twc_farc_men_mg_as","twc_farc_men_rif_akm","twc_farc_men_rif_m21","twc_farc_men_rif_hk416","twc_farc_men_rif_ak104","twc_farc_men_rif_ak74","twc_farc_men_rif_at","twc_farc_men_rif_m4","twc_farc_men_rif_akm","twc_farc_men_rif_m21","twc_farc_men_rif_hk416","twc_farc_men_rif_ak104","twc_farc_men_rif_ak74","twc_farc_men_rif_at","twc_farc_men_rif_m4","twc_farc_men_rif_akm","twc_farc_men_rif_m21","twc_farc_men_rif_hk416","twc_farc_men_rif_ak104","twc_farc_men_rif_ak74","twc_farc_men_rif_at","twc_farc_men_rif_m4"];

vehicleList = ["CUP_C_UAZ_Unarmed_TK_CIV", "CUP_C_Skoda_Blue_CIV", "CUP_C_Datsun_Plain", "CUP_C_Ural_Open_Civ_03"];

enemyTechnical = ["CUP_O_LR_MG_TKM", "CUP_O_LR_SPG9_TKM"];

_script = execVM "Insurgency_Core\SHK_pos\shk_pos_init.sqf";
waitUntil{scriptDone _script};


badTownArray = ["Airport north","Loymanara","Jaza","sultansafe","loy manara oilfield","iedrestrictionzone","Bosquet","Faro","Guran","Feas"];

[missionNamespace,"base","Main Base"] call BIS_fnc_addRespawnPosition;

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