#include "sys_cleanup\init.sqf";
#include "sys_diary\init.sqf";
#include "sys_forwardBase\init.sqf";
#include "sys_score\init.sqf";
#include "sys_player\init.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";
#include "sys_intel\init.sqf";
//#include "sys_ragdoll\init.sqf";
"iedRestrictionZone" setMarkerAlpha 0;

InsP_fnc_deleteMarkers = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fn_deleteMarkers.sqf";
InsP_fnc_deadCache = compile preProcessFileLineNumbers "Insurgency_Core\server\sys_cache\fnc_deadCache.sqf";
twc_news = compile preprocessfilelinenumbers "Insurgency_Core\client\news.sqf";
cutText ["","Black IN",0.001];
waitUntil {!isNull player};
cutText ["","Black IN",0.001];

_alphaaction = ["SpawnsmallAlphaCreate","TWC News","",{call twc_news},{true}] call ace_interact_menu_fnc_createAction;
["TWC_Item_Public_Base_LOCSTAT",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Start Simple CQB Course","",{execvm "Insurgency_Core\client\func\fnc_cqbrange.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Start Complex CQB Course","",{[true] execvm "Insurgency_Core\client\func\fnc_cqbrange.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

_alphaaction = ["SpawnsmallAlphaCreate","Reset CQB Course","",{execvm "Insurgency_Core\client\func\fnc_cqbrange_reset.sqf"},{true}] call ace_interact_menu_fnc_createAction;
["Infostand_1_EP1",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;


twc_endmissionplayer = {
player setvehicleammo 0;
};

if ((count units group player) > 6) then {
	[group player] remoteexec ["twc_hintfullsection"];
};

if ((!(forcedMap select 0)) && ((forcedMap select 1))) then {player setdamage 1};

twc_firstspawned = 0;
twc_lastspawned = 0;
twc_serstarttime = time + 10000;

twc_pubcamo = 500;
waituntil {!isnil "twc_missionname"};
if (["70", twc_missionname] call BIS_fnc_inString) then {
	twc_pubcamo = 2;
};
if (["90", twc_missionname] call BIS_fnc_inString) then {
	twc_pubcamo = 20;
};

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

if ((!(isnull _corpse)) && ((_corpse distance twc_basepos) < 500)) then {
	[_corpse] spawn {
		params ["_corpse"];
		_corpse setvehicleammo 0;
		clearweaponcargoglobal _corpse;
		clearitemcargoglobal _corpse;
	};
};
	if ((!(["sniper", typeof player] call BIS_fnc_inString)) && (!(["spotter", typeof player] call BIS_fnc_inString))) then {
		player setunittrait ["camouflageCoef", twc_pubcamo];
	};
twc_client_nightcamo = {
	if (((["sniper", typeof player] call BIS_fnc_inString)) && ((["spotter", typeof player] call BIS_fnc_inString))) exitwith {};
	while {(sunOrMoon == 1)} do {
		sleep 120;
	};
	player setunittrait ["camouflageCoef", 3];
	while {(sunOrMoon == 0)} do {
		sleep 120;
	};
	player setunittrait ["camouflageCoef", twc_pubcamo];
	
	[] spawn twc_client_nightcamo;
	
};
[] spawn twc_client_nightcamo;

[] spawn {
	_pos = getpos player;
	_time = time;
	player allowdamage false;
	waituntil {((player distance _pos > 40) || (time > (_time + 120)))};
	player allowdamage true;
};

if ((time > (twc_serstarttime + 600)) && (twc_firstspawned > 1)) exitwith {
	player setvehicleammo 0.2;
};

twc_lastspawned = time;
if (twc_firstspawned > 1) exitwith {};
twc_firstspawned = time;
twc_serstarttime = time;
/////////////////////////////////////////////////////////////////
//first spawn code
/////////////////////////////////////////////////////////////////


if (!("ItemMap" in assigneditems player)) then {
	addMissionEventHandler ["Map", {
		params ["_mapIsOpened", "_mapIsForced"];
		_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];
		if ((vehicle player == player) && ((player distance _base) > 300)) then {
			player unassignItem "itemmap";
			player removeitem "itemmap";
		} else {
			if (_mapIsOpened) then {
				player linkItem "itemmap";
			} else {
				player unassignItem "itemmap";
				player removeitem "itemmap";
			};			
		};
	}];
	if (!(["blank", typeof player] call BIS_fnc_inString)) then {
		"Low Tech Role" hintc ["You can view the map from inside any vehicle or at base", "You can find other players in the field using the BLUFOR intel function in ACE Self Interact (hold CTRL+Win key by default)"];
	
		player CreateDiaryRecord ["Diary",["Maps","You can view the map from inside any vehicle or at base. You can find other players in the field using the BLUFOR intel function in ACE Self Interact (hold CTRL+Win key by default)"]];
	};
	removegoggles player;
}	else {
	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		player linkItem "itemmap";
	}];

	
	//if they have a map but it's cold war, it's probably a command role and they should be notified that their buddies don't have the same priveledges to stop them running off and expecting the others to be able to follow
	
	if ((["70", twc_missionname] call BIS_fnc_inString)) then {
		removegoggles player;
		"Low Tech Command Role" hintc ["Your section members do not have a radio or map, keep them close", "You can find other players in the field using the BLUFOR intel function in ACE Self Interact (hold CTRL+Win key by default)"];
	
		player CreateDiaryRecord ["Diary",["Maps","Section members do not have a radio or map, keep them close. You can find other players in the field using the BLUFOR intel function in ACE Self Interact (hold CTRL+Win key by default)"]];
	};
};

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	_vehicle setunittrait ["camouflageCoef", twc_pubcamo];
}];

