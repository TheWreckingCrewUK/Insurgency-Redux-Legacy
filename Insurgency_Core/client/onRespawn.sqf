
#include "newstext.sqf";

[] spawn {
	sleep 5;
	//set radios again
	call twc_fnc_setradio;
};
	//make the player middle eastern if they spawn as ANA. Sounds racist, but otherwise it looks dumb
_me = player;
if ((faction player == "ana_units") || ((side player) == east)) then {
[_me, ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom] remoteExec ["setFace", 0, _me] 
};

/*
_nobackpack = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_nobackpack");

if (!isnil "_nobackpack") then {

	if (_nobackpack == 1) then {
		player addEventHandler ["Take", {
			params ["_unit", "_container", "_item"];
			removebackpack player;
		}];
	};
};
*/

[player, false] execvm "insurgency_core\client\sys_player\vehicledrop.sqf";

[] spawn {
	waituntil {(!(isnil "twc_missionname"))};
	waitUntil {!isNull player};

	if (((uniform player) == "UK3CB_BAF_U_RolledUniform_MTP") && ((["90", twc_missionname] call BIS_fnc_inString))) then {
	for "_i" from 1 to 3 do {
		sleep 3;
		(player) setObjectTextureGlobal [0, "uk3cb_baf_equipment\backpacks\data\backpack_ddpm_co.paa"];
		};
	};
};

 
 _armourcrew = ["Modern_British_VehicleCrew","Modern_USMC_VehicleCrew","1990_British_Tank_Crew_Desert","2000_British_Vehicle_Crew","Modern_British_VehicleCommander","Modern_USMC_VehicleCommander","1990_British_Tank_Commander_Desert","2000_British_Vehicle_Commander"];
 

 if (typeof player in _armourcrew) then {
 
	[player] remoteExec ["twc_fnc_crewcount", 2];
	
	if ((["infantry", str (group player)] call BIS_fnc_inString)) then {
		if ((group player getvariable ["twc_ismechanised", 0]) == 0) then {
			group player setvariable ["twc_ismechanised", 1, true];
		};
	};
};

if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {
	_crewcount = 0;

	{if (typeof _x in _armourcrew) then {_crewcount = _crewcount + 1;}} foreach units group player;
	group player setvariable ["armourcount", _crewcount, true];
		if ((group player getvariable ["armourcount", 3]) == 0) then {
			group player setvariable ["twc_ismechanised", 0, true];
		};
	
};
/*
//mortar removed in the strippening 2020
if ((random 1)< twc_mortarchance) then {
_ran = (random 3);
waituntil {(!(isnil "twc_mortar_targetlist"))};
for "_i" from 1 to _ran do {
twc_mortar_targetlist pushback ((getpos player) vectoradd [random 1,random 1,random 1]);
publicVariable "twc_mortar_targetlist";
};
};
*/
twc_pubcamo = 500;
waituntil {!isnil "twc_missionname"};
if (["70", twc_missionname] call BIS_fnc_inString) then {
	twc_pubcamo = 2;
};
if (["90", twc_missionname] call BIS_fnc_inString) then {
	twc_pubcamo = 20;
};
	if ((!(["sniper", typeof player] call BIS_fnc_inString)) && (!(["spotter", typeof player] call BIS_fnc_inString)) && (!(["uksf", typeof player] call BIS_fnc_inString))) then {
		player setunittrait ["camouflageCoef", twc_pubcamo];
	};
