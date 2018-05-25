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
	"As an interpreter you can gain access to valuable information regarding enemy activity. As you move through the area you will receive hints regarding cache locations, currently defended towns, IED's and even estimates of stronghold strength. You will only get this information if your PRC152 is set to the correct channel however, and you will need to find the correct channel yourself."
]];	
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



/*
player addEventHandler ["Hit", {[] spawn {if !(vehicle player == player) exitwith{};if (stance player == "PRONE") exitwith {};if ((random 1)>1.5) exitwith{}; _this = player; _this setUnconscious true; sleep 0.1; _this setUnconscious false}}]*.