vehicle player setVariable ["twc_isenemy",0, true];

#include "sys_restrict\init.sqf";

if (!(["infantry", str (group player)] call BIS_fnc_inString)) then {
execvm "insurgency_core\client\sys_restrict\attachmentcount.sqf" 
};
["en", "English"] call acre_api_fnc_babelAddLanguageType;
["pa", "Pashto"] call acre_api_fnc_babelAddLanguageType;
["en"] call acre_api_fnc_babelSetSpokenLanguages;
//systemchat "terp init";
if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	["en", "pa"] call acre_api_fnc_babelSetSpokenLanguages;
	["en"] call acre_api_fnc_babelSetSpeakingLanguage;
	"You're an interpreter. Read more about this in the diary on your map" remoteExec ["hint",twc_terp];
	
	player CreateDiaryRecord ["Diary",["Interpreter",
	"As an interpreter you can gain access to valuable information regarding enemy activity. As you move through the area you will receive hints regarding cache locations, currently defended towns, IED's and even estimates of stronghold strength. <br /><br />You will only get this information if your PRC152 is set to the correct channel however, and you will need to find the correct channel yourself. You can speed this process up by ACE interacting on a High Value Target (HVT) and getting the radio channel that way."
]];	


{
_getfreq = ["deleteCreate","Get Radio Frequency","",{
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Enemy Intel</t>"; 

 _text1 = format ["<br />The Enemy Is Using Channel %1",twc_enemychannel];
 _terptext = parsetext (_title + _text1);
 hint _terptext;

},{true}] call ace_interact_menu_fnc_createAction;
[_x,0,["ACE_MainActions"],_getfreq,true] call ace_interact_menu_fnc_addActionToClass;

} foreach hvtlist;

};



if (["uksf", typeof player] call BIS_fnc_inString) then {
	[] spawn {
		_pos = getpos player;
		waituntil {(player distance _pos) > 3};
		_gr = (group player getvariable ["twc_groupcountry", "baf"]);
		if (_gr == "cag") then {
			[player] call twc_loadout_sfgroup_cag_switch;
		};
		if (_gr == "st6") then {
			[player] call twc_loadout_sfgroup_st6_switch;
		};
		if (_gr == "ana") then {
			[player] call twc_loadout_sfgroup_ana_switch;
		};
	};
};

if (["fst", typeof player] call BIS_fnc_inString) then {
{
_returnvehicle = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

twc_coyotecount=twc_coyotecount - 1;
publicVariable "twc_coyotecount";

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_x,0,["ACE_MainActions"],_returnvehicle,true] call ace_interact_menu_fnc_addActionToClass;

} foreach ["UK3CB_BAF_Coyote_L111A1_Base_D","UK3CB_BAF_Coyote_L111A1_Base_W","UK3CB_BAF_Coyote_L134A1_Base_D","UK3CB_BAF_Coyote_L134A1_Base_W"];


