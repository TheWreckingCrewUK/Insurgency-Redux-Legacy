#include "sys_cleanup\init.sqf";
#include "sys_intel\init.sqf";
#include "sys_diary\init.sqf";
#include "sys_forwardBase\init.sqf";
#include "sys_restrict\init.sqf";
#include "sys_score\init.sqf";
#include "sys_player\init.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";
"iedRestrictionZone" setMarkerAlpha 0;

waitUntil {!isNull player};


sleep 30;
//systemchat "terp init";
if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	"You're an interpreter. Read more about this in the diary on your map" remoteExec ["hint",twc_terp];
	
	player CreateDiaryRecord ["Diary",["Interpreter",
	"As an interpreter you can gain access to valuable information regarding enemy activity. As you move through the area you will receive hints regarding cache locations, currently defended towns, IED's and even estimates of stronghold strength. You will only get this information if your PRC152 is set to the correct channel however, and you will need to find the correct channel yourself. You can speed this process up by ACE interacting on a High Value Target (HVT) and getting the radio channel that way."
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

	if (typeOf vehicle player == "Modern_British_JetPilot") then {

		if (( count(allPlayers - entities "HeadlessClient_F")) >= 8) then 
		{
			hint "You're a pilot. Read how to spawn aircraft in the diary on your map";
		} else
		{
			hint "You're a pilot, but there are less than 6 people on the server so you can't spawn or fly anything. Choose another slot.";
		};
		};
	
	player CreateDiaryRecord ["Diary",["Pilot", 
 "As a pilot you can move and paradrop very large amounts of ammunition and vehicles, as well as provide combat close air support to troops on the ground. You can spawn aircraft at the main spawner that the infantry uses for ammunition spawning.  
 </br></br> Your choice of aircraft is limited based on how many people are in the server, and the spawner will only show you aircraft that you have the playercount to fly at that point. This has a cooldown, and you can return aircraft with ace interaction to mitigate this. If you're a fixed wing pilot spawning a plane, that plane will appear on the apron, not the spawn helipad." 
]]; 
};

//check if the player is stuck in the map screen
if ((str getpos player) == "[10,10,10]") then {
player setdamage 1;
systemchat "map glitch workaround activated with a result of 10, please tell Hobbs this happened with this result ASAP";
};
if ((str getpos player) == "[0,0,0]") then {
player setdamage 1;

systemchat "map glitch workaround activated with a result of 0, please tell Hobbs this happened with this result ASAP";
};

