twc_fnc_getDisplayName = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_getDisplayName.sqf";
twc_fnc_showSandBagItems = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_showSandBagItems.sqf";
twc_fnc_startcqbrangeserver = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_cqbrange_server.sqf";

twc_fnc_campaignserver = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_campaignserver.sqf";

twc_fnc_enemyspawnpos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_enemyspawnpos.sqf";
twc_fnc_isnearblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_isnearblufor.sqf";

twc_fnc_findnearestblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findnearestblufor.sqf";
twc_fnc_checkenemyradio = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_checkenemyradio.sqf";

twc_fnc_civfluff_server = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_civ\fnc_civfluff_server.sqf";

twc_fnc_civfluff_client = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_civfluff_client.sqf";

twc_fnc_findnearestroad = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findnearestroad.sqf";

twc_fnc_civtraffic_server = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_civ\fnc_civtraffic_server.sqf";

twc_fnc_civtraffic_client = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_civtraffic_client.sqf";

twc_fnc_findoutsideblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findoutsideblufor.sqf";

twc_fnc_stopcivs = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_stopcivs.sqf";
twc_fnc_bluforreport = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_bluforreport.sqf";


twc_fnc_flipvehicle = compile preprocessfilelinenumbers "insurgency_core\client\sys_player\flipvehicle.sqf";

twc_fnc_posNearPlayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_posNearPlayers.sqf";


twc_fnc_seenbyplayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_seenbyplayers.sqf";
twc_fnc_lookedatbyplayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_lookedatbyplayers.sqf";
twc_fnc_findsneakypos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findsneakypos.sqf";

twc_fnc_pubstartingloadout = compile preprocessfilelinenumbers "Insurgency_Core\client\sys_player\loadouts\fnc_startingloadout.sqf";

twc_terp_timer = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_terp\fnc_terp_timer.sqf";
twc_terp_msgcheck = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_terp\fnc_terp_msgcheck.sqf";

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

twc_hintfullsection = {
	params ["_group"];
	
	_arr = [];
	{
		_arr pushback [name _x, typeof _x, getPlayerUID _x];
	} foreach (units _group);
	
	if (!hasinterface) exitwith {
		diag_log ("twcgoodeggs "+(str _arr));
	};
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

_UKaction5 = ["10mshoot","Select Shoot Mode 2","",{playsound "hint3"; (player setvariable ["twc_shootcomp_shotcount", 1])},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER") && ((player getvariable ["twc_shootcomp_shotcount", 1]) == 4))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","Select Shoot Mode 1","",{playsound "hint3"; (player setvariable ["twc_shootcomp_shotcount", 0])},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER") && ((player getvariable ["twc_shootcomp_shotcount", 1]) == 1))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;

_UKaction5 = ["10mshoot","Select Shoot Mode 5","",{playsound "hint3"; (player setvariable ["twc_shootcomp_shotcount", 4])},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER") && ((player getvariable ["twc_shootcomp_shotcount", 1]) == 0))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;


_UKaction5 = ["10mshoot","Set Not Ready","",{playSound3D ["A3\missions_f\data\sounds\click.wss", player]; (player setvariable ["twc_shootcomp_shooterready", 0]); systemchat "Shooter standby - The shoot will not start until you set ready";},{(((typeof cursorTarget) == "TargetBootcampHuman_F") && ((cursorObject distance player) < 150) && (cameraview == "GUNNER") && ((player getvariable ["twc_shootcomp_shooterready", 1]) == 1))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;


_UKaction5 = ["10mshoot","Set Shooter Ready","",{playSound3D ["A3\missions_f\data\sounds\click.wss", player]; player setvariable ["twc_shootcomp_shooterready", 1]; systemchat "Shooter ready";},{((count (player nearobjects ["TargetBootcampHumanSimple_F", 200]) > 0) && ((player getvariable ["twc_shootcomp_shooterready", 1]) == 0))}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _UKaction5] call ace_interact_menu_fnc_addActionToObject;




twc_shootcomp_addeh1 = {
	params ["_target", "_player", "_dis"];
	_target setvariable ["twcshootcomp_hits" + (str _dis) + (name _player), 0, true];
	_eh1 = _target addEventHandler ["Hit", {
		params ["_unit", "_source", "_damage", "_instigator"];
		_unit setdamage 0;
		[_unit] spawn {
			params ["_unit"];
			waitUntil {_unit animationPhase "terc" > 0};
			_unit animateSource ["terc",0,true];
		};
		
		_targets = _instigator getvariable ["twc_activecomptargets", []];
		
		{
			if ((_x select 0) == _unit) then {
				_dis = _x select 1;
				_h = _unit getvariable ["twcshootcomp_hits" + (str _dis) + (name _instigator), 0];
				_unit setvariable ["twcshootcomp_hits" + (str _dis) + (name _instigator), (_h + 1) min 5, true];
				
				_h = _unit getvariable ["twcshootcomp_hits" + (str _dis) + (name _instigator), 0];
				if ((_instigator getvariable ["twc_shootcomplete", 0]) == 1) then {
					(_instigator setvariable ["twc_shootcomplete", 0, true]);
				};
					
				
			};
		} foreach _targets;
		
		
		
	}];

	_target setvariable ["twcshootcomp_e1", _eh1, true];
};