_gr = (group player getvariable ["twc_groupcountry", "baf"]);


if (_gr == "us") then {
	[player] call twc_loadout_fstgroup_us_switch;
};

};

if (["logi", typeof player] call BIS_fnc_inString) then {

_returnvehicle = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

twc_quadbikecount=twc_quadbikecount - 1;
publicVariable "twc_quadbikecount";

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
["B_Quadbike_01_F",0,["ACE_MainActions"],_returnvehicle,true] call ace_interact_menu_fnc_addActionToClass;


};


if (["pilot", typeof player] call BIS_fnc_inString) then {

	//if (typeOf vehicle player == "Modern_British_JetPilot") then {

		//if (( count(allPlayers - entities "HeadlessClient_F")) >= 6) then 
		if (( count(allPlayers - entities "HeadlessClient_F")) >= 0) then 
		{
			hint "You're a pilot. Read how to spawn aircraft in the diary on your map";
		} else
		{
			hint "You're a pilot, but there are less than 6 people on the server so you can't spawn or fly anything. Choose another slot.";
		};
		//};
	
	player CreateDiaryRecord ["Diary",["Pilot", 
 "As a pilot you can move and paradrop very large amounts of ammunition and vehicles, as well as provide combat close air support to troops on the ground. You can spawn aircraft at the main spawner that the infantry uses for ammunition spawning.  
<br /><br />Your choice of aircraft is limited based on how far the mission has progressed, and the spawner will only show you aircraft that you have the ability to fly at that point. If you're a fixed wing pilot spawning a plane, that plane will appear on the apron, not the spawn helipad." 
]]; 
};




if((typeOf player) in ["Modern_British_VehicleCommander", "Modern_British_VehicleCrew", "1970_British_Vehicle_Commander", "1970_British_Vehicle_Crew"]) then {
	["TWC_ArmourCrewConnected", [getPlayerUID player]] call CBA_fnc_serverEvent;
	
	

			hint "Read how to spawn heavy vehicles in the diary on your map";

		
	
	player CreateDiaryRecord ["Diary",["Armour Crew", 
 "The armour crew is responsible for providing heavy fire support and transport for the infantry. They have much better protection against IED's and rockets than other vehicles, and so have much more freedom in where they can go.
<br /><br />
One of the main advantages of the armour crew is their ability to operate in positions that would be too dangerous for other vehicles. The commander should leverage this advantage while managing the risk to the vehicle.
<br /><br />
The commander can spawn vehicles from the main spawner, and then despawn them by ace interacting on the vehicle when it's in base. Only 2 vehicles may be around at a time, if both of them get destroyed then it allows you 1 more.
<br /><br />
The large vehicles require a full crew of 3 to operate, but the vehicles without a full turret only require a member of the armour crew to drive it. For example, a crewman could drive an FV432 APC with the commander as the gunner and then the second crewman could drive another FV432 with an infantryman as the gunner.
" 
]]; 
	
	
};



if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin"]) then {
	_gr = (group player getvariable ["twc_groupcountry", "baf"]);
	if (_gr == "cag") then {
		[player] call twc_loadout_snipergroup_cag_switch;
	};
	if (_gr == "us") then {
		[player] call twc_loadout_snipergroup_us_switch;
	};
	if (_gr == "usmc") then {
		[player] call twc_loadout_snipergroup_usmc_switch;
	};
	if (_gr == "uksf") then {
		[player] call twc_loadout_snipergroup_uksf_switch;
	};
	["TWC_SniperConnected", [getPlayerUID player]] call CBA_fnc_serverEvent;
};


if (sunormoon == 0) then {
	player addweapon "rhsusf_ANPVS_14";
};

if (time > 200) then {[] spawn twc_fnc_enemyspawnpos;};

//Set Radios Correctly
_radioID = [getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType")] call acre_api_fnc_getRadioByType; 
 if (!isNil "_radioID") then { 
_channelNumber = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioChannel"); 
 _switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
 Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType"),_channelNumber]; 
 };

twc_fnc_idf = compile preprocessfilelinenumbers "insurgency_Core\server\sys_basedefence\IDF_Alarmfire.sqf";
}];