twc_fnc_getDisplayName = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_getDisplayName.sqf";
twc_fnc_showSandBagItems = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_showSandBagItems.sqf";
twc_fnc_startcqbrangeserver = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_cqbrange_server.sqf";

twc_fnc_campaignserver = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_campaignserver.sqf";

twc_fnc_enemyspawnpos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_enemyspawnpos.sqf";
twc_fnc_isnearblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_isnearblufor.sqf";

twc_fnc_findnearestblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findnearestblufor.sqf";

twc_fnc_findoutsideblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findoutsideblufor.sqf";

twc_fnc_stopcivs = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_stopcivs.sqf";
twc_fnc_bluforreport = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_bluforreport.sqf";

//execVM "Insurgency_Core\client\func\fnc_gasattack.sqf";

player addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];
	
	if ((side _entity) == east) then {
		_entity setVariable ["twc_isenemy",1];
		//systemchat "enemy placed";
	};
	if ((side _entity) == civilian) then {
		_entity setVariable ["twc_isenemy",0,true];
	};
}];

twc_hintnearbyshootcomp = {
	params ["_text", "_shooter"];
	if (!hasinterface) exitwith {
		diag_log ("twcshootcomp"+_text);
	};
	if ((player distance _shooter) > 30) exitwith {};
	systemchat _text;
};

twc_shootcomp_resettarget = {
	params [ "_target"];
	_target animateSource ["terc",0,true];
};

_UKaction5 = ["10mshoot","5m Shoot","",{[5] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(count (player nearobjects ["TargetBootcampHumanSimple_F", 2]) > 0) && (!(cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","10m Shoot","",{[10] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(count (player nearobjects ["TargetBootcampHumanSimple_F", 2]) > 0) && (!(cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","20m Shoot","",{[20] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(count (player nearobjects ["TargetBootcampHumanSimple_F", 2]) > 0) && (!(cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","30m Shoot","",{[30] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(count (player nearobjects ["TargetBootcampHumanSimple_F", 2]) > 0) && (!(cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","60m Shoot","",{[60] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(count (player nearobjects ["TargetBootcampHumanSimple_F", 2]) > 0) && (!(cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","100m Shoot","",{[100] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(count (player nearobjects ["TargetBootcampHumanSimple_F", 2]) > 0) && (!(cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

///

_UKaction5 = ["10mshoot","5m Shoot","",{[5] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","10m Shoot","",{[10] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","20m Shoot","",{[20] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","30m Shoot","",{[30] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","60m Shoot","",{[60] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","100m Shoot","",{[100] execvm "Insurgency_Core\client\func\fnc_shootcomp.sqf"},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER"))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","Select Shoot Mode 2","",{playsound "hint3"; (player setvariable ["twc_shootcomp_shotcount", 1])},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER") && ((player getvariable ["twc_shootcomp_shotcount", 1]) == 0))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","Select Shoot Mode 1","",{playsound "hint3"; (player setvariable ["twc_shootcomp_shotcount", 0])},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER") && ((player getvariable ["twc_shootcomp_shotcount", 1]) == 4))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","Select Shoot Mode 5","",{playsound "hint3"; (player setvariable ["twc_shootcomp_shotcount", 4])},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER") && ((player getvariable ["twc_shootcomp_shotcount", 1]) == 1))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;