twc_client_nightcamo = {
	_namount = 3;
	_damount = twc_pubcamo;
	if (((["sniper", typeof player] call BIS_fnc_inString)) || ((["spotter", typeof player] call BIS_fnc_inString))) then {
		_namount = 0.3;
		_damount = 1;
	};
	if (((["uksf", typeof player] call BIS_fnc_inString))) then {
		_namount = 1;
		_damount = 1;
	};
	player setunittrait ["camouflageCoef", _damount];
	while {(sunOrMoon == 1)} do {
		sleep 120;
	};
	player setunittrait ["camouflageCoef", _namount];
	while {(sunOrMoon == 0)} do {
		sleep 120;
	};
	player setunittrait ["camouflageCoef", _damount];
	
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


_timer = missionnamespace getvariable ["twc_serstarttime", 9999];
_firsttimer = missionnamespace getvariable ["twc_firstspawned", 0];
if ((time > (_timer + 600)) && (_firsttimer > 1)) exitwith {

	_items = (vestitems player);
	{player removeitemfromvest _x} foreach (vestitems player);
	player setvehicleammo 0.8;
	{
		player additemtovest _x;
	} foreach _items;
};





twc_lastspawned = time;
if ((_firsttimer > 1)) exitwith {
	_skiploadout = (group player) getvariable ["twc_nopersistentloadout", false];
		if  (!(_skiploadout)) then {
		_role = typeof vehicle player;

		_profile = profilenamespace getvariable ["twcpubloadout" + _role, []];

		if ((count _profile) > 0) then {
			profilenamespace setvariable ["twcpubloadout" + _role, [uniformitems player, vestitems player, backpackitems player]];
			saveprofilenamespace;
		};

	};
};
twc_firstspawned = time;
twc_serstarttime = time;
/////////////////////////////////////////////////////////////////
//first spawn code
/////////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//persistent loadout stuff

[] spawn {
sleep 1;
call twc_fnc_pubstartingloadout;
};
[player] call twc_fnc_civfluff_client;
[player] call twc_fnc_civtraffic_client;

[] spawn {
sleep 10;
player addEventHandler ["Inventoryclosed", {
	_array =profilenamespace getvariable ["twcpubloadout" + (typeof player), []];
	if ((str _array) == (str ([uniformitems player, vestitems player, backpackitems player]))) exitwith {};
	profilenamespace setvariable ["twcpubloadout" + (typeof player), [uniformitems player, vestitems player, backpackitems player]];
	saveprofilenamespace;
}];

player addEventHandler ["Reloaded", {
	profilenamespace setvariable ["twcpubloadout" + (typeof player), [uniformitems player, vestitems player, backpackitems player]];
	saveprofilenamespace;
}];

player addEventHandler ["killed", {
	profilenamespace setvariable ["twcpubloadout" + (typeof player), [uniformitems player, vestitems player, backpackitems player]];
	[] spawn {
		sleep 3;
		saveprofilenamespace;
	};
}];
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


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
		"Low Tech Command Role" hintc ["Your section members do not have a radio or map, stay together", "You can find other players in the field using the BLUFOR intel function in ACE Self Interact (hold CTRL+Win key by default)"];
	
		player CreateDiaryRecord ["Diary",["Maps","Section members do not have a radio or map, stay together. You can find other players in the field using the BLUFOR intel function in ACE Self Interact (hold CTRL+Win key by default)"]];
	};
};


vehicle player setVariable ["twc_isenemy",0, true];

#include "sys_restrict\init.sqf";

	


if (!(["infantry", str (group player)] call BIS_fnc_inString)) then {
execvm "insurgency_core\client\sys_restrict\attachmentcount.sqf" 
};
["en", "English"] call acre_api_fnc_babelAddLanguageType;
["pa", "Pashto"] call acre_api_fnc_babelAddLanguageType;

_lan = "en";

if ((str (side player)) == "east") then {
	_lan = "pa";
};

[_lan] call acre_api_fnc_babelSetSpokenLanguages;
//systemchat "terp init";
if (["interpreter", typeof player] call BIS_fnc_inString) then {
	
	[twc_terp_msgcheck] remoteExec ["bis_fnc_call", 2];
	[] spawn {
		waituntil {!isnil "twc_terp_timer"};
		sleep 30;
		[] spawn twc_terp_timer;
	};
	["en", "pa"] call acre_api_fnc_babelSetSpokenLanguages;
	["en"] call acre_api_fnc_babelSetSpeakingLanguage;
	_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Interpreter</t>"; 
	_text1 = "<br />You're an interpreter. Read more about this in the diary on your map";
	_terptext = parsetext (_title + _text1);
	hint _terptext;
	
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


if (((["uksf", typeof player] call BIS_fnc_inString) && (!(["70", twc_missionname] call BIS_fnc_inString)) && (!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) || ((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin", "Modern_British_FAC", "Modern_British_JetPilot", "Modern_British_HeliPilot","Modern_British_crewchief", "Modern_British_FSTAssistant","Modern_British_FSTForwardObserver","Modern_British_FSTCommander"])) then {
	[] spawn {
		_pos = getpos player;
		waituntil {(player distance _pos) > 3};
		
		_team = (group player) getvariable ["twc_groupcountry", "baf"]; 
		_role = player getvariable ["twc_loadoutrole", ""]; 
		if (_role != "") then {
			_var = missionnamespace getvariable [("twc_loadout_" + _team + "_" + _role), []]; 
			_var call twc_loadout_switchloadout; 
			[player] call twc_fnc_buildmagarray_set; 
			[player] call twc_fnc_buildmagarray;
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


_suntime = date call BIS_fnc_sunriseSunsetTime;

if ((daytime < ((_suntime select 0) - 0.8)) || (daytime > ((_suntime select 1) - 1))) then {
	player addweapon "CUP_NVG_PVS14";
};

if (time > 200) then {[] spawn twc_fnc_enemyspawnpos;};

 _newstextold = profilenamespace getvariable ["twc_newstext", ""];
 _newstextnew = missionnamespace getvariable ["twc_newstext", ""];
 if (!(str _newstextold == str _newstextnew)) then {
	_pos = getpos player;
	waituntil {(_pos distance player) > 5};
	sleep 1;
	_pos = getpos player;
	waituntil {(_pos distance player) > 5};
	hint _newstextnew;
	profilenamespace setvariable ["twc_newstext", _newstextnew];
};

player linkitem "itemwatch";

twc_fnc_idf = compile preprocessfilelinenumbers "insurgency_Core\server\sys_basedefence\IDF_Alarmfire.sqf";